Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B613BC8BFAF
	for <lists+apparmor@lfdr.de>; Wed, 26 Nov 2025 22:10:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOMmC-0000W0-2F; Wed, 26 Nov 2025 21:10:12 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vOMm9-0000Vl-EH
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 21:10:09 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD1D240F83
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 21:10:06 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2958a134514so2233215ad.2
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 13:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764191405; x=1764796205;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etwvSuPkB6K0qsrfspA5D5Yf0GIH78UqvE+Q+LobWHQ=;
 b=ov15sGwaBw5b2zhjZDjwHhBs7fLWQuJtb5UkOrr05XDixlYVebRBdtmmuFp3S3K2w0
 0ESZkW5bnGOtcxG1ddI+neSipm/zHyYC4Q0V5Gu+e5zAz9pDrk3ZGlQG+4kA/yLiNKIZ
 9t6v7/pFFlvm+6WV6E1ZKoj+I6HBV3ea6Vsi3AbogsVI9OKPTt+2LE8VDMnWq4hZv/X7
 A6JmqE7ReyAPNw/1w5eUy5PYjWtnNiQwD4oXS1qdBkp1rcgM7mFsjMyrFGinazfskRgi
 +0H13VrOLOi7qaF4vSAl+C4t8xGuUkHDsC9qFvuDV6O1DfBHfdQi3dBHLx5KNVPrY0dN
 nZsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiHVdTD89yRjwDeGIpH0rFxbegU/mfpXttUX0sGyqs0RDsIJQAN+colfN/C2nNaz/SSAh34xQIEw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz/XDpKMlcWRuIGrzu+H523L8h6pYJ7xAG5uY/b5VkyEa24SAZr
 EHh3rGSGDiVY+dVl6OhoD1SbVdMR7j2+t6tXvDQeGS/ylg7JTeseCF/SykWeBlfxVZBioJWBZVp
 qfYQo7+8xHwWsP17sQXrKroZQaZWAvnBTL89N0/BlHzQHZ9+sg0ErL2OTUE5n6lRueH+K5QYyEa
 xheA==
X-Gm-Gg: ASbGncshGE8HX7hiF8lIUGg7eO76gyYm8J0DoQiEhCNJEhDUV/vUoRaK8sotOeUDE/L
 AXPDWzWbUL39ph81C3brGraLHQvRQoO9V6GgagQoyvXVmySWq6EEQeiVpnzsEcxHqPB7qI6Z+9O
 +OexgqlueU0qI+8i30sWBUC10n31tdgmTUe3JYm8JGREA4ynuCCoJ76g4t0ehh5fR7Fe3JpS8Zl
 4d/lNHovE8GUhIuIL1I2rvpmlKmWG4pSI806WsUfGyBnR8A1OUZ+DCku4hRP3CK9iOFnJhco6H9
 xfxunEpRyRx7My7TmC54OYk6toMlbMRUAt+wRfWyZ61M5Qskt8t1H8K1OVxKCaeBHDFKUj8C8A2
 lRJETrmLHP/SDLYeRLDlwuLGI
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id
 d9443c01a7336-29bab1db61fmr85232995ad.50.1764191405252; 
 Wed, 26 Nov 2025 13:10:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO9cEqjZUKFW7BJRLCbL8zz0v+bKZwgqGsvGz/h3CjwbNizKdrFpT89fEjElUoizqoEVJ9nA==
X-Received: by 2002:a17:902:f54a:b0:295:6427:87d4 with SMTP id
 d9443c01a7336-29bab1db61fmr85232635ad.50.1764191404774; 
 Wed, 26 Nov 2025 13:10:04 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29b5b26fc24sm209243355ad.67.2025.11.26.13.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 13:10:04 -0800 (PST)
Message-ID: <c64398f7-d470-4b30-a5a2-d3884581d9fc@canonical.com>
Date: Wed, 26 Nov 2025 13:10:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Helge Deller <deller@kernel.org>
References: <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100> <e88c32c2-fb18-4f3e-9ec2-a749695aaf0a@canonical.com>
 <c192140a-0575-41e9-8895-6c8257ce4682@gmx.de>
 <d35010b3-7d07-488c-b5a4-a13380d0ef7c@canonical.com>
 <20251126104444.29002552@pumpkin>
 <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de>
 <20251126142201.27e23076@pumpkin> <aScY13MEBATreotz@carbonx1>
 <f5637038-9661-47fe-ba69-e461760ac975@canonical.com>
 <aSdfyGv2T88T5FEu@carbonx1>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <aSdfyGv2T88T5FEu@carbonx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: david laight <david.laight@runbox.com>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/26/25 12:15, Helge Deller wrote:
