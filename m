Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CE5F4058
	for <lists+apparmor@lfdr.de>; Tue,  4 Oct 2022 11:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ofeaw-0003u1-GJ; Tue, 04 Oct 2022 09:52:10 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ofeav-0003tt-3v
 for apparmor@lists.ubuntu.com; Tue, 04 Oct 2022 09:52:09 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C6FE542F7E; 
 Tue,  4 Oct 2022 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1664877127;
 bh=auXXm/gRfpR6ooMtURJxM7kzyBAv5R3HRiNjDlYasY8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=NdygnKiEBbLYsBVhagqcZFPeH6gw7AwSBU3gERc2PG9245RQsoyUQlxWzyNKDufOI
 Y71IFTwmcuT36fA7fIpyDOhNXRUjjD78JAtAe6W9CFoNiPLKUkU0CfkeXL/e3Ce0Pa
 uY+VOyJgLg2wQQzLsIs2FDh198vuS3rz3bVk5a+m0ktdFjltKF+7pt0FXTqpz7OfmK
 1x8ZP3Xpz9eQvKl+nW+fQDqIfJw4OizdA3BArDc9xdS6DJFkT59dfe4Xq1vk1Lqexc
 jeulOMyrYR6Zln+0TCGlD49bZNPmpmIDhH5Ju5ZrxfCtuigz5sN8bgDmXmvoUawWie
 PqVUtf0y3WtxA==
Message-ID: <3c47940d-06e2-6c08-280c-76f7a365cf0b@canonical.com>
Date: Tue, 4 Oct 2022 02:52:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20221004084515.659441-1-usama.anjum@collabora.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221004084515.659441-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: store return value of
 unpack_perms_table() to signed variable
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
Cc: apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/4/22 01:45, Muhammad Usama Anjum wrote:
> The unpack_perms_table() can return error which is negative value. Store
> the return value to a signed variable. policy->size is unsigned
> variable. It shouldn't be used to store the return status.
> 
> Fixes: 2d6b2dea7f3c ("apparmor: add the ability for policy to specify a permission table")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

yep, thanks I have pulled this in

Acked-by: john.johansen@canonical.com <john.johansen@canonical.com>

> ---
>   security/apparmor/policy_unpack.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 45c9dfdc8e0d..09f316943951 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -734,14 +734,18 @@ static int unpack_pdb(struct aa_ext *e, struct aa_policydb *policy,
>   {
>   	void *pos = e->pos;
>   	int i, flags, error = -EPROTO;
> +	ssize_t size;
>   
> -	policy->size = unpack_perms_table(e, &policy->perms);
> -	if (policy->size < 0) {
> -		error = policy->size;
> +	size = unpack_perms_table(e, &policy->perms);
> +	if (size < 0) {
> +		error = size;
>   		policy->perms = NULL;
>   		*info = "failed to unpack - perms";
>   		goto fail;
> -	} else if (policy->perms) {
> +	}
> +	policy->size = size;
> +
> +	if (policy->perms) {
>   		/* perms table present accept is index */
>   		flags = TO_ACCEPT1_FLAG(YYTD_DATA32);
>   	} else {


