Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H/6DxtBumnMTQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:07:23 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAEB2B632A
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:07:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2k3o-00062z-9V; Wed, 18 Mar 2026 06:07:16 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2k3l-00062G-Od
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:07:13 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 921A13F2B3
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773814033;
 bh=Y9C0ll41pLo/w/XkMY5Phe0CSgY+/kCNKWKcRvEfNTg=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=S7ab/ibRRlys+mC99G2t79ADx1uHqiANI+H3Jo+QX4virQ+e06QazYVycpFLL65Hq
 s5pWyRq4b90c7B6RbTgLhMnNluqaJ1WfZkbbBR1AQ1yy2dOcksPgKm5Ik1gfQzmf+U
 C/dkJFJdMAOAUW8L3qVkz5wug3XGh+hfZdPXcStzgP13VE6+C53+9TZ/s3KruuVp/N
 VUk5b6+GA5/nGQz0kVXkED5Ga0CmMGe4/xfZHbx1SVe4nDsMsSwgzWDnjX1BqgUPQN
 7XGzgzsn68Up4FGEDXQevWJFJLuNurLDdvlmvMPt5nTINchdtI6J6vvsdCPNyJy/F4
 T0lO+c/6SKdBHW2HSzzWhTuhL58/U7BE7dUYGUjqyNfEvNRnk/+vm1W6MZCllE0arW
 GhD4CP44kTQ4xFdDdAFsQVwy428ceDtEmX/kE03fG9xx83dbN709RRdKDWWy4j/tKU
 ZYvOowoq7dJ5rGzMaqRagtFdKpurU3Qr4i9ohgN/6xgIReIUx4NF4DJn/wzLU90BsR
 UrzwpEV8xXElaKhn4w+xcSO0XPoKudi/9mDKcz8FeVqAoDeJ1tmo0QDuiVWow58Lea
 qgjjtvLj8PhthDDoIBpUdZ6Nri5PT/KrBOIwiBGayZe4ybUwjDwwIsrELTZCXajW17
 VYG0k2tRLlilHtaEWYlNr8AA=
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-82a71ea4127so791264b3a.2
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773814032; x=1774418832;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9C0ll41pLo/w/XkMY5Phe0CSgY+/kCNKWKcRvEfNTg=;
 b=IfnqCWhSfpVXO1Ml5fk9OvF7ZCJZ3RcjkZPxIQNGc7MVnQd3M6uAVHpouRHK/dxK2L
 x2Dk55kjzbZb15WW3dhJDTlERvgIG4SGktd0fyaL8JbnVnKubhuMybYQKY2rQ3k1KozH
 2lhCUaecvscY/6He8f5GLsvjZO+iD2E/cUJvmNH2wWrVU8X9pTqbXUs1+z2EKrgVmfUf
 DihwmKZXCOay8okuLDuqWiRgb1EXDW4pC1rm6gpsxhL0/ztZlCXyxExUMobvwwxaHmxW
 5Dgfu+sv/Ya4AtiY1gAf5Rd+biELN3aD7iZLKrH/jr4xjkr57jHqf2SM5e7rmpSHidM3
 pRNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXFetl9YI3XuRyWvNUjJlR0pvNy4dcdnUmNuNp+7Dhlj+zLCGWg1J/nY7h77PV4RPR1r2QafljBA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyaMi7+xmwgqnV0SJ7TaDUdsr7vHcaXbTZcAiCuiA2iGzfwKjJb
 tzYWZPciubRlPRsUJUX3vgVSrThNQM/6yb4CSdw/mK+Re3OGdk9ShOzI88jWE35fsTDun5w3cmq
 R/x3ry1vWZN7ZIqnw8//o52naiS5s//Ze/G8VCnBQ8WIelerP6WjRp/fUH70KOkBW1elTq+hVh6
 gZN8KS5co+Rw==
X-Gm-Gg: ATEYQzz34BMPaG8zV7iwpCxoHCqBDnri4+0DyP2a3YBmhfu+G0itqSpTvM6H/GyyjoP
 BK3dQZizN9eAv45zpRLHu9OaCT8LjxcoRTkeCdHSPUtdelQQ91MyG6u/NSDJKsjbkbrxnAlsZ60
 OjrldM0W3U0xaSKwfZ0lE9AwNJMwKOFEqA7V+/dfQeFF5fZogS84vYMUez7uljKJjkVRvPYCIEj
 kJzNTPVgsMIqGqzogoLnPMeYp2pqZFPyMyMk0/bGtio3ntIONbm62RcwBPDRzUzhhs/JgUFCLCw
 BodfyRU9wTw6LyOEVGfLuzN/1r5MhE9eUpvwcz2HD1Ef7ZmKHJAT0viqNb09vIoq1fiag86RtJG
 yzfnXdQs396t4pdigIovUyvkaHKHdS/mN/vi90w==
