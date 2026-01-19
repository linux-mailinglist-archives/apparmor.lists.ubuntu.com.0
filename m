Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 83269D3BC2C
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 00:56:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhz6s-0001YH-Te; Mon, 19 Jan 2026 23:56:38 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vhz6r-0001Y8-EO
 for apparmor@lists.ubuntu.com; Mon, 19 Jan 2026 23:56:37 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 529933F7C4
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768866997;
 bh=Oo0wji2kExLF4MhDfF+dqGzKTMshpVWDzqNzGuD749w=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DQSSwM2086LccMJtWYBlhMXbh6b9cj/dQSBlQ7nd17ftnezaLL+57OScMA7kiHQTx
 NDrcRgp1hf/qx7yCYTT58/XJBGMmBWxCA6qjmN9AStHJYDuAucra4d5D8IOAmp4pDx
 F0EXo9MYlq/z0WaVdoF86fWHtWwQMe2PTDYTlhFPnEaNkSy3TNmpdodbi5Jff+Jn8O
 72gkm0PvMXogaCnrqmNevJCRS7dBX6bmpqV4AVOtpXcMnZwr70wJH01Q3YTuj9Ai8s
 qZ+6xfBzq/d72jz1tBi7sVAR2JgWiRnny4TUpvB5IIAeXp9XLWonUtacFJR9T1pdlj
 2R0ehbnvlqkdPJAG5/Fylo8fh4vFBXWkY+L9jjSpuJFmjvDAPCvrQ1zFrKVDDK/lr5
 A/eS8dboMuT/hcL3ZI/Ul245dFjYkWp4jZB3pFXVRcCeiXUoZ0aXXpEXRXXH2QlJOX
 eYaThlNJ7K4UuGSyQDSa1EII92cz1L3/xsWcFHQtKkxj2aNKOAMJ881nB+y++n8lF3
 NprwdZKvx/Q/NVFp9SYYXqNM2KfoKKOw7BBPpWerJs7O7PuFen3XNkGuDeU1QRkdAE
 MJOyOFHWpnC5QSBLZbqSuXotZBEpT3GjmuA2mmqykh+cN4e565XOFGVByYM0C96uHw
 9RVs3NrCLoyhReFGAaZAl2+s=
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29f27176aa7so72733135ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 15:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768866995; x=1769471795;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oo0wji2kExLF4MhDfF+dqGzKTMshpVWDzqNzGuD749w=;
 b=N7dAa8TpiLxrWlgkqXGzsSMOkQvlt7KUjVWoYktU9kax3jePURHBHrwri6amF4oPDI
 hgLtwGM4W8dEqLjuVPgjZvU3Bhc3UT7qzjHjLv6k0ztnYZRPGkYDAkK40FDvxbQu7RvQ
 zhX/N7TD5lJ/6UkzAbVUbqLOkJsRwwTy5+I9N7qa9zuJN8iEGI/sF/BELUt9QrbnFt2w
 MQMMYlgpnNa9TH/dG46IMabVf9mq/JBoiyJCMbhn3a3tc97PeMVj3Ylf8n5bGEI6kPLA
 5xFBPKk3102QSBmOBZP+UFLfZIcxwm4CEsSaNmvKCdu7X9KIMPoo45lIMTZa5aHqMcAc
 jylw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/eg6h89EQxxE7yxS93QQ/Pn5TtOsPzpH9C2Uw2GNxuuB7iJr+/gXaCkXFr7L8H5MrQyEiz5wJBw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxxLstJQ0Ju8cgqYsb6H/QoxIwEGY45zzN7v7ja/BnpuBw4VQ+E
 2y5soZvFH54YsA/mBDavJPv91FpqIihLwft93bx0LCQ7yQXs0Z6vPKIavmYwFsQEUbYW68TNx75
 qMqMZrWo2Dgqv7xKfTcRa/Y3OvwUulxEBcuC/qLqVIfiD9HG0RhDq0hG6Ato3nt6dA7m+CnDFTa
 EoTw==
X-Gm-Gg: AZuq6aJsed0L3gy7K4zhzMKSF7gUQe9YNoe4IfziZTFoOZ2PFCxtU4VhgqJpaXx1A4i
 4O4JcyfeLy2tNCuLvw806NHjY/m6KT0OHft+Tc0lHUUMnBLGaVJJrwrWrU8lrSXNcwzNBPHVQAL
 PddvZeKf1zqTVbgXFaGSjYNhuruKYQ5tqM4/Xbe5uJruLp9M6/tp3coyPH7l382BHvma1w2dzWI
 kPly89XOlxDopfVmpgmfG8GBD8mlTKmpKnlsZXaAkrWaevwhNnlZBoUa7gVgquf47+lTSxs4lEU
 jvcPhcvgQvgd/mCj4qthJKCvW9Akp0j7rY+KgURY3JyKADM7THRhk7Z19Gp77jLDUlrSoR1XTP2
 I/osS57j/5FsiNuAIuJXeb0ED
X-Received: by 2002:a17:902:e74f:b0:2a0:bb3b:4191 with SMTP id
 d9443c01a7336-2a768a7e5cbmr288595ad.12.1768866995657; 
 Mon, 19 Jan 2026 15:56:35 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:2a0:bb3b:4191 with SMTP id
 d9443c01a7336-2a768a7e5cbmr288505ad.12.1768866995302; 
 Mon, 19 Jan 2026 15:56:35 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a7194235ffsm103332965ad.102.2026.01.19.15.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 15:56:32 -0800 (PST)
Message-ID: <0fa0e263-da74-43f2-9c2e-c61801e0d3ac@canonical.com>
Date: Mon, 19 Jan 2026 15:56:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhengmian Hu <huzhengmian@gmail.com>, john@apparmor.net,
 apparmor@lists.ubuntu.com
References: <20260119122119.3648154-1-huzhengmian@gmail.com>
 <20260119122119.3648154-2-huzhengmian@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260119122119.3648154-2-huzhengmian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 1/1] apparmor: avoid per-cpu hold underflow
 in aa_get_buffer
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

On 1/19/26 04:21, Zhengmian Hu wrote:
> Signed-off-by: Zhengmian Hu <huzhengmian@gmail.com>

Small nit, there is no patch description. I can pull that from patch [0/1] if you are okay with that, otherwise can you send in a v2?

I will pull this in once I know your preference


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


