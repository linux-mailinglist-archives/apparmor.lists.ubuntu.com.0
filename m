Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481BAB34D5
	for <lists+apparmor@lfdr.de>; Mon, 12 May 2025 12:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uEQJN-0004fA-TU; Mon, 12 May 2025 10:23:05 +0000
Received: from smtp-8fab.mail.infomaniak.ch ([83.166.143.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uEQH2-0004YG-Co
 for apparmor@lists.ubuntu.com; Mon, 12 May 2025 10:20:40 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6c])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zwwbq65GhzRqZ;
 Mon, 12 May 2025 12:20:39 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Zwwbn4lZ8zDLf; Mon, 12 May 2025 12:20:37 +0200 (CEST)
Date: Mon, 12 May 2025 12:20:36 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250512.Uong6eCaVuwu@digikod.net>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
 <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
 <9aaeda3a-8ef5-4820-b2e4-9180b73fb368@canonical.com>
 <20250509.ePu7gaim1Foo@digikod.net>
 <19313f6b-42d7-4845-9a4b-93c7546aadb9@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19313f6b-42d7-4845-9a4b-93c7546aadb9@canonical.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=83.166.143.171; envelope-from=mic@digikod.net;
 helo=smtp-8fab.mail.infomaniak.ch
X-Mailman-Approved-At: Mon, 12 May 2025 10:23:05 +0000
Subject: Re: [apparmor] [PATCH 1/3] Wire up the lsm_manage_policy syscall
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
Cc: paul@paul-moore.com, Arnd Bergmann <arnd@arndb.de>, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, May 11, 2025 at 03:47:21AM -0700, John Johansen wrote:
> On 5/9/25 03:26, Mickaël Salaün wrote:
> > On Thu, May 08, 2025 at 01:18:20AM -0700, John Johansen wrote:
> > > On 5/7/25 23:06, Song Liu wrote:
> > > > On Wed, May 7, 2025 at 8:37 AM Maxime Bélair
> > > > <maxime.belair@canonical.com> wrote:
> > > > [...]

> > > > permission check to each pseudo file. The downside of the syscall, however,
> > > > is that all the permission checks are hard-coded in the kernel (except for
> > > 
> > > The permission checks don't have to be hard coded. Each LSM can define how it handles
> > > or manages the syscall. The default is that it isn't supported, but if an lsm decides
> > > to support it, there is now reason that its policy can't determine the use of the
> > > syscall.
> > 
> >  From an interface design point of view, it would be better to clearly
> > specify the scope of a command (e.g. which components could be impacted
> > by a command), and make sure the documentation reflect that as well.
> > Even better, have a syscalls per required privileges and impact (e.g.
> > privileged or unprivileged).  Going this road, I'm not sure if a
> > privileged syscall would make sense given the existing filesystem
> > interface.
> > 
> 
> uhhhmmm, not just privileged. As you well know we are looking to use
> this for unprivileged policy. The LSM can limit to privileged if it
> wants but it doesn't have to limit it to privileged policy.

Yes, I meant to say having a syscall for unprivileged actions, and maybe
another one for privileged ones, but this might be a hard sell. :)

To say it another way, for your use case, do you need this syscall(s)
for privileged operations?  Do you plan to drop (or stop extending) the
filesystem interface or do you think it would be good for (AppArmor)
privileged operations too?  I know syscalls might be attractive and
could be used for everything, but it's good to have a well-defined plan
and semantic to avoid using such syscall as another multiplexer with
unrelated operations and required privileges.

If this syscall should also be a way to do privileged operations, should
we also agree on a common set of permissions (e.g. global CAP_MAC_ADMIN
or user namespace one)?

[...]

> > > > Overall, I am still not convinced a syscall for all LSMs is needed. To
> > > > justify such
> > > 
> > > its not needed by all LSMs, just a subset of them, and some nebulous
> > > subset of potentially future LSMs that is entirely undefinable.
> > > 
> > > If we had had appropriate LSM syscalls landlock wouldn't have needed
> > > to have landlock specific syscalls. Having another LSM go that route
> > > feels wrong especially now that we have some LSM syscalls.
> > 
> > I don't agree.  Dedicated syscalls are a good thing.  See my other
> > reply.
> > 
> 
> I think we can just disagree on this point.
> 
> > > If a
> > > syscall is needed by an LSM its better to try hashing something out
> > > that might have utility for multiple LSMs or at the very least,
> > > potentially have utility in the future.
> > > 
> > > 
> > > > a syscall, I think we need to show that it is useful in multiple LSMs.
> > > > Also, if we
> > > > really want to have single set of APIs for all LSMs, we may also need
> > > > get_policy,
> > > 
> > > We are never going to get a single set of APIs for all LSMs. I will
> > > settle for an api that has utility for a subset
> > > 
> > > > remove_policy, etc. This set as-is appears to be an incomplete design. The
> > > 
> > > To have a complete design, there needs to be feedback and discussion
> > > from multiple LSMs. This is a starting point.
> > > 
> > > > implementation, with call_int_hook, is also problematic. It can easily
> > > > cause some> controversial behaviors.
> > > > 
> > > agreed it shouldn't be doing a straight call_int_hook, it should only
> > > call it against the lsm identified by the lsmid
> > 
> > Yes, but then, I don't see the point of a "generic" LSM syscall.
> 
> its not a generic LSM syscall. Its a syscall or maybe a set of syscalls
> for a specific scoped problem of loading/managing policy.
> 
> Can we come to something acceptable? I don't know but we are going to
> look at it before trying for an apparmor specific syscall.

I understand and it's good to have this discussion.

