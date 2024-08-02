Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340F94634F
	for <lists+apparmor@lfdr.de>; Fri,  2 Aug 2024 20:40:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sZxCg-0007x9-Cu; Fri, 02 Aug 2024 18:40:38 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1sZxCe-0007x1-0u
 for apparmor@lists.ubuntu.com; Fri, 02 Aug 2024 18:40:36 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5a28b61b880so57209a12.1
 for <apparmor@lists.ubuntu.com>; Fri, 02 Aug 2024 11:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722624035; x=1723228835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvGo9T3eyBjc8RzJ3B/6nw2VwxThF3mQa//XCX7dSjQ=;
 b=ugqA6VKgfnLAU9BhuuZw2g0vqZm2eTlxJ/yAx6bGygVRRS9qtqil4FJ4qQNRI5Gtmt
 dv3J9ERhd20iWtBf9gpCzae7RxSaFhOClbasqK/kPP+mkUo1w6gyxsqHvUkUTD62V6+a
 5K8jiLkz8+ropM8Faxcxy2+0jsdUvVvmfCqhUK0NIqyPZxDSgb1E0u3tx+D0o3HCfPzk
 2sDdgGrVC6EfFVhBvOfMK3/t+uMO+9taJdxUZI0Uf6NxQyExpZSpQCQUZV+S6vxjtABF
 f1Q1F0+yo+Mr1WyIMI2TrWN9Zo/eqKBSLfFSyK4zNsetKzYpo59Q0OhrFmrAQGhVCN7p
 fV5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEsxxmGXm7CE+b1rTpWPpOZxmEnrwuXucXRra8xoc77GfyP7SVP6WVcNvM9IKO9TZC92sHrtOPuhVUxU+EToE4mRGgI8LAXAK
X-Gm-Message-State: AOJu0YxvyD6fwR1Ce0y5x8xFT+1uU90lUhtbKL7231LKsV8P5BOAduc3
 0IEJtV1+mppjG0BDGu+GnX98f+uzJBgQf0OY1RMHiyBIvKrfdCXpgStnWTZtalzBsUJuxivWUD8
 +9tpbZcdbgBECwIl6+9XqJwiHPgHldgthhrpe
X-Google-Smtp-Source: AGHT+IE6a715lvD7e7H+jRBC/YC4Qmp0ZvYcNq+Z2J6Y52jOrAYsO1CDkNEmQVXxr6y4yqKqUpa8HB00+hEb3yiQVGc=
X-Received: by 2002:a05:6402:51cb:b0:5b8:ccae:a8b8 with SMTP id
 4fb4d7f45d1cf-5b99e0a517emr10054a12.3.1722624034462; Fri, 02 Aug 2024
 11:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com>
 <D35ML45KMWK8.1E29IC0VZO4CL@iki.fi>
In-Reply-To: <D35ML45KMWK8.1E29IC0VZO4CL@iki.fi>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 Aug 2024 20:39:56 +0200
Message-ID: <CAG48ez1GFY5H1ujaDfcj-Ay5_Pm8MsBVL=vU4tEynXgzg5yduQ@mail.gmail.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.52; envelope-from=jannh@google.com;
 helo=mail-ed1-f52.google.com
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
Cc: linux-security-module@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Aug 2, 2024 at 8:09=E2=80=AFPM Jarkko Sakkinen <jarkko.sakkinen@iki=
.fi> wrote:
> On Fri Aug 2, 2024 at 4:10 PM EEST, Jann Horn wrote:
> > cred_alloc_blank and cred_transfer were only necessary so that keyctl c=
an
> > allocate creds in the child and then asynchronously have the parent fil=
l
> > them in and apply them.
> >
> > Get rid of them by letting the child synchronously wait for the task wo=
rk
> > executing in the parent's context. This way, any errors that happen in =
the
> > task work can be plumbed back into the syscall return value in the chil=
d.
> >
> > Note that this requires using TWA_SIGNAL instead of TWA_RESUME, so the
> > parent might observe some spurious -EGAIN syscall returns or such; but =
the
> > parent likely anyway has to be ready to deal with the side effects of
> > receiving signals (since it'll probably get SIGCHLD when the child dies=
),
> > so that probably isn't an issue.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > This is a quickly hacked up demo of the approach I proposed at
> > <https://lore.kernel.org/all/CAG48ez2bnvuX8i-D=3D5DxmfzEOKTWAf-DkgQq6aN=
C4WzSGoEGHg@mail.gmail.com/>
> > to get rid of the cred_transfer stuff. Diffstat looks like this:
> >
> >  include/linux/cred.h          |   1 -
> >  include/linux/lsm_hook_defs.h |   3 ---
> >  include/linux/security.h      |  12 ------------
> >  kernel/cred.c                 |  23 -----------------------
> >  security/apparmor/lsm.c       |  19 -------------------
> >  security/keys/internal.h      |   8 ++++++++
> >  security/keys/keyctl.c        | 100 ++++++++++++++++++++++++++--------=
------------------------------------------------------------------
> >  security/keys/process_keys.c  |  86 ++++++++++++++++++++++++++++++++++=
++++++++++++----------------------------------------
> >  security/landlock/cred.c      |  11 ++---------
> >  security/security.c           |  35 ----------------------------------=
-
> >  security/selinux/hooks.c      |  12 ------------
> >  security/smack/smack_lsm.c    |  32 --------------------------------
> >  12 files changed, 82 insertions(+), 260 deletions(-)
> >
> > What do you think? Synchronously waiting for task work is a bit ugly,
> > but at least this condenses the uglyness in the keys subsystem instead
> > of making the rest of the security subsystem deal with this stuff.
>
> Why does synchronously waiting is ugly? Not sarcasm, I genuineily
> interested of breaking that down in smaller pieces.
>
> E.g. what disadvantages would be there from your point of view?
>
> Only trying to form a common picture, that's all.

