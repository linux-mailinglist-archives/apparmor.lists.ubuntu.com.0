Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D7856D39330
	for <lists+apparmor@lfdr.de>; Sun, 18 Jan 2026 08:54:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhNbW-0001i1-2N; Sun, 18 Jan 2026 07:53:46 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vhNbU-0001hu-T9
 for apparmor@lists.ubuntu.com; Sun, 18 Jan 2026 07:53:44 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE0D83FBB3
 for <apparmor@lists.ubuntu.com>; Sun, 18 Jan 2026 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768722824;
 bh=v7U1iagX4vJbfzuHqFXq77v5wZjwn6HrXJlBdamcTNk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=XHpFUh7icbzqhy+BOikeZoscLrQZ7Jr+Ol9NRSgeeuWb+Rk54I0rL6W/NHR1e6IJt
 TSDXZpZm0mtaUcKccyDCFSuqBLiiK5YcmrBGx/lAjFWg82LlQS4EkEG16fwMd85K3t
 24I66P5fgl3xpgSK+WPxd6HsrYpoNYmkINF2gR/VLNzlHSr4XIA/DYdNvhXcKjU1BU
 OlFXuQ7K07ZTKBD0qVg6VsnD9abfD3fdKaZIW48MgcA0s973rH1obNtaoWeYS5keWc
 T4F0EnYlBkIPhGWCiz0nmvDqnjHdlNaYCyIQLRG/Yc1p0hWR+0R06GMHmxBUIMsAbp
 9fcwNMsABBCqP5ac/FjgjO1iFJ2FW0MTwVIqwR48HVz/g2HkVVFWttJMqjU+d6m7rV
 G0ga+1lIbA/1DFQ0F2GdJMY0TyC/Ph8ZKIQsTp+qu2Ymqs4d4et9Ove0+KfJoTuqSm
 aGv3ZZO/yn1EKK9qDPjbwoQPLwCfQLhl0be5uQ2N6ET3g1bbjd/lUBjpam0lCuTv0K
 hGrZHEVocozY45YjiOphZMYDrrDyl+zDUGwAVTeSoFK132MbWmITQq57TH98d785CP
 iN+mETCAqJE4dVKvsBBTg8K2EKXovDz+wzLKLsC2nGgGtlv9PmBC0xbpeU9FgvpH8T
 t82lKU6PSE5fa9JzzTs2COAs=
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0a0bad5dfso55973555ad.0
 for <apparmor@lists.ubuntu.com>; Sat, 17 Jan 2026 23:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768722823; x=1769327623;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7U1iagX4vJbfzuHqFXq77v5wZjwn6HrXJlBdamcTNk=;
 b=GlZKrpDPxJtVxf3hk2v3DgJ+OxvIrpHsEyR97SkniPbM1s64oOJOqDZQ0A4kgbLwya
 yG8vRcLln0K7WMZ3/FU6qo2tr/HvduTUy9vTyb48WHrygmmVt0b5soXCJ6Q3Ye347odk
 jhtQ2+QEvsWjo5z97Cl7faLpux214Y+QW944ELdn7XQAJdlGmk4qZJFFBmhGu/T3ld7F
 D6NHD1Glr8KWEBXL5O7oTM2lPtGid1QiXq5nlSyl0IeJbJev+JpM/3sqTdE8S7pBAZMv
 GPen0jXxBJMiWFtaPNPO0x0aiTAGmP7xMAJeH7Vgcu5cNCPe2uQ8XcxUnrQA5vvFt/rT
 OACA==
X-Gm-Message-State: AOJu0YzVHKNFUT9T+QbOTJpePfZjFrdCvWsWJRHh/88pSnWVLknXggqJ
 P+l/7MpBTcMbh0W+8Gq/fDGYGHQv9eoX/bZntkiJDZd2LUUlReO5QhomZgcc33vB3ppF11sjw7Z
 hGx1/MrskXQwDU/Gs2v0GuwJEaqsNhhFy55R/O8/eM3ORD9IvnzztRJ9pPz0Rje8Oy1JI4f0bxB
 sSgXwyotMQoQ==
