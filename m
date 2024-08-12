Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDA956009
	for <lists+apparmor@lfdr.de>; Mon, 19 Aug 2024 01:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sfp0m-0007Dn-IZ; Sun, 18 Aug 2024 23:08:36 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <groeck7@gmail.com>) id 1sdYVi-0000ZZ-3A
 for apparmor@lists.ubuntu.com; Mon, 12 Aug 2024 17:07:10 +0000
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-39b3ffc570bso21301305ab.3
 for <apparmor@lists.ubuntu.com>; Mon, 12 Aug 2024 10:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723482428; x=1724087228;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjxMScf/umzBfKjEzS4Da/J1mKHJM/1WWdAzOpqreok=;
 b=kRlm24yYe7FgvwJ4Re99k0KZEgFhtXXz0EFFHDTSQvMjyWyNCZ+5xyfIrWHk4pD97C
 FqEVTES4VvkYraoVj55NPKdcdFsHtXWC0b0fuWwm39S7RunTnUSQgpzgWxITuDCdjUEP
 pdngwjowPKs9MRDy292mwquG+ThnDYBV6syyI4kpJHhKC7lSkOgBYGG7o3jMwopvVFkT
 eGXiL8ew8NncRMovNnbmwGhRRwByFCq0bQY91GWo6dptcxjvrwfFh+i/P/TwsRFHCPGJ
 YKoL3niasikfJyIpPKE1ZHR8qUfe1qhm5Z/94Az92TPlS6onccHSIhaz7XqcrmPT7VIf
 XMpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdcHGXC4gb38qjKZi27WLB8p1R9AvuiE+anzac7MdwIJE/XU0mgpjo3OcFh9to0+8F6LPyrgUNhwfeATZmlT+K/NAy/6BE8/ua
X-Gm-Message-State: AOJu0Ywt5s614DJRyPlhTjvGjByLUwVDeMzhsL7Mox0HFUfYwhN8gE92
 MjMYJ0Wlcu9CFzUz9y6dhlPF+EH/A9NmUkG5vm4D5SKLmXc/CqA0
X-Google-Smtp-Source: AGHT+IFHtxwQg4KjFaCR69gG/M/hFE3E1BVFokmm5lOicfbs9m/PAJe6vx8PiX04p70ehl7YT4WShA==
X-Received: by 2002:a05:6e02:1d18:b0:375:9dd4:d693 with SMTP id
 e9e14a558f8ab-39c477b6319mr9903085ab.3.1723482428544; 
 Mon, 12 Aug 2024 10:07:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e58ad960sm4267570b3a.78.2024.08.12.10.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 10:07:08 -0700 (PDT)
Message-ID: <90a90f45-cd24-4d98-868e-ac30317badfe@roeck-us.net>
Date: Mon, 12 Aug 2024 10:07:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>
References: <20240808155931.1290349-1-linux@roeck-us.net>
 <6a0c69d4-f614-4348-a28f-0d4a6fe08df8@canonical.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6a0c69d4-f614-4348-a28f-0d4a6fe08df8@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.166.176; envelope-from=groeck7@gmail.com;
 helo=mail-il1-f176.google.com
X-Mailman-Approved-At: Sun, 18 Aug 2024 23:08:35 +0000
Subject: Re: [apparmor] [PATCH] apparmor: fix policy_unpack_test on big
	endian systems
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
Cc: Paul Moore <paul@paul-moore.com>, Kees Cook <keescook@chromium.org>,
 Brendan Higgins <brendanhiggins@google.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/12/24 09:55, John Johansen wrote:
> On 8/8/24 08:59, Guenter Roeck wrote:
>> policy_unpack_test fails on big endian systems because data byte order
>> is expected to be little endian but is generated in host byte order.
>> This results in test failures such as:
>>
>>   # policy_unpack_test_unpack_array_with_null_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:150
>>      Expected array_size == (u16)16, but
>>          array_size == 4096 (0x1000)
>>          (u16)16 == 16 (0x10)
>>      # policy_unpack_test_unpack_array_with_null_name: pass:0 fail:1 skip:0 total:1
>>      not ok 3 policy_unpack_test_unpack_array_with_null_name
>>      # policy_unpack_test_unpack_array_with_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:164
>>      Expected array_size == (u16)16, but
>>          array_size == 4096 (0x1000)
>>          (u16)16 == 16 (0x10)
>>      # policy_unpack_test_unpack_array_with_name: pass:0 fail:1 skip:0 total:1
>>
>> Add the missing endianness conversions when generating test data.
>>
>> Fixes: 4d944bcd4e73 ("apparmor: add AppArmor KUnit tests for policy unpack")
>> Cc: Brendan Higgins <brendanhiggins@google.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Looks good
> 
> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> I will pull this into my tree
> 

Thanks!

Guenter


