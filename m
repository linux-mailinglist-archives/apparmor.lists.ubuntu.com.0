Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KT5IqY9umlbTQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 06:52:38 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B52B6030
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 06:52:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2jpU-0001rL-JY; Wed, 18 Mar 2026 05:52:28 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2jpT-0001r8-2I
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 05:52:27 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E4D133F604
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773813146;
 bh=rlLVK36GBtlh7PKwRHLXFZOzpJKiMH+joZLh5908m+4=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=HeoWQngdaFDuZ34a9tEceNaM/ELFgr8adpglDpn+Z+pB8BtkBcdI7uLB9WkJrDsrd
 b581ciFSfdUeHiisGrYIreFPISyj/zYjl59fWRDbR533kGydH/KKNZba3aQAs0cdeu
 p5gvBdM2WOrwbmaFWgoWvEzBJnZd6SBBFH4cmRT/XlbqNK7c5Vq+fsIR+rzqRcQPSO
 NuUCoFVN38NK2+hzd2euT9Y51e+nQC1k+F0xwIRZ03q58A5yPrZlC1JUFBiFj9oHND
 ywEd3VVAzdq4RVb9YD90U5MgxwTAXRGByN9VY1RVF1E+CS6sTcP6e7DOoCk3KqxnXR
 zrB0QFicHCoEBDrbo3fJSvGZueFuvxWd4dL7DXoA3v9CpgvFKNw2BLfDvRS59TiCpJ
 CYBwn8DgOUduhAC8kp5xpge5Bw4vgW/3nsE4i149ePV79HHA4zxVMj8Z9tWNGKeOLs
 2O9UZ0MRCwunJxVJmCM6s7yEf7Rfq8tVVTVY9Lppfz2jvO4Kp4z9OlLyhA2Kag8bDc
 yy4YARNyIke1aQWaMOv9QEBHjhTl+oFEBC09mr7dywag7Us6H/YWcD74KfFeXnzRwE
 9/nHXoiWsLWbH+VUhM6JMCXKbc3yWdrYJk1wEqHVKNkwWIO1iXicCtfnh/Kxgir/pG
 P5x7BDK/MrbFlUVkjhHBlTUw=
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8297d261a67so259787b3a.0
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 22:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773813145; x=1774417945;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlLVK36GBtlh7PKwRHLXFZOzpJKiMH+joZLh5908m+4=;
 b=tRv5JsHU7LyHp8pODbJMP4037xf4/WnpFY5ZsJ2TtdeRGc8dwfISZXcUN9ORTdwzv8
 dPNi3Y6DB+zkY8bP87VrU67D55uQPxpjnaUdghS29akRSZerCA7BNPxOhvBqFvOAGpez
 sGp0W8ToHH36pGcWU0cMQziScnZ2/WJOG8NXGTZEplwYFquQcJFa4HYjMHz92E8tre+U
 Opd9494Jk9pM04r4lNzTzBloNeNGuH9aSjw2SGGaGF6++W6BHwu9sBOQrkw7OlzHrhI/
 Gw+WPbThFFstyY2+xn2T6Hc+BKgk6V9TlIw5nGtxjYJWH/TeXKgJmyZyaMj7ECHxYDPA
 r69Q==
X-Gm-Message-State: AOJu0Yzdpb+YnCPFDdbnDFEqeoIlEZ8qo2Ndl3hyb0fxIYlX1UFWpOMJ
 cMMf2xD3coaCPbg0slE3E9YMNJYGMSREdFpv7XPIU3/SnRvYe4Fy2zJ6Bb3+I7Ho5pc8hqzMVoo
 i2e4lG0yZF9IYWUEeeQVDLYiE38EBWmU0wMrLXkaaTSxe1Xjb+WcsgMQY8aJ8I3aI8Lh4WIRw4n
 DEtJu/kKZjfQ==
