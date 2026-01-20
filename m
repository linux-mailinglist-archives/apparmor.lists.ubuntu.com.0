Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAFD3BC7E
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 01:44:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhzrL-0000ny-SM; Tue, 20 Jan 2026 00:44:39 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vhzrK-0000nr-CB
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 00:44:38 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 41E893FE15
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 00:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768869878;
 bh=QYIUKitptevaGw1P3/4y8IjKDAu5WlM17haDrLnfc/U=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=aTlOmiYNTchPSZS6gSnxFsq+kY7r5dtFvPt1cbSn9YM9Cdo6SiH5esbjjtmfSx1Tv
 sX9RGWLzwKzlp/KgYTSJBLyvpb0K4TeXU5OeBeoPUweTlS+mtJ1rgcSUG9Mi0mUiNJ
 zRYb33kbaIt628bBGOkOXaepVY4ngICdvne+8wRlW724qvJW4yWAZ9gFAdHtmR8ZM3
 OKCxbELXopnfqpHxPgW9NdgKOVW+vGBJPbL2onfiwJ7n1zYzTmUrugQcTuNaBVUyoD
 LXRm91Syx5p+juxr+SdZOptDo7p5FeJLKfSmFXg7nxnTgfaHrp+nilovR1EbxNdAo5
 q2UlqkzHO4Q0My7H7BaKFusZXAsjFukAkmIXQ064xWM/NRvtK3ca9++oPXmS2ALYTl
 uxx7c5NchaU379z7a3ghVvVgctjdTrWW+D+gtragL0kaw4wksgtgiqzvBkv5uQDpir
 cJgkr19bxENL6IfzkywviMUeUV94waohPd0wEKgg/4Wv1H6QiCkyLBFjqA1/ssIgjU
 nJBFV89GM0j84tLO9YE+uBbTwLwmD79/NLZ+Oryn8QYP69v7xOwJ8Nyk6ZVvRYngtT
 gTrf/a/Im2uLC0xkSfBxyN9RASpCJWMWU97dUVCBr7Ecg/85csXGuQ6UUdDwycZk7+
 1pUlfr1l+TWTqCqzY+Z8fDwA=
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0f0c7a06eso44572735ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 16:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768869876; x=1769474676;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYIUKitptevaGw1P3/4y8IjKDAu5WlM17haDrLnfc/U=;
 b=qDp5R0PRhUA9S6fo6i0zjB05rLrZiIhWstf6E9iqCDBFMlpHI39lhRxFck8pPkhUzJ
 uVgJ3/8f4baPoW2G6VTZ/LpDgsItyfxrIyRWmXvmEdh4hWTQKgUrYDtZn1quJfyDHwaW
 8gPGBaEe+xqjVXOKW0YsOYls1VOYfZ+o9HQ10MNriByDyewcvIBxxw6v7UavpnFQC7fl
 9hdzJkGX1IwFh5xafwChh8iGRl+69XthQmiw2VUNEbc7WY54vo7jT8A10jJ19k0rWk4B
 9YnsoyK7Zw2lt7EWUdqFowXxyz4Yh2irfZokVQZDyhBdE1rl6dYzzhHDJILenUKmoa30
 d2qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkQinJpgtDtnXMtmy1n9trgwe/TXkm46F5hlgVHEcirwLIk+xptjHyna91SAGgysyqgJsCmOiIjw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxG8tqqft3XZeISuO6yXngajta9/ewBs7TdWLnGijA7XMbeflL/
 jxZwvE2sD0H3MPsbjC+kY56yCuW80ngvEBGcIZvYEv1r//CbkkQ6xrR6Y3fgXMtTar3/+KtLHpx
 xSUS3Z3F02cirkgOtDdoQ1QINlDh8QZNXACk3TVFizJaMMoI+eNY6dgaOloQ81AeeIlmS0ATj9L
 CWNQ==
X-Gm-Gg: AZuq6aI3sGqB3SSvp+En78KAMYTYGi5sUJIZPShM7O9Biuat7I8Qs1goDRnVqvtaxbi
 iNHGxeHo4UGioFTo+V54LRORWr6FJsc327EYPvi9BdvwkWvJ7tG1XNCnVxqheRz7LU3Qy+eKpfY
 IJ9UIzUyG4IBtv+gQ0lNc2bAZ7HwQRMZsE2pD8s90SW6vNJMAdTSSPhUKrgoeMv8GUXzUzLjc+8
 muozvuvwpQY0XcgG92SGxds5kBuJ/ogwwj0hc+IYKvmdD48+9oi1nwFSDfGPy9B1OymxZDa12Ac
 er7pu0J9D7zYO37McymrDa+KaUEH38f+abErRsbk2G0GHBRiHGYVG69EeprMHwaxFp3wEBrC3hm
 OtG3pLXu9gixrkZhQcSZkSLiG
X-Received: by 2002:a17:902:da8c:b0:2a0:bb0a:a5dd with SMTP id
 d9443c01a7336-2a7177e99eamr103222925ad.57.1768869876687; 
 Mon, 19 Jan 2026 16:44:36 -0800 (PST)
X-Received: by 2002:a17:902:da8c:b0:2a0:bb0a:a5dd with SMTP id
 d9443c01a7336-2a7177e99eamr103222825ad.57.1768869876264; 
 Mon, 19 Jan 2026 16:44:36 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm106460445ad.38.2026.01.19.16.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 16:44:35 -0800 (PST)
Message-ID: <35869346-9eed-4120-9e4b-cdc1b04dc844@canonical.com>
Date: Mon, 19 Jan 2026 16:44:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhengmian Hu <huzhengmian@gmail.com>, john@apparmor.net,
 apparmor@lists.ubuntu.com
References: <20260120000307.369587-1-huzhengmian@gmail.com>
 <20260120000307.369587-2-huzhengmian@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260120000307.369587-2-huzhengmian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v2 1/1] apparmor: avoid per-cpu hold
 underflow in aa_get_buffer
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
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/19/26 16:03, Zhengmian Hu wrote:
> When aa_get_buffer() pulls from the per-cpu list it unconditionally
> decrements cache->hold. If hold reaches 0 while count is still non-zero,
> the unsigned decrement wraps to UINT_MAX. This keeps hold non-zero for a
> very long time, so aa_put_buffer() never returns buffers to the global
> list, which can starve other CPUs and force repeated kmalloc(aa_g_path_max)
> allocations.
> 
> Guard the decrement so hold never underflows.
> 
> Signed-off-by: Zhengmian Hu <huzhengmian@gmail.com>

thanks, Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into apparmor-next

> ---
>   security/apparmor/lsm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 9b6c2f157..a6c884ba6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1868,7 +1868,8 @@ char *aa_get_buffer(bool in_atomic)
>   	if (!list_empty(&cache->head)) {
>   		aa_buf = list_first_entry(&cache->head, union aa_buffer, list);
>   		list_del(&aa_buf->list);
> -		cache->hold--;
> +		if (cache->hold)
> +			cache->hold--;
>   		cache->count--;
>   		put_cpu_ptr(&aa_local_buffers);
>   		return &aa_buf->buffer[0];


