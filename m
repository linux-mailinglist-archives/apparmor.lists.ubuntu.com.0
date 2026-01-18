Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 84605D39335
	for <lists+apparmor@lfdr.de>; Sun, 18 Jan 2026 08:58:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhNfx-0002BV-4a; Sun, 18 Jan 2026 07:58:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vhNfv-0002As-1N
 for apparmor@lists.ubuntu.com; Sun, 18 Jan 2026 07:58:19 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E29143F29F
 for <apparmor@lists.ubuntu.com>; Sun, 18 Jan 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768723098;
 bh=f0P3fyaL8jQDNR4Wu3v8iL1NAvWou/N8RJqK3iy3F/k=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=PSeItWrnG8289COy9lgxMFlHUdKfXRyfl8nQ16PIgk2cI22UYD3JEG34OV81La5Oo
 gp4Ihr9NSaBuNHMItIJkr4UMeqRsdCTwPD3G69Tat0PXwKoZgEN4CpefVzt2C8gq40
 GkNQ5vk4R74+Jo4Pi+lq1eSOX06LAlN93C90pnNVAPnwQNY/zgSNgi58+F/Bxw/EP5
 Bb2y9sCCTTQcyNa3uwqZXcZ8RcR8POvKsG9vva9n960w9ERcALLSYAmQzYNdXiKoFY
 QZXX3b0aMiiwG88BUZOd0QtxwXiLRDA1S3TMA0WzOPGIry17+2o03ilcb4VFXUEYu2
 XI+ISFz8Bc/kgSUJvJXx+71erSLN5Hb0zw10VfoN9JOJ2EQHPA8mFctnKFMYvI2OOF
 zMqjJNLHRlGJxrEjOzFYIdBRi4zGL0LaFvOzVj+xwk68v8VTU5AEsvXzZCeYwqQk9r
 86idVHT8pUIlgpypClE8DkOsx+8xMiCBe2jWYhrsgOmvlMF9kd3SMYCIi1+3wHgmK/
 rmF6zDObM1veO9e//hHIrmmluq2SlO0Y25bvQJNTVTbnJjfjv/W+ONsqnYZvm/Tx70
 aSQr3Og782VnJfu2TH4S1TH58DjvNOfjxXMkTQ2ep6UX/DhM2MakjgIcI8Fc4Zobie
 N18kH+PQPS3vYRGNDrZ9ZVew=
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81e81fbbb8cso3248553b3a.3
 for <apparmor@lists.ubuntu.com>; Sat, 17 Jan 2026 23:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768723097; x=1769327897;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0P3fyaL8jQDNR4Wu3v8iL1NAvWou/N8RJqK3iy3F/k=;
 b=JzJToffe9M6Ck4Yc4NUV56e04y6Lsrk1Y6U6fpvRoI721Wu1HKsRKegQcUu1mwYTI8
 Mjs5YyWzmbiIQW0/AbroNx71o7BVFAQu12vR9ijWkzh4UKKv2hDrzPEfzUDv9HpZgpJD
 JGylwr+lXEbhBNbNGiL6J/HoknCtGilfjPyA5NZvm2+1eVuThkGJCuUgJDxCE3Hr954v
 U/jEkbeXZW7y7u9QgaUsPNHjnyC7AcHlCtUkoOgNAW6/uTOHsK8UgQBkw5Z+WiYiGGSH
 opuJ3IjnZdiIojd02k1q1HWEWFePue/OxhxNbidCUT+DamgmPCT36wFTdb8egkdqM8KE
 fDLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHApFIidIZSKDo6Y2BlCqZ73Th2PRzWE+MHDSRME8NmSFG/I2K7qQaAsO2AdyQBOyKE8aNtXHe3w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwzCwnrBrgODtzxdropD+TFuvjfvayWf2mVILgEY6wnOIz2CDU4
 YKypp9qmIIyzunRDwCdq2ieumUOqtjwSi1egZUc9S6nAUK0Kg0DB4D4vcCKruDYaqPD0lFtfKed
 5gieW5kc1tsG6tNK99Ox56YqxzAdmknkP6oqD9Ag/BTn7YBYPBJgyfACZoPrtw43F4ph4z1HJto
 lhQLQW09lGpw==
X-Gm-Gg: AY/fxX5YPjDE6FGzOIbUV/fFaRZ4WE8Piy3FvcRsyJhXD3Ie8x36oxqOWUy+0+H4Jsv
 kudLHi9e5tnI+V3rlqC8mfFtidhZr/ISCG/kg4SDPToyrGYq0UqUZ0DyW8eykssdL+LzrI+1kcX
 6f3KRTyzkqapCJEgUQgq4BQf1YrQurzGJq9rwsOnLKrxx3aTWbn0MQcJO5P9Pz+TzkODyomX+Vu
 VxVWcPUPACN6XCnm2d5XAgsGFGi0e9lB2sQleY3D3D5DWFrfvfTBRD7gfCooWYzLFn1/rh7bD6a
 HNT88uzNmyEntkCEqLEU6stRL+Q7F2/8wPdUml/T0dSi1QJbI1RoU8WbljUH0h9ValXF7S5ndbH
 4lmWhF3vBXPOy0d/q9TFhOy+O
X-Received: by 2002:a05:6a00:808:b0:81c:6ca8:8007 with SMTP id
 d2e1a72fcca58-81fa03b431fmr8248222b3a.69.1768723097427; 
 Sat, 17 Jan 2026 23:58:17 -0800 (PST)
X-Received: by 2002:a05:6a00:808:b0:81c:6ca8:8007 with SMTP id
 d2e1a72fcca58-81fa03b431fmr8248215b3a.69.1768723097078; 
 Sat, 17 Jan 2026 23:58:17 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-81fa10be07fsm6102162b3a.20.2026.01.17.23.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jan 2026 23:58:16 -0800 (PST)
Message-ID: <7617e0b9-21a4-4caa-9ded-51f4d240b273@canonical.com>
Date: Sat, 17 Jan 2026 23:58:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260114173226.14956-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260114173226.14956-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix boolean argument in
	apparmor_mmap_file
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/14/26 09:32, Ryan Lee wrote:
> The previous value of GFP_ATOMIC is an int and not a bool, potentially
> resulting in UB when being assigned to a bool. In addition, the mmap hook
> is called outside of locks (i.e. in a non-atomic context), so we can pass
> a fixed constant value of false instead to common_mmap.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into the apparmor tree as is, but added
another patch to do as Tyler suggested

> ---
>   security/apparmor/lsm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 08757f372972..320e4e1e1748 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -826,7 +826,7 @@ static int common_mmap(const char *op, struct file *file, unsigned long prot,
>   static int apparmor_mmap_file(struct file *file, unsigned long reqprot,
>   			      unsigned long prot, unsigned long flags)
>   {
> -	return common_mmap(OP_FMMAP, file, prot, flags, GFP_ATOMIC);
> +	return common_mmap(OP_FMMAP, file, prot, flags, false);
>   }
>   
>   static int apparmor_file_mprotect(struct vm_area_struct *vma,


