Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E7774A48
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 22:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTTFS-0007lN-19; Tue, 08 Aug 2023 20:24:10 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qTTFQ-0007lF-KN
 for apparmor@lists.ubuntu.com; Tue, 08 Aug 2023 20:24:08 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2149541F38; 
 Tue,  8 Aug 2023 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691526248;
 bh=4BQLKRDO3fv4Nxm5Vkxx4czvYuMe15qi/VUS0w2UCvw=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=wL9IIQwkAgZlMOiEXZGnBsvIuIjnYrzoRY1I93cMToS5cWxR0TQNirqq0Ul12OdM+
 JjFL+Q1NZmXs9zHTBUXTi59MLGIUuWUJauHOVVT46Dx6zAE3T9zZyXybHiKjZk/kzq
 MoG05Je74FaoeLB+TCz/bOr5vIX6w4Y173VWk4BuZGejWrmueo+CLTA8aJNHu9o8if
 rwLOtEKQ1vUe6icMnxmaqdUeypD8+QMGtx/AOousdVWjU2gWdDp0CXl/a5saDaEbEA
 X7h1xjeITt0IDj0nTe3xvutHnUDvz97gzoHdFLW5JDcN2S/BxR3V7fNt6a+0vuDodR
 8iwXRPNq3fa+g==
Message-ID: <c4c2be04-5b39-ae56-cf4c-3124986e0c98@canonical.com>
Date: Tue, 8 Aug 2023 13:24:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Zhu Wang <wangzhu9@huawei.com>, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
References: <20230731111614.212113-1-wangzhu9@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230731111614.212113-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: remove kernel-doc warnings
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

On 7/31/23 04:16, Zhu Wang wrote:
> Remove kernel-doc warnings:
> 
> security/apparmor/lib.c:33: warning: Function parameter or member 't' not
> described in 'aa_free_str_table'
> security/apparmor/lib.c:33: warning: Excess function parameter 'str'
> description in 'aa_free_str_table'
> security/apparmor/lib.c:94: warning: Function parameter or member 'n' not
> described in 'skipn_spaces'
> security/apparmor/lib.c:390: warning: Excess function parameter 'deny'
> description in 'aa_check_perms'
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

thank you for your contribution unfortunately Gaosheng Cui beat you to this
set of changes with

[PATCH -next 06/11] apparmor: Fix kernel-doc warnings in apparmor/lib.c

> ---
>   security/apparmor/lib.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
> index a630c951bb3b..01943ec184da 100644
> --- a/security/apparmor/lib.c
> +++ b/security/apparmor/lib.c
> @@ -27,7 +27,7 @@ struct aa_perms allperms = { .allow = ALL_PERMS_MASK,
>   
>   /**
>    * aa_free_str_table - free entries str table
> - * @str: the string table to free  (MAYBE NULL)
> + * @t: the string table to free  (MAYBE NULL)
>    */
>   void aa_free_str_table(struct aa_str_table *t)
>   {
> @@ -85,6 +85,7 @@ char *aa_split_fqname(char *fqname, char **ns_name)
>   /**
>    * skipn_spaces - Removes leading whitespace from @str.
>    * @str: The string to be stripped.
> + * @n: Number of spaces to be removed.
>    *
>    * Returns a pointer to the first non-whitespace character in @str.
>    * if all whitespace will return NULL
> @@ -371,7 +372,6 @@ int aa_profile_label_perm(struct aa_profile *profile, struct aa_profile *target,
>    * @profile: profile being checked
>    * @perms: perms computed for the request
>    * @request: requested perms
> - * @deny: Returns: explicit deny set
>    * @sa: initialized audit structure (MAY BE NULL if not auditing)
>    * @cb: callback fn for type specific fields (MAY BE NULL)
>    *


