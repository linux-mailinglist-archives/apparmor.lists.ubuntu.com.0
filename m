Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8DD1CB43
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 07:44:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfucH-0003Lz-2A; Wed, 14 Jan 2026 06:44:29 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vfucG-0003Ls-3a
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 06:44:28 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 01EBC3F285
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 06:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768373068;
 bh=chIc2b1Dh4A6t14+Dy1wSXlAlPCW+gFMUTTjbk2KsIs=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=jJIgQxh85EC+AUgaYVk515G11idO0urjYpz/IFCwcnc59XgFkR88EX8TgnWUPcBrV
 eUDd4Bl8tbU1a9eQIGXqw33+04zxIRv8Y8RtYEMyVHpgSbg3plwYlT2r8Jd+Ima396
 KAGZR3QGEKL38kVZ9xfDKg4BSOo6q5Od+Kd/VsblS+McgpSaGFMKJL2j5CPLC1QQ6Z
 yq8o1qWMvRBXabEJ6K812UbcQXFReJnuixfDLAYdbfmh6/LOGnTqwDuvIdlF98K5Ds
 /uMaDafHd8FVejbmaQ4RSdoj+dEyWbMvB9sly1q1FNq3XvJBJem5DxRqTYBSnq+h+m
 NBJwora0UmJiwX0lEL7Zd1eK7zn1bhPP6VTBk3E2VUZTM021Wh0RUUgc7kJWT1suDj
 6TRwnUkZd8gA8e6guofUDgbo0VLBloL5me4+cRPsgwriChpbn413+H7r+RwIUneF9e
 VCvxY4NzRf/BM0AJ05BEIyUwccVevlkpybKghmOmW44UZEHsz0TTeYAZ1Tp0WDG2fr
 kWHI/SHQoZsSWTafvwprNGNJkvOgapiVA2O0yzRyiXWct2qHn9jUUi2vjJ8AiwIb56
 ev3vDqvb9qrg/FrG7kUMbj5FgiOtLbfvW/0CrSpfYV7gmDKjgdTMuhMmcX75gBzVX3
 TLACaVPKOwGSP/TUl/8p2EFY=
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29f27176aa7so122523035ad.2
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jan 2026 22:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768373066; x=1768977866;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=chIc2b1Dh4A6t14+Dy1wSXlAlPCW+gFMUTTjbk2KsIs=;
 b=ZdsrvvsAbgPZ222clMecArrcSCHbOVpp8hP1BCTHQz18PVw43IkCaunKN1bTJd+y9k
 aRM5164H1bKnxnQDmMGBeSslmowhgndhalvTEzAxByJ/1JyseEDZ9UVlRHy1t2ktG2Eh
 WoZcW1zsoUrugId+Mc8uJc3otjys0S+EcCX4yuE3BM1vE8xgqqyfuHcvhE9kffXxXD7W
 idND842rGantr0NKWToWZPYHa502zE9FAMRmrJ36Inuck+cbicmT4bf5c1fdeWHg2dCL
 YymGk7mYWzOe0TQxvXVPFSBn5f4yAS8SaAGap2CWnGO9KIAbRkSt/ScWRpJl5gvrzhn/
 4Wwg==
X-Gm-Message-State: AOJu0Yx9EGeMaKfExC5TioJSmplaDsIdkluFZmaGnANipGfb6t1Kp0tK
 Vt7rNLUH6/kZACHdqWyiruF8pzUsFuI09HMtb8N2Dk8GwLfCqGzIuVh4KH3nIDMtKwOfpSnBhpw
 SidzE29Po/HwlOjpw6rs94CRTp7B+L5nEHJiNFmc6qC5YDtW1+dtTyNBHNdxRT2Qha7EyT3wf02
 Fk60Np6YJQxA==
X-Gm-Gg: AY/fxX6X0vxQuFhqoErtvgR9wVRqbdB6YDzPJkX1omt4NKPQ9tTh7y4eph39Eh5ap/3
 av3YQvT+IREpTvktKpuVoFBrmrLGFcJSTRf2ekjIb1k0Z8nAvmr5dxOLm9p/8HMItahMifPd1o4
 ZGP4M1GgJe3gROpnICK1vGqM4vhATj1A7n+05gPjTVPeU6v1dS1tN6cau74vC71d6XVYPcHIslL
 qDXm/XU/fYaO9COcvBYrRFV8L9+ohtq1OnhXbHgefMwkvf7aYU0LLvUbkG0+Fx7888Kj/VVCumZ
 mTJFMx4y6zdLYecLkhkBnHBj5bydw9Bb+D7xxe2i6Sd+NE5KBLG9sYP81t+Ov/ZniXdUT19Br3u
 03JX8GWoExSvh7z/qvlmfidSV
X-Received: by 2002:a17:902:ef44:b0:2a0:9ecc:694a with SMTP id
 d9443c01a7336-2a599e34930mr17811745ad.37.1768373066375; 
 Tue, 13 Jan 2026 22:44:26 -0800 (PST)
X-Received: by 2002:a17:902:ef44:b0:2a0:9ecc:694a with SMTP id
 d9443c01a7336-2a599e34930mr17811555ad.37.1768373065922; 
 Tue, 13 Jan 2026 22:44:25 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2eabsm213542275ad.49.2026.01.13.22.44.25
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 22:44:25 -0800 (PST)
Message-ID: <17fe3a3f-81ad-4413-8a89-e8e9a507d981@canonical.com>
Date: Tue, 13 Jan 2026 22:44:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <f3721413-a4ee-4efc-8bbb-60c19d8d5acf@163.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <f3721413-a4ee-4efc-8bbb-60c19d8d5acf@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [ISSUE]Does apparmor support the port limit for app
 please?
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

On 1/13/26 21:10, Fei Shao wrote:
> Hi all,
> I write a profile for nginx like below:
> ---------------------------------------------
> profile /usr/sbin/nginx {
>    include <abstractions/base>
> 
> 
>    capability net_bind_service,
>    capability setuid,
>    capability setgid,
> 
>    capability dac_read_search,
> 
> 
>    network inet tcp port=80,   #<==this line
>    /usr/sbin/nginx mrix,
> /etc/nginx/** r,
> /var/log/nginx/** rw,
> }
> ---------------------------------------------
> 
> if put the "network inet tcp port=80" in usr.sbin.nginx file, the aa-enforce return is :
> 
> ---------------------------------------------
> sudo aa-enforce usr.sbin.nginx
> ERROR: Invalid or unknown keywords in 'network  inet tcp port=80
> ---------------------------------------------
> 
> so I have an issue about this, does apparmor support the port limit for app please?
> 

it will depend on the version of apparmor you have, and the kernel. ATM the port
limitation is not in the upstream kernel.

In userspace you need a 4.1.x or newer userspace. You can get that info from packaging
or running the command apparmor_parser -V. You will also need a kernel with the out of
tree networking patch that has been in dev.

Ubuntu is carrying the patch that allows this in their kernel. There needs to be another
round of revision on the it, and the new version needs to be posted for review. this will
not happen in time for the 6.20 kernel, but there is a chance it could happen for the 6.21
kernel.

> 
> Thanks
> 
> Fei Shao
> 
> 


