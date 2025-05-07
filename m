Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C0AAE4F7
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 17:37:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCgpx-0003S4-VU; Wed, 07 May 2025 15:37:33 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uCgpw-0003RC-Hy
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 15:37:32 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D22083F03F
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 15:37:27 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ace99fe4282so4088066b.1
 for <apparmor@lists.ubuntu.com>; Wed, 07 May 2025 08:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632247; x=1747237047;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr9yeU7dVZUGfHuigq4Ki6OIiok3yQVQgVBSFzRvIM8=;
 b=kHdsD/APHMtUyUnicrfxYQCaqCCMWU1KYn6eblBJt2njs738GpD4ubz6JFtqJwc32Q
 Zp750Uw69BvYExPYuDHhXKtP8/crsPHIrQA1pSUJSQ4ER1XTBTlcZwSEYE11dKYo5w+o
 jG3rCYUj2sr9dLFpMNy9K/4kowC7KpY+lNJ65HTeEvpuRTCPQ281BMnUk8J6vIxzxWCL
 oojyvjL/G5HPxhC4AWfGR62q3kjL1m0uQYE2yw6/hybiQ+OsPXvM5ffCWmQ+UneRcGuo
 1yOxc/fUcK0neZs0HtDByM1V+cKAFwuszTuWLn9R1h6sTsGPI3bcVYPGwhNzHjZyR5hr
 lyRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuY1i0q9robWsLmMYmAMy9DdRGjSomr8NUjJ/BvPKEjbCw1XtGEdb9TKmvl1Q2mTDrcqZH14FMww==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwraWOg5HqLkz114h9k06LXxrbLwZQNugYC/TlicHAWlOXO5R1Q
 ZtMYfwKP/mfgRbIOceJnX0IGEpgWsAGXdLEWRWHMMDr1XPZtx8ZZF81UocS73w8wtMnyXQkwYHx
 zFaPagRuCaKwoi+oLeuQ6Uet4MFamzijIqOPf3p/WoneKH6TLlxcWpIDB2uz4XbCF/iG7lFBlTw
 ==
X-Gm-Gg: ASbGncvKDqiC8w1XjLGe/ZJvz2Ei1GzNkjOo/6BLIS5O2B90VLdCzswsSPVGxijHbcl
 Ul+v4V7QU0fC5s8XL30Y4g9clVfwMINU6MMowH78SkHTs3PpG/Tasv18FvJLoj7vM1GzyPjqser
 iaNeSNobV6vVMwJcr0quBGA8MacxYntFMUjJQ/UxSJoi+78fO0bJix3aoAbCyBxe9GPsXSsXRN/
 FszNCj8OYQIHG3yonvi5Uwvv3J7fp/6JGJlSLcsnRdxxZcqxhbq+u8UKQ6tscOULEeGJF8Lz9QJ
 LlNzYuzV/sxUvKyqv8qvOP3bl3AlmcuwVJ/Dn2D8TpqNz+RHjctcgztUtfavzTyeka0=
X-Received: by 2002:a17:907:cd0d:b0:ace:be7c:11df with SMTP id
 a640c23a62f3a-ad1eaefaedcmr364827866b.6.1746632246826; 
 Wed, 07 May 2025 08:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3LQvsicm0YBjAOHirumoX4UDCK+hCXE9ScCJp5xtKINT4FyusXCl/66Pqvnso9XRhvIDAPw==
X-Received: by 2002:a17:907:cd0d:b0:ace:be7c:11df with SMTP id
 a640c23a62f3a-ad1eaefaedcmr364824366b.6.1746632246505; 
 Wed, 07 May 2025 08:37:26 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274?
 ([2001:861:3280:410:2ef0:5dff:fe60:6274])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891ef1e0sm923525466b.77.2025.05.07.08.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 08:37:26 -0700 (PDT)
Message-ID: <bc252425-2703-48c4-a1fa-9268124c2386@canonical.com>
Date: Wed, 7 May 2025 17:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@i-love.sakura.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 5/7/25 08:19, Song Liu wrote:
> On Tue, May 6, 2025 at 7:40 AM Maxime Bélair
> <maxime.belair@canonical.com> wrote:
>>
>> Define a new LSM hook security_lsm_manage_policy and wire it into the
>> lsm_manage_policy() syscall so that LSMs can register a unified interface
>> for policy management. This initial, minimal implementation only supports
>> the LSM_POLICY_LOAD operation to limit changes.
>>
>> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
> [...]
>> diff --git a/security/security.c b/security/security.c
>> index fb57e8fddd91..256104e338b1 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -5883,6 +5883,27 @@ int security_bdev_setintegrity(struct block_device *bdev,
>>  }
>>  EXPORT_SYMBOL(security_bdev_setintegrity);
>>
>> +/**
>> + * security_lsm_manage_policy() - Manage the policies of LSMs
>> + * @lsm_id: id of the lsm to target
>> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
>> + * @buf:  userspace pointer to policy data
>> + * @size: size of @buf
>> + * @flags: lsm policy management flags
>> + *
>> + * Manage the policies of a LSM. This notably allows to update them even when
>> + * the lsmfs is unavailable is restricted. Currently, only LSM_POLICY_LOAD is
>> + * supported.
>> + *
>> + * Return: Returns 0 on success, error on failure.
>> + */
>> +int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
>> +                              size_t size, u32 flags)
>> +{
>> +       return call_int_hook(lsm_manage_policy, lsm_id, op, buf, size, flags);
> 
> If the LSM doesn't implement this hook, sys_lsm_manage_policy will return 0
> for any inputs, right? This is gonna be so confusing for users.

Indeed, that was an oversight. It will return -EOPNOTSUPP in the next patch revision.

> 
> Thanks,
> Song

Thanks,

Maxime


