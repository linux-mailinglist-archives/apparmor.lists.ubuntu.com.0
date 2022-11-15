Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC062AEAE
	for <lists+apparmor@lfdr.de>; Tue, 15 Nov 2022 23:55:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ov4pu-0008IQ-8g; Tue, 15 Nov 2022 22:55:22 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ov4ps-0008IG-FM
 for apparmor@lists.ubuntu.com; Tue, 15 Nov 2022 22:55:20 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C7D4C43203; 
 Tue, 15 Nov 2022 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668552918;
 bh=ZYKYh7ar+iV2zdeaMNhbONQKuid3u4gISiE2FkUTHsk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=qXDEx1Fson92rvz4Uc50ZgsAVBYMzeyV1AOFR+dHEubdIZJUa/FxXd3yCbrTAj7Jp
 rVoEFMA2QDxKb0tlgoanbCzhgmGsU7fGnCNg1YVbCUd7Cs1Yr3nIrIZOH/yA9mfGf8
 aYjDy/c+prfjAzUqH3vJtNG3V9rXIuJ5nJ3m7CcTNry+qMiiMYJSCELljOn8E3s4z6
 43Rf2bmnVhWWAO2+zQ81xGUAfybFiv8xo6GOJCAq5mGpK2RrzsND5D1kZcI2xJiMFe
 nqeO4+h1WqpsvdNixDkjqHaNlNEBt0bVYy983HsuiPUCvs2FuxOSuESfEsrfDpN9Ya
 fvgBpEs5e0Tpw==
Message-ID: <60212b3a-1a03-3843-da59-43881be17f99@canonical.com>
Date: Tue, 15 Nov 2022 14:55:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Sonixxfx <sonixxfx@gmail.com>, apparmor@lists.ubuntu.com
References: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
 <afb647b3-e9a7-24ae-0a94-99cdd2b02b49@canonical.com>
 <CAKO675=Pbn42nZ5d5ViqHXK4McPOyK2BXfh4dOFhp4xhUA=Ypg@mail.gmail.com>
 <CAKO675mn-0StCMUsxF1qO2mUDQK9jRPTB6AOeJiG-G9DGMGH2w@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAKO675mn-0StCMUsxF1qO2mUDQK9jRPTB6AOeJiG-G9DGMGH2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Snaps are blocked by Apparmor on Ubuntu 22.04
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

On 11/15/22 13:23, Sonixxfx wrote:
> Op di 15 nov. 2022 om 19:08 schreef Sonixxfx <sonixxfx@gmail.com <mailto:sonixxfx@gmail.com>
> 
> Sorry for mailing to you directly John.
> 
>     Op di 15 nov. 2022 om 18:06 schreef John Johansen <john.johansen@canonical.com <mailto:john.johansen@canonical.com>>:
> 
>         On 11/15/22 06:30, Sonixxfx wrote:
>          > Hi,
>          >
>          > I was trying Apparmor today, but now my snaps won't run anymore. I have tried a couple of things to solve it, including disabling Apparmor, but it didn't help.
>          > When i try to start Brave for example dmesg shows me:
>          >
> 
>         how did you disable apparmor?
> 
>         systemctl disable apparmor
> 
>         or
> 
>         systemctl disable snapd.apparmor
> 
>         or
> 
>         systemctl stop apparmor
> 
>         or did you edit /etc/grub/defaults
> 
> 
>     I ran
> 
>     sudo systemctl stop apparmor.service
> 
this will unload policy and make everything unconfined until reboot or the service is started again. It is important to note that restarting the service will NOT re-confine applications that are unconfined. They must be restarted.

>     to disable Apparmor.
> 
>     I ran
> 
>     sudo systemctl disable apparmor.service
> 
>     to unload the kernel module.
this does not unload the kernel module, as apparmor is built into the kernel. At this time there is no option to make an of the LSMs loadable modules. What this does is partially disable systemd services that load policy/manage state.

Partially because it only does late stage service disabling, there is early stage that can still run (not used by default on Ubuntu) and this can really mess up your system.

> 
> 
>     Should I have run:
> 
>     sudo systemctl disable snapd.apparmor ?
> 
no the only safe way to disable apparmor is to set apparmor=0 as a kernel parameter, you can do this temporarily in grub when booting or in /etc/defaults/grub and the update-grub

>          > brave_brave.desktop[9095]: snap-confine has elevated permissions and is not confined but should be. Refusing to continue to avoid permission escalation attacks
>          > brave_brave.desktop[9095]: Please make sure that the snapd.apparmor service is enabled and started.
>          >
>          > These messages are also shown when I have Apparmor enabled and started.
>          >
> 
>         what does aa-status return?
> 
> 
>     I have already reinstalled my OS, sorry. But I am curious what you answer to my question.
> 
>          > Can someone tell me how I can resolve this?
>          >
> 
>         so snaps by-pass the apparmor userspace service and only use the kernel component. They run their own service to manage snap confinement. What do you get for
> 
>         systemctl status snapd.apparmor
> 
> 
>         and of course if it is not running you can do
> 
>         systemctl start snapd.apparmor
> 
>         or make sure it runs after reboot
> 
>         systemctl enable snapd.apparmor
> 
> 
>     Thanks for the info 😃
> 


