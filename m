Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2ED21BAE
	for <lists+apparmor@lfdr.de>; Thu, 15 Jan 2026 00:16:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vgA6M-0006u3-NX; Wed, 14 Jan 2026 23:16:34 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vgA6L-0006t4-GT
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 23:16:33 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 549163F47D
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 23:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768432593;
 bh=RTCLaXlkPiglt/Knsh034I9ZUgDHgx8CvH8ysWRVFOU=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=FX4uhx5sPh0UICVROt3WDHKYbf0f8Xqej95GF1H5DZtmhwA503lH+zPBlGIXR/OCo
 aQ1cZfR7aLuBP4NZc6Mfte9XaTc/PS3bRWcd4tiAVe6V/Q91DzNQ2C2j6s3mlmZjoF
 6fGT7AR51ZRrz0YnYHX8abWEHhtiSwmJ68chX/SuuRZCLA8Pw/Xozq3z3kJAEEODtW
 qYi4fN9bAMSPhbvoOCaTQJ6Hyy0rCpK2Zz2Kmk82soL4BCPClQxobF116xOx7ph01B
 KBbcwJYP/Lpdas3oDmGSxUi/ydoqZIk4ZJ247gx/mWn8NkTgdeSE4wbChvyBgEnvLu
 4jHYbLXo2b5tTuwCIB6Cz6TmeGSi6PEDiUjWsWmRCCmhXoh4PGkbYiPTe6I1HDzucY
 aUuVJLxe3vEFwFJUdOKSjRuG7LKs8kpUUz3oxWM0bs6Py0Ee6ugDd32apn9mPLSuN3
 /7pygaWFYKbAzFBn7Ujysxu0cl4u187lCQlkWZPYofHN5RCyMbWjJDAghjYMI+btHo
 rAUkHCssDMjLU8FSAaPHxJbpXFAVGD7wTOQj4Xfa2kAYZjIM21snp/YhQRQpsa1mtK
 yrNBLi6UzMa+S+07efwKYURhPm9qbeSZJDJeRYyNp7P2TQpcdAkz6jnQElUJvgS2OJ
 lhS0SrDfqvV/NZvdsLLE/IEE=
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0dabc192eso3576105ad.0
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 15:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768432592; x=1769037392;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTCLaXlkPiglt/Knsh034I9ZUgDHgx8CvH8ysWRVFOU=;
 b=glKqO6T2FR44XixUksDUhBiThUOh9xdjxrF4RsytP/8aVD0/WF6SbdQEFFqfuYJroD
 2M+zeALqNFtWeTKsYBN8AzgmDN3IEKBN+vzEVYpeNPAIVhWVgc+dXUfOjYfQE3tjpUip
 AeCinvFpqEAyqqh36hY6uhH2xdI5AF8Ux9OjkzE8HvreRMft/n4H+N7WiGQrgxcAuQqG
 oEVMfOV8AkJOt8Amf7hG8GlQ0gODp8BlOq9JIGEauCb/S//FPph01h4PQ8mzM34/fDVW
 YoPq2L071R0MdB/Dg15Lvri5tf7ZLQ9OkovwzjxJXO5pNTeDX9lg40Y1qPqyzvq6rSoR
 dVwQ==
X-Gm-Message-State: AOJu0Yyt1ZA1snx6DXPkZhRpTXDKOcMQaMc4x1V1R7Vp/ht2P5zygubk
 tRPVOr8UBtuwKWLW3aFmhrzbtwbzHEcvzEwjtX6G8EmeicMtm1zWbRd4I9mIYuF9aWjuX7TxjvJ
 L+8NEwkJd4VlMXr7X6+UbALYbIu3Tcb6O5Wa3O1ZUL1G4pgKt1ZgzTMlCO3ZgABERqtwz+tUpHm
 I9GeVKZISeyg==
X-Gm-Gg: AY/fxX5eiEzflMSizKCu3u+bNJj6DJjgVVTD5Xso+eu8SvK/9k2NwcTFxgGf+HB0nYN
 4JZdz+wTY1hJdfB+CrXOpHbJ0pqq33wPh5t4kifvCJ6fhJ78wHltOCrxx8MQgmdLjo8J0gq8MbJ
 VCnl5BsngJ9sMQtiOdjJTVhzYsT4Cs73Lej0MyL4FcFP5+jD2Hx/qN92uYYp+V41p/Wufp73v2A
 odGsjF61+2XgZhfl4iZUbdM6WJ4rfsI8edfKxd2ibvCW3/f4vnQ2FMHz4VKHHX+hGyekQYFzPkN
 nJxWZvFiqXoaEGBQQfnBP8Z9NknmoFwdXVKrDumjdEfFXN81IlGgZoxwYAmw/q5Ba0D0rHm/jvz
 tOUwBaz92SWqCJ6a2cKf1cxn7
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id
 d9443c01a7336-2a599e697e0mr49882755ad.59.1768432591887; 
 Wed, 14 Jan 2026 15:16:31 -0800 (PST)
X-Received: by 2002:a17:903:1510:b0:2a1:3ee3:c6ae with SMTP id
 d9443c01a7336-2a599e697e0mr49882385ad.59.1768432591377; 
 Wed, 14 Jan 2026 15:16:31 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a3e3cc793fsm238029785ad.72.2026.01.14.15.16.30
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 15:16:30 -0800 (PST)
Message-ID: <ef469d4e-59db-4fe4-9b7d-52aa07679efc@canonical.com>
Date: Wed, 14 Jan 2026 15:16:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <20260114173226.14956-1-ryan.lee@canonical.com>
 <aWghkyAXnXru7-sQ@yaupon>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <aWghkyAXnXru7-sQ@yaupon>
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

On 1/14/26 15:06, Tyler Hicks wrote:
> On 2026-01-14 09:32:24, Ryan Lee wrote:
>> The previous value of GFP_ATOMIC is an int and not a bool, potentially
>> resulting in UB when being assigned to a bool. In addition, the mmap hook
>> is called outside of locks (i.e. in a non-atomic context), so we can pass
>> a fixed constant value of false instead to common_mmap.
>>
>> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
>> ---
>>   security/apparmor/lsm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
>> index 08757f372972..320e4e1e1748 100644
>> --- a/security/apparmor/lsm.c
>> +++ b/security/apparmor/lsm.c
>> @@ -826,7 +826,7 @@ static int common_mmap(const char *op, struct file *file, unsigned long prot,
>>   static int apparmor_mmap_file(struct file *file, unsigned long reqprot,
>>   			      unsigned long prot, unsigned long flags)
>>   {
>> -	return common_mmap(OP_FMMAP, file, prot, flags, GFP_ATOMIC);
>> +	return common_mmap(OP_FMMAP, file, prot, flags, false);
> 
> With all callers of common_mmap() now passing false for in_atomic,
> shouldn't we drop in_atomic from the common_mmap() function definition?
> 
good catch, atm that is indeed the case


