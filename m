Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6BA34C60
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2025 18:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tidMx-0002Xb-Sm; Thu, 13 Feb 2025 17:51:23 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tidMw-0002XL-2N
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 17:51:22 +0000
Received: from [192.168.192.85] (unknown [50.39.104.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4F0383FF3B
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 17:51:21 +0000 (UTC)
Message-ID: <5dd89f64-cb4c-4d4a-b2e1-6b8f172b3a9b@canonical.com>
Date: Thu, 13 Feb 2025 09:51:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
 <87seohq1do.fsf@manticora>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <87seohq1do.fsf@manticora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] AppArmor version for upcoming Debian 13 (Trixie)
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2/13/25 08:02, intrigeri wrote:
> Hi,
> 
> Thanks for the quick reply! Some comments and more questions inline
> below:
> 
> John Johansen (2025-02-10):
>> On 2/10/25 03:48, intrigeri wrote:
>>> Currently Debian testing/sid is tracking AppArmor 3.1.x.
>>>
>>> I'm wondering if I should upgrade to 4.x for Debian 13 (Trixie), whose
>>> freeze will start in a few months. I would greatly appreciate
>>> some advice.
>>>
>> Yes. We have been planning to get debian updated to 4.1. Beta4
>> should be dropping some time today. We still have a couple of
>> known issues to fix before finally release but it is getting
>> close. It should release some time this month (February).
>>

Based on early testing on suse and ubuntu build systems we had a
few build issue for some platforms shake out so I am going to cut
a beta5

Ubuntu has an updated packaging for beta4/5 that I can send you

>> 4.1 will be a long term support version, where the current 4.0
>> release was not.
> 
> OK, so I'll try to upload 4.1.0~beta4 to experimental ASAP. I hope
> I can recycle some of the 4.1.0~beta1 packaging work from Ubuntu even
> though the Ubuntu packaging has switched to a Git workflow that makes
> this hard.
> 
> And then from there we'll see what's left to do and whether that's
> realistic to get it into Debian testing in time for the freeze for
> disruptive changes (March 15). I'll make the final decision once 4.1
> final is released.
> 
>>> Do I understand correctly that 4.x (or is it only 4.1?)
>>> may not support policy that was written for 3.x?
>>>
>>
>> AppArmor 4.x is backwards compatible with 3.x through the abi
>> mechanism. If a profile declares support for a 3.x abi that
>> is what will be supported and used.
> 
> OK, so, do I understand correctly that if we ship 4.1 in Debian
> Trixie, all profiles shipped in Trixie MUST:
> 
>   - Either declare abi/4.x — there's already a few in Debian, but not
>     many; this will work.
> 
>   - Or declare abi/3.0 — there's already a few in Debian, but not many;
>     this will work in most cases, but in some cases profile
>     interactions may break things and extra work is needed to
>     fix things.
>

No. How the abi system works is if profiles declare an abi, then the
parser will use the profiles declared api, and also what is advertised
by the kernel and intersect them as part of the compile so that if
the profile doesn't support something in the kernel, the compile
will reflect that and the kernel won't (mostly there may be some things
that has to be done) enforce it.

If a profile doesn't declare an abi then it is assumed to be a 2.x
profile and we fall back to the abi pinning system. You can find
more detail in the wiki https://gitlab.com/apparmor/apparmor/-/wikis/apparmorpolicyfeaturesABI


>     To tell whether that's the case, is it sufficient to run them
>     through `apparmor_parser --skip-cache --skip-kernel-load`
>     and assume the parser will error out if they're not compatible?
> 
yes the parser will error out if it doesn't understand something.

As for compatible, that depends on what you mean. The parser can do
rule downgrade, and drop features entirely if the kernel doesn't
support them. You can have the parser be silent about those changes,
warn on them, or error out.

see
$ apparmor_parser --help=warn

for the current set of supported warnings. But what you are specifically
looking for is

[no-]rule-not-enforced 	warn if a rule is not enforced
[no-]rule-downgraded   	warn if a rule is downgraded to a lesser but still enforcing rule
[no-]abi               	warn if there are abi issues in the profile

you can disable a warning with, eg.
    apparmor_parser --warn=no-rule-not-enforced

you can enable a warnings with, eg.
    apparmor_parser --warn=rule-not-enforced

and you can cause the parser to error out on a specific warning with
    apparmor_parser --Werror=rule-not-enforced

you can set these in /etc/apparmor/parser.conf or on the cmdline, the
cmdline will override what is set in the apparmor.conf file


There is one more wrinkle, for a build time test you are going to
want to specify the expected kernel ABI, so that you aren't testing
against the build host and what ever random kernel it has

you will need to set the flag

--kernel-features=the/kernel/features/file

you can get the kernel features file by running the following cmd
on a Trixie system

$ aa-features-abi -x > kernel-feature-file


There is a caveat that I thought of that the current warns don't
cover.
warn=abi covers your profile file having a different abi than the
          includes you are using
warn=rule-downgraded covers cases like unix socket rules getting
          downgraded to just a network socket rule
warn=rule-not-enforced covers the cases where a rule just can't be
          enforced at all

what isn't covered is if the profiles abi (what ever it is) doesn't
cover what the kernel supports. That is the kernel can enforce
restriction beyond what the profile will. ie. warn that this profile
should be upgraded/improved.

>     If that works, we're in luck: I can do that via autopkgtests!
>     If takes more manual work, I doubt we'll have capacity to evaluate
>     all the profiles in Debian in due time.
> 
setting Werror should allow autopkgtests to catch errors

>   - Or declare no ABI but luckily be compatible with ABI 4.x. I think
>     the majority of the profiles we have in Debian currently declare
>     no ABI. I don't know if they are compatible with ABI 4.x.
> 

profiles that don't declare an ABI will be assumed to be ABI 2.x, the
specific ABI will be taken from the parser.conf pinning that debian
has enabled.

Policy loaded with a 2.x ABI can co-exist in the kernel with 3.x and
4.x ABIs, each being enforced as best as possible using their respective
ABIs.

This does mean 2.x policy isn't enforcing newer features, eg. on Ubuntu
the user namespace restrictions. But it allows for incremental policy
updates, and for LXD to have a debian Buster container using its
policy while running on debian Trixie



>     Same as above:
> 
>     To tell whether that's the case, is it sufficient to run them
>     through `apparmor_parser --skip-cache --skip-kernel-load`
>     and assume the parser will error out if they're not compatible?
> 

yes, same answer as above.

>     If that works, we're in luck: I can do that via autopkgtests!
>     If takes more manual work, I doubt we'll have capacity to evaluate
>     all the profiles in Debian in due time.

ideally (hoefully) it will just work without having to do any policy
updates.

however its not a bad idea to go through and take a look at what
could be upgraded

> 
> Correct?
> 
> I've tried to understand how this works from
> https://gitlab.com/apparmor/apparmor/-/wikis/AppArmorpolicyfeaturesabi
> but I failed so far. If there's other doc I should read, please point
> me to it :)
> 
Oh. Well that means I need to work on improving that doc then :)

> Cheers,


