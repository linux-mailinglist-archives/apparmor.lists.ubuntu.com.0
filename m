Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AD614ACA
	for <lists+apparmor@lfdr.de>; Tue,  1 Nov 2022 13:35:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1opqUG-00054Y-NF; Tue, 01 Nov 2022 12:35:24 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1opqUE-00054Q-MK
 for apparmor@lists.ubuntu.com; Tue, 01 Nov 2022 12:35:22 +0000
Received: from [172.20.1.180] (unknown [62.168.35.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 30E2B4322C; 
 Tue,  1 Nov 2022 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1667306120;
 bh=ZXI2ubxMWRqToeMfWY1GdaoOA0OwOCd4/sdNwpaxdIw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Gq7nJwNhOCIAR4rWNdC8tVTW2oqOl1flYeWFfW77dJHI+pQSRKdWybzBEWWlmKFUG
 2SPqIi61ZFZwthtZzCRKW7j6utaAaBe42rtGbGl0Qhj6wotq52KqsW+nuy7zmDVuqK
 xmvbzFYG6wy4C8h/iPCa2rqQDgkw277NZObKotQj6chzhApK5l53c2wXERy2xc2Xie
 6veWct20Gyvf1dTtUhlVzUbv3L1zBoIUIsk0AcCRFYF23OzlFSSnvRdle1x9/JiOOi
 iZDuNjH1LBNuX77+aK3XbcLX8zaje05cTMedorv4XzctvaAcynfQAogwg7giRu4vCR
 g/ehro9QSM/fw==
Message-ID: <635c91c3-4adb-01ff-1491-fe5188bb38a6@canonical.com>
Date: Tue, 1 Nov 2022 05:35:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huawei.com>, paul@paul-moore.com,
 serge@hallyn.com
References: <20221028123320.88132-1-xiujianfeng@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221028123320.88132-1-xiujianfeng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Fix memleak in alloc_ns()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/28/22 05:33, Xiu Jianfeng wrote:
> After changes in commit a1bd627b46d1 ("apparmor: share profile name on
> replacement"), the hname member of struct aa_policy is not valid slab
> object, but a subset of that, it can not be freed by kfree_sensitive(),
> use aa_policy_destroy() to fix it.
> 
> Fixes: a1bd627b46d1 ("apparmor: share profile name on replacement")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/policy_ns.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
> index 5c38563a6dcf..fd5b7afbcb48 100644
> --- a/security/apparmor/policy_ns.c
> +++ b/security/apparmor/policy_ns.c
> @@ -132,7 +132,7 @@ static struct aa_ns *alloc_ns(const char *prefix, const char *name)
>   	return ns;
>   
>   fail_unconfined:
> -	kfree_sensitive(ns->base.hname);
> +	aa_policy_destroy(&ns->base);
>   fail_ns:
>   	kfree_sensitive(ns);
>   	return NULL;


