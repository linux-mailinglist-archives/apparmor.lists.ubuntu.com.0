Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7BDAAF55C
	for <lists+apparmor@lfdr.de>; Thu,  8 May 2025 10:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCwSW-0004Ic-Mk; Thu, 08 May 2025 08:18:24 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uCwSU-0004IP-K5
 for apparmor@lists.ubuntu.com; Thu, 08 May 2025 08:18:22 +0000
Received: from [10.101.3.5] (unknown [213.157.19.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B55463FB95; 
 Thu,  8 May 2025 08:18:21 +0000 (UTC)
Message-ID: <9aaeda3a-8ef5-4820-b2e4-9180b73fb368@canonical.com>
Date: Thu, 8 May 2025 01:18:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>, =?UTF-8?Q?Maxime_B=C3=A9lair?=
 <maxime.belair@canonical.com>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
 <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@i-love.sakura.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/7/25 23:06, Song Liu wrote:
> On Wed, May 7, 2025 at 8:37 AM Maxime Bélair
> <maxime.belair@canonical.com> wrote:
> [...]
>>>
>>> These two do not feel like real benefits:
>>> - One syscall cannot fit all use cases well...
>>
>> This syscall is not intended to cover every case, nor to replace existing kernel
>> interfaces.
>>
>> Each LSM can decide which operations it wants to support (if any). For example, when
>> loading policies, an LSM may choose to allow only policies that further restrict
>> privileges.
>>
>>> - Not working in containers is often not an issue, but a feature.
>>
>> Indeed, using this syscall requires appropriate capabilities and will not permit
>> unprivileged containers to manage policies arbitrarily.
>>
>> With this syscall, capability checks remain the responsibility of each LSM.
>>
>> For instance, in the AppArmor patch, a profile can be loaded only if
>> aa_policy_admin_capable() succeeds (which requires CAP_MAC_ADMIN). Moreover, by design,
>> policies can be loaded only in the current namespace.
>>
>> I see this syscall as a middle point between exposing the entire sysfs, creating a large
>> attack surface, and blocking everything.
>>
>> Landlock’s existing syscalls already improve security by allowing processes to further
>> restrict their ambient rights while adding only a modest attack surface.
>>
>> This syscall is a further step in that direction: it lets LSMs add restrictive policies
>> without requiring exposing every other interface.
> 
> I don't think a syscall makes the API more secure. If necessary, we can add

It exposes a different attack surface. Requiring mounting of the fs to where it is visible
in the container, provides attack surface, and requires additional external configuration.

Then there is the whole issue of getting the various LSMs to allow another LSM in the
stack to be able manage its own policy.

> permission check to each pseudo file. The downside of the syscall, however,
> is that all the permission checks are hard-coded in the kernel (except for

The permission checks don't have to be hard coded. Each LSM can define how it handles
or manages the syscall. The default is that it isn't supported, but if an lsm decides
to support it, there is now reason that its policy can't determine the use of the
syscall.

> BPF LSM); while the sys admin can configure permissions of the pseudo
> files in user space.
> 
Other LSMs also have policy that can control access to pseudo filesystems and
other resources. Again, the control doesn't have to be hard coded. And seccomp can
be used to block the syscall.



>> Again, each module decides which operations to expose through this syscall. In many cases
>> the operation will still require CAP_SYS_ADMIN or a similar capability, so environments
>> that choose this interface remain secure while gaining its advantages.
>>
>>>>    - Avoids overhead of other kernel interfaces for better efficiency
>>>
>>> .. and it is is probably less efficient, because everything need to
>>> fit in the same API.
>>
>> As shown below, the syscall can significantly improve the performance of policy management.
>> A more detailed benchmark is available in [1].
>>
>> The following table presents the time required to load an AppArmor profile.
>>
>> For every cell, the first value is the total time taken by aa-load, and the value in
>> parentheses is the time spent to load the policy in the kernel only (total - dry‑run).
>>
>> Results are in microseconds and are averaged over 10 000 runs to reduce variance.
>>
>>
>> | t (µs)    | syscall     | pseudofs    | Speedup       |
>> |-----------|-------------|-------------|---------------|
>> | 1password | 4257 (1127) | 3333 (192)  | x1.28 (x5.86) |
>> | Xorg      | 6099 (2961) | 5167 (2020) | x1.18 (x1.47) |
>>
> 
> I am not sure the performance of loading security policies is on any
> critical path.

generally speaking I agree, but I am also not going to turn down a
performance improvement either. Its a nice to have, but not a strong
argument for need.

> The implementation calls the hook for each LSM, which is why I think the
> syscall is not efficient.
> 
it should only call the LSM identified by the lsmid in the call.

> Overall, I am still not convinced a syscall for all LSMs is needed. To
> justify such

its not needed by all LSMs, just a subset of them, and some nebulous
subset of potentially future LSMs that is entirely undefinable.

If we had had appropriate LSM syscalls landlock wouldn't have needed
to have landlock specific syscalls. Having another LSM go that route
feels wrong especially now that we have some LSM syscalls. If a
syscall is needed by an LSM its better to try hashing something out
that might have utility for multiple LSMs or at the very least,
potentially have utility in the future.


> a syscall, I think we need to show that it is useful in multiple LSMs.
> Also, if we
> really want to have single set of APIs for all LSMs, we may also need
> get_policy,

We are never going to get a single set of APIs for all LSMs. I will
settle for an api that has utility for a subset

> remove_policy, etc. This set as-is appears to be an incomplete design. The

To have a complete design, there needs to be feedback and discussion
from multiple LSMs. This is a starting point.

> implementation, with call_int_hook, is also problematic. It can easily
> cause some> controversial behaviors.
> 
agreed it shouldn't be doing a straight call_int_hook, it should only
call it against the lsm identified by the lsmid