X-Received: by 2002:aa7:88d4:0:b0:82a:6967:a06d with SMTP id
 d2e1a72fcca58-82a6af2da84mr2037732b3a.57.1773814032268; 
 Tue, 17 Mar 2026 23:07:12 -0700 (PDT)
X-Received: by 2002:aa7:88d4:0:b0:82a:6967:a06d with SMTP id
 d2e1a72fcca58-82a6af2da84mr2037712b3a.57.1773814031889; 
 Tue, 17 Mar 2026 23:07:11 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6bf0cf5fsm1648868b3a.61.2026.03.17.23.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:07:11 -0700 (PDT)
Message-ID: <a07056c3-cfb1-4b6c-809b-c445cd83ec59@canonical.com>
Date: Tue, 17 Mar 2026 23:07:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260212211604.396098-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260212211604.396098-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix net.h and policy.h circular
	include pattern
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.lee@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email,canonical.com:mid];
	NEURAL_HAM(-0.00)[-0.988];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[canonical.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: DDAEB2B632A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/12/26 13:16, Ryan Lee wrote:
> While the #ifdef guards prevent the circular include from blowing up,
> policy.h does not actually need anything from net.h. Remove, that include
> and instead include net.h in the other files that need it.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into apparmor-next but dropped the out of tree portion
of the patch

> ---
>   security/apparmor/af_inet.c        | 2 +-
>   security/apparmor/af_unix.c        | 1 +
>   security/apparmor/apparmorfs.c     | 1 +
>   security/apparmor/include/policy.h | 1 -
>   security/apparmor/policy.c         | 1 +
>   security/apparmor/policy_unpack.c  | 1 +
>   6 files changed, 5 insertions(+), 2 deletions(-)
> 
> This patch applies cleanly to the Ubuntu 6.17 kernel.
> 
> diff --git a/security/apparmor/af_inet.c b/security/apparmor/af_inet.c
> index 5255595a6876..c30a14bd7822 100644
> --- a/security/apparmor/af_inet.c
> +++ b/security/apparmor/af_inet.c
> @@ -18,7 +18,7 @@
>   #include "include/apparmor.h"
>   #include "include/file.h"
>   #include "include/label.h"
> -#include "include/path.h"
> +#include "include/net.h"
>   #include "include/policy.h"
>   #include "include/cred.h"
>   
> diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
> index f8f7d17a61ca..543f18121be3 100644
> --- a/security/apparmor/af_unix.c
> +++ b/security/apparmor/af_unix.c
> @@ -20,6 +20,7 @@
>   #include "include/apparmor.h"
>   #include "include/file.h"
>   #include "include/label.h"
> +#include "include/net.h"
>   #include "include/path.h"
>   #include "include/policy.h"
>   #include "include/cred.h"
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 6b18775705f9..2253f4b7fd48 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -33,6 +33,7 @@
>   #include "include/crypto.h"
>   #include "include/ipc.h"
>   #include "include/label.h"
> +#include "include/net.h"
>   #include "include/policy.h"
>   #include "include/policy_ns.h"
>   #include "include/resource.h"
> diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
> index e3cf1a03f79d..855657b3d2b9 100644
> --- a/security/apparmor/include/policy.h
> +++ b/security/apparmor/include/policy.h
> @@ -26,7 +26,6 @@
>   #include "file.h"
>   #include "lib.h"
>   #include "label.h"
> -#include "net.h"
>   #include "perms.h"
>   #include "resource.h"
>   
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 7fa346000aa9..9ae858a203bc 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -81,6 +81,7 @@
>   #include "include/file.h"
>   #include "include/ipc.h"
>   #include "include/match.h"
> +#include "include/net.h"
>   #include "include/path.h"
>   #include "include/policy.h"
>   #include "include/policy_ns.h"
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 74cdfdd43d7e..7d4dd17a97be 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -25,6 +25,7 @@
>   #include "include/crypto.h"
>   #include "include/file.h"
>   #include "include/match.h"
> +#include "include/net.h"
>   #include "include/path.h"
>   #include "include/policy.h"
>   #include "include/policy_unpack.h"


