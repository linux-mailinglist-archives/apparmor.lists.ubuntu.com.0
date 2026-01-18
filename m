Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 38283D39334
	for <lists+apparmor@lfdr.de>; Sun, 18 Jan 2026 08:57:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhNet-00023q-IZ; Sun, 18 Jan 2026 07:57:15 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vhNes-00023h-Id
 for apparmor@lists.ubuntu.com; Sun, 18 Jan 2026 07:57:14 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6FEEB3FBB3
 for <apparmor@lists.ubuntu.com>; Sun, 18 Jan 2026 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768723034;
 bh=OkFucOEIPscVpFYqOJILl70h26k3vPeLAZ1bAbjl6V8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=aT+N67F/F3Gnlszz9LqmJJ50EcznP9NaXMoPKhYw6kPqrx49aeXMx+YldbZV9CF3M
 sgrozvVYvjwRUs+8bnt3O0q/C99nrAyxFEqIuPRKvMAEdKCcT6mWtfoTcBrwPA/N1u
 NcxJM1vF7fdcl23INXzeBclwZeeKq9si20iAmzpul+yLTEnErUp7l2MT9kD1oeoF7z
 9APIopv8LGejGc4LTkhI9jKLxKx7xo1pdMVeeh+eLdw8IEKAP3wjrhr8Ij6FjZoUrt
 Vx6bgmOP+QhLFZNxP9HxK/yxfEqFI35x6Lj5NeTHzXcGqSlec3KSFcF5flN0KmWs9H
 T/1bY9QnCrsw37i68elZRfT4OKoVL6Idxiczj0I0+c5nLPpv9VIFzdwRnuOaobDaL2
 4AW85MLQagyqOPt1ZA10OdlDj4pZ4vFmpbTwOTTEPkgLpiw9kgZBVXrxv4kMhlLFY9
 1qhTcWo7ocrxjDahCwzadKEnYwX/kZyDDgyfKOgdcrYPGaLuKcMN4zz7oVpE/tlBks
 68E0ZwgYxlAHOOBod3mY+0emkOceh/PL+METFizDjiqa4NZ4jRGL5OzpdbApptyMcz
 Fp5rwgdZj52/g7eO8BxaEgZ+l8jsPnob6K5dTlh9lfKEYK+wYLII+Ll4nuIz6JwU80
 BigCvYX4/UgWdglGUyF/fnIM=
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a0e9e0fd49so39942195ad.0
 for <apparmor@lists.ubuntu.com>; Sat, 17 Jan 2026 23:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768723033; x=1769327833;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkFucOEIPscVpFYqOJILl70h26k3vPeLAZ1bAbjl6V8=;
 b=M6zeLWLWNGl+cfpI8qoyfscdXnFkLp4Vu00qL6QORWoga6McdBAewZfD1gjYra2+LO
 7NxGZV54SYOE+fLMd0WCP1IKpXMOMiQj0KEtysrgLXiiAZycsI0zxQ5quuluetoMKH5p
 +nCAMbsSPzdHNK4Ae4KdC0CDfxL42l+D/2qpzyucrzwDFwAkUSvop09kTlWASBDMVVSl
 5GqbbyJ+tDNouDAGqT+qIEYeljBR8NswWplHulEOTJNr+pFw+m8fYb7fVA6HUaSZpak4
 3hOKoovS9EorbQyVDiH4NSkt8dYaPRkoSDLe3CbvLbS6RGgo+5uekO1BLohXg6GVRdD9
 Du4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAgQUNv92yZwGGwt4O/BGS+9LNjde5nXTEjaot/pYLcD0ClAjNGCBN1bnLpNfmKuZ/xn6XY49SHQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzOI7E0p7Xz7V3SDM08dBCnRUXG8yRVI1mZdcPDE144eAIhHffN
 3PleHC6B1nxz8RuPs7UIO3b7T8SdTt7x90qHsqdbyKubgh7aTPAO0ccglMQ5DWZ7cVw/Iu1iLwb
 YniVjFpnLE852LZJ1OgI5s3Y2K9+mozvNyaxZ2td0NfVMuCAN9xiRlBb4DOqUiaZcMucmf0ZtT9
 s5w75UU9EIBA==
X-Gm-Gg: AY/fxX58tGDYf1jqx3BsPOVLK5V13J+Nkn9SEQt2Vp6TgS/87kcigivYyni1IXOB0RM
 tgfz2I/Uzn61vj5Ms5H8nWPPyWsB9/9qpYRwjAzrzNtgtebncnyQmpTiDr9AUXKyptsCsfeQU0a
 iwvrcgAWo395zYMBnSDhYO0I8DJaaQiqEcX8QzpiFtUJlI4VR4fZ6dLdHynPAJIf+dH9ssNudW0
 +sR/rw87UQgbhUSLjyiczMKg2GFkMxMKDQ4Yuv7q8DkdVwIh1vxRd995DP3+2c/mJlKShSFyJSU
 X8SFL0HQBVZUJiQQIeifYo5ajHoszMpgZqNVAFdxzg5Mr6LoF8qMkARguSNo25PlbgwcTSWRfPp
 lhIyR1wKfP2eSY3g9tyuwrGZL
X-Received: by 2002:a05:6a21:15cf:b0:35e:caf1:78e3 with SMTP id
 adf61e73a8af0-38deeabf5dbmr10252938637.11.1768723033032; 
 Sat, 17 Jan 2026 23:57:13 -0800 (PST)
X-Received: by 2002:a05:6a21:15cf:b0:35e:caf1:78e3 with SMTP id
 adf61e73a8af0-38deeabf5dbmr10252934637.11.1768723032734; 
 Sat, 17 Jan 2026 23:57:12 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c5edf2330d4sm6233739a12.5.2026.01.17.23.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jan 2026 23:57:11 -0800 (PST)
Message-ID: <d2f7bbe3-c0fe-4925-ab70-c9e777b64fc3@canonical.com>
Date: Sat, 17 Jan 2026 23:57:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260113173558.15401-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260113173558.15401-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: return -ENOMEM in
 unpack_perms_table upon alloc failure
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
Cc: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/13/26 09:35, Ryan Lee wrote:
> In policy_unpack.c:unpack_perms_table, the perms struct is allocated via
> kcalloc, with the position being reset if the allocation fails. However,
> the error path results in -EPROTO being retured instead of -ENOMEM. Fix
> this to return the correct error code.
> 
> Reported-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
> Fixes: fd1b2b95a2117 ("apparmor: add the ability for policy to specify a permission table")
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into the apparmor tree

> ---
>   security/apparmor/policy_unpack.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 019430225e4a..2280a8f7a843 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -700,8 +700,10 @@ static ssize_t unpack_perms_table(struct aa_ext *e, struct aa_perms **perms)
>   		if (!aa_unpack_array(e, NULL, &size))
>   			goto fail_reset;
>   		*perms = kcalloc(size, sizeof(struct aa_perms), GFP_KERNEL);
> -		if (!*perms)
> -			goto fail_reset;
> +		if (!*perms) {
> +			e->pos = pos;
> +			return -ENOMEM;
> +		}
>   		for (i = 0; i < size; i++) {
>   			if (!unpack_perm(e, version, &(*perms)[i]))
>   				goto fail;


