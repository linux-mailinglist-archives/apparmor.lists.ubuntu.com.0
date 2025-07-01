Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB8AEF2CB
	for <lists+apparmor@lfdr.de>; Tue,  1 Jul 2025 11:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uWX0y-0003I9-2N; Tue, 01 Jul 2025 09:10:56 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uWX0w-0003Hy-A3
 for apparmor@lists.ubuntu.com; Tue, 01 Jul 2025 09:10:54 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D57E63F6B4
 for <apparmor@lists.ubuntu.com>; Tue,  1 Jul 2025 09:10:53 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-606ee65164fso5676466a12.1
 for <apparmor@lists.ubuntu.com>; Tue, 01 Jul 2025 02:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361051; x=1751965851;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzQqF0J/ul9TxEtjjmA9x9umVEbue93hGArsOir7XgI=;
 b=jGGldli4v+wynVGtBrqbatbQKLSb+X2wU3zysDvX6fSSnKiEZdGesP9/57KcqHRb3w
 IgzxFssRiXZ6+OpbRxae9lT6+z+dUj57JuGsNP4CNd4ieftv/rvQ7ZawmrwlLamekDgQ
 7icv4z7GmLExwu5po5EVeDEFYiSunIppXk3erlWeeYF/o3Uh2C2QB3i8VLJ3UiAe/QhE
 h/yixCfOuN6GANEEHFsmGr8hT7gacxEKACt6x3eoO/r0AMKqPiQvTLGUl0kyPOhdXEd0
 TzTuO3mDJUEVr/oTAOq5aKC/UriNv3YidX/cCvdlpwMuiCKQjWIoPOLRPKVJQBfbXohF
 GAcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV10+s6elu7uEBE6VQxIkgemydXm4Df1toFh22y26AdwQhjQt0NSS3Jm2HiCDOIyyLAWBYtP+unPA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx+uGLqL6F5eEJGlfIXdhHgEg4GXo75lN1n3FW1OIOgI4OD6AE7
 d6Hw4oIaI+3TQ3MIpohqa1M5lI79gPPV2Wfeb8B2DdpSnsPCt2lTk8YEVYKJnn0G7Hv7YukFbBB
 ZaqUArbsyZ0jfmLT2xxcYxKMOhmXFXKDFB6W1tzeRhvZh2W+gLUyrthpP+ovfV+gNwLq2irvdQI
 Pa0A==
X-Gm-Gg: ASbGnctVL65X70F03gmK1HdHZjs7dn4X8DPjs8Lxa/NsO4Ioj4+KdpTWM0mqEjZMbBP
 WD5xUt+9ZkSgHyIqLg3B8NzHWhaz4goa1BfMl3r5avUIo2aruHyAqZDaIy23n1nLpxEXbRoMnuR
 6LfbDI4DuKZB8ECtX2o4R5T1bXGFtQORgGO/3u9vrAurwijNPee8nM6tIB8btpOfwBgw6YEWret
 zeZsfaXDI9kWe07thkZgDomwdG7ZTLr/vtyQ+YEuaXbQiZTrZHoxtwp1zfFrkARco0A/kKhMSRz
 s7ahnjUDlCcUHq8KNaLu7zJWPhDUgbDKKOcsBGYnh2Cs6M2q6mh/g32EgNsI02Nrl6Kj1Xe3rBb
 VAQ==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id
 ffacd0b85a97d-3a8fdb2ae51mr14169008f8f.3.1751361038383; 
 Tue, 01 Jul 2025 02:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Wa9pcB2UUm59Z4GOCv082ua6JPrrZMxVXb+S8tPsIyn/l8uZo0KZb8KgbdGHQMaVoSmCBg==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id
 ffacd0b85a97d-3a8fdb2ae51mr14168505f8f.3.1751361037764; 
 Tue, 01 Jul 2025 02:10:37 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274?
 ([2001:861:3280:410:2ef0:5dff:fe60:6274])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7481sm12850160f8f.14.2025.07.01.02.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 02:10:37 -0700 (PDT)
Message-ID: <36d50ab2-ef5a-4440-b6c5-ec324afa9260@canonical.com>
Date: Tue, 1 Jul 2025 11:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-security-module@vger.kernel.org
References: <20250624143211.436045-1-maxime.belair@canonical.com>
 <20250624143211.436045-4-maxime.belair@canonical.com>
 <5313b937-304a-4f2a-8563-3ad1ea194cb9@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <5313b937-304a-4f2a-8563-3ad1ea194cb9@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v3 3/3] AppArmor: add support for
 lsm_config_self_policy and lsm_config_system_policy
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 6/25/25 03:21, Tetsuo Handa wrote:
> Huge memory leak.
> Here too. :-)
Nice catch, this is fixed in the next iteration.

