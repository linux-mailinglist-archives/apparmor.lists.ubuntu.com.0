Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E631AB23B4
	for <lists+apparmor@lfdr.de>; Sat, 10 May 2025 14:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uDizX-0001lH-IW; Sat, 10 May 2025 12:07:43 +0000
Received: from smtp-190b.mail.infomaniak.ch ([185.125.25.11])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uDKvi-00035x-ND
 for apparmor@lists.ubuntu.com; Fri, 09 May 2025 10:26:10 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zv4sZ2328zsXS;
 Fri,  9 May 2025 12:26:10 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Zv4sY4F4qz57l; Fri,  9 May 2025 12:26:09 +0200 (CEST)
Date: Fri, 9 May 2025 12:26:08 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250509.ePu7gaim1Foo@digikod.net>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
 <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
 <9aaeda3a-8ef5-4820-b2e4-9180b73fb368@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aaeda3a-8ef5-4820-b2e4-9180b73fb368@canonical.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=185.125.25.11; envelope-from=mic@digikod.net;
 helo=smtp-190b.mail.infomaniak.ch
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
Cc: paul@paul-moore.com, Arnd Bergmann <arnd@arndb.de>, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, May 08, 2025 at 01:18:20AM -0700, John Johansen wrote:
> On 5/7/25 23:06, Song Liu wrote:
> > On Wed, May 7, 2025 at 8:37 AM Maxime Bélair
> > <maxime.belair@canonical.com> wrote:
> > [...]
> > > > 
> > > > These two do not feel like real benefits:
> > > > - One syscall cannot fit all use cases well...
> > > 
> > > This syscall is not intended to cover every case, nor to replace existing kernel
> > > interfaces.
> > > 
> > > Each LSM can decide which operations it wants to support (if any). For example, when
> > > loading policies, an LSM may choose to allow only policies that further restrict
> > > privileges.
> > > 
> > > > - Not working in containers is often not an issue, but a feature.
> > > 
> > > Indeed, using this syscall requires appropriate capabilities and will not permit
> > > unprivileged containers to manage policies arbitrarily.
> > > 
> > > With this syscall, capability checks remain the responsibility of each LSM.
> > > 
> > > For instance, in the AppArmor patch, a profile can be loaded only if
> > > aa_policy_admin_capable() succeeds (which requires CAP_MAC_ADMIN). Moreover, by design,
> > > policies can be loaded only in the current namespace.
> > > 
> > > I see this syscall as a middle point between exposing the entire sysfs, creating a large
> > > attack surface, and blocking everything.
> > > 
> > > Landlock’s existing syscalls already improve security by allowing processes to further
> > > restrict their ambient rights while adding only a modest attack surface.
> > > 
> > > This syscall is a further step in that direction: it lets LSMs add restrictive policies
> > > without requiring exposing every other interface.
> > 
> > I don't think a syscall makes the API more secure. If necessary, we can add
> 
> It exposes a different attack surface. Requiring mounting of the fs to where it is visible
> in the container, provides attack surface, and requires additional external configuration.

We should also keep in mind that syscalls could be accessible from
everywhere, by everyone, which may increase the attack surface compared
to a privileged filesystem interface.  Adding a second interface may
also introduce issues.  Anyway, I'm definitely not against syscalls, but
I don't see why the filesystem interface would be "less secure" in this
context.

> 
> Then there is the whole issue of getting the various LSMs to allow another LSM in the
> stack to be able manage its own policy.

Right, and it's a similar issue with seccomp policies wrt syscalls.

> 
> > permission check to each pseudo file. The downside of the syscall, however,
> > is that all the permission checks are hard-coded in the kernel (except for
> 
> The permission checks don't have to be hard coded. Each LSM can define how it handles
> or manages the syscall. The default is that it isn't supported, but if an lsm decides
> to support it, there is now reason that its policy can't determine the use of the
> syscall.

From an interface design point of view, it would be better to clearly
specify the scope of a command (e.g. which components could be impacted
by a command), and make sure the documentation reflect that as well.
Even better, have a syscalls per required privileges and impact (e.g.
privileged or unprivileged).  Going this road, I'm not sure if a
privileged syscall would make sense given the existing filesystem
interface.

> 
> > BPF LSM); while the sys admin can configure permissions of the pseudo
> > files in user space.
> > 
> Other LSMs also have policy that can control access to pseudo filesystems and
> other resources. Again, the control doesn't have to be hard coded. And seccomp can
> be used to block the syscall.
> 
> 
> 
> > > Again, each module decides which operations to expose through this syscall. In many cases
> > > the operation will still require CAP_SYS_ADMIN or a similar capability, so environments
> > > that choose this interface remain secure while gaining its advantages.
> > > 
> > > > >    - Avoids overhead of other kernel interfaces for better efficiency
> > > > 
> > > > .. and it is is probably less efficient, because everything need to
> > > > fit in the same API.
> > > 
> > > As shown below, the syscall can significantly improve the performance of policy management.
> > > A more detailed benchmark is available in [1].
> > > 
> > > The following table presents the time required to load an AppArmor profile.
> > > 
> > > For every cell, the first value is the total time taken by aa-load, and the value in
> > > parentheses is the time spent to load the policy in the kernel only (total - dry‑run).
> > > 
> > > Results are in microseconds and are averaged over 10 000 runs to reduce variance.
> > > 
> > > 
> > > | t (µs)    | syscall     | pseudofs    | Speedup       |
> > > |-----------|-------------|-------------|---------------|
> > > | 1password | 4257 (1127) | 3333 (192)  | x1.28 (x5.86) |
> > > | Xorg      | 6099 (2961) | 5167 (2020) | x1.18 (x1.47) |
> > > 
> > 
> > I am not sure the performance of loading security policies is on any
> > critical path.
> 
> generally speaking I agree, but I am also not going to turn down a
> performance improvement either. Its a nice to have, but not a strong
> argument for need.
> 
> > The implementation calls the hook for each LSM, which is why I think the
> > syscall is not efficient.
> > 
> it should only call the LSM identified by the lsmid in the call.
> 
> > Overall, I am still not convinced a syscall for all LSMs is needed. To
> > justify such
> 
> its not needed by all LSMs, just a subset of them, and some nebulous
> subset of potentially future LSMs that is entirely undefinable.
> 
> If we had had appropriate LSM syscalls landlock wouldn't have needed
> to have landlock specific syscalls. Having another LSM go that route
> feels wrong especially now that we have some LSM syscalls.

I don't agree.  Dedicated syscalls are a good thing.  See my other
reply.

> If a
> syscall is needed by an LSM its better to try hashing something out
> that might have utility for multiple LSMs or at the very least,
> potentially have utility in the future.
> 
> 
> > a syscall, I think we need to show that it is useful in multiple LSMs.
> > Also, if we
> > really want to have single set of APIs for all LSMs, we may also need
> > get_policy,
> 
> We are never going to get a single set of APIs for all LSMs. I will
> settle for an api that has utility for a subset
> 
> > remove_policy, etc. This set as-is appears to be an incomplete design. The
> 
> To have a complete design, there needs to be feedback and discussion
> from multiple LSMs. This is a starting point.
> 
> > implementation, with call_int_hook, is also problematic. It can easily
> > cause some> controversial behaviors.
> > 
> agreed it shouldn't be doing a straight call_int_hook, it should only
> call it against the lsm identified by the lsmid

Yes, but then, I don't see the point of a "generic" LSM syscall.

