Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E97840B82
	for <lists+apparmor@lfdr.de>; Mon, 29 Jan 2024 17:31:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rUUY0-0003uL-Fw; Mon, 29 Jan 2024 16:31:48 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sergio.costas@canonical.com>)
 id 1rUUXv-0003tz-0I
 for apparmor@lists.ubuntu.com; Mon, 29 Jan 2024 16:31:43 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7CC383F878
 for <apparmor@lists.ubuntu.com>; Mon, 29 Jan 2024 16:31:42 +0000 (UTC)
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-51110896b51so925065e87.1
 for <apparmor@lists.ubuntu.com>; Mon, 29 Jan 2024 08:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706545901; x=1707150701;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rkPEyMTOQS5pfyEU2zqPASJHoaC677jzDF7TiSwKTcU=;
 b=iAFK7O8b5qbgi99Dnm8J/QpHRacrpSoFY9F57WyfXP5RCMQS7plgi/7fMUWnH0lZiN
 tQVSM1K7BI2FfD7d5gWFPU8Ctd2m47xB6eo09Rzew4ikAZHTB/PNE2k4g95fCcU/3Hqx
 ofjJfxoLdXmdKeNs1lSbIEMHKdRy5dKzk7ai+oQDBItkPErpNF51xqozQmubz0PtTcb3
 3ofoLK7kFNJt3iYmmvCpoYoygPZgBqA+Y+zmwHI+hYRXzU9avCfNDQA15AEb8hqUrOYM
 WE0ErNevhc/h18o45QgzGp1jScdDeG+Yw69MTPJE/Cxx03SDEKf1Lj4srw/z12glCgMu
 TgAg==
X-Gm-Message-State: AOJu0YwZVYbCBVxidoalRkvFjmFBjevvo7FTfAJZpbLNdZQ4nIb+/ADi
 1sUqZDz3pv72LZKucqQ7b/6tu8e4Kr/yr2imnKNIgcTaKWy2wFm10qt7GdjqbQwJ7lvpj6AICIJ
 1UgiTimZ8cTD09VqO7selNO/kPHXaIbGsrMkiG0Ax9H9aODZgZbUuOO8KjD/D8KLdEVcBYo3apq
 Pya5BvDg==
X-Received: by 2002:a05:6512:61:b0:510:3c1:52dc with SMTP id
 i1-20020a056512006100b0051003c152dcmr4045960lfo.69.1706545901724; 
 Mon, 29 Jan 2024 08:31:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1fsjyTdR8dHWtZfZ0nkrp3fcDkIb8tYS93bzRSpLyljn+GejZoTzqCD8AJftL3WJiasE9GA==
X-Received: by 2002:a05:6512:61:b0:510:3c1:52dc with SMTP id
 i1-20020a056512006100b0051003c152dcmr4045951lfo.69.1706545901326; 
 Mon, 29 Jan 2024 08:31:41 -0800 (PST)
Received: from [192.168.0.34] (138.red-83-37-113.dynamicip.rima-tde.net.
 [83.37.113.138]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b0040efc446d80sm723262wmq.40.2024.01.29.08.31.40
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:31:41 -0800 (PST)
Message-ID: <d5ffa21c-c3ca-4b34-9402-9437e64488ad@canonical.com>
Date: Mon, 29 Jan 2024 17:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: Sergio Costas Rodriguez <sergio.costas@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] ENOPROTOOPT error when calling aa_getpeercon()
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

Hi all,

I'm using aa_getpeercon() to get info about a socket, but in some 
kernels with odd apparmor configurations it returns ENOPROTOOPT. But the 
manpage doesn't list that error in the possible errors of this call. 
Under which circumstances can that error be returned?

Thanks.


