Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C79CD718E2F
	for <lists+apparmor@lfdr.de>; Thu,  1 Jun 2023 00:12:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4U3O-00030y-Qs; Wed, 31 May 2023 22:12:26 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q4U3N-00030p-Mo
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 22:12:25 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 08D7A4025D; 
 Wed, 31 May 2023 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1685571144;
 bh=+nmIKvT8Ba+dN10imTlWRtRDyfWTnTxdKB1XxYUU3pk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=f27qCkFfqf3knIJRXDS4D3TcS6NUryEZpa0RCOkMFCOlMLc2YG4Zq+y2qbt6QK72O
 28JPjvDAfFiXWxv6Sj+IHjOCefAUS/8rmI1A6gOhI2lkxVxdmkwlGjpHvuKxON+xLD
 j2ca406SsQe+m6fvjxKYxAAJTL9TZYcV7tOhJzpLjGV9jd/2r/eZEr+v+FLpthkiPn
 e1QoHbeaaBskZcSGMtcMen9y7MOE9xiT6MCQSyzB70ssLo01nL1ql/lZDfWSk5Kttb
 6UaE873H19SvnW5eWSQEDjxzwiAzMC2XESVYnf+WwJd01+oXm0a059JhkmxGJYgc9o
 VP/gxWtc19WEA==
Message-ID: <202ffe3e-689f-d824-1f8c-c9f99835e0b5@canonical.com>
Date: Wed, 31 May 2023 15:12:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
References: <20230531111833.144628-1-gongruiqi@huaweicloud.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230531111833.144628-1-gongruiqi@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: remove unused macro
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, apparmor@lists.ubuntu.com,
 Wang Weiyang <wangweiyang2@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, gongruiqi1@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/31/23 04:18, GONG, Ruiqi wrote:
> SOCK_ctx() doesn't seem to be used anywhere in the code, so remove it.
> 
> Signed-off-by: GONG, Ruiqi <gongruiqi@huaweicloud.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I will pull this into the apparmor-next tree

> ---
>   security/apparmor/include/net.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/security/apparmor/include/net.h b/security/apparmor/include/net.h
> index 6fa440b5daed..64a0112bf62d 100644
> --- a/security/apparmor/include/net.h
> +++ b/security/apparmor/include/net.h
> @@ -52,7 +52,6 @@ struct aa_sk_ctx {
>   };
>   
>   #define SK_CTX(X) ((X)->sk_security)
> -#define SOCK_ctx(X) SOCK_INODE(X)->i_security
>   #define DEFINE_AUDIT_NET(NAME, OP, SK, F, T, P)				  \
>   	struct lsm_network_audit NAME ## _net = { .sk = (SK),		  \
>   						  .family = (F)};	  \


