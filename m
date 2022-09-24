Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 744795E8AAF
	for <lists+apparmor@lfdr.de>; Sat, 24 Sep 2022 11:21:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oc1Lf-0002NH-Gp; Sat, 24 Sep 2022 09:21:23 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oc1Le-0002NA-27
 for apparmor@lists.ubuntu.com; Sat, 24 Sep 2022 09:21:22 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B9943F121; 
 Sat, 24 Sep 2022 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1664011281;
 bh=o4c3l0kNYfnCILC+LMrCcqunU9BVFBwuA+Uw3QWtLmA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=KplvA8MJ4AapHEy7QV5fKanMj4I6BnyLH/eW4wGYW0/8bQuT0oqTv0tLrA+KFyFPU
 zQW0L1bEyW/jYAE0gUS6RieFgH1FjewpCRru0h+4d056puLLG0k8ZMrAk3ggD9LvkD
 EKBcM2LRrTsJJxJG+6wd+kwGTOm43q8jqpul2w+KGEbo9GAMRIjZOirpsSnbR7+Vqd
 Oq15b3K9S1GWVZlLzFyCpFQIZoWxjKsTdeK6+fZHFg18YcbAuX0hnkyyuFLIP3lekS
 3gEKeHQZtNlFc6/ADWZn3FIjWDvRDahac6yLg9x4m5Eht4BNXzQE/Z2vlCUAraFZsB
 SlEubRXFwKxHw==
Message-ID: <b493f609-3dbd-77fd-8290-1e48eb0059f8@canonical.com>
Date: Sat, 24 Sep 2022 02:21:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huawei.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20220914074607.194838-1-xiujianfeng@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220914074607.194838-1-xiujianfeng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: make __aa_path_perm() static
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 9/14/22 00:46, Xiu Jianfeng wrote:
> Make __aa_path_perm() static as it's only used inside apparmor/file.c.
> 
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/file.c         | 6 +++---
>   security/apparmor/include/file.h | 3 ---
>   2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index e1b7e93602e4..14f7d7ef3f54 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -265,9 +265,9 @@ unsigned int aa_str_perms(struct aa_dfa *dfa, unsigned int start,
>   	return state;
>   }
>   
> -int __aa_path_perm(const char *op, struct aa_profile *profile, const char *name,
> -		   u32 request, struct path_cond *cond, int flags,
> -		   struct aa_perms *perms)
> +static int __aa_path_perm(const char *op, struct aa_profile *profile, const char *name,
> +			  u32 request, struct path_cond *cond, int flags,
> +			  struct aa_perms *perms)
>   {
>   	int e = 0;
>   
> diff --git a/security/apparmor/include/file.h b/security/apparmor/include/file.h
> index 029cb20e322d..17dca3502230 100644
> --- a/security/apparmor/include/file.h
> +++ b/security/apparmor/include/file.h
> @@ -189,9 +189,6 @@ unsigned int aa_str_perms(struct aa_dfa *dfa, unsigned int start,
>   			  const char *name, struct path_cond *cond,
>   			  struct aa_perms *perms);
>   
> -int __aa_path_perm(const char *op, struct aa_profile *profile,
> -		   const char *name, u32 request, struct path_cond *cond,
> -		   int flags, struct aa_perms *perms);
>   int aa_path_perm(const char *op, struct aa_label *label,
>   		 const struct path *path, int flags, u32 request,
>   		 struct path_cond *cond);


