Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA3A5BF1C
	for <lists+apparmor@lfdr.de>; Tue, 11 Mar 2025 12:34:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1trxsF-0002zy-Ac; Tue, 11 Mar 2025 11:34:15 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vindrg@gmail.com>) id 1trxsD-0002zj-CR
 for apparmor@lists.ubuntu.com; Tue, 11 Mar 2025 11:34:13 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so59591761fa.2
 for <apparmor@lists.ubuntu.com>; Tue, 11 Mar 2025 04:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741692852; x=1742297652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnHviAtmQzAsaiRoyd4ZSEssY2nrrcozMLrIOThHI4Q=;
 b=DZHkv3Hi+vaEdNLqMPC0M3GGRJCbB9jzaMP0hWHefkdJfuxkXfK7yTBk00EC8GJLCQ
 N9KlUfl28XAjUf+ZtF21XsOeVZjc+hvzVNAcHaiGtgNm49ffnaLKV6IyKQANSq4BxEhL
 5/yKqiZEAlLpfpbni8+6wFZdNh+Mk16ZeYokzKCZTxKXm3k02U3289v61EN+t21jTf+G
 m8jgR0O2XIu4NqOByQvv5gM31Z0LMudBxAhw7vuYm+V9gpFLagKBKxRgnkmoShy0W3yq
 x1RsvjrKu7WAL4sBqLEFvNp02uCDb/s8CJrck8+DMzi8DxUJuyy/XzIWFxgAT3c1iJu4
 09DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNnrYWeyRUAGD1xWalok6OnM31IZcErKFApxMvHWsDM+LzFfgv4tIhKA0gBIrQ66CCxBqnsyM3QQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxq7Y44njgCSqLVsx8pHBBtTwEQP6kWMVbrM55z0v8OYur5U8h5
 kOexRaKu3GHN/ESUjI2YNjKOvvpnVTEjvRrsPIVrOsmnBTPrbMoV
X-Gm-Gg: ASbGncsO5s6XD55LpM4kXCzuT4vRXcP8GimbDM2FG2QEfe6QX1y0Pwzpn1J++aohxkw
 oJATp0EvpgyaRVtuxtY1+Z0OY6oBwDJtg3nG3rCs+81d6KSgZbDCJFqz/N4vZIK2rmOmhQWzQ3X
 HRURU2y6f9Rr3SKGxuPYO6BXmdSQd32SMZlcmTgn+GipXiARXbOJYCGtVrENUE7RiSyaMpYBSvA
 H5bllWHqy79gPJQkjTonm1y/XZzNBNnqEGRoiMmM9jE3/us//QthUtfBEjufe+IKJuPmTG8k28n
 4JD+LZHnEHUwWysXeOgmBKxUkCKvc/ZdjsKwWBmZ2W+7OjLaP5HXBg==
X-Google-Smtp-Source: AGHT+IHL6elrNS8QfxVmZWMv+XlmF5v4smp78T07N4dI+f8ZIBryUNwrtyYZhoWM8mtQF0VaEtUmIg==
X-Received: by 2002:a05:6512:3d15:b0:545:8f7:8597 with SMTP id
 2adb3069b0e04-54990e58529mr7435430e87.16.1741692851983; 
 Tue, 11 Mar 2025 04:34:11 -0700 (PDT)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bf1fa955fsm17840111fa.79.2025.03.11.04.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 04:34:11 -0700 (PDT)
Message-ID: <b5951c07-bd99-4d7a-93e9-ba94642df991@gmail.com>
Date: Tue, 11 Mar 2025 13:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <dc80dadc-3ebd-4a63-a13a-6427d91d4908@gmail.com>
 <3c802290-fe1f-45e1-8638-cf8ac3401033@canonical.com>
Content-Language: en-US
From: Vincas Dargis <vindrg@gmail.com>
In-Reply-To: <3c802290-fe1f-45e1-8638-cf8ac3401033@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.171; envelope-from=vindrg@gmail.com;
 helo=mail-lj1-f171.google.com
Subject: Re: [apparmor] What's about all these new "uncofined" profiles with
 just "userns"?
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

Hi,

On 2025-03-02 01:48, John Johansen wrote:
 > On 3/1/25 05:02, Vincas Dargis wrote:
 >> 2. Apparently, my long-practiced "tradition" to invoke `aa-enforce /etc/apparmor.d/*` after every apparmor[-profiles]
 >> package upgrade (due to usr.bin.ping-and-friends becoming "complain" again), is now seemingly ill-advised? Enforcing
 >> all these new, almost-empty "uncofined" profiles makes sort of havoc...
 >>
 > ah yeah aa-enforce of the unconfined profiles will cause some issues. Enough that its a bug worth fixing. We should add
 > some kind of flag that either allows skipping those or the inverse is required to enforce on them. Opinions/feedback on
 > which is welcome
Yes, some kind of "unconfinable" or "not_confinable" flag could help. One could use flags=(complain,unconfinable) for 
any WIP profile.


 >> b). How should user enable proper custom firefox profile correctly?
 >>
 >>      aa-disable /etc/apparmor.d/firefox, and enforce /etc/apparmor.d/usr.bin.firefox?
 >>
 > aa-disable of the profile file you don't want should work, and is the current recommended method
OK got it.


 > sadly the overlay feature didn't land in 4.1, it is coming and it will allow you to setup local overrides without having
 > to overwrite profiles dropped in by packaging.
Overlay looks cool.

Thanks for explanations!

