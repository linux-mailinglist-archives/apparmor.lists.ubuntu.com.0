Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D29784A6C
	for <lists+apparmor@lfdr.de>; Tue, 22 Aug 2023 21:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qYX3B-0004kB-O3; Tue, 22 Aug 2023 19:28:25 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qYX3A-0004if-G7
 for apparmor@lists.ubuntu.com; Tue, 22 Aug 2023 19:28:24 +0000
Received: from [10.8.192.2] (unknown [50.47.144.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9872C400FF; 
 Tue, 22 Aug 2023 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692732504;
 bh=kvqkivsKxAV86aMsAMF0SdVAoMxhg68oNywBNC10nCg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=V3zuTMkMKuQATLOZBfUfkd9PpKwi9joQGoiCHXp9V8yEvI/d4XDDHT+4hTXdWRN11
 daN2taPyLKBKdIe/za00YrnEdqif3AxtjX6axGLQC+D+f7cbq8RD0uH2A28kxUerXA
 etNP+AjYdw5mJ8Zk8lu2845Jwp6hcRU+FVSpNt9fTwZagKwNBU/aoDZZyPykVz6XeA
 gJm7irWvNEOH00NzvbTXBJya1oQI3o4MU29orhVjfWQLMyjLAU0+eVHg9fMC5oGwyE
 2gVOT5Z73M8FXUs4qcoInJwZeh5kQuXZhp1h5IhlqSWVkykrX0DZzgPFoNrbZLhx3E
 +XYevpmTJc9rw==
Message-ID: <6d9e4dd9-4197-bbd1-eaf5-d79db0605ea3@canonical.com>
Date: Tue, 22 Aug 2023 12:28:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
References: <20230807093904.565766-1-gongruiqi@huaweicloud.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230807093904.565766-1-gongruiqi@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: remove unused PROF_* macros
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
Cc: linux-security-module@vger.kernel.org,
 Wang Weiyang <wangweiyang2@huawei.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Xiu Jianfeng <xiujianfeng@huawei.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/7/23 02:39, GONG, Ruiqi wrote:
> From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
> 
> The last usage of PROF_{ADD,REPLACE} were removed by commit 18e99f191a8e
> ("apparmor: provide finer control over policy management"). So remove
> these two unused macros.
> 
> Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>

sorry, I seem to have dropped my reply to this, I have
pulled this into apparmor-next

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/include/policy.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
> index 545f791cabda..ed9a8669af80 100644
> --- a/security/apparmor/include/policy.h
> +++ b/security/apparmor/include/policy.h
> @@ -254,9 +254,6 @@ ssize_t aa_remove_profiles(struct aa_ns *view, struct aa_label *label,
>   			   char *name, size_t size);
>   void __aa_profile_list_release(struct list_head *head);
>   
> -#define PROF_ADD 1
> -#define PROF_REPLACE 0
> -
>   #define profile_unconfined(X) ((X)->mode == APPARMOR_UNCONFINED)
>   
>   /**


