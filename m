Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DED757080
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 01:28:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLXdZ-00057J-1a; Mon, 17 Jul 2023 23:28:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alexandre@pujol.io>) id 1qLXdT-00055z-3w
 for apparmor@lists.ubuntu.com; Mon, 17 Jul 2023 23:28:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FB91E0005
 for <apparmor@lists.ubuntu.com>; Mon, 17 Jul 2023 23:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pujol.io; s=gm1;
 t=1689636490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Z/nwPI3fADaY68qgP6ROuQdmtprcTotqOx0Z95Qe9Ck=;
 b=Ca85llEQC3h1O3lAJ9f8fZahdB4nfa2/v6xPKMxsgUfOs8s+KJcdNms3VTPSHat+3soznw
 +K6z4IVMM/9jKg7pHp3mnFFWIRoY5nlDz1IjBYN38E6XHKkYXyh+Z3fxKCdxE3Z5AxsKCE
 iF2j3Mmg1qTRq6t+8IL2fUjTvFCF8TAdKNH13GpmCR425pkqeuYjtIsBdVKjLyZJPeyXxk
 s3vLmUd5+nNIU41G2YtgODpmVXn3Q2apvcWS4oM8UYR0antKfL0Md6Q+BmHuITV1Uj4KTr
 JE0DZacpo/FRuLz3pePnCrVNK4/Q3nrtUVqfR5iDGrJkJw91AHIGY9WIVqpSiQ==
Message-ID: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
Date: Tue, 18 Jul 2023 00:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexandre Pujol <alexandre@pujol.io>
Autocrypt: addr=alexandre@pujol.io; keydata=
 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
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alexandre@pujol.io
Subject: [apparmor]  apparmor with large profile set
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

Hi,


Following a conversation I had with John a few months ago at the LSS-NA. 
Here is a (non-exhaustive) list of things that are useful when working 
on large profiles set [0]. For more context, you can find my talk to 
LSS-NA [1] and the slide [2]. I know they may have been work already in 
these area, this email mostly aim to put the accent on the feature that 
are the most needed (in my opinion).


**Current/Planned Rules**

- The ability to transition to another profile in pivot_root is needed 
for most sandbox manager profiles. This would allow a profile to 
transparently transition to a sandboxed profile without the help of the 
sandboxing program (Eg: flatpak, steam, toolbox...)

- The reg ex exclusion has proposed in the doc [3] ({*^}, {**^}) would 
be quite useful too.

- The globbing syntax having (where [0-9]* means a digit, followed by 
any number of any character) is confusing for everyone. Furthermore, the 
way the profiles are usually written I am pretty sure this would not 
break too many profiles to update this to a more common syntax

Updating the doc to clearly show what is already implemented and what is 
planned would be nice too.


**Conditional Statement**

A lot of resource access depends on some global settings/software 
installed on the system. Eg: the desktop environment, X11, Wayland, the 
package manager... Therefore, having some sort of conditional statement 
in the profile could make sense. That can mostly be sugar syntax, 
however, some conditions may need to be checked on execution, while for 
other, simple directives (like: `only: apt`) parsed during package build 
could work.


**no-new-privs**

To the surprise of no one, this is a pain... While most profiles do not 
need it at all, some very important profiles are really dependent on it. 
For example, it is currently not possible to properly confine systemd 
and therefore, to have full system confinement without it.


**Snap**

Some snap based profile (dynamically generated by snap itself) breaks 
when using with apparmor.d [0]

An example with the Ubuntu Store that does not start and raise the 
following audit log:
```
DENIED  snap.snap-store.ubuntu-software dbus_method_call 
org.freedesktop.DBus send bus=session path=/org/freedesktop/DBus 
interface=org.freedesktop.DBus member=RequestName peer_label=dbus-daemon
```

The snap.snap-store.ubuntu-software profile is expecting an unconfined 
peer_label, not the dbus-daemon profile.


**Profiles really long to load**

Using apparmor.d with Gnome raises a curious issue: the system needs 
over a minute to load, without raising any gnome or apparmor related 
logs. However, it is as fast as expected without apparmor.d or when 
Gnome is not present (on server for example).

I am attaching the systemd logs for more details: without apparmor [4] 
and, with apparmor [5] enabled. They have been generated on an Archlinux 
based VM made with [6]. The VM can be generated as detailed in [7].



That is all for now. I am going to test the alpha version of apparmor 4 
with the new network rules it looks promising...

[0]: https://github.com/roddhjav/apparmor.d

[1] https://www.youtube.com/watch?v=OzyalrOzxE8

[2] 
https://lssna2023.sched.com/event/1K7bI/building-the-largest-working-set-of-apparmor-profiles-alexandre-pujol-the-collaboratory-tudublin 


[3]: 
https://gitlab.com/apparmor/apparmor/-/wikis/AppArmor_Core_Policy_Reference#apparmor-globbing-syntax 


[4]: 
https://privatebin.net/?318a3f5d601c0d83#H1SCAquJp4tcaezDhnSjKeMGk66zLRdUx8k7jLKq75tE 


[5]: 
https://privatebin.net/?cdaac3f1051aad22#CbGrksjKJwrjEAFo7rzgWCV57SgW4jRjg9B99sT44UTy 


[6]: 
https://github.com/roddhjav/apparmor.d/blob/main/tests/packer/init/archlinux-gnome.user-data.yml 


[7]: 
https://apparmor.pujol.io/development/integration/#test-virtual-machines

Regards,
Alex


