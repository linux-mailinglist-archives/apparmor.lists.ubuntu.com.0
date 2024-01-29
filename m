Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594F840FEF
	for <lists+apparmor@lfdr.de>; Mon, 29 Jan 2024 18:26:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rUVOj-0000H3-23; Mon, 29 Jan 2024 17:26:17 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sergio.costas@canonical.com>)
 id 1rUVOe-0000Gt-AE
 for apparmor@lists.ubuntu.com; Mon, 29 Jan 2024 17:26:12 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EEA4B3F15B
 for <apparmor@lists.ubuntu.com>; Mon, 29 Jan 2024 17:26:11 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40efb53adbfso4395125e9.0
 for <apparmor@lists.ubuntu.com>; Mon, 29 Jan 2024 09:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706549171; x=1707153971;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kTBvb8gh53RyyYGH9bBhu+SN7hcemAuxeAZDrW/3Xi8=;
 b=wU5vIcj/MMdelmxGXJ2RmsSUjmFKiJe8EWgzjrualNOhRkjDD77mcpF+fVQzP/GO0n
 R4Aw5FXComvFAF+fzCAy5EhKDl7mrw34FPMGToQ5uyGbXKAE4pX5fPmg6Vw5FRs0mV5/
 wCTt4pwHKKOxx0qpWhOZu5r7YHp01r9RBicHZ/Xh81NIGGwppP+iYEAdMFwDvtw61tY9
 OtclgMNz9H7+l599z3Ok12A++OqvHq61eBYof+SDY/csr7GhJV0OAtT0TUX/TSu9P12o
 Erv6B3CEGhiOrwseR6ffRk8Jc82C9NFiM9rGunrzB5vS3Y1qRN2QR8TW9mEw1K0LI8Qe
 kj0w==
X-Gm-Message-State: AOJu0YxXlCIMDIQFTmH15WVEC5FD5fknwTv3hZIvoTRU2eXqT2wsfzlJ
 4h02F8i+hrJ/ZPpZUhkivAiVBlRKjGd+QWNwyhaiAGVl0ilU6ZXts4hl8tGEf8AS6Wzq+x5UgN/
 V8L7lw2HpiUMdngqGXjPOi7OF7wK4s597xQ2axuHuAKVcQuM0H8YrOZHD8r5TugqnRlBERlQyqT
 x1z9trOg==
X-Received: by 2002:a05:600c:4715:b0:40e:c564:a9ea with SMTP id
 v21-20020a05600c471500b0040ec564a9eamr5766270wmo.20.1706549171751; 
 Mon, 29 Jan 2024 09:26:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrqzPuyc26QbsnyF5EZxgJ49z98ZHsV9qViackebiPQ1Z89z8uM9bvargcXYk4qSPnoJ9htw==
X-Received: by 2002:a05:600c:4715:b0:40e:c564:a9ea with SMTP id
 v21-20020a05600c471500b0040ec564a9eamr5766256wmo.20.1706549171445; 
 Mon, 29 Jan 2024 09:26:11 -0800 (PST)
Received: from [192.168.0.34] (138.red-83-37-113.dynamicip.rima-tde.net.
 [83.37.113.138]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a05600c518700b0040ec6d7420csm14480293wmb.14.2024.01.29.09.26.10
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 09:26:10 -0800 (PST)
Message-ID: <292f48bb-4ec2-45ca-8683-1eda53b0d7a3@canonical.com>
Date: Mon, 29 Jan 2024 18:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor@lists.ubuntu.com
References: <d5ffa21c-c3ca-4b34-9402-9437e64488ad@canonical.com>
 <a992b887-24fd-4f9a-a663-3c8363ecce0c@canonical.com>
From: Sergio Costas Rodriguez <sergio.costas@canonical.com>
In-Reply-To: <a992b887-24fd-4f9a-a663-3c8363ecce0c@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] ENOPROTOOPT error when calling aa_getpeercon()
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

El 29/1/24 a las 17:48, John Johansen escribió:
> On 1/29/24 08:31, Sergio Costas Rodriguez wrote:
>> Hi all,
>>
>> I'm using aa_getpeercon() to get info about a socket, but in some 
>> kernels with odd apparmor configurations it returns ENOPROTOOPT. But 
>> the manpage doesn't list that error in the possible errors of this 
>> call. Under which circumstances can that error be returned?
>>
>
> to use aa_getpeercon() your kernel will need the fine grained unix 
> mediation which hasn't land in upstream kernels yet. So current 
> upstream kernels will return -ENOPROTOOPT because SO_PEERLABEL is not 
> a supported protocol option.
>
> Additionally note that with LSM stacking, with apparmor stacked with 
> another LSM, even if you have the fine grained af_unix mediation, that 
> aa_getpeercon() will either return an error or the wrong LSM info (it 
> will depend on the version aa_getpeercon() that is in use.
>
>
Mmm... does that mean that Ubuntu kernels have that patch included? Do 
you know since which version?

