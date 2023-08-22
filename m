Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689F784841
	for <lists+apparmor@lfdr.de>; Tue, 22 Aug 2023 19:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qYUwO-0007rv-LN; Tue, 22 Aug 2023 17:13:16 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qYUwN-0007ro-92
 for apparmor@lists.ubuntu.com; Tue, 22 Aug 2023 17:13:15 +0000
Received: from [10.8.192.2] (unknown [50.47.144.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4A61A400E7; 
 Tue, 22 Aug 2023 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692724395;
 bh=73a097A+cKW9GnePRG80nx1cU9UPZ+sr9pFoukCXOZA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=MBgGpQnTam43AtpOk+iUx0q4q+Vh48uDmNqU9ttUDZTY+3FvJTPrqnBOzW+r/z1xh
 1yHh2c5j7M2c2DVyfIKBscTatbFRF7rgxe43JyxhJNIIl6zl9qduhdoZjEaSRgZ/85
 yP/gdnIYEtR0qG4Oq26i0StVg1ZubUsgoxVlamYONWwu23oz9fgYxLFGZ2KyVFvdfM
 8OJNqnraHBh1Ya65xfvGrCc8XoWEQJssGvHNrOfy3AW0XDXSs0n9wkYBy3xyAEX+qb
 a0a51FrQYxMNL34rB4MkIT9Qn/7UXbgtpnbExdxal9vTeoMVsspIX7ESvgfS4uagL9
 UnYN7rDJy3v0A==
Message-ID: <2b1955a6-1f0d-081a-c173-730f25a51275@canonical.com>
Date: Tue, 22 Aug 2023 10:13:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Georgia Garcia <georgia.garcia@canonical.com>
References: <20230821183724.2588567-1-georgia.garcia@canonical.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230821183724.2588567-1-georgia.garcia@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: fix invalid reference on
 profile->disconnected
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/21/23 11:37, Georgia Garcia wrote:
> profile->disconnected was storing an invalid reference to the
> disconnected path. Fix it by duplicating the string using
> aa_unpack_strdup and freeing accordingly.
> 
This is going to need the Fixes tag

Fixes: 72c8a768641d ("apparmor: allow profiles to provide info to disconnected paths")

> Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>

the patch certainly addresses the issue, and I can add the Fixes tag, but unless
there is something I am missing I think we should avoid the intermediate variable
as noted below

> ---
>   security/apparmor/policy.c        | 1 +
>   security/apparmor/policy_unpack.c | 5 +++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 4817c1b30105..d7525f228c43 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -255,6 +255,7 @@ void aa_free_profile(struct aa_profile *profile)
>   
>   	aa_put_ns(profile->ns);
>   	kfree_sensitive(profile->rename);
> +	kfree_sensitive(profile->disconnected);
>   
>   	free_attachment(&profile->attach);
>   
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index d2d740bb5618..8b2ad42c80ba 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -804,7 +804,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
>   	const char *info = "failed to unpack profile";
>   	size_t ns_len;
>   	struct rhashtable_params params = { 0 };
> -	char *key = NULL;
> +	char *key = NULL, *disconnected = NULL;
>   	struct aa_data *data;
>   	int error = -EPROTO;
>   	kernel_cap_t tmpcap;
> @@ -870,7 +870,8 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
>   	}
>   
>   	/* disconnected attachment string is optional */
> -	(void) aa_unpack_str(e, &profile->disconnected, "disconnected");
> +	(void) aa_unpack_strdup(e, &disconnected, "disconnected");
> +	profile->disconnected = disconnected;

is there any reason you added the intermediate step of unpacking to &disconnected instead of just directly to the value as before?
>   
>   	/* per profile debug flags (complain, audit) */
>   	if (!aa_unpack_nameX(e, AA_STRUCT, "flags")) {


