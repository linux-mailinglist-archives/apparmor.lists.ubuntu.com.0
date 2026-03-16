Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEbOFXGtt2nkUAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 08:12:49 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670B295788
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 08:12:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w227w-0001mf-N0; Mon, 16 Mar 2026 07:12:36 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w227u-0001mY-Va
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 07:12:35 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B137A3F2C5
 for <apparmor@lists.ubuntu.com>; Mon, 16 Mar 2026 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773645154;
 bh=q8oFm9ZgKJ1ZrScYK3Qonh6WR/Y6yY6WioJKe5tR8jA=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=dtVo1yEEYHQOe8lbTLj+dFgdkKSohxHpCVVwcaCZ+nqsDkkHkStnZ6XG30bAc/zjP
 zep/nSUgxG6WLKjkvsGPPhShgb0974HK50E8snT8jDJqdcvoLUoENmKm6KSb686n7e
 k8SLchEc/qDWv9w7ukJUNTqyEGrN29TYdH/oyyji55q/YDNcmHNSH3s3BIW97UcH6b
 FNwE73v5qCVS7JO9VHAcFZNtjvEx42OQR6uq9hjKkEUl3XBoE+hVliDF0yAFp9nFVB
 HrZylaY3lQhUPqwswEwouabQ/eB5sC7IHVN55lih2KRgE6PmVjcf+yosNnGmcgBb/0
 NHSE3kHl7wXUm3Tb7VcDIvyvu7e9jwc4Ippc5iPOZA+kdJrlGvbUdFbVf5XpqqMEJ1
 cMTQmO03fH0WlaMsVvoFTjwXxNaSV16QcvWCYCmAE8xO8wqgjbFuK1DViS8bTc00UT
 /6dbJ8tPzjdYD+TDFbVSu/NRB5VbmTLNrv6sRNP45RGpG8AFiXh2ramcPyhOFia6Pz
 feB3q2Mc1PBZkfe1cQm3ck8Q7XLCeSn7rOqOaukpLdOIktWotLKU7R1tSEQrUJVEcf
 /mRE4cHWEqSiigkQuQ/6rlxZEBsCQktbjn5spd48a/90im9KoTTbnAOD2XQGQGVTdq
 n53vuEYLrKtfmwgX0JxXeorU=
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae57228f64so50205795ad.0
 for <apparmor@lists.ubuntu.com>; Mon, 16 Mar 2026 00:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773645153; x=1774249953;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8oFm9ZgKJ1ZrScYK3Qonh6WR/Y6yY6WioJKe5tR8jA=;
 b=n7rLv8pwV/idig21wsVzSQR6ywH9qPH9b5mfVfJcnlQ9C0teTMds34cILJYGqILCMP
 XjrKrUosCs10cYM6P2btcr9vFLmtFtKVLYlv6P2kN9viz7BC5cQ2NZ0zJpCOu9Jqi3vy
 jHYymIpCX0b/CrbwOHNex8rVk5iWHuvILpIYCbhnUlu6Asvol51HbZqWmcPudyg1VhIO
 dGw3thY6hOXsyhLilZxyz0mb9sVxAE2/Z+L9K0Bwk/U20jXIpmGgiSbge74fzCNoch6Q
 dEj3DAYpIYKoDrgfG9+llRiKK8mm5i95UbAgNg9yoSJlMJRK3P0MVuu0zJz7o/X8v3si
 rNgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVECPN5RDFx4NgJl2XTtKeJbtmwx5sjNTFQ4kZtWXPzfim69LXvNT9xQGaYmF+c074l+BCXYbt9IA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwlFkhSRfStqv4YMq4f2+/GcelievhytFrbGCPv5L4bz9Nb9n5z
 0zXePzB8oJTr2d6ypUB12X2FV0JqbSgNKGIIdoTG3uFrg49YSeUn+7apxFIclEjajeWXn4I3Cyn
 YOyCwq9p4x5V2ZFGtddarhQUV+kzlpjMOKkYsN98/BH3SOWQzyxzfUbrWAxkrQkUSEfEaBMgJsR
 7/gA==
