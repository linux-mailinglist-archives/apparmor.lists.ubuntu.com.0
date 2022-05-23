Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24E5307F8
	for <lists+apparmor@lfdr.de>; Mon, 23 May 2022 05:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nsyUB-00039B-6y; Mon, 23 May 2022 03:11:59 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nsyUA-000390-45
 for apparmor@lists.ubuntu.com; Mon, 23 May 2022 03:11:58 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 406083F222; 
 Mon, 23 May 2022 03:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653275516;
 bh=ME4DgQz1ZQkUQbseaucCWjpRoKJKTXuKSMt1Iewn76M=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=USSdqPG+5aLJReJbg31TvL6Cga+M82IkM5uSeJb8CjVruf+5ItDQL3XHle1nf4mA1
 RC8YaeLpCg1pK2Qq6WBpDUSQRGdhDHlgoF0W8vIbvg11Nvdi74AgMdrhMSPQeE+QLD
 UXSi28wIi526lCbOuobPDD/92sulgshhT4f9jhjHzDBXPbevOS7FxIm1EO+kjmKX7h
 tW2YWzwmM3BRi7LtxMfZZsOnJj/9YwGEBEPlBicMR71cevQXbO/YAbPVGlHnZXie5M
 egT6wAa4CXbzOWaDXdCtqviLg7sbWnJUHUGSW0Ywr5SxubD38e+vB2UBkuni8Tpsog
 E/o53sJV1Tsjg==
Message-ID: <47593cdc-4db1-1975-4a6e-115899095a6e@canonical.com>
Date: Sun, 22 May 2022 20:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: werner_kienzler <werner_kienzler@protonmail.com>
References: <acQDNxeIWDb5bYaBDt1z9dL9-E7k3E5rmYznvPuVJWyHl76LFAV-dpuqS5tFv_MykfCIqkIIfsl7uM4bIZxD2cQsAoQUmDCl__PN9h6IRGE=@protonmail.com>
 <c7bc314e-46bb-e463-cb52-a71536083a02@canonical.com>
 <Y4XUwH0mA3r01nKFQcdPXTvsYqgV-H0Tvk-KF3ENwu2iTj1wATzhc-j8QwaoNXKMQqauhKLzKq0TGKjW8jHNiuMYz8VgQODkn9k-HmBlM8U=@protonmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <Y4XUwH0mA3r01nKFQcdPXTvsYqgV-H0Tvk-KF3ENwu2iTj1wATzhc-j8QwaoNXKMQqauhKLzKq0TGKjW8jHNiuMYz8VgQODkn9k-HmBlM8U=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Apparmor and Docker - capabilities and network flags
 not working
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/22/22 06:43, werner_kienzler wrote:
> Hallo,
> 
>> is docker using user namespaces, or network namespaces?
> Good question - I didn't enable "user namespace isolation" in the docker daemon (so I don't set "userns-remap" in "/etc/docker/daemon.json"), so I assume I'm using network namespaces? But I don't have deeper knowledge in this topic - should I run some test here or configure something?
> 

I need to do some digging on the docker side before I can say what configs you need to look at or tests for you to run.

> 
>> What is your kernel version? And do you have any none-upstream patches on it.
> I use an up to date kernel of my dirstro, which is 5.17.9. It is 100% vanilla and has no patches applied to it.
> 

Can you dump the loaded profile and send it to me? Basically

sudo cat /sys/kernel/security/apparmor/policy/profiles/docker-nginx.*/raw_data > /tmp/raw_profile

where * is going to match some unique number and send me the raw_profile file. This will let me pick out how the parser is compiling the profile which will help with figuring out why network deny is not working.



