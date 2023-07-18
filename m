Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F57572A9
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 06:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLbu0-0000kv-Uc; Tue, 18 Jul 2023 04:01:32 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qLbtz-0000ko-WE
 for apparmor@lists.ubuntu.com; Tue, 18 Jul 2023 04:01:32 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B969A3F911; 
 Tue, 18 Jul 2023 04:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1689652890;
 bh=gD5IqYGTungJeSAscKUTxm/7M49LxPXzyQ0m3wbIp4I=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=D6ZV7UEfowewaxx8Fx0tR3kWNTQtqKm1k8JpkpGsW7QBc84FJ4FEdlQXScnUuRuGq
 6vMqkGEgh7PaqmM7c9mwrWMj0p+qWSGFKUS4KA4iu41ZmDEifArwot6Xa/ATLIdb0Z
 3wUZlgPyySCMoQ3hNSGstOAD75isLWKo8glWIW3eo+hjSUwYKphicjgQI1cZUD0k7P
 Qht2jLUu6+kooE+VthXJ/SIsae46EYI2cbGxGXBcTivmtxpTpynj+aD51Vp0PIUxyO
 RNuXo3Ago/UdCTFS3Z94AAg0Zhj+0Lwk4TtZ2Ai1koDh80A/ZSWt/gBHjBmg06z3kK
 vSBo+CoBd82tg==
Message-ID: <fccec1fb-b421-a532-5ee3-027f94b836fc@canonical.com>
Date: Mon, 17 Jul 2023 21:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexandre Pujol <alexandre@pujol.io>, apparmor@lists.ubuntu.com
References: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

<< snip >>

> I am attaching the systemd logs for more details: without apparmor [4] and, with apparmor [5] enabled. They have been generated on an Archlinux based VM made with [6]. The VM can be generated as detailed in [7].
> 

so there are a couple of errors that jump out at me around so larger jumps in time in the logs

Jul 10 11:51:22 aa-archlinux-gnome gnome-shell[1754]: AT-SPI: Error retrieving accessibility bus address: org.freedesktop.DBus.Error.NoReply: Did not receive a reply. Possible causes include: the remote application did not send a reply, the message bus security policy blocked the reply, the reply timeout expired, or the network connection was broken.


And org.freedesktop.systemd1 seems to be an issue, while the non-apparmor log has some failures it successfully starts the service as part of the session
Jul 10 11:52:48 aa-archlinux-gnome dbus-daemon[439]: [session uid=120 pid=439] Successfully activated service 'org.freedesktop.systemd1'
Jul 10

the apparmor log does not succeed in launching the service, throwing up about 10 more errors around it than the non-apparmor log

nothing definitive but some avenues to research