X-Gm-Gg: ATEYQzwbTjJa5OvSTXhP9h9Xbe5fFy3PkHE9US5ZhkjXcOTXmWVTeZ5C8reh4Ofj4mB
 QcnD684PS2M2rhgZPA+NOMb9L5iQ87pIgHk8vg5TgMoVYeVcXPMKMbnDxvg9IDQNvmlz0aLN1UJ
 OhLxLvYKZh9QXCJc4xnKtrlKFvsBNW0C+d5BrvnySRsqEN3FP98QiI60TtDKaOjJGxq5Voq5YF8
 9vpZEnGNP+o6OoTmQyI0m/gU5PngG6PHlAVrLlCXsh6P7RNw/Srbzppgi+4yYVAlD37zjj+rutn
 bejcxuG56op9GdLKOEp1ZLAjwcrB9ubyaqMuPhHDf0bXpnYmycUD7lgtvqTI7Mc+gtwCNUYRKEQ
 Mq1OjSMDFAs8NI0srPlWrGLhb58h+2QNoRVpteA==
X-Received: by 2002:a17:903:2282:b0:2b0:4c89:7b3a with SMTP id
 d9443c01a7336-2b04c897db5mr51936725ad.47.1773645153183; 
 Mon, 16 Mar 2026 00:12:33 -0700 (PDT)
X-Received: by 2002:a17:903:2282:b0:2b0:4c89:7b3a with SMTP id
 d9443c01a7336-2b04c897db5mr51936495ad.47.1773645152702; 
 Mon, 16 Mar 2026 00:12:32 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2aece7edd14sm126374665ad.50.2026.03.16.00.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 00:12:32 -0700 (PDT)
Message-ID: <ef568d19-30b5-4373-9c65-b4597ff77a27@canonical.com>
Date: Mon, 16 Mar 2026 00:12:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sang-Hoon Choi <csh0052@gmail.com>, apparmor@lists.ubuntu.com
References: <CAO=c-5qhqocQpC3uWDp97E3ObjXiRFhjrS9fSqQVwR0_H6cZeg@mail.gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <CAO=c-5qhqocQpC3uWDp97E3ObjXiRFhjrS9fSqQVwR0_H6cZeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] AppArmor io_uring: uring_sqpoll implemented but
 uring_cmd is missing
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
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:csh0052@gmail.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,lists.ubuntu.com];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 2670B295788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 22:48, Sang-Hoon Choi wrote:
> Hi John,
> 
> I noticed that AppArmor implements two of the three io_uring LSM
> hooks but not the third:
> 
>    security_uring_sqpoll       -> apparmor_uring_sqpoll       (implemented)
>    security_uring_override_creds -> apparmor_uring_override_creds
> (implemented)
>    security_uring_cmd          -> (not implemented)
> 
> SELinux implements all three, including uring_cmd (selinux_uring_cmd,
> added August 2022).
> 
correct

> The missing uring_cmd hook means that URING_CMD operations (used by
> ublk, NVMe passthrough, and the upcoming fuse-io-uring) are not
> mediated by AppArmor. On Ubuntu/Debian systems, these operations go
> through with no LSM check at all.
> 
sadly yes

> I ran into this while testing ublk in container environments. A
> privileged container can create block devices via URING_CMD on
> /dev/ublk-control, and AppArmor profiles that restrict device access
> do not cover URING_CMD operations on already-open file descriptors.
> 
correct

> For context, I previously discussed the SQPOLL credential caching
> behavior with Jens Axboe, who confirmed it is by design and pointed
> to the LSM hooks as the correct enforcement point. Since AppArmor
yeah, I am not fond of the credential caching behavior

> already handles sqpoll and credential override, adding uring_cmd
> seems like a natural extension.
> 
yes, it is coming, it is just a matter of dev time.

> Is there a reason uring_cmd was left out when the other two hooks
> were added, or is this just something that hasn't been gotten to yet?
> 

the initial implementation ran into problems with uring_cmd, so
instead of delaying all uring mediation, it was split from sqpoll
and override_creds.

> I am writing a paper analyzing ublk security in containers and want
> to accurately describe AppArmor's coverage. Any information about
> plans for uring_cmd support would help me get the paper right.
> 

yes. Support for uring_cmd is coming as well as uring_allowed. The
issue really is just developer time. Landing new mediation requires
not only the mediation, but also tests, and tooling etc.

There is a lot happening in apparmor atm, with a lot of competing
priorities. The single biggest push atm, has been to fix bugs,
and performance issues, and dramatically expand the CI. This will
put us in a better place to ensure we aren't causing regressions
as we land new mediation.

And there is a bunch of improvements to mediation coming,
including better uring, network, namespace, task, rlimits, object
delegation, identify delegation, and more.








> Thanks.
> 
> Best regards
> Sang-Hoon Choi
> 


