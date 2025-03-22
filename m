Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B4A6CA50
	for <lists+apparmor@lfdr.de>; Sat, 22 Mar 2025 14:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tvyss-0001F5-76; Sat, 22 Mar 2025 13:27:30 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vindrg@gmail.com>) id 1tvysq-0001Ev-La
 for apparmor@lists.ubuntu.com; Sat, 22 Mar 2025 13:27:28 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30c416cdcc0so30681471fa.2
 for <apparmor@lists.ubuntu.com>; Sat, 22 Mar 2025 06:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742650047; x=1743254847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BA5M5AcdS9+s7vOX4m/afzkJ3GECSnvanmgb9syFNS4=;
 b=ZV1e4uP2i3vmUutAq8+3sNXQ08XS28OqZ0Kv3pk0I1ioXjxlq+v5O7qu4yp1CEc0a0
 +3aia7I5Ap/N/qkB+gUZuaWLuosqhK0o2+04mk4m9bKpuUsufggsm4C/utEErcba9zHA
 n9GaR+FCeOvKVKjBz70x93ydcd1L/nsFoQ3zpyA24wV4tyX/Je1NqGBGhVdhuzQfIFWx
 JcgbzQElKzN1lgVyOajqho+sA9suDbNuB2Q9O47oWBgTJ7r48t4xciAd4+mZZzP7TyDc
 sdxs8++EYZmVDMtB3+XZEomWdq321gN9abbReVvp5IdawNzoRpPe4UMaofLKXGcHfsLe
 G6SQ==
X-Gm-Message-State: AOJu0YxJnhyrTWvxzjuqidiBbdaUtm4pxYu+aJs7O664ZOeKNF78wmqv
 v7CBKPTp6cV/O1q4PXW0N2SdsZ5gvV2UtKvvPSzSNgf4XmnBJCqetd+WV9lM
X-Gm-Gg: ASbGncuHRu44mfCj6KkO/IZHVesKwiS3li6PKd++TW2vvFKV2MmowX4kBCHk3rK21ea
 gPH4OzgiYSmJwrOX+ANkMbxbsJ8HB6JM15akDyNagsfYZK+J4Hu8kVgCUYcNyO4hCNVnLqm6ex8
 L5lBh6/W/KD7iA5nyPJTj/G6vC4fyx2FPeGeh3DhlaaIZD5bkReIPzK0ATN5KhxgMYpsIYru/MO
 ClAGkEO0tV8t1ptLw5tOy/Yn+P+OUmTyowIhL1/rNqI3cuZySdUNZr/fyHipY7WWzk+YTLIJz50
 2ZdiUdI9KrhVxfQNn45MqudhQqrQMmqUJTBhcmgfCyPbqHC5tcL9IAU46VRDwY/1
X-Google-Smtp-Source: AGHT+IGrrF6GOAgsQjD2pnN8ufGPXnNiIQd40IRhHf6USi0gSAzCCHnU26TpYdiGx6Z2185H+eGRIA==
X-Received: by 2002:a05:651c:b0d:b0:30b:c569:4689 with SMTP id
 38308e7fff4ca-30d7e2a7695mr24053241fa.27.1742650047361; 
 Sat, 22 Mar 2025 06:27:27 -0700 (PDT)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d8f4124sm5942961fa.70.2025.03.22.06.27.26
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Mar 2025 06:27:26 -0700 (PDT)
Message-ID: <fc4f9e72-0df3-443a-b4f0-de711b689144@gmail.com>
Date: Sat, 22 Mar 2025 15:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
 <87h63oosud.fsf@manticora>
 <d3dbc46d-3c92-4e80-9936-50ea81b5a15d@canonical.com>
Content-Language: en-US
From: Vincas Dargis <vindrg@gmail.com>
In-Reply-To: <d3dbc46d-3c92-4e80-9936-50ea81b5a15d@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.170; envelope-from=vindrg@gmail.com;
 helo=mail-lj1-f170.google.com
Subject: Re: [apparmor] AppArmor version for upcoming Debian 13 (Trixie)
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

On 2025-03-21 06:51, John Johansen wrote:
> Good, while we know of a few outstanding issues, I think we have closed all
> the blockers. So now its just a matter of deciding when to do a release.

Sorry for chiming in, but could someone comment on this bug report: https://gitlab.com/apparmor/apparmor/-/issues/493

It seems like important issue, which would be nice to have fixed for next Debian Stable.

Thanks.

