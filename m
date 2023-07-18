Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 420377571BE
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 04:27:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLaR2-0004pA-KK; Tue, 18 Jul 2023 02:27:32 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qLaR0-0004p2-QI
 for apparmor@lists.ubuntu.com; Tue, 18 Jul 2023 02:27:30 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DCCBC3F912; 
 Tue, 18 Jul 2023 02:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1689647250;
 bh=OYzAIu1gtqyzcA55330a+O8ARptzX9J8RM+QFY49m28=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=GD9TclP1X6zqzufaHqHcl476uZ/cSlJiK5wqMZ3rSEuLQc00o+jB0m217MSTcceoe
 jMMvD/Ii6i2sP5ecJgNG3jSfGUT1HVz1zV4XO752eFCFKYCyf2p1mEj1UwP3qTzFKv
 Gb4T8ryQost74DMMC4dRSLaljGIW2Kqlo6Araa1xi3AgW/1TWIrdbriCJdM9CB0lAd
 SolxzybuFpYsiDPX9tWl3HwQpeKA1Gsalwxm2bSRg4yKqU/ZSyOfUhf+h1cL9ZYm8V
 SKedcZtJ41YK2ODH/ve1t5Vei7dowm2t8533CfhK3N7C1Jlo9uQP2axwIX1NeiNnFh
 logeciYc/80Sw==
Message-ID: <ecb682bc-86be-5e25-b6f9-ab7c2e06914e@canonical.com>
Date: Mon, 17 Jul 2023 19:27:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Alexandre Pujol <alexandre@pujol.io>, apparmor@lists.ubuntu.com
References: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] apparmor with large profile set
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

On 7/17/23 16:28, Alexandre Pujol wrote:
> Hi,
> 
> 
> Following a conversation I had with John a few months ago at the LSS-NA. Here is a (non-exhaustive) list of things that are useful when working on large profiles set [0]. For more context, you can find my talk to LSS-NA [1] and the slide [2]. I know they may have been work already in these area, this email mostly aim to put the accent on the feature that are the most needed (in my opinion).
> 
Hey Alexandre, thanks for writing this up

> 
> **Current/Planned Rules**
> 
> - The ability to transition to another profile in pivot_root is needed for most sandbox manager profiles. This would allow a profile to transparently transition to a sandboxed profile without the help of the sandboxing program (Eg: flatpak, steam, toolbox...)
> 

yes this has been experimented with, though I don't know if we will ever get it upstream. We might be able to get a limited form if, we can should there is a single task within the namespace. The problem comes down to pivot_root applies to all tasks within the namespace and walking a switch all tasks (generic case) isn't going to get upstream.

I have been playing with a more limited update a shared variable model, that would allow for a change without having to walk all tasks in an ns within a pivot_root hook.


> - The reg ex exclusion has proposed in the doc [3] ({*^}, {**^}) would be quite useful too.
> 
well globbing ...

> - The globbing syntax having (where [0-9]* means a digit, followed by any number of any character) is confusing for everyone. Furthermore, the way the profiles are usually written I am pretty sure this would not break too many profiles to update this to a more common syntax
> 
this can't change, it would break policy, even if we update all policy in the system there is policy being shipping by too many other projects. For better or worse the apparmor rules are based on shell globbing not RE or eRE. There is a potential for exposing a full RE with special syntax. Something like

   ^/foo[1-7]*$

so basically using RE anchoring to indicate the rule is using RE instead of globbing. This of course is just one potential way of expressing this. Suggestions are welcome


> Updating the doc to clearly show what is already implemented and what is planned would be nice too.
> 
yeah the docs need serious work

> 
> **Conditional Statement**
> 
> A lot of resource access depends on some global settings/software installed on the system. Eg: the desktop environment, X11, Wayland, the package manager... Therefore, having some sort of conditional statement in the profile could make sense. That can mostly be sugar syntax, however, some conditions may need to be checked on execution, while for other, simple directives (like: `only: apt`) parsed during package build could work.
> 

yep. This is a WIP, I don't know if we will get to where we land better condition statements in 4.0 but probably not, as only prep work has been done so far. With that said the plan is to improve the current conditionals, and also add some kernel run time vars.

> 
> **no-new-privs**
> 
> To the surprise of no one, this is a pain... While most profiles do not need it at all, some very important profiles are really dependent on it. For example, it is currently not possible to properly confine systemd and therefore, to have full system confinement without it.
> 
> 
yeah, another one we need to get upstream. The question has been exactly what we can get upstream before we make it available more broadly. This should be coming within the next couple kernel releases.

> **Snap**
> 
> Some snap based profile (dynamically generated by snap itself) breaks when using with apparmor.d [0]
> 
indeed

> An example with the Ubuntu Store that does not start and raise the following audit log:
> ```
> DENIED  snap.snap-store.ubuntu-software dbus_method_call org.freedesktop.DBus send bus=session path=/org/freedesktop/DBus interface=org.freedesktop.DBus member=RequestName peer_label=dbus-daemon
> ```
> 
> The snap.snap-store.ubuntu-software profile is expecting an unconfined peer_label, not the dbus-daemon profile.
> 
I have talked to the snap team about this some, and locally within our own policy we are going to work towards getting rid of unconfined as a label. Any where it exists today with get replaced with a variable with a name that has the semantic intent. It may get set to unconfined, but it will at least be easier to make changes.

> 
> **Profiles really long to load**
> 
> Using apparmor.d with Gnome raises a curious issue: the system needs over a minute to load, without raising any gnome or apparmor related logs. However, it is as fast as expected without apparmor.d or when Gnome is not present (on server for example).
> 
I have some ideas here, but we are going to need to do some testing to find what the major bottle necks are. Profile loads do get serialized on a mutex lock but that should be only held during the insert after all the unpack and verification is done.

It will be interesting to get some actual data on the bottle neck.

> I am attaching the systemd logs for more details: without apparmor [4] and, with apparmor [5] enabled. They have been generated on an Archlinux based VM made with [6]. The VM can be generated as detailed in [7].
> 
thanks, that is going to take awhile to digest. Hopefully there are some good clues in it

> 
> 
> That is all for now. I am going to test the alpha version of apparmor 4 with the new network rules it looks promising...
> 
> [0]: https://github.com/roddhjav/apparmor.d
> 
> [1] https://www.youtube.com/watch?v=OzyalrOzxE8
> 
> [2] https://lssna2023.sched.com/event/1K7bI/building-the-largest-working-set-of-apparmor-profiles-alexandre-pujol-the-collaboratory-tudublin
> 
> [3]: https://gitlab.com/apparmor/apparmor/-/wikis/AppArmor_Core_Policy_Reference#apparmor-globbing-syntax
> 
> [4]: https://privatebin.net/?318a3f5d601c0d83#H1SCAquJp4tcaezDhnSjKeMGk66zLRdUx8k7jLKq75tE
> 
> [5]: https://privatebin.net/?cdaac3f1051aad22#CbGrksjKJwrjEAFo7rzgWCV57SgW4jRjg9B99sT44UTy
> 
> [6]: https://github.com/roddhjav/apparmor.d/blob/main/tests/packer/init/archlinux-gnome.user-data.yml
> 
> [7]: https://apparmor.pujol.io/development/integration/#test-virtual-machines
> 
> Regards,
> Alex
> 
> 


