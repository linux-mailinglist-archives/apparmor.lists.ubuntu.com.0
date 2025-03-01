Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175AA4AE7B
	for <lists+apparmor@lfdr.de>; Sun,  2 Mar 2025 00:48:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1toWZA-0003Js-Uc; Sat, 01 Mar 2025 23:48:20 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1toWZ8-0003JY-73
 for apparmor@lists.ubuntu.com; Sat, 01 Mar 2025 23:48:18 +0000
Received: from [192.168.192.85] (unknown [50.39.103.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9E1FD3FF09
 for <apparmor@lists.ubuntu.com>; Sat,  1 Mar 2025 23:48:17 +0000 (UTC)
Message-ID: <3c802290-fe1f-45e1-8638-cf8ac3401033@canonical.com>
Date: Sat, 1 Mar 2025 15:48:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <dc80dadc-3ebd-4a63-a13a-6427d91d4908@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <dc80dadc-3ebd-4a63-a13a-6427d91d4908@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] What's about all these new "uncofined" profiles with
 just "userns"?
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

On 3/1/25 05:02, Vincas Dargis wrote:
> Hi,
> 
> After some AppArmor upgrade in Sid I've discovered that "firefox" profile is now duplicate.
> 
> Also, started to see some strange "flatpak", "busybox" errors in bash terminal...
> 
unconfined profiles shouldn't be causing errors, but if you enforce them ...

The unconfined profiles have multiple purposes/functions,

1. As a name for policy to reference. Profiles can cross reference other profiles, etc. as part of ipc rules. Instead of using unconfined for everything that isn't confined you can using an unconfined profile, giving it a name, and tightening up the profile of the application communicating with the application/service that has the unconfined profile.

Generally from a system packaging pov unconfined profiles are a stepping stone, to having a full profile.


2. They serve as a way to disable a profile without breaking policy. Simply disabling often results in the application running unconfined. But with ipc rules this can end up breaking policy. An unconfined profile fixes this problem. We did not add a symlink mechanism like disable has, as we were hoping to land an overlay mechanism that could be used instead.


3. They serve as a policy escape/by-pass for local users. If confinement is tight, an system may not have unconfined, or unconfined might have restrictions. Unconfined profiles profiles provide a way for users to create a profile, without having to go through the development work, to just allow their applications to run.

You can see this use on Ubuntu systems, where aa-notify (if enabled) will prompt the user, and then make a basic unconfined profile so that they can just run their application that is getting denials. Generally this is for AppImages atm.


4. This is being used by Ubuntu as a by-pass of the unprivileged user namespace restriction, for applications that are use unprivileged user namespaces.

    Currently Ubuntu is carrying some hard coded patches that add some restrictions on unconfined. One of those is stopping applications from using unprivileged user namespaces (privileged applications have full access). Unfortunately unprivileged user namespaces just aren't as safe as they were advertised to be and are part of most exploit chains now, but they are are used by a lot of applications, generally to setup some kind of sandbox. Instead of a big global toggle for unprivileged user namespace mitigation, Ubuntu is now doing it on a per application basis. The many of the unconfined profiles, are there to allow those applications to function while a full profile is being developed.

As for the Ubuntu unprivileged user namespace restriction. That ability will be coming to upstream as well, but as part of policy instead of hard coded. So it is taking longer to land.



> 1. Apparently, now there are bunch of new profiles, like /etc/apparmor.d/firefox, that conflicted with my own /etc/apparmor.d/usr.bin.firefox.
> 
disable the ones that conflict. An overlay feature is coming, to allow local profiles to easily override system profiles but it didn't land in 4.1

> 2. Apparently, my long-practiced "tradition" to invoke `aa-enforce /etc/apparmor.d/*` after every apparmor[-profiles] package upgrade (due to usr.bin.ping-and-friends becoming "complain" again), is now seemingly ill-advised? Enforcing all these new, almost-empty "uncofined" profiles makes sort of havoc...
> 
ah yeah aa-enforce of the unconfined profiles will cause some issues. Enough that its a bug worth fixing. We should add some kind of flag that either allows skipping those or the inverse is required to enforce on them. Opinions/feedback on which is welcome

> So,
> 
> a). Could some one please bring me back into the loop, what's it all about?
> 

> b). How should user enable proper custom firefox profile correctly?
> 
>      aa-disable /etc/apparmor.d/firefox, and enforce /etc/apparmor.d/usr.bin.firefox?
>
aa-disable of the profile file you don't want should work, and is the current recommended method. Of course it fails if they have the same file name, in which case it is recommended to rename your local version, at least until the overlay feature lands.
  
>      Or overwrite /etc/apparmor.d/firefox after every upgrade?
> 
ideally not considering that messes with packaging.

>      Or is there some sort of new overriding feature I don't know to make these new profiles inactive while custom one active?
> 
sadly the overlay feature didn't land in 4.1, it is coming and it will allow you to setup local overrides without having to overwrite profiles dropped in by packaging.

> Thanks.
> 
> 
> [0] https://salsa.debian.org/apparmor-team/apparmor/-/blob/8c785a5fb707253fb46213e0648d19b64631de83/profiles/apparmor.d/firefox
> 
> 
> 