X-Gm-Gg: ATEYQzxFXZqVEGyng9p/WJUzNVviteNPKcEvxUTlZ8JqwasDz7RIDyv0KWPFTvhAHwW
 p4wr3i2IavxKD7tIw7gcbAcf0ceCdtovbYHPMaHw+nGpJG0umEduUJlcDOM3VG/cHBJTSCjNof3
 oGbMUM5BH72MoxzsZPIG0pqRcSJDILlUbgneTKsg+3f0/g2rAzLcIXCdpD4bvHGHP05TjJtQQY8
 wc13tjXcu6ujRyhgL0YcTdcCA5J1drlNXIBZnlXoOl4zm27zgZe6nK6SZhWyhJkcXe4TGd6wiIv
 Zu283N9EmV2v1Sy6XalJwrvr2sDqdxDp/hnQBXbG2g+uf1bD6mIUzHacE7H1z1UkNeS1mTySPWJ
 wojMKTvTAqU5WkBUC39Xew2aCtiQa5A5NLtvpfA==
X-Received: by 2002:a05:6a00:bd12:b0:829:a127:518 with SMTP id
 d2e1a72fcca58-82a6ae0c30bmr2107118b3a.40.1773813145281; 
 Tue, 17 Mar 2026 22:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd12:b0:829:a127:518 with SMTP id
 d2e1a72fcca58-82a6ae0c30bmr2107089b3a.40.1773813144753; 
 Tue, 17 Mar 2026 22:52:24 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6b5308f1sm1203191b3a.8.2026.03.17.22.52.23
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 22:52:24 -0700 (PDT)
Message-ID: <11115255-88c2-4c93-9c6f-587b82cc5c78@canonical.com>
Date: Tue, 17 Mar 2026 22:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <20260211131952.391532-1-maxime.belair@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260211131952.391532-1-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH] apparmor: propagate -ENOMEM correctly in
 unpack_table
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
X-Spamd-Result: default: False [-1.61 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[canonical.com:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:dkim,canonical.com:email,canonical.com:mid,gitlab.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 4F9B52B6030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/11/26 05:19, Maxime Bélair wrote:
> Currently, if the `kvzalloc` in `unpack_table` fails, it returns NULL.
> This is masked by `aa_dfa_unpack` which interprets NULL as a -EPROTO,
> leading to confusing error messages in `apparmor_parser` [1].
> 
> The fixed behavior correctly propagates -ENOMEM on allocation failure.
> 
> [1] https://gitlab.com/apparmor/apparmor/-/issues/592
> 
> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/match.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index bbeb3be68572..6cca29c1f209 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -33,7 +33,7 @@
>    */
>   static struct table_header *unpack_table(char *blob, size_t bsize)
>   {
> -	struct table_header *table = NULL;
> +	struct table_header *table = ERR_PTR(-EPROTO);
>   	struct table_header th;
>   	size_t tsize;
>   
> @@ -74,20 +74,21 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
>   		else if (th.td_flags == YYTD_DATA32)
>   			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
>   				     u32, __be32, get_unaligned_be32);
> -		else
> -			goto fail;
> +		else {
> +			kvfree(table);
> +			table = ERR_PTR(-EPROTO);
> +			goto out;
> +		}
>   		/* if table was vmalloced make sure the page tables are synced
>   		 * before it is used, as it goes live to all cpus.
>   		 */
>   		if (is_vmalloc_addr(table))
>   			vm_unmap_aliases();
> -	}
> +	} else
> +		table = ERR_PTR(-ENOMEM);
>   
>   out:
>   	return table;
> -fail:
> -	kvfree(table);
> -	return NULL;
>   }
>   
>   /**
> @@ -343,8 +344,11 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
>   
>   	while (size > 0) {
>   		table = unpack_table(data, size);
> -		if (!table)
> +		if (IS_ERR(table)) {
> +			error = PTR_ERR(table);
> +			table = NULL;
>   			goto fail;
> +		}
>   
>   		switch (table->td_id) {
>   		case YYTD_ID_ACCEPT:


