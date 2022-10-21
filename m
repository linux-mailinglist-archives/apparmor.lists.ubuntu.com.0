Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117B606DC9
	for <lists+apparmor@lfdr.de>; Fri, 21 Oct 2022 04:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1olhoR-0004ON-St; Fri, 21 Oct 2022 02:31:07 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1olhoQ-0004OF-Qg
 for apparmor@lists.ubuntu.com; Fri, 21 Oct 2022 02:31:06 +0000
Received: from [192.168.192.83] (unknown [50.47.134.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E3B7F43229; 
 Fri, 21 Oct 2022 02:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1666319466;
 bh=W5ttTTvJhQt4iDiuMC26FByAMmCEgx3KWUE5L8KpP7U=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=OZT2127MI30oLkHN/HfKdTDGLMQt/MK5TuvwgCWwAj6Y8lIcGkdXKQzGvR5yDb5L9
 IXkTdgEr+p1xmSr8IuySgzBLW9dpj7MdvNxhm3PH56L512Lemuzi0PEz7AnuDUQOjU
 E4y8uICB1YV/2d9UeuVNxiQh366wAp8hQT0/tbasa0tucRuRXwMeEjqCWyonmfCiND
 JonsSQuXW++EJ28lMTDmjrjFHd6Tt9ikqdS247nJVjOR48gqDMW2sgdYG1P1Zuj1Qh
 DFPV3+uOnKBsDTXI32vCQeCS6ExXPoOyM5P3GlE3ySqtgRc7yyUozP9IPOONiLMoLX
 t/NSPIHdKXHNg==
Message-ID: <d39df9d7-fc54-7e9b-d4ce-5c0d4fc455d4@canonical.com>
Date: Thu, 20 Oct 2022 19:31:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20221014084255.26103-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221014084255.26103-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: Fix spelling of function
 name in comment block
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
Cc: paul@paul-moore.com, Abaci Robot <abaci@linux.alibaba.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/14/22 01:42, Yang Li wrote:
> 'resouce' -> 'resource'
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2396
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

I have pulled this into my tree

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/resource.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
> index ed543f4edfd9..d7dbacc9a369 100644
> --- a/security/apparmor/resource.c
> +++ b/security/apparmor/resource.c
> @@ -66,7 +66,7 @@ static int audit_resource(struct aa_profile *profile, unsigned int resource,
>   }
>   
>   /**
> - * aa_map_resouce - map compiled policy resource to internal #
> + * aa_map_resource - map compiled policy resource to internal #
>    * @resource: flattened policy resource number
>    *
>    * Returns: resource # for the current architecture.


