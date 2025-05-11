Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FEAB27F5
	for <lists+apparmor@lfdr.de>; Sun, 11 May 2025 13:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uE4pI-0000V8-Hg; Sun, 11 May 2025 11:26:36 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uE4pH-0000Ux-Ad
 for apparmor@lists.ubuntu.com; Sun, 11 May 2025 11:26:35 +0000
Received: from [172.20.3.254] (unknown [213.157.19.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 27CD93FA05; 
 Sun, 11 May 2025 11:26:33 +0000 (UTC)
Message-ID: <351fb82f-272d-4dfc-9fa2-9ed094fbd6a5@canonical.com>
Date: Sun, 11 May 2025 04:26:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Casey Schaufler <casey@schaufler-ca.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
 <CAHC9VhRKwB4quqBtYQyxRqCX2C6fCgTbyAP3Ov+NdQ06t1aFdA@mail.gmail.com>
 <120954c2-87b7-4bda-958b-2b4f0180a736@canonical.com>
 <efe5b15a-6141-424a-8391-9092e79e4acf@schaufler-ca.com>
 <20250509.Chuecae0phoo@digikod.net>
 <71c3c2d6-5569-4580-89a4-513a03a429ab@schaufler-ca.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <71c3c2d6-5569-4580-89a4-513a03a429ab@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 5/9/25 07:21, Casey Schaufler wrote:
> On 5/9/2025 3:26 AM, Mickaël Salaün wrote:
>> On Thu, May 08, 2025 at 09:54:19AM -0700, Casey Schaufler wrote:
>>> On 5/8/2025 1:29 AM, John Johansen wrote:
>>>> On 5/7/25 13:25, Paul Moore wrote:
>>>>> On Wed, May 7, 2025 at 6:41 AM Tetsuo Handa
>>>>> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>>>>> On 2025/05/06 23:32, Maxime Bélair wrote:
>>>>>>> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
>>>>>>> index dcaad8818679..b39e6635a7d5 100644
>>>>>>> --- a/security/lsm_syscalls.c
>>>>>>> +++ b/security/lsm_syscalls.c
>>>>>>> @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user
>>>>>>> *, ids, u32 __user *, size,
>>>>>>>    SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void
>>>>>>> __user *, buf, u32
>>>>>>>                 __user *, size, u32, flags)
>>>>>>>    {
>>>>>>> -     return 0;
>>>>>>> +     size_t usize;
>>>>>>> +
>>>>>>> +     if (get_user(usize, size))
>>>>>>> +             return -EFAULT;
>>>>>>> +
>>>>>>> +     return security_lsm_manage_policy(lsm_id, op, buf, usize,
>>>>>>> flags);
>>>>>>>    }
>>>>>> syzbot will report user-controlled unbounded huge size memory
>>>>>> allocation attempt. ;-)
>>>>>>
>>>>>> This interface might be fine for AppArmor, but TOMOYO won't use this
>>>>>> interface because
>>>>>> TOMOYO's policy is line-oriented ASCII text data where the
>>>>>> destination is switched via
>>>>>> pseudo‑filesystem's filename ...
>>>>> While Tetsuo's comment is limited to TOMOYO, I believe the argument
>>>>> applies to a number of other LSMs as well.  The reality is that there
>>>>> is no one policy ideal shared across LSMs and that complicates things
>>>>> like the lsm_manage_policy() proposal.  I'm intentionally saying
>>>>> "complicates" and not "prevents" because I don't want to flat out
>>>>> reject something like this, but I think there needs to be a larger
>>>>> discussion among the different LSM groups about what such an API
>>>>> should look like.  We may not need to get every LSM to support this
>>>>> new API, but we need to get something that would work for a
>>>>> significant majority and would be general/extensible enough that we
>>>>> would expect it to work with the majority of future LSMs (as much as
>>>>> we can predict the future anyway).
>>>>>
>>>> yep, I look at this is just a starting point for discussion. There
>>>> isn't going to be any discussion without some code, so here is a v1
>>>> that supports a single LSM let the bike shedding begin.
>>> Aside from the issues with allocating a buffer for a big policy
>>> I don't see a problem with this proposal. The system call looks
>>> a lot like the other LSM interfaces, so any developer who likes
>>> those ought to like this one. The infrastructure can easily check
>>> the lsm_id and only call the appropriate LSM hook, so no one
>>> is going to be interfering with other modules.
>> We may not want to only be able to load buffers containing policies, but
>> also to leverage file descriptors like Landlock does.  Getting a
>> property from a kernel object or updating it is mainly about dealing
>> with a buffer.  And the current LSM syscalls do just that.  Other kind
>> of operations may require more than that though.
>>
>> I don't like multiplexer syscalls because they don't expose a clear
>> semantic and can be complex to manage and filter.  This new syscall is
>> kind of a multiplexer that redirect commands to an arbitrary set of
>> kernel parts, which can then define their own semantic.  I'd like to see
>> a clear set of well-defined operations and their required permission.
>> Even better, one syscall per operation should simplify their interface.
> 
> The development and maintenance of system calls is expensive in both
> time and effort. LSM specific system calls frighten me. When I was
> young adding system calls was just  not  done. A system call would
> never be allowed for a specific sub-system or optional feature. True,
> there are issues with the LSM specific filesystem approach. But I
> like it, as it allows the LSM more freedom in its interfaces and
> won't clutter the API if the LSM goes away or quits using it.
> 
I get the reticence on adding syscalls. Indeed its part of why I
want to explore LSM syscalls before going with an apparmor specific
syscall.

The current LSM specific fs approach has limitations that just can't
be reasonably worked around for some use cases, so that leaves going
with an alternate mechanism. For this use case, ioctls are problematic
like the fs. prctl could work for a subset and abused for the whole,
but a syscall feels cleaner.

I am open to other options.




