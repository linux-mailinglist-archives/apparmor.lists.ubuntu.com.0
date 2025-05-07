Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C6033AAE4FE
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 17:38:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCgqQ-0003ZI-5A; Wed, 07 May 2025 15:38:02 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uCgqN-0003Yd-LU
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 15:37:59 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 446BE3F20C
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 15:37:56 +0000 (UTC)
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-acb5a03afdcso519848166b.3
 for <apparmor@lists.ubuntu.com>; Wed, 07 May 2025 08:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632274; x=1747237074;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rw+ajBmKH1oYIOuaY57PRGZktJSoo5Qqq7a4MCBkd4k=;
 b=V66roS3EOmqvtKThFDPQPcFVGHPHsH1V5cJ6m6egOJofaXDLbxvUx9wmhaZEnz5/K7
 wclSSFKtw1bIvd9E8NRmI0Q+Q0zIHPv2JvKqQDBcSeWUB0dZ4fZ9hkySV6+U3JncWkEu
 wLlzd1Y23SM1MnfmqKsJzpFz6qMXH8l4f2kKKmqeWo2NjUTZuVOrTuBAjZR+cD9oNq7J
 iwZNCwN0clBj9FsL9vC1fnI482CAUpg+jB34IMQip5cQSVQFBE6lldtdzvv5YnljhHqf
 FMa1VFuPDa9bJU+012Nr7uMDexJK1YLo73/Wu6E/IK+MJpEWSXC+HiIcv5w/dioHaPKq
 zQ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkFZQlmdjThlqbJ9pApknCuN9l+3SCQcJb1mfbshBni9f8SfGBcPeaZNYO+6IsutmPXioZkigsfg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwkD7ZdWB0YRv3SzS/R7bWw6z/pM2lJJEJpwnKD7KQOCnDSlqGz
 nkUb7ey3i32HxMJ0ujmk4/IC3IoEAhgrt5/AXyJ+4M9bjMsyCP623pYJOWFsYuZMRE7a0Tp1KP6
 eQ2hprY0xkl3kdo4w86CW7RAwOWl7k9DPG8JN9AY2XtfTaYuhkKKC+sKE7yZYF2tnktRWbHn8lA
 ==
X-Gm-Gg: ASbGncvUYCwHqSikjq8yrtTNWyss++kRYUKd+/esslFtCfD4HhsQpicz3Xb3D/xIdhR
 16Ti7mri+TxSy3fe6k9bn5Qc1YfgylaoeANDUFDylmrAa0f7zx36Yh8PdWguZdRwPkLBergjd8j
 wbvDeOMeipfoaEd/ngM1LUonGVJZCuyNPrnAEyOJY8M1DS+5tkynkk328p0iBiDn8EBi+vpOK84
 Fu6wt8ptkHf1EKC/NGUA7TJK4fukEBOLPGNvsnj6pXGx6Qu1kLgU8SOijGogC+nrs1aALetUKFM
 RZO6IBOQPz45DuW80tthJ31QJM1+vG7gC0opPLtI9AR6Lpwzw8YQPomxEOvjKB0HD98=
X-Received: by 2002:a17:907:8a8d:b0:ace:ed3b:285e with SMTP id
 a640c23a62f3a-ad1e8d8971amr360967666b.56.1746632274313; 
 Wed, 07 May 2025 08:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIiet74C8oMIdKA/PaSf8H9s5ZGkI/NebFPYSp7/1cEBiQAWfXF+ATv0VmOBrz140lQ6CMAg==
X-Received: by 2002:a17:907:8a8d:b0:ace:ed3b:285e with SMTP id
 a640c23a62f3a-ad1e8d8971amr360964566b.56.1746632273838; 
 Wed, 07 May 2025 08:37:53 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274?
 ([2001:861:3280:410:2ef0:5dff:fe60:6274])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1ee0b7e4csm159333766b.52.2025.05.07.08.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 08:37:53 -0700 (PDT)
Message-ID: <705fa834-b680-4a0e-9996-cca0565b0987@canonical.com>
Date: Wed, 7 May 2025 17:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-security-module@vger.kernel.org
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
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
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 5/7/25 12:40, Tetsuo Handa wrote:
> On 2025/05/06 23:32, Maxime Bélair wrote:
>> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
>> index dcaad8818679..b39e6635a7d5 100644
>> --- a/security/lsm_syscalls.c
>> +++ b/security/lsm_syscalls.c
>> @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
>>  SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void __user *, buf, u32
>>  		__user *, size, u32, flags)
>>  {
>> -	return 0;
>> +	size_t usize;
>> +
>> +	if (get_user(usize, size))
>> +		return -EFAULT;
>> +
>> +	return security_lsm_manage_policy(lsm_id, op, buf, usize, flags);
>>  }
> 
> syzbot will report user-controlled unbounded huge size memory allocation attempt. ;-)
> 
> This interface might be fine for AppArmor, but TOMOYO won't use this interface because
> TOMOYO's policy is line-oriented ASCII text data where the destination is switched via
> pseudo‑filesystem's filename; use of filename helps restricting which type of policy
> can be manipulated by which process. 

First, like any LSM, TOMOYO is not obliged to implement every operation. It can simply
expose the one that makes sense for its use case. For instance, I don't think it needs an
equivalent of the manager interface.

If TOMOYO wants to support several sub‑operations, it can distinguish them with the
syscall’s flags parameter instead of filenames (as securityfs_if.c does today) and reuse
the code already employed by its pseudo‑fs, as in the AppArmor patch. Supporting this
syscall would therefore require only minimal changes.

Line‑oriented ASCII text is not a barrier, either. The syscall can pass that format just
fine. Because a typical TOMOYO line is very small, the performance gains from using the
syscall are actually greater. A brief benchmark is available in [1].

Thanks,

Maxime

[1] https://gitlab.com/-/snippets/4840792

