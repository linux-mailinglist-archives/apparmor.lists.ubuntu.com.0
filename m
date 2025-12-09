Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65BCAEDBC
	for <lists+apparmor@lfdr.de>; Tue, 09 Dec 2025 05:22:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vSpFD-00015J-7X; Tue, 09 Dec 2025 04:22:35 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vSpF9-00014u-4x
 for apparmor@lists.ubuntu.com; Tue, 09 Dec 2025 04:22:31 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 671F63F323
 for <apparmor@lists.ubuntu.com>; Tue,  9 Dec 2025 04:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1765254149;
 bh=jvafHzXRPUmrNizKatC1kt/Vv2WRs307DxCc2nFCER8=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=PJGoOSH2UHHM+v9zCKscHwAU41JelAtBWty8wUbwGlceUqoNdoB/uiMdp1OkluFK9
 u3mVtM11sk55BbM3Xa1ZwwGuspFmsOrNiPYKGIVywq/AQScPgF+ofu8GL9MCRV1lUD
 BH8SQFcE+ptRrHHJ/GZJKvN3ndi/hHrlwtzSsekAd7ac4zoniAb+yKEa6qjlRtGYCD
 8IEvXeKswPqz6K1quwvsvefqhe3GBZcNC2ZOUj5D+twJIK9Hs9YJ1NlilkPrCONGhy
 uagJA3PWDpsFF0G6rAR9YacX6wycOzp/3wKIwXDdM81r8KxdBsIxC3WOTpvwPwf6+3
 l33fUuK+ilSLNJK1UnPczNKLBQEhTmSEIAaZ4fDdONZSjWhps3UDRPt4Sis3XnnAOw
 7Hoz2U7VlF8NzTHswG5gKNOLAIWWgAjiC6BqnHFnVdxBjJ76no64/akXWe7SG/7NE7
 K1q719DPdrNdX/yxHI2du2Yt32kGKvOJ5HLcMKQBQABjalTk+P0JLo7tRaybaU+Cl3
 41XBL9EKE/5Yc0j5im90W4xRqNJk7vV5C6clVnkzaM/zpv5NI5P6M90amWaYMbPufq
 pYC+23YOoepb+a7DUwSqjwC5kNS42L6rBShr2QJjH1bMzRdLwCy5hi1bYX2ezHbzGk
 V/9A315pnBA+dpdR2axs/Kk4=
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bc240cdb249so5166894a12.3
 for <apparmor@lists.ubuntu.com>; Mon, 08 Dec 2025 20:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254148; x=1765858948;
 h=content-transfer-encoding:organization:autocrypt:content-language
 :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvafHzXRPUmrNizKatC1kt/Vv2WRs307DxCc2nFCER8=;
 b=SyIoQmryRBp6g+0/rKDkGvaniKuLD2mpN4Ki7iCSxqCKCPwCComRDHPzFuKNVAvodC
 AkcEOgUOn9dVXb5KecB0u+PewTZOe4f+E9kmokOXGVUjv44qqnMafJRAv4xPIIDsWtKH
 BL5X1bcZiPlfCz9FoUNloffDELxBoRi0ZjH8JJuc3P8fikbCU4jSnFrdMziXw47gBuGg
 t1GAiqGuOE4oZVjciE+M7eYLsVXNHMtQntrW73AGX6S8STYdxqQccF1pEoG4Iyzi01sH
 JHOdkwflTl/YZhsnscuSYv8RBaBntRrzxGVVqnJ0EK5b1zm7KMV1guuF6JB8r6LuX+Nf
 OBAg==
X-Gm-Message-State: AOJu0Yz59NrNfmKus9wGQ0oHytQBA8Uq1YsTcUkb3rtqrTzXNpJjajKB
 KRImi5ugH3qH9AiV/+QfNooqaQhFZEqjWCBKqnL4VJTfRzxevxE7RvRYfEtWJ61yJ8+GYKsJk6n
 MiIrZikYZo77IJvTfiUNYjzXIi35J/xrmh03OqDGcSp0fR42+DRGMpv39tcbHJnuuZAYcoM2wvu
 gq+BdfQZrowg==
X-Gm-Gg: ASbGncsSHpCdQjrQPudObsIqMhmF0kTQ2WtiR+NrpOiej3eoxn5qtlG463evZtCiVTS
 d2miCtDz0ps8vZlB1xFWkz6Lzv6i6DfIAVOHBWEz1yDnN8isk60UWX2hPcO0/V3T1bRxS/CryWK
 o8NALxks0N0dSAffu4a/FKX+JeEXWvsz3QYx7rswZ/qIKAgti8X90J4n/I/qDkzHKGLV/sbbj6y
 Z0yzMGwYowaaQ7Gk+d/GvSI53UJ8RT+Ur3ywKk/NRd9QZNQzaTGegMR3S+4byi9Py7ZYP79hUDF
 DBKRwIK8X+5dDAuwtVNgKa/nXx8o4i2AzPCpFr8VMXS0sE5JwDfqcpqZFl/XSp4T/kpX1nXlwO0
 xyRqWfJiq+1bRwxY/WSfq4gUH
X-Received: by 2002:a17:902:ce90:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-29df632948dmr81671975ad.51.1765254147944; 
 Mon, 08 Dec 2025 20:22:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS0srmvJy07nATsRkr5m8GW3T23SbYiYGTejBp42M+sRLQOS83MFpW8tpoSmBre6Uw+y97EA==
X-Received: by 2002:a17:902:ce90:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-29df632948dmr81671765ad.51.1765254147433; 
 Mon, 08 Dec 2025 20:22:27 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29e4f15accfsm42175615ad.35.2025.12.08.20.22.26
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 20:22:26 -0800 (PST)
Message-ID: <d79f4f2f-7630-4651-99f7-e5c49654694e@canonical.com>
Date: Mon, 8 Dec 2025 20:22:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor Dec 9 IRC meeting on irc.oftc.net
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

The next monthly irc meeting is scheduled for Tuesday Dec 9, @18:00 UTC in #apparmor on irc.oftc.net