Two things:

1. It means we have to send a pseudo-signal to the parent, to get the
parent to bail out into signal handling context, which can lead to
extra spurious -EGAIN in the parent. I think this is probably fine
since _most_ parent processes will already expect to handle SIGCHLD
signals...

2. If the parent is blocked on some other killable wait, we won't be
able to make progress - so in particular, if the parent was using a
killable wait to wait for the child to leave its syscall, userspace
=E1=BA=81ould deadlock (in a way that could be resolved by SIGKILLing one o=
f
the processes). Actually, I think that might happen if the parent uses
ptrace() with sufficiently bad timing? We could avoid the issue by
doing an interruptible wait instead of a killable one, but then that
might confuse userspace callers of the keyctl() if they get an
-EINTR...
I guess the way to do this cleanly is to use an interruptible wait and
return -ERESTARTNOINTR if it gets interrupted?

> > Another approach to simplify things further would be to try to move
> > the session keyring out of the creds entirely and just let the child
> > update it directly with appropriate locking, but I don't know enough
> > about the keys subsystem to know if that would maybe break stuff
> > that relies on override_creds() also overriding the keyrings, or
> > something like that.
> > ---
> >  include/linux/cred.h          |   1 -
> >  include/linux/lsm_hook_defs.h |   3 --
> >  include/linux/security.h      |  12 -----
> >  kernel/cred.c                 |  23 ----------
> >  security/apparmor/lsm.c       |  19 --------
> >  security/keys/internal.h      |   8 ++++
> >  security/keys/keyctl.c        | 100 +++++++++++-----------------------=
--------
> >  security/keys/process_keys.c  |  86 +++++++++++++++++++---------------=
--
> >  security/landlock/cred.c      |  11 +----
> >  security/security.c           |  35 ---------------
> >  security/selinux/hooks.c      |  12 -----
> >  security/smack/smack_lsm.c    |  32 --------------
> >  12 files changed, 82 insertions(+), 260 deletions(-)
>
> Given the large patch size:
>
> 1. If it is impossible to split some meaningful patches, i.e. patches
>    that transform kernel tree from working state to another, I can
>    cope with this.
> 2. Even for small chunks that can be split into their own logical
>    pieces: please do that. Helps to review the main gist later on.

There are basically two parts to this, it could be split up nicely into the=
se:

1. refactor code in security/keys/
2. rip out all the code that is now unused (as you can see in the
diffstat, basically everything outside security/keys/ is purely
removals)

[...]
> Not going through everything but can we e.g. make a separe SMACK patch
> prepending?

I wouldn't want to split it up further: As long as the cred_transfer
mechanism and LSM hook still exist, all the LSMs that currently have
implementations of it should also still implement it.

But I think if patch 2/2 is just ripping out unused infrastructure
across the tree, that should be sufficiently reviewable? (Or we could
split it up into ripping out one individual helper per patch, but IDK,
that doesn't seem to me like it adds much reviewability.)

