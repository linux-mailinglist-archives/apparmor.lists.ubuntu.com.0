Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A666291A9
	for <lists+apparmor@lfdr.de>; Tue, 15 Nov 2022 06:50:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ouoqD-0007tQ-6L; Tue, 15 Nov 2022 05:50:37 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ouoqB-0007tD-IX
 for apparmor@lists.ubuntu.com; Tue, 15 Nov 2022 05:50:35 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9ACD4422B3; 
 Tue, 15 Nov 2022 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668491435;
 bh=4LVekn4etMX4t+j1zPTTbnYRPFD21Kw3Oz/a4zinzfk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=pbqC/ToSSDAZQOFd65hKwPYYfhq6Xqtp1oRvCGrYs7m+bPb/1Z58H41Uf83v04w6W
 sZzbJlX9rMyfibS7Jbj3lTBMKXUr2AKCmYJkyizNPra7ORGHg9ZeYCQ3X7fDwwLrPM
 wK5zoK8VC/WFZt5A0eG9V3sSWiP86Q3VhnMVJZcQNyyNptq6ZOetbMuR0bmTT3eNTk
 PJpgE9400bO9DiNT7r/wNFxCmqGHGqJ1PBsuCc73HLIcmqkJBERvaO383L9/hml2fA
 jJgsuBdDOlUqeh8ztFmZP8+17JqytnkmOeLCLcMN+4vrOe+oWHMb+zAYWCczlOsKo1
 zO3X2WsEfr3nw==
Message-ID: <7de9792f-0d85-2225-ddec-9021c9ed14b8@canonical.com>
Date: Mon, 14 Nov 2022 21:50:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: christian.ehrhardt@canonical.com, apparmor@lists.ubuntu.com
References: <20221114162442.2557922-1-christian.ehrhardt@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221114162442.2557922-1-christian.ehrhardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH] Allow access to possible cpus for glibc-2.36
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

On 11/14/22 08:24, christian.ehrhardt@canonical.com wrote:
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> 
> Glibc in 2.36 and later will [1] access sysfs at
> /sys/devices/system/cpu/possible when usig sysconf
> for _SC_NPROCESSORS_CONF.
> 
> That will make a lot of different code, for example
> anything linked against libnuma, trigger this apparmor
> denial.
> 
>    apparmor="DENIED" operation="open" class="file" ...
>    name="/sys/devices/system/cpu/possible" ...
>    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
> ￼
> This entry seems rather safe, and it follows others
> that are already in place. Instead of fixing each
> software individually this should go into the base
> profile as well.
> 
> Initially reported via
> https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/1989073
> 
> Fixes: https://gitlab.com/apparmor/apparmor/-/issues/267
> 
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>

thanks applied to master, 3.1, 3.0, 2.13, and 2.12

> ---
>   profiles/apparmor.d/abstractions/base | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor.d/abstractions/base
> index a03be4b07..81c50359e 100644
> --- a/profiles/apparmor.d/abstractions/base
> +++ b/profiles/apparmor.d/abstractions/base
> @@ -101,6 +101,7 @@
>     @{PROC}/cpuinfo                r,
>     @{sys}/devices/system/cpu/       r,
>     @{sys}/devices/system/cpu/online r,
> +  @{sys}/devices/system/cpu/possible r,
>   
>     # glibc's *printf protections read the maps file
>     @{PROC}/@{pid}/{maps,auxv,status} r,


