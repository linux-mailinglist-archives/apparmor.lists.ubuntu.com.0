Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93AB20FED
	for <lists+apparmor@lfdr.de>; Mon, 11 Aug 2025 17:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ulUZY-0003BZ-Jr; Mon, 11 Aug 2025 15:36:28 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1ulUZW-0003BK-Em
 for apparmor@lists.ubuntu.com; Mon, 11 Aug 2025 15:36:26 +0000
Received: from [192.168.192.85] (unknown [50.47.147.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6E8DD405C3; 
 Mon, 11 Aug 2025 15:36:25 +0000 (UTC)
Message-ID: <9398f0e7-ec46-4b6c-9e1e-904c40b326e7@canonical.com>
Date: Mon, 11 Aug 2025 08:36:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: valoq <valoq@mailbox.org>
References: <aJiPtAhLY2esOAkC@mailbox.org>
 <de1c49d7-4033-4091-b190-46a82f6b4a92@canonical.com>
 <aJm-2Hj9_7woDXBd@mailbox.org>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <aJm-2Hj9_7woDXBd@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Upstream kernel socket path isolation
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/11/25 02:58, valoq wrote:
> On Sun, Aug 10, 2025 at 02:56:13PM -0700, John Johansen wrote:
>> On 8/10/25 05:25, valoq wrote:
>>> Recently I have been testing apparmor process isolation and came across different behaviors in regards to socket isolation, especially in regards to socket file path filtering.
>>>   From what I have gathered, the documented features in apparmor are only enforced with a kernel fully patched with all apparmor features, like what ubuntu implements.
>>> Which means that all other linux distributions out there are currently not providing any effective process isolation through apparmor since escape path like socket communication is wide open. (the base abstraction commonly
>>> +included allows sockets and there is no file path filter implemented in distro kernels other then ubuntu)
>>
>> yes the base abstraction is problematic. It is something I would like to kill but that is harder said than done
>>
>>> If I understand it correctly, the recently added aa patches for linux 6.17 will bring this feature for everyone but I would like to know if this is actually the correct assumption and if starting with kernel 6.17 the
>>
>> It will for unix sockets, if you are using a version of apparmor that supports the new abi. Because unix sockets cross both socket, and file mediation and are done the way they are in the kernel, there was no way to land ubuntu's version in the kernel without breaking existing policy for non-ubuntu systems. Policy will have declare it is using the new abi, and existing unix policy rules should work, but there are some cases where there may need to be a tweak to the rules. The tweak is that the new unix socket is slightly stricters, when shared across processes, so the rules are backwards compatible and will work on an ubuntu system using the older af_unix mediation (that is it can be downgraded transparently).
> 
> There is curently a rather popular project on github that provides many aa profiles. https://github.com/roddhjav/apparmor.d
very aware, there is work going on to integrate most of it into the main apparmor project. apparmor.d will continue as a fork for the bits that aren't pulled into the upstream project.

> I assume this already includes the new abi so only the kernel is missing on most distros?
> It was rather surprising to find out how different the upstream kernel handles apparmor, especialy since there is no mention of this in any official distros documentation. I will try to add some warning to the wikis about the kernel requirements for effective isolation since it seems like many distros advertise apparmor despite the trivial escape path through unix domain sockets. Thank you for the work on bringing this into the mainline kernel

It does not, nor does Ubuntu. This side of things is a wip, it has been waiting on the kernel to ensure there isn't any policy out there that could break, and be used as a reason to revert the af_unix patches. It has taken a long time, and there have been several stops and reworks along the way. Since af_unix interacts with both network, and file the dangers of breaking someones system with policy declaring the new abi, and yet not being updated for it is very real. We have had kernel patches reverted for breaking userspace, because a developer wouldn't change his abi. Which the required several cycles to rework code, and introduce new abis etc. This has lead to several changes in the abi system, and us being very careful about how certain features are rolled out.

> 
>>
>> Fine grained inet/inet6 mediation is still a wip, we plan to post the current patches up for review, but it is unlikely that they will land for 6.18, those will be more likely 6.19. Fine grained mediation of other socket types like netlink are something for future improvement atm.
> 
> This is for filtering specific domains or network interfaces? This is not strictly required to prevent sandbox escape though, correct?
> 
Correct.

>>
>>> +upstream linux kernel actually does include all required patches to provide effective isolation. Perhaps someone could point out where the differences between upstream kernel and ubuntus/apparmor kernel are documented?
>>>
>> there is some info in the upstream wiki, the biggest issue is it hasn't been kept up to date.
>>
>>>
>>> During my dive into apparmor I also noticed two possible bugs or at least strange behaviors that I wanted to point out/have checked:
>>>
>>> 1.
>>> If a profile has an include statement like:
>>> include <abstractions/base>
>>> and the profile is edited to comment out this line with a single # like this:
>>> #include <abstractions/base>
>>> then the single # is ignored and the include is interpreted anyway.
>>> Only when several ## are put before the include or there is a space in between will the line be effectively commented out. Is this intentional?
>>>
>>
>> sadly yes. its a historical artifact. When includes where first added, they were add to look like C includes (a mistake), and using the # was also considered "good" as it allowed them to be added to policy without breaking older versions of apparmor. If you put a space between the # and include it becomes a comment, if use double # (ie. ##) its a comment. Its unfortunate that it still persists but there is still too much policy using it.
>>
>> It has been officially deprecated upstream, but that means its still not removed for another 5 years
> 
> Perhaps we can get that removed 
Removal will come, but it takes time. Upstream policy is once something is deprecated it usually will take 5 years.

> or at the very least create a warning in the logs about it? Took me a few hours to figure this out and I will likely not be the only one
> 
it already has a warning since the apparmor-3.1 release commit db246ddbb  parser: begin deprecation process for #include

you do need to make sure your warnings, aren't hiding it, which is the default most distros use for warnings. At least if using init scripts/systemd

you can enable it through the command line with the --warn flag

$ apparmor_parser --help=warn

for deprecations

     --warn=all
   or
     --warn=deprecated


> 
>>> Im not sure there is any critical use case to exploit this, but at the very least it allows to probe for the existance of any file in the filesystem without aa permissions and reveal its metadata, which seems to contradict
>>> +the MAC model.
>>>
>> it does, and we will improve here but won't be able to do a perfect job. The Linux kernel doesn't allow the LSM to full hide the existence of files. Its really unfortunate, but we can certainly do better.
> 
> Doesn't the landlock lsm do exactly that? Perhaps there is a way to use the same method in apparmor
> 
no, it hides them the best it can, but the LSM/kernel specifically the vfs won't let the LSM do this proper. It was objected to by the vfs maintainer back when the LSM was trying to be merged. For the LSM hook points, and LSM can return what it wants, but the vfs doesn't always call the LSM, eg. standard DAC permissions are usually checked first, and if there is an error there, the vfs will short circuit and the LSM won't get called. There are other corners where this is the case as well. There is also the whole split between the LSM path hooks, and the inode hooks. Where the inode hooks are called in more places but you are missing mount information, but the path hooks aren't called everywhere you need/would like mount information.

> 
> On an unrelated note: Has the patch for user namespace filtering made it into the kernel yet? I havent seen any news about it recently.
> 
it has not, all features have been backed up behind af_unix which has been sitting in linux-next since 6.13. Each cycle, there would be something major crop up late in the cycle making it so it wasn't ready to land. Now that af_unix looks to have landed (fingers crossed on no reverts), we will start pushing the remaining out of tree features. Generally 1 at a time for bigger features (eg af_unix), and 2 or 3 at a time for smaller (userns). The goal is to not make the PR too large, as that can result in the PR not getting accepted.

> Regardless, I am very grateful and happy about the work and progress with apparmor, so thank you.


