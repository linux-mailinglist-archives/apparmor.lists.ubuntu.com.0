Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB3629FF0
	for <lists+apparmor@lfdr.de>; Tue, 15 Nov 2022 18:06:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ouzOX-00022N-0d; Tue, 15 Nov 2022 17:06:45 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ouzOV-00022F-Ap
 for apparmor@lists.ubuntu.com; Tue, 15 Nov 2022 17:06:43 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 594FF431AE; 
 Tue, 15 Nov 2022 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668532002;
 bh=raibg8Z0uKIBJGiM9PBHWKMDbnXAqWRQs3Z789+2DiM=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=T+h/6Yi5d4aqrMnUhRMPJkajY2j9SojrIsB2A3oEBt7Aseuh4ACgfQsjB1AmuUDs6
 wiwW8HohoNlagc+SvaauaQ4134JPFn04qGq/naO22ja7bJddQE/VtsWu/ORGrt4IaT
 aUnsJeOZWdNeEri4YJBqq09zcdcMB/tDAaRiA7XHAF+CdXfTpY+mD9wpVEYKiX0Ui4
 45M+hTVvfjWph4wZK/++aoqf7G/GGwtVlBTSo135iR5UvwPdTqgaxTb9laZlEJh9sM
 st4wfx0yDPQgYeNQ97SkJkkiFj9R7MRnnlg099XZa4zB2OJtiG0ZdupiHOJDY+NQno
 VDuv0vhSjRspw==
Message-ID: <afb647b3-e9a7-24ae-0a94-99cdd2b02b49@canonical.com>
Date: Tue, 15 Nov 2022 09:06:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Sonixxfx <sonixxfx@gmail.com>, apparmor@lists.ubuntu.com
References: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
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

On 11/15/22 06:30, Sonixxfx wrote:
> Hi,
> 
> I was trying Apparmor today, but now my snaps won't run anymore. I have tried a couple of things to solve it, including disabling Apparmor, but it didn't help.
> When i try to start Brave for example dmesg shows me:
> 

how did you disable apparmor?

systemctl disable apparmor

or

systemctl disable snapd.apparmor

or

systemctl stop apparmor

or did you edit /etc/grub/defaults

> brave_brave.desktop[9095]: snap-confine has elevated permissions and is not confined but should be. Refusing to continue to avoid permission escalation attacks
> brave_brave.desktop[9095]: Please make sure that the snapd.apparmor service is enabled and started.
> 
> These messages are also shown when I have Apparmor enabled and started.
> 

what does aa-status return?

> Can someone tell me how I can resolve this?
> 

so snaps by-pass the apparmor userspace service and only use the kernel component. They run their own service to manage snap confinement. What do you get for

systemctl status snapd.apparmor


and of course if it is not running you can do

systemctl start snapd.apparmor

or make sure it runs after reboot

systemctl enable snapd.apparmor


