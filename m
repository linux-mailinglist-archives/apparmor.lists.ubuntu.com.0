Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA8946CEB
	for <lists+apparmor@lfdr.de>; Sun,  4 Aug 2024 09:04:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1saVID-00088D-7i; Sun, 04 Aug 2024 07:04:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jarkko@kernel.org>) id 1saIQs-0002xn-2V
 for apparmor@lists.ubuntu.com; Sat, 03 Aug 2024 17:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F05FBCE01FE;
 Sat,  3 Aug 2024 17:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E2EC116B1;
 Sat,  3 Aug 2024 17:20:38 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Aug 2024 20:20:35 +0300
Message-Id: <D36G6JFV79FK.2LCFXJYDTRRPK@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
X-Mailer: aerc 0.18.0
References: <20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com>
 <D35ML45KMWK8.1E29IC0VZO4CL@iki.fi>
 <CAG48ez1GFY5H1ujaDfcj-Ay5_Pm8MsBVL=vU4tEynXgzg5yduQ@mail.gmail.com>
In-Reply-To: <CAG48ez1GFY5H1ujaDfcj-Ay5_Pm8MsBVL=vU4tEynXgzg5yduQ@mail.gmail.com>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=jarkko@kernel.org;
 helo=sin.source.kernel.org
X-Mailman-Approved-At: Sun, 04 Aug 2024 07:04:36 +0000
Subject: Re: [apparmor] [PATCH RFC] security/KEYS: get rid of
 cred_alloc_blank and cred_transfer
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri Aug 2, 2024 at 9:39 PM EEST, Jann Horn wrote:
> > > What do you think? Synchronously waiting for task work is a bit ugly,
> > > but at least this condenses the uglyness in the keys subsystem instea=
d
> > > of making the rest of the security subsystem deal with this stuff.
> >
> > Why does synchronously waiting is ugly? Not sarcasm, I genuineily
> > interested of breaking that down in smaller pieces.
> >
> > E.g. what disadvantages would be there from your point of view?
> >
> > Only trying to form a common picture, that's all.
>
> Two things:
>
> 1. It means we have to send a pseudo-signal to the parent, to get the
> parent to bail out into signal handling context, which can lead to
> extra spurious -EGAIN in the parent. I think this is probably fine
> since _most_ parent processes will already expect to handle SIGCHLD
> signals...
>
> 2. If the parent is blocked on some other killable wait, we won't be
> able to make progress - so in particular, if the parent was using a
> killable wait to wait for the child to leave its syscall, userspace
> =E1=BA=81ould deadlock (in a way that could be resolved by SIGKILLing one=
 of
> the processes). Actually, I think that might happen if the parent uses
> ptrace() with sufficiently bad timing? We could avoid the issue by
> doing an interruptible wait instead of a killable one, but then that
> might confuse userspace callers of the keyctl() if they get an
> -EINTR...
> I guess the way to do this cleanly is to use an interruptible wait and
> return -ERESTARTNOINTR if it gets interrupted?

Or ERESTARTSYS if you want to select the behavior from caller using
SA_RESTART, whether to restart or -EINTR.


> > > Another approach to simplify things further would be to try to move
> > > the session keyring out of the creds entirely and just let the child
> > > update it directly with appropriate locking, but I don't know enough
> > > about the keys subsystem to know if that would maybe break stuff
> > > that relies on override_creds() also overriding the keyrings, or
> > > something like that.
> > > ---
> > >  include/linux/cred.h          |   1 -
> > >  include/linux/lsm_hook_defs.h |   3 --
> > >  include/linux/security.h      |  12 -----
> > >  kernel/cred.c                 |  23 ----------
> > >  security/apparmor/lsm.c       |  19 --------
> > >  security/keys/internal.h      |   8 ++++
> > >  security/keys/keyctl.c        | 100 +++++++++++---------------------=
----------
> > >  security/keys/process_keys.c  |  86 +++++++++++++++++++-------------=
----
> > >  security/landlock/cred.c      |  11 +----
> > >  security/security.c           |  35 ---------------
> > >  security/selinux/hooks.c      |  12 -----
> > >  security/smack/smack_lsm.c    |  32 --------------
> > >  12 files changed, 82 insertions(+), 260 deletions(-)
> >
> > Given the large patch size:
> >
> > 1. If it is impossible to split some meaningful patches, i.e. patches
> >    that transform kernel tree from working state to another, I can
> >    cope with this.
> > 2. Even for small chunks that can be split into their own logical
> >    pieces: please do that. Helps to review the main gist later on.
>
> There are basically two parts to this, it could be split up nicely into t=
hese:
>
> 1. refactor code in security/keys/
> 2. rip out all the code that is now unused (as you can see in the
> diffstat, basically everything outside security/keys/ is purely
> removals)

Yeah, I'd go for this simply because it allows better reviewer
visibility. You can look at the soluton and cleanups separately.

>
> [...]
> > Not going through everything but can we e.g. make a separe SMACK patch
> > prepending?
>
> I wouldn't want to split it up further: As long as the cred_transfer
> mechanism and LSM hook still exist, all the LSMs that currently have
> implementations of it should also still implement it.
>
> But I think if patch 2/2 is just ripping out unused infrastructure
> across the tree, that should be sufficiently reviewable? (Or we could
> split it up into ripping out one individual helper per patch, but IDK,
> that doesn't seem to me like it adds much reviewability.)

I don't want to dictate this because might give wrong advice (given
bandwidth to think it through). Pick a solution and we'll look at it :-)

BR, Jarkko