X-Gm-Gg: AY/fxX4GN5Xep4x//3kybdmv9V6XJlejZMKZ6F4swJVCd/zCFs00Z8Lz4TbFTx/bPUI
 /lj1/nsVjZcPcwR1sI2vGU3+zbdiPB0/mvoUJi9RhlitS58gIgXsn3d4aKkT2IEMJJEH1I8YwP3
 xcvAsCJjdgRC/Mib1xMohUsd+BXp3G+q9/AlqoIMaGjV9kTg4NMe8wS6cBPLnNFqcEbCL8ThayB
 EJVR999sQvJXwS4J1Arw4mftepXwn5G0lYiltUslGJPfTU/rNk/Nbi3Hg774l2mhZ7HK1lz2n/o
 /gjmI7EACawjRHyMJjjH6WdaMJW6YjNevo/OU+NGqVqhJhBUvo5Uz50y6GsROqhmhamvBOnW/bb
 7QzqazJDIm5aU8DBAoEU69uHL
X-Received: by 2002:a17:903:1a2e:b0:298:6a79:397b with SMTP id
 d9443c01a7336-2a7176cc35bmr71897345ad.56.1768722822872; 
 Sat, 17 Jan 2026 23:53:42 -0800 (PST)
X-Received: by 2002:a17:903:1a2e:b0:298:6a79:397b with SMTP id
 d9443c01a7336-2a7176cc35bmr71897255ad.56.1768722822527; 
 Sat, 17 Jan 2026 23:53:42 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm63013165ad.38.2026.01.17.23.53.41
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jan 2026 23:53:42 -0800 (PST)
Message-ID: <20755c13-c094-4441-8679-85bd1447cabf@canonical.com>
Date: Sat, 17 Jan 2026 23:53:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <20260113173558.15401-1-ryan.lee@canonical.com>
 <93e697f2-c67c-4020-9a24-4e2d149797ed@app.fastmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <93e697f2-c67c-4020-9a24-4e2d149797ed@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: return -ENOMEM in
 unpack_perms_tableupon alloc failure
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

On 1/14/26 09:42, Zygmunt Krynicki wrote:
> W dniu 13.01.2026 o 18:35 Ryan Lee pisze:
>> In policy_unpack.c:unpack_perms_table, the perms struct is allocated via
>> kcalloc, with the position being reset if the allocation fails. However,
>> the error path results in -EPROTO being retured instead of -ENOMEM. Fix
>> this to return the correct error code.
>>
>> Reported-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
>> Fixes: fd1b2b95a2117 ("apparmor: add the ability for policy to specify
>> a permission table")
>> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
>> ---
>>   security/apparmor/policy_unpack.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/security/apparmor/policy_unpack.c
>> b/security/apparmor/policy_unpack.c
>> index 019430225e4a..2280a8f7a843 100644
>> --- a/security/apparmor/policy_unpack.c
>> +++ b/security/apparmor/policy_unpack.c
>> @@ -700,8 +700,10 @@ static ssize_t unpack_perms_table(struct aa_ext
>> *e, struct aa_perms **perms)
>>   		if (!aa_unpack_array(e, NULL, &size))
>>   			goto fail_reset;
>>   		*perms = kcalloc(size, sizeof(struct aa_perms), GFP_KERNEL);
>> -		if (!*perms)
>> -			goto fail_reset;
>> +		if (!*perms) {
>> +			e->pos = pos;
>> +			return -ENOMEM;
>> +		}
>>   		for (i = 0; i < size; i++) {
>>   			if (!unpack_perm(e, version, &(*perms)[i]))
>>   				goto fail;
>> -- 
>> 2.43.0
> 
> This looks good.
> 
> I'm unfamiliar with kernel acked protocol so I'll refrain from that.
> 
Essentially here, since you reviewed the patch you could add a
Reviewed-by: Zygmunt Krynicki <me@zygoon.pl>
like Tyler did.

You can find the tag descriptions in
Documentation/process/5.Posting.rst

search for "tags in common"


