Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 156406FFC13
	for <lists+apparmor@lfdr.de>; Thu, 11 May 2023 23:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pxE9Q-0000Pb-Ko; Thu, 11 May 2023 21:48:40 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pxE9P-0000PS-Qh
 for apparmor@lists.ubuntu.com; Thu, 11 May 2023 21:48:39 +0000
Received: from [10.230.83.65] (unknown [72.28.92.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3722440026; 
 Thu, 11 May 2023 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1683841719;
 bh=hjvm1zm7cWLOP+uGf76IIMlTIPMFKlV+xXfMnXyGB8Q=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Cjhg1vG0eHurLwCGA5RC85fFZHhbtKuQVMy4+k9XxNBIQ2RfNELgpNkVU2786iQeU
 EWeNhfVzikltesWaOsNXR8iVjzsuKOtRFjAqbHv2S5gyQt+bta974N+Z9gtor4AfPD
 dVSTc/GDABBZ5f2Fo9wphW+bkvJ475qR9CcgmYj/u7rOUWmZURzTCskLqVCdRj7uXw
 3BnhIR0AsBqBsLyPIIz83GmU5vJqRz5gMZJYa9J/d3fYIOfpkv0IuavddN5LKNur7U
 +UheZL1FcyvGu6wfqcPKwdo1H4d2MuuTrzqDpzKEE4XP129oPMZeXOxU1oPUJ9DZEP
 9q4Y5MdEPP25g==
Message-ID: <7085879d-4d21-b90a-c08d-60450d1c7d38@canonical.com>
Date: Thu, 11 May 2023 14:48:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20230511213441.never.401-kees@kernel.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230511213441.never.401-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: aa_buffer: Convert 1-element array
 to flexible array
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
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/11/23 14:34, Kees Cook wrote:
> In the ongoing effort to convert all fake flexible arrays to proper
> flexible arrays, replace aa_buffer's 1-element "buffer" member with a
> flexible array.
> 
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: apparmor@lists.ubuntu.com
> Cc: linux-security-module@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree.

> ---
> One thing I notice here is that it may be rare for "buffer" to ever change
> for a given kernel. Could this just be made PATH_MAX * 2 directly and
> remove the module parameter, etc, etc?

possibly. Currently the only use case I know of is for some stress testing
where we drop the buffer size down really small to try and break things.
This isn't part of the regular regression runs and could be handle with a
config/compile time to a buffer size constant.


> ---
>   security/apparmor/lsm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index d6cc4812ca53..35eb41bb9e3a 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -46,7 +46,7 @@ int apparmor_initialized;
>   
>   union aa_buffer {
>   	struct list_head list;
> -	char buffer[1];
> +	DECLARE_FLEX_ARRAY(char, buffer);
>   };
>   
>   #define RESERVE_COUNT 2
> @@ -1647,7 +1647,7 @@ char *aa_get_buffer(bool in_atomic)
>   		list_del(&aa_buf->list);
>   		buffer_count--;
>   		spin_unlock(&aa_buffers_lock);
> -		return &aa_buf->buffer[0];
> +		return aa_buf->buffer;
>   	}
>   	if (in_atomic) {
>   		/*
> @@ -1670,7 +1670,7 @@ char *aa_get_buffer(bool in_atomic)
>   		pr_warn_once("AppArmor: Failed to allocate a memory buffer.\n");
>   		return NULL;
>   	}
> -	return &aa_buf->buffer[0];
> +	return aa_buf->buffer;
>   }
>   
>   void aa_put_buffer(char *buf)
> @@ -1747,7 +1747,7 @@ static int __init alloc_buffers(void)
>   			destroy_buffers();
>   			return -ENOMEM;
>   		}
> -		aa_put_buffer(&aa_buf->buffer[0]);
> +		aa_put_buffer(aa_buf->buffer);
>   	}
>   	return 0;
>   }


