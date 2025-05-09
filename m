Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B4AB23B5
	for <lists+apparmor@lfdr.de>; Sat, 10 May 2025 14:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uDizX-0001lO-Oh; Sat, 10 May 2025 12:07:43 +0000
Received: from smtp-190a.mail.infomaniak.ch ([185.125.25.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uDKwK-000380-5e
 for apparmor@lists.ubuntu.com; Fri, 09 May 2025 10:26:48 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zv4tH4x3gzTkQ;
 Fri,  9 May 2025 12:26:47 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Zv4tH0ccfzFFD; Fri,  9 May 2025 12:26:47 +0200 (CEST)
Date: Fri, 9 May 2025 12:26:45 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <20250509.Chuecae0phoo@digikod.net>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
 <CAHC9VhRKwB4quqBtYQyxRqCX2C6fCgTbyAP3Ov+NdQ06t1aFdA@mail.gmail.com>
 <120954c2-87b7-4bda-958b-2b4f0180a736@canonical.com>
 <efe5b15a-6141-424a-8391-9092e79e4acf@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efe5b15a-6141-424a-8391-9092e79e4acf@schaufler-ca.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=185.125.25.10; envelope-from=mic@digikod.net;
 helo=smtp-190a.mail.infomaniak.ch
X-Mailman-Approved-At: Sat, 10 May 2025 12:07:41 +0000
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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
Cc: Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, kees@kernel.org,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, May 08, 2025 at 09:54:19AM -0700, Casey Schaufler wrote:
> On 5/8/2025 1:29 AM, John Johansen wrote:
> > On 5/7/25 13:25, Paul Moore wrote:
> >> On Wed, May 7, 2025 at 6:41 AM Tetsuo Handa
> >> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >>> On 2025/05/06 23:32, Maxime Bélair wrote:
> >>>> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> >>>> index dcaad8818679..b39e6635a7d5 100644
> >>>> --- a/security/lsm_syscalls.c
> >>>> +++ b/security/lsm_syscalls.c
> >>>> @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user
> >>>> *, ids, u32 __user *, size,
> >>>>   SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void
> >>>> __user *, buf, u32
> >>>>                __user *, size, u32, flags)
> >>>>   {
> >>>> -     return 0;
> >>>> +     size_t usize;
> >>>> +
> >>>> +     if (get_user(usize, size))
> >>>> +             return -EFAULT;
> >>>> +
> >>>> +     return security_lsm_manage_policy(lsm_id, op, buf, usize,
> >>>> flags);
> >>>>   }
> >>>
> >>> syzbot will report user-controlled unbounded huge size memory
> >>> allocation attempt. ;-)
> >>>
> >>> This interface might be fine for AppArmor, but TOMOYO won't use this
> >>> interface because
> >>> TOMOYO's policy is line-oriented ASCII text data where the
> >>> destination is switched via
> >>> pseudo‑filesystem's filename ...
> >>
> >> While Tetsuo's comment is limited to TOMOYO, I believe the argument
> >> applies to a number of other LSMs as well.  The reality is that there
> >> is no one policy ideal shared across LSMs and that complicates things
> >> like the lsm_manage_policy() proposal.  I'm intentionally saying
> >> "complicates" and not "prevents" because I don't want to flat out
> >> reject something like this, but I think there needs to be a larger
> >> discussion among the different LSM groups about what such an API
> >> should look like.  We may not need to get every LSM to support this
> >> new API, but we need to get something that would work for a
> >> significant majority and would be general/extensible enough that we
> >> would expect it to work with the majority of future LSMs (as much as
> >> we can predict the future anyway).
> >>
> >
> > yep, I look at this is just a starting point for discussion. There
> > isn't going to be any discussion without some code, so here is a v1
> > that supports a single LSM let the bike shedding begin.
> 
> Aside from the issues with allocating a buffer for a big policy
> I don't see a problem with this proposal. The system call looks
> a lot like the other LSM interfaces, so any developer who likes
> those ought to like this one. The infrastructure can easily check
> the lsm_id and only call the appropriate LSM hook, so no one
> is going to be interfering with other modules.

We may not want to only be able to load buffers containing policies, but
also to leverage file descriptors like Landlock does.  Getting a
property from a kernel object or updating it is mainly about dealing
with a buffer.  And the current LSM syscalls do just that.  Other kind
of operations may require more than that though.

I don't like multiplexer syscalls because they don't expose a clear
semantic and can be complex to manage and filter.  This new syscall is
kind of a multiplexer that redirect commands to an arbitrary set of
kernel parts, which can then define their own semantic.  I'd like to see
a clear set of well-defined operations and their required permission.
Even better, one syscall per operation should simplify their interface.

