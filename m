Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACC6A8C61
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:58:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrsl-0006pd-Fb; Thu, 02 Mar 2023 22:58:39 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pXrsj-0006pK-Pu
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:58:37 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2A9E13F301; 
 Thu,  2 Mar 2023 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677797915;
 bh=nkU4U7NSmjI2zWgPD+AtYN7NNzpxjnc7tmq01qgN89k=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=QkcSCzV3s2aj6boz+mHxWsvucqomXVM/UQMrhA8Io4U8bKBeQ81oMS6ckekAuDzcQ
 nkee4Drs6MUphvNdT3zxLyELL0QBD3OjNecncPrTQ+WRLaN25mbdEPFtaIB/hxBYjZ
 6LQWJNNw1PSTwYQ9GiuttKxMpIh3lrywy15enDkd4vPX4jww9qJK/F3V6v+YoVGM8p
 KwJTSxjKOR0eVcxtl4LhCOnUwTRrQuiV6DbFt5hbn1WrxG7+UhtfmpUHN3F3VQ90D6
 3Txt4UavSwO0JpLNRp9W8onES1k7FXy6P1GVHKx0l9OcE5dMacEx5bs89r2WVKcrd2
 wQtRYLKHRCkVg==
Message-ID: <257aa5c0-144b-b157-0270-0a7f470c195b@canonical.com>
Date: Thu, 2 Mar 2023 14:58:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com,
 keescook@chromium.org, yzaikin@google.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-6-mcgrof@kernel.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230302202826.776286-6-mcgrof@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 05/11] loadpin: simplify sysctls use with
 register_sysctl()
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 3/2/23 12:28, Luis Chamberlain wrote:
> register_sysctl_paths() is not required, we can just use
> register_sysctl() with the required path specified.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/loadpin/loadpin.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
> index d73a281adf86..c971464b4ad5 100644
> --- a/security/loadpin/loadpin.c
> +++ b/security/loadpin/loadpin.c
> @@ -52,12 +52,6 @@ static bool deny_reading_verity_digests;
>   #endif
>   
>   #ifdef CONFIG_SYSCTL
> -static struct ctl_path loadpin_sysctl_path[] = {
> -	{ .procname = "kernel", },
> -	{ .procname = "loadpin", },
> -	{ }
> -};
> -
>   static struct ctl_table loadpin_sysctl_table[] = {
>   	{
>   		.procname       = "enforce",
> @@ -262,7 +256,7 @@ static int __init loadpin_init(void)
>   		enforce ? "" : "not ");
>   	parse_exclude();
>   #ifdef CONFIG_SYSCTL
> -	if (!register_sysctl_paths(loadpin_sysctl_path, loadpin_sysctl_table))
> +	if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
>   		pr_notice("sysctl registration failed!\n");
>   #endif
>   	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");


