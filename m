Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFF744B1F
	for <lists+apparmor@lfdr.de>; Sat,  1 Jul 2023 23:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qFi3p-0000mm-TI; Sat, 01 Jul 2023 21:23:17 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qFi3n-0000md-RA
 for apparmor@lists.ubuntu.com; Sat, 01 Jul 2023 21:23:15 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3B5F941499; 
 Sat,  1 Jul 2023 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1688246594;
 bh=KPwH1nKRAguBg1nOREYocPWWKm8GQE/gTar+oQPlIHA=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=vaE7GU51gvTyNZZsYHdeRzciZ2GlWp0P2w0PhvpGoITzOYrjiv/PUHBt99euDt1n0
 OqgBv9gj/ulxGfKD20vod61pGKJcLm5NP4QEzwK4GOqZqNCyfjFvsrnh67eLFftzRm
 5hmNbdCwG03KqvumVMdNnT4lj5t2IWnShq33PJlYo9zRRelI7uYpkDFavWcH2Jp5RB
 RJ1W/meyZt+upnm9ZxrWbau2WDhz0I6b+/KM/xBOgawmlB5wa+2zE2Kcq410iY9a1F
 PWJiI3Ui0Yc3rH4xK4dh6OGMLO276CFm2tfmYYRwu6cp3TMFKdHTpPMlzph8Y8l+bJ
 GBfk/1vWnHevw==
Message-ID: <6bfe2904-da9a-dc92-a247-917a4650a0fc@canonical.com>
Date: Sat, 1 Jul 2023 14:23:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: me@beroal.in.ua, apparmor@lists.ubuntu.com
References: <2c7b993c-6bb6-7558-f0aa-ddbc28ebe380@beroal.in.ua>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <2c7b993c-6bb6-7558-f0aa-ddbc28ebe380@beroal.in.ua>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] May a GUI program be manipulated via a display
 server socket?
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

On 7/1/23 09:00, me@beroal.in.ua wrote:
> Hi. Suppose that a program M (malicious) tries to open a URL in a web browser V (victim). In a typical AppArmor profile for M, V is executed with the `Px` mode, for example:
> 
> ```
> /usr/lib/firefox/firefox Px,
> ```
> 
> Can M give V an environment variable (`WAYLAND_DISPLAY` for Wayland or `DISPLAY` for X11) which tells V to execute user input from a Unix socket which M controls? If yes, then M can do something on websites under the name of a user. In other words, V isn't isolated after all.

potentially. It will depend on your version of apparmor, V, the kernel, and libc. Well and many other factors.

Lets start with the environment variables

Px scrubs unsafe envirnonment variables (sort of). The definition of unsafe is up to libc (or equiv) and is done as part of the application startup (no I don't like this design).
So libc (or equivalent) is responsible for scrubbing the variables and has the definition of what the variables to scrub. It could choose not to scrub any or the set it is scrubbing may not be sufficient for some applications. V may do its own additional environment scrubbing/sanitization, but that is not likely and we can't rely on it.

Depending on your version of apparmor it will mediate unix sockets, not just creation but track security context of who is on each end, and verify that those end points are allowed to communicate. Who can communicate is governed by policy, so it will depend on the policy on the system. It is fully possible that policy will block M from talking to V, but in a system that allows for a lot of unconfined applications, it might be possible. As communication from confined to unconfined is usually allowed (it can be blocked by policy). So it will depend on if M and V are confined and what their confinement allows.


> 
> I'm worried because this situation is quite common. Many programs are expected to open a URL, and many jobs are controlled via a web browser nowadays.
> 
> 
yep, you are right to be worried, way too much is done through the browser and as such they are generally given way more permissions than is needed for any given task, but it needs to do N different tasks ...


