Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81AAB23B3
	for <lists+apparmor@lfdr.de>; Sat, 10 May 2025 14:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uDizX-0001l9-A8; Sat, 10 May 2025 12:07:43 +0000
Received: from smtp-1908.mail.infomaniak.ch ([185.125.25.8])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uDKvK-00033P-P6
 for apparmor@lists.ubuntu.com; Fri, 09 May 2025 10:25:46 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zv4s60c9lzS2f;
 Fri,  9 May 2025 12:25:46 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Zv4s36FSSzCvl; Fri,  9 May 2025 12:25:43 +0200 (CEST)
Date: Fri, 9 May 2025 12:25:39 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250509.bokeiCho2oov@digikod.net>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
 <470689f0-223e-4d26-a919-8d48f383883b@I-love.SAKURA.ne.jp>
 <7da224cd-fd9c-4c80-9a23-cb977420f50b@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7da224cd-fd9c-4c80-9a23-cb977420f50b@canonical.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=185.125.25.8; envelope-from=mic@digikod.net;
 helo=smtp-1908.mail.infomaniak.ch
X-Mailman-Approved-At: Sat, 10 May 2025 12:07:41 +0000
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
Cc: paul@paul-moore.com, Arnd Bergmann <arnd@arndb.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp, kees@kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, May 08, 2025 at 12:52:55AM -0700, John Johansen wrote:
> On 5/7/25 15:04, Tetsuo Handa wrote:
> > On 2025/05/08 0:37, Maxime Bélair wrote:
> > > Again, each module decides which operations to expose through this syscall. In many cases
> > > the operation will still require CAP_SYS_ADMIN or a similar capability, so environments
> > > that choose this interface remain secure while gaining its advantages.
> > 
> > If the interpretation of "flags" argument varies across LSMs, it sounds like ioctl()'s
> 
> yes that does feel like ioctls(), on the other hand defining them at the LSM level won't
> offer LSMs flexibility making it so the syscall covers fewer use cases. I am not opposed
> to either, it just hashing out what people want, and what is acceptable.
> 
> > "cmd" argument. Also, there is prctl() which can already carry string-ish parameters
> > without involving open(). Why can't we use prctl() instead of lsm_manage_policy() ?
> > 
> 
> prctl() can be used, I used it for the unprivileged policy demo. It has its own set of
> problems. While LSM policy could be associated with the process doing the load/replacement
> or what ever operation, it isn't necessarily tied to it. A lot of LSM policy is not
> process specific making prctl() a poor fit.
> 
> prctl() requires allocating a global prctl()
> 
> prctl() are already being filtered/controlled by LSMs making them a poort fit for
> use by an LSM in a stacking situation as it requires updating the policy of other
> LSMs on the system. Yes seccomp can filter the syscall but that still is an easier
> barrier to overcome than having to have instruction for how to allow your LSMs
> prctl() in multiple LSMs.
> 
> 
> Mickaël already argued the need for landlock to have syscalls. See

Landlock indeed requires syscalls mainly because of its unprivileged
nature.

> https://lore.kernel.org/lkml/20200511192156.1618284-7-mic@digikod.net/
> and the numerous iterations before that.

This link might be misleading though, it points to an initial version of
the syscall proposal (v17) and it was then decided to create one syscall
per operation (v34), which is why we ended with 3 syscalls.  See the
changelog:
https://lore.kernel.org/r/20210422154123.13086-9-mic@digikod.net

> 
> Ideally those could have been LSM syscalls, with landlock leveraging them.

I don't agree.  The Landlock syscalls have a well-defined semantic, with
documented security requirements, and they deal with specific kernel
objects identified with file descriptors, including a dedicated one:
[landlock-ruleset].  For the features provided by these Landlock
syscalls, it would not have been a good idea to reuse existing syscalls,
nor to rely on the syscall proposed in this series because the interface
is too specific to some of the current privileged LSMs (i.e. ingest a
policy blob).  Making this interface more generic would lead to even
less defined semantic though.

> AppArmor
> is getting to where it has similar needs to landlock. Yes we can use ioctls, prctls,
> netlink, the fs, etc. it doesn't mean that those are the best interfaces to do so,

I think it would make sense to propose AppArmor-specific syscalls.

> and ideally any interface we use will be of benefit to some other LSMs in the future.

The LSM syscalls may make sense to deal with LSM blobs managed by the
LSM framework (e.g. get/set properties) when the operations are
common/generic.

Security policies are specific to each LSM and they should implement
their own well-defined interface (e.g. filesystem, netlink, syscall).

The LSM framework doesn't provide nor manage any security policy, it
mainly provides a set of consistent and well-defined kernel hooks with
security blobs to enforce a security policy.  I don't think it makes
sense to add LSM syscalls to manage things not managed by the LSM
framework.

