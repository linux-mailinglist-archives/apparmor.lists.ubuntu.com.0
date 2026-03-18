Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLaaKb1FumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:27:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE92B6531
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:27:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kMy-0001In-LJ; Wed, 18 Mar 2026 06:27:04 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kMw-0001Ie-KZ
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:27:02 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 69B6C3FB75
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815222;
 bh=e9u2utDffeAat3Jdcbazk5JkvgzpuBoSq9gVDsGwVAg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jA6d0fyr9B54X0LbMaWCzVyqztgnXAhaX7dt/MMOw9iDI+jx4EE3YVkAZ7yNHle+4
 nu8sb4gGUPYX8Nnqma0EwKm93Oh4Ht1kSDpYPEZV1Okf275hFMR4R870phBy8KnGAs
 t3fsQeZJGDJ0KoVSNfu7LT1jvc6XhmGk14q2OzXQPy2O6Gn5UReLoWfr4BAiKTMI8L
 8Q89IDd2599K8+re3fGbge7UjyhPgyx0IovUY8jh0iaXdSe+OEgwKMtZPUdOeA/AAJ
 JVZqETSe6s7EzdCTLh+DVTLaqitt/Fgx41hfZM1L2B7fT0P8A5omxbeaNUOfhM6iee
 JKcdwMrZS5xk1kljUYU3kTlxPHyAjXS0rooPfKmSWXAkznoYq4oQ8vAyCx5st6PkZG
 3u+gnr6XgLgdqB85U6i9nBZCPXuQlsfXwtEosODAOtFyg/SpN6ACwuHvir/IIWv+Cg
 lRHYXHiMaphQDNuLwLGS613sh1l1Y9caafS55uDnnJpSeRouULg2bXTXJpMeD9juSF
 trciw5Ltg8Sz0NiM3GBqu7WGhvECXOLrqfNypBSgfaMZbevb6AK25ZSI/XwSG5CbjH
 v60JhFztHpuF2YYR69apKATSG+bBIY9uC/fIojJp5ZR5A9I9cGZGa6VtfQS/54kN/G
 EbVIDyNxDFw8CBVwoapOW9Os=
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2b060c14ccbso152670005ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815221; x=1774420021;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9u2utDffeAat3Jdcbazk5JkvgzpuBoSq9gVDsGwVAg=;
 b=ba3Sy7e9B+R+4gqisxS6S8+nWZxehh73qu1Q9N1ssy8zWZfrEtGEb4k9cBtQXzG8f9
 l/Xa5QnGMH2pnG8ht+Mf/5e2fpevu0gWMBa4RbaPCi21Po/C4dgPAFxNuR14aYj4P1W8
 Ew/ft4V+qxPY0ZRj6bKzu33rx0pWWlznbgsz2sw7YhNfcPgGw3KHDdtCPuYjSfQ+Zix2
 MWnboTvvQk48ReYkOFYoI3lOAFXJEvomsOj3kQbXUJypOlUNQvAMSC0lppIHhfaNtEjm
 dvIyRPtmnCigyKFhr9qADvTq4r4npmi1/Oe8tg02kfWzfyxxG0sxKGk55pkAp+QwbYro
 CPgA==
X-Gm-Message-State: AOJu0YxK1HynpdJ+K07Fcsz1Dj98eycSQAoh/EGxE1wAiZZ6q62pcea4
 HYvxzAR9ohcfRF48DyZ1TZD7CR517lsx7+29cEQsZ5lk2bpPLbPL8FyOeO3C3cKyYE/VPhIm5yx
 shxabKEq1blJioU1agtafQroUSw0z3azKvOoe7P0ZOqLluwsLLjvr9HLZ+EpU2bMc+DGIWZRsg2
 DZrA==
X-Gm-Gg: ATEYQzz2D3+s8Sbh/ocsT8y4HpT9nvOGB55Aivs01sdL2oIJ0hJXNpYvuWKkc4L9QXi
 dK6sFheb0rFtETCvtCxNLMWxanH2z/Yy1v2ryoEud7rkVt0yssj23wm/GtBB1mbkaTKJWJObpMM
 CaV19zkxTVoyo30T6/I7z+oFBAEyzX2uxkd6a6ycRUXko3d1UCj5Im90lVEWvVMgHvy5OOfpV/I
 1BBV3TXDsjGMvxODFLjaRngijAUw0ee6nmxQJgLZV3aryE7plxaBYxvQYNRQmq/DxKG7DH2fBZx
 AJHkvsUsjVXbvyDqgleEX8gQ2GN8GZygYwBjnq4KD9+iw+NF0PZmmf1gSEPJuFgv2xCk/05JG5Q
 dDNa+BxrLdue3qKEjbHGc3VkV+yBtwaFZ0AoWlw==
X-Received: by 2002:a17:902:d588:b0:2ae:4f15:1aba with SMTP id
 d9443c01a7336-2b06e3bcfb2mr26165515ad.30.1773815221042; 
 Tue, 17 Mar 2026 23:27:01 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2ae:4f15:1aba with SMTP id
 d9443c01a7336-2b06e3bcfb2mr26165285ad.30.1773815220700; 
 Tue, 17 Mar 2026 23:27:00 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2b06e605108sm18492275ad.60.2026.03.17.23.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:27:00 -0700 (PDT)
Message-ID: <9aff5d87-e513-47cc-bafd-993e37d97458@canonical.com>
Date: Tue, 17 Mar 2026 23:26:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260222204645.285727-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260222204645.285727-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace memcpy + NUL
 termination with kmemdup_nul in do_setattr
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,canonical.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	NEURAL_HAM(-0.00)[-0.991];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 61DE92B6531
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/22/26 12:46, Thorsten Blum wrote:
> Use kmemdup_nul() to copy 'value' instead of using memcpy() followed by
> a manual NUL termination.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

sorry this got dropped. It has been now pulled into my tree

> ---
>   security/apparmor/lsm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..49aa6ad68838 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -858,12 +858,9 @@ static int do_setattr(u64 attr, void *value, size_t size)
>   
>   	/* AppArmor requires that the buffer must be null terminated atm */
>   	if (args[size - 1] != '\0') {
> -		/* null terminate */
> -		largs = args = kmalloc(size + 1, GFP_KERNEL);
> +		largs = args = kmemdup_nul(value, size, GFP_KERNEL);
>   		if (!args)
>   			return -ENOMEM;
> -		memcpy(args, value, size);
> -		args[size] = '\0';
>   	}
>   
>   	error = -EINVAL;


