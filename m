Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917260C37A
	for <lists+apparmor@lfdr.de>; Tue, 25 Oct 2022 07:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1onCpf-00049h-NO; Tue, 25 Oct 2022 05:50:35 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1onCpe-00049V-BC
 for apparmor@lists.ubuntu.com; Tue, 25 Oct 2022 05:50:34 +0000
Received: from [192.168.43.182] (unknown [62.168.35.125])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BE13B422E9; 
 Tue, 25 Oct 2022 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1666677033;
 bh=yox8mjyeuZlCoe/FoMjeIoTMqW4Nu1lv1zq+lpqENys=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=bOP5ODNofoLpiN90yOa5ZIYdre4m98omJkmb5CqBMof7eru93HNKqcqDx/3bHmaxN
 LOZjuoDo1LufW1N16Ie0yYhhOuBwh0jAHenT3AwWMMGW0JJxXmNg8DWqDhL5jCGrZn
 X5V20W99N7art5dqJj/nTxu8vitQNTOHwHxvWtPBfqOjEGEWkSMxMKxIoZJbVH64rY
 vQqRy8rK/fbDddbsGTYTqM0cm9a+RKowAPoHy1VKt0Bu//v2B5/qzLsZFPeCloAaf1
 JSbeJHuesjfreZ5asnqe2jj+E3ZlnGtNjkC1Od+hePHLwWFMH6dlTel3ZSEc6GOsRH
 MnJUbo1Y0kxEg==
Message-ID: <4ad67bac-bae1-dd3f-bdcb-a2f5bfdfa2b6@canonical.com>
Date: Mon, 24 Oct 2022 22:50:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huawei.com>, paul@paul-moore.com,
 serge@hallyn.com
References: <20221021093602.102839-1-xiujianfeng@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221021093602.102839-1-xiujianfeng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Fix memleak issue in
	unpack_profile()
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

On 10/21/22 02:36, Xiu Jianfeng wrote:
> Before aa_alloc_profile(), it has allocated string for @*ns_name if @tmpns
> is not NULL, so directly return -ENOMEM if aa_alloc_profile() failed will
> cause a memleak issue, and even if aa_alloc_profile() succeed, in the
> @fail_profile tag of aa_unpack(), it need to free @ns_name as well, this
> patch fixes them.
> 
> Fixes: 736ec752d95e ("AppArmor: policy routines for loading and unpacking policy")
> Fixes: 04dc715e24d0 ("apparmor: audit policy ns specified in policy load")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

yep thanks I have pulled this into my tree

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/policy_unpack.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 2e028d540c6b..1bf8cfb8700a 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -858,8 +858,11 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
>   	}
>   
>   	profile = aa_alloc_profile(name, NULL, GFP_KERNEL);
> -	if (!profile)
> -		return ERR_PTR(-ENOMEM);
> +	if (!profile) {
> +		info = "out of memory";
> +		error = -ENOMEM;
> +		goto fail;
> +	}
>   	rules = list_first_entry(&profile->rules, typeof(*rules), list);
>   
>   	/* profile renaming is optional */
> @@ -1090,6 +1093,10 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
>   	if (error == 0)
>   		/* default error covers most cases */
>   		error = -EPROTO;
> +	if (*ns_name) {
> +		kfree(*ns_name);
> +		*ns_name = NULL;
> +	}
>   	if (profile)
>   		name = NULL;
>   	else if (!name)
> @@ -1392,6 +1399,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
>   {
>   	struct aa_load_ent *tmp, *ent;
>   	struct aa_profile *profile = NULL;
> +	char *ns_name = NULL;
>   	int error;
>   	struct aa_ext e = {
>   		.start = udata->data,
> @@ -1401,7 +1409,6 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
>   
>   	*ns = NULL;
>   	while (e.pos < e.end) {
> -		char *ns_name = NULL;
>   		void *start;
>   		error = verify_header(&e, e.pos == e.start, ns);
>   		if (error)
> @@ -1432,6 +1439,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
>   
>   		ent->new = profile;
>   		ent->ns_name = ns_name;
> +		ns_name = NULL;
>   		list_add_tail(&ent->list, lh);
>   	}
>   	udata->abi = e.version & K_ABI_MASK;
> @@ -1452,6 +1460,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
>   	return 0;
>   
>   fail_profile:
> +	kfree(ns_name);
>   	aa_put_profile(profile);
>   
>   fail:


