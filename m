Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B657BF2C
	for <lists+apparmor@lfdr.de>; Wed, 20 Jul 2022 22:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oEGFM-0005QK-2p; Wed, 20 Jul 2022 20:24:40 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oEGFK-0005QC-Jc
 for apparmor@lists.ubuntu.com; Wed, 20 Jul 2022 20:24:38 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B9FFD3F3C0; 
 Wed, 20 Jul 2022 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658348678;
 bh=2Y97BB6vjKwhsIP/n0mmC5lKGsgfc1sWpUPesvKpSUs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=BkHvcOoTUxNqlPN6hRu6IhlmX/H22u5RTBiCWqXmvS4tR+w1w2JCEOrMCciawX516
 keEJTKastKE5xCQIbR3C5sUSt6YZClBVAnWLskC/fRFmrnzahoeel6ErhhLVSqDZoD
 Priuv9JFPA/JzOUcKAnKH3yyM26SGZOfpy86FvShyprVvMUcmoOgefroPRRBDC6L7p
 74CPbbeuY8WMU0q9bJW7gfehEHcoV+SoCihf6eTOcSgSAjUgRzGDivzkQf145GY91D
 A/Flm1SMM2Jqn9MUWY2IachSuWNPlFNIKSYzClXaKHZRvxts4bKCvGRA6O2NnubjC0
 jK3vvPsSzsLWA==
Message-ID: <847ef193-71a7-9714-be20-2cbb654e9c09@canonical.com>
Date: Wed, 20 Jul 2022 13:24:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
References: <20220720120443.16518-1-lukas.bulwahn@gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220720120443.16518-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: correct config reference to
	intended one
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/20/22 05:04, Lukas Bulwahn wrote:
> Commit 5bfcbd22ee4e ("apparmor: Enable tuning of policy paranoid load for
> embedded systems") introduces the config SECURITY_APPARMOR_PARANOID_LOAD,
> but then refers in the code to SECURITY_PARANOID_LOAD; note the missing
> APPARMOR in the middle.
> 
> Correct this to the introduced and intended config option.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

thanks, I have pulled this into apparmor-next

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/lsm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 090a20805664..e29cade7b662 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1402,7 +1402,7 @@ module_param_named(path_max, aa_g_path_max, aauint, S_IRUSR);
>    * DEPRECATED: read only as strict checking of load is always done now
>    * that none root users (user namespaces) can load policy.
>    */
> -bool aa_g_paranoid_load = IS_ENABLED(CONFIG_SECURITY_PARANOID_LOAD);
> +bool aa_g_paranoid_load = IS_ENABLED(CONFIG_SECURITY_APPARMOR_PARANOID_LOAD);
>   module_param_named(paranoid_load, aa_g_paranoid_load, aabool, S_IRUGO);
>   
>   static int param_get_aaintbool(char *buffer, const struct kernel_param *kp);