> * John Johansen <john.johansen@canonical.com>:
>> On 11/26/25 07:12, Helge Deller wrote:
>>> * david laight <david.laight@runbox.com>:
>>>> On Wed, 26 Nov 2025 12:03:03 +0100
>>>> Helge Deller <deller@gmx.de> wrote:
>>>>
>>>>> On 11/26/25 11:44, david laight wrote:
>>>> ...
>>>>>>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>>>>>>> index 26e82ba879d44..3dcc342337aca 100644
>>>>>>> --- a/security/apparmor/match.c
>>>>>>> +++ b/security/apparmor/match.c
>>>>>>> @@ -71,10 +71,10 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>>>>>>      				     u8, u8, byte_to_byte);
>>>>>>
>>>>>> Is that that just memcpy() ?
>>>>>
>>>>> No, it's memcpy() only on big-endian machines.
>>>>
>>>> You've misread the quoting...
>>>> The 'data8' case that was only half there is a memcpy().
>>>>
>>>>> On little-endian machines it converts from big-endian
>>>>> 16/32-bit ints to little-endian 16/32-bit ints.
>>>>>
>>>>> But I see some potential for optimization here:
>>>>> a) on big-endian machines just use memcpy()
>>>>
>>>> true
>>>>
>>>>> b) on little-endian machines use memcpy() to copy from possibly-unaligned
>>>>>       memory to then known-to-be-aligned destination. Then use a loop with
>>>>>       be32_to_cpu() instead of get_unaligned_xx() as it's faster.
>>>>
>>>> There is a function that does a loop byteswap of a buffer - no reason
>>>> to re-invent it.
>>>
>>> I assumed there must be something, but I did not see it. Which one?
>>>
>>>> But I doubt it is always (if ever) faster to do a copy and then byteswap.
>>>> The loop control and extra memory accesses kill performance.
>>>
>>> Yes, you are probably right.
>>>
>>>> Not that I've seen a fast get_unaligned() - I don't think gcc or clang
>>>> generate optimal code - For LE I think it is something like:
>>>> 	low = *(addr & ~3);
>>>> 	high = *((addr + 3) & ~3);
>>>> 	shift = (addr & 3) * 8;
>>>> 	value = low << shift | high >> (32 - shift);
>>>> Note that it is only 2 aligned memory reads - even for 64bit.
>>>
>>> Ok, then maybe we should keep it simple like this patch:
>>>
>>> [PATCH v2] apparmor: Optimize table creation from possibly unaligned memory
>>>
>>> Source blob may come from userspace and might be unaligned.
>>> Try to optize the copying process by avoiding unaligned memory accesses.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
>>> index 1fbe82f5021b..386da2023d50 100644
>>> --- a/security/apparmor/include/match.h
>>> +++ b/security/apparmor/include/match.h
>>> @@ -104,16 +104,20 @@ struct aa_dfa {
>>>    	struct table_header *tables[YYTD_ID_TSIZE];
>>>    };
>>> -#define byte_to_byte(X) (X)
>>> +#define byte_to_byte(X) (*(X))
>>>    #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
>>>    	do { \
>>>    		typeof(LEN) __i; \
>>>    		TTYPE *__t = (TTYPE *) TABLE; \
>>>    		BTYPE *__b = (BTYPE *) BLOB; \
>>> -		for (__i = 0; __i < LEN; __i++) { \
>>> -			__t[__i] = NTOHX(__b[__i]); \
>>> -		} \
>>> +		BUILD_BUG_ON(sizeof(TTYPE) != sizeof(BTYPE)); \
>>> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) || sizeof(BTYPE) == 1) \
>>> +			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
>>> +		else /* copy & convert convert from big-endian */ \
>>> +			for (__i = 0; __i < LEN; __i++) { \
>>> +				__t[__i] = NTOHX(&__b[__i]); \
>>> +			} \
>>>    	} while (0)
>>>    static inline size_t table_size(size_t len, size_t el_size)
>>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>>> index c5a91600842a..13e2f6873329 100644
>>> --- a/security/apparmor/match.c
>>> +++ b/security/apparmor/match.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/vmalloc.h>
>>>    #include <linux/err.h>
>>>    #include <linux/kref.h>
>>> +#include <linux/unaligned.h>
>>>    #include "include/lib.h"
>>>    #include "include/match.h"
>>> @@ -70,10 +71,10 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>>    				     u8, u8, byte_to_byte);
>>>    		else if (th.td_flags == YYTD_DATA16)
>>>    			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>>> -				     u16, __be16, be16_to_cpu);
>>> +				     u16, __be16, get_unaligned_be16);
>>>    		else if (th.td_flags == YYTD_DATA32)
>>>    			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>>> -				     u32, __be32, be32_to_cpu);
>>> +				     u32, __be32, get_unaligned_be32);
>>>    		else
>>>    			goto fail;
>>>    		/* if table was vmalloced make sure the page tables are synced
>>
>> I think we can make one more tweak, in just not using UNPACK_ARRAY at all for the byte case
>> ie.
>>
>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>> index 26e82ba879d44..389202560675c 100644
>> --- a/security/apparmor/match.c
>> +++ b/security/apparmor/match.c
>> @@ -67,8 +67,7 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>>   		table->td_flags = th.td_flags;
>>   		table->td_lolen = th.td_lolen;
>>   		if (th.td_flags == YYTD_DATA8)
>> -			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>> -				     u8, u8, byte_to_byte);
>> +			memcp(table->td_data, blob, th.td_lolen);
> 
> True.
> Then byte_to_byte() can go away in match.h as well.
> So, here is a (untested) v3:
> 
and lightly tested now

I will pull it into my tree

> 
> [PATCH v3] apparmor: Optimize table creation from possibly unaligned memory
> 
> Source blob may come from userspace and might be unaligned.
> Try to optize the copying process by avoiding unaligned memory accesses.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
Acked-by: John Johansen <john.johansen@canonical.com>

> diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
> index 1fbe82f5021b..19e72b3e8f49 100644
> --- a/security/apparmor/include/match.h
> +++ b/security/apparmor/include/match.h
> @@ -104,16 +104,18 @@ struct aa_dfa {
>   	struct table_header *tables[YYTD_ID_TSIZE];
>   };
>   
> -#define byte_to_byte(X) (X)
> -
>   #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
>   	do { \
>   		typeof(LEN) __i; \
>   		TTYPE *__t = (TTYPE *) TABLE; \
>   		BTYPE *__b = (BTYPE *) BLOB; \
> -		for (__i = 0; __i < LEN; __i++) { \
> -			__t[__i] = NTOHX(__b[__i]); \
> -		} \
> +		BUILD_BUG_ON(sizeof(TTYPE) != sizeof(BTYPE)); \
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) \
> +			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
> +		else /* copy & convert convert from big-endian */ \
> +			for (__i = 0; __i < LEN; __i++) { \
> +				__t[__i] = NTOHX(&__b[__i]); \
> +			} \
>   	} while (0)
>   
>   static inline size_t table_size(size_t len, size_t el_size)
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index c5a91600842a..1e32c8ba14ae 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -15,6 +15,7 @@
>   #include <linux/vmalloc.h>
>   #include <linux/err.h>
>   #include <linux/kref.h>
> +#include <linux/unaligned.h>
>   
>   #include "include/lib.h"
>   #include "include/match.h"
> @@ -66,14 +67,13 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>   		table->td_flags = th.td_flags;
>   		table->td_lolen = th.td_lolen;
>   		if (th.td_flags == YYTD_DATA8)
> -			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u8, u8, byte_to_byte);
> +			memcpy(table->td_data, blob, th.td_lolen);
>   		else if (th.td_flags == YYTD_DATA16)
>   			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u16, __be16, be16_to_cpu);
> +				     u16, __be16, get_unaligned_be16);
>   		else if (th.td_flags == YYTD_DATA32)
>   			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u32, __be32, be32_to_cpu);
> +				     u32, __be32, get_unaligned_be32);
>   		else
>   			goto fail;
>   		/* if table was vmalloced make sure the page tables are synced


