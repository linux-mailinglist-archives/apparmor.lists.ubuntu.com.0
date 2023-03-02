Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6466A8C35
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:51:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrmA-00065q-Au; Thu, 02 Mar 2023 22:51:50 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pXrm9-00065j-Ln
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:51:49 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6E3503F123; 
 Thu,  2 Mar 2023 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677797507;
 bh=bioryjk+aw7umCRjJRv4QvVIBgleMXFeIjs93Jwz0DU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Cj7XrX8b3UMGQ4YO23XrAP0FCwraXl+y1is+aXBHq4Yaq0NJ8Y8zOoX9mLwzMi+cA
 W3HPuGOFaftga2KXhKyZ5/4wS3BJLQBJ5S66CQM0hrX5LMpBQztUXGj1ZJW8M57Tj9
 E70gT7F19dTUoCRQak+Bmmjm6DiRshfhlHBeKvil8gT2zCWDPf/XMYo1iREmsccTjN
 W73jiILx6RoqVEa9UN6TtrU3KE8vHdtwQu/Blp/WvArnFFzabJzHpde6FZkpMk6+tz
 aA8hHzFDIvRxA5sc+RxL5w2jCZ/b5qSxjxwm4eMptgFrVN4BVZW/vH7z72DRLHmUiF
 E9HGDOJeYK7xg==
Message-ID: <0767e9c6-b255-7c66-a75b-e3fc59f129f9@canonical.com>
Date: Thu, 2 Mar 2023 14:51:40 -0800
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
 <20230302202826.776286-5-mcgrof@kernel.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230302202826.776286-5-mcgrof@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 04/11] apparmor: simplify sysctls with
 register_sysctl_init()
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
> Using register_sysctl_paths() is really only needed if you have
> subdirectories with entries. We can use the simple register_sysctl()
> instead.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/lsm.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index d6cc4812ca53..47c7ec7e5a80 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1764,11 +1764,6 @@ static int apparmor_dointvec(struct ctl_table *table, int write,
>   	return proc_dointvec(table, write, buffer, lenp, ppos);
>   }
>   
> -static struct ctl_path apparmor_sysctl_path[] = {
> -	{ .procname = "kernel", },
> -	{ }
> -};
> -
>   static struct ctl_table apparmor_sysctl_table[] = {
>   	{
>   		.procname       = "unprivileged_userns_apparmor_policy",
> @@ -1790,8 +1785,7 @@ static struct ctl_table apparmor_sysctl_table[] = {
>   
>   static int __init apparmor_init_sysctl(void)
>   {
> -	return register_sysctl_paths(apparmor_sysctl_path,
> -				     apparmor_sysctl_table) ? 0 : -ENOMEM;
> +	return register_sysctl("kernel", apparmor_sysctl_table) ? 0 : -ENOMEM;
>   }
>   #else
>   static inline int apparmor_init_sysctl(void)


