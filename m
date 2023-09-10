Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F65C799DEE
	for <lists+apparmor@lfdr.de>; Sun, 10 Sep 2023 13:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qfJ1C-0000ar-Bs; Sun, 10 Sep 2023 11:54:22 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1qfJ16-0000aX-6X
 for apparmor@lists.ubuntu.com; Sun, 10 Sep 2023 11:54:16 +0000
Received: from [192.168.192.83] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 615DA3F111; 
 Sun, 10 Sep 2023 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1694346856;
 bh=xlXnWypCFPYC81LPfQWebS5jhmXh94DgzMUTsCikYXE=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=vkybdS3sjvRhFCwuY344SAkxLXKmvH8jY6+gDdKmI0/vDf2Urb6TG+SPdqH1ZDOgV
 cboyfG5Ftjf8BHNDHr8RZkTzD8Idv3pjYXeBIlV9cvyMUtBDxN6mqSVN/PXY3mfyc0
 0L2nASgbIU5qJX/NUiCeYh9MZA0AWtHnTZ0z16rTZbejsgdcj7dwFVZ+mq7y6VgZsv
 12T7XOiAU4aZSIBwSlFkuh6y4VXgVlL9x7HaBdnTA1ECZ/4n2eLq1Xq707S7WESs+v
 LVlHnsLU8YYerkJ4qgPRQMJ8WunzC5IQmtArt0iCFWMC50rpWdpsy+E/1+P2D4TUmk
 07mOdxfbUrVgQ==
Message-ID: <35f763fe-9a16-2194-6a51-13515f52598a@canonical.com>
Date: Sun, 10 Sep 2023 04:54:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andreas Steinmetz <anstein99@googlemail.com>, apparmor@lists.ubuntu.com
References: <CAOTMNwtt9=ig9dtOxqyLVBthh+tJJkZEv64qpGN43+-sCBtRrw@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAOTMNwtt9=ig9dtOxqyLVBthh+tJJkZEv64qpGN43+-sCBtRrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] move_mount not handled by AppArmor completely
 subverts security
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

On 9/5/23 07:42, Andreas Steinmetz wrote:
> Tested with kernel 6.4.12-arch1-1
> 
> AppArmor seemingly doesn't handle the move_mount system call. Thus

correct,
commit 2db154b3ea8e ("vfs: syscall: Add move_mount(2) to move mounts around")

added the move_mount syscall and a new LSM hook, but did not provide
even stub implementations to existing LSMs, introducing a regression
in all LSMs implementing mount mediation.

Unfortunately a fix has not landed in apparmor.

> only CAP_SYS_ADMIN is required to bind mount any directory anywhere.

correct. It requires cap_sys_admin in the capability set, and the
profile. Unfortunately if relying on mount mitigations in the profile
this is a by-pass


> This allows to completely subvert security including e.g. rootkit
> installation for a process that actually should be confined by an
> enforced AppArmor policy.
> 
correct. Though it is mitigated to a degree by requiring cap_sys_admin
within the profile.

> Simple policy that should deny mounts and prevent system modification:
> 
> abi <abi/3.0>,
> profile minimal {
>   capability sys_admin,
>   /bin/bash mr,
>   /etc/** mrlk,
>   /mnt/** mrwlk,
>   /usr/** mrlkix,
>   /proc/*/attr/apparmor/current r,
> }
> 
> The following test then run as root:
> 
> [root /]# aa-exec -p minimal /bin/bash
> bash: /dev/null: Permission denied
> bash: /root/.bashrc: Permission denied
> [root /]# cat /proc/self/attr/apparmor/current
> minimal (enforce)
> [root /]# ls -l /etc/malicious_software
> ls: cannot access '/etc/malicious_software': No such file or directory
> [root /]# touch /etc/malicious_software
> touch: cannot touch '/etc/malicious_software': Permission denied
> [root /]# mount --bind / /mnt
> [root /]# touch /mnt/etc/malicious_software
> [root /]# ls -l /etc/malicious_software
> -rw-r--r-- 1 root root 0 Sep  5 16:27 /etc/malicious_software
> [root /]#
> 
> This test case is very legitimate as it shows that the MAC enforcement
> by AppArmor is completely bypassed, resulting is standard DAC access
> control, which is not supposed to happen, especially as the enforced
> profile does not allow for any mount operation.
> 
correct

> Probably the whole set of system calls mentioned in
> https://lwn.net/Articles/759499/ is probably not handled and thus
> affected.
> 

yes and no - there is certainly a need for additional mediation on
them. I need to dig deeper to establish exactly what needs to be
done.

I will reply to this with a first pass at addressing move_mount.


