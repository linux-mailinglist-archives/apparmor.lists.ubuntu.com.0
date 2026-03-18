Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GqmA2VAumnMTQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:04:21 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF582B628B
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:04:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2k0t-0005M3-6H; Wed, 18 Mar 2026 06:04:15 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2k0r-0005Ls-R9
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:04:13 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A534E3F29F
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773813853;
 bh=g5rPKteiApd7nJwaHeU4G59Ue8wG5WbFnYwXwXpyUP4=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=JJmj/3+lAV7ASUJARCLU+j/Ly2gpDJCiaYMRiXlKvD84dMvumeKzx+gTksJBjORQY
 9sDbML/EuLcHbg7r4DoPT3W4chOFSurqUy/3A1sGZXWxFUEw9UkomItcVX3JY2MjQA
 yLASihwv2+iGqUImjabcr9ZwisXftl5IG+d800+l3z2N1M/nsr4Bqmq30M3VRWBon8
 86vJpUzAKflW//SxFIwYZImrik0a8z9DbnmN0TSrBYPoUvfyWFw2LuZx8Oq+kF1BDk
 Ad/lWgOm09c1Ontjt0KiXzTDjc05V7PuTUs8Cy9y0Wxu4V6kunelhfj2HjCRt7/grF
 dW2rg/vS5vaZEL4D/buHZ0+pnQlzmTD72zXVYRIlOMs9x2YMbXR4rdBLkyTadosB40
 yFfwYjm8kKARsOs7uMUGsVbEIK6PUjVep8WWT+G89V3XAxNQk7ny2zfjsiACyKgQhr
 4IX+uEDChQ/LO4ws2Wvf8UF89MDkUJr9cJf6IFMvWoKqPL3RybLmM38leMV8vCQa02
 QT8qFcgvf5dIS68GaHt309aTvT42S/4yDjrdIqfYaRlPG5ZzaSkCC+BGZ5wO4gbCp7
 nbtZneJ9yM6nw4Pszo9TBUFJ/CQJcEwNnPqHaAO16iGuUMjIPuXcFSdbDBNK0FOlhD
 djC7hgMWtRuWRzJrR3PsCVoQ=
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-829942cf9deso5588978b3a.0
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773813852; x=1774418652;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5rPKteiApd7nJwaHeU4G59Ue8wG5WbFnYwXwXpyUP4=;
 b=ENsA012rRI9y+uKhXFjbGtINPomznoX2Zy3KR/XJ8bKIzIycQaVzBwyt5WmXxvQCcu
 S7WIabPeRjr7R56W17TX4UxQYv5lQSLx1mUqi8Mvray2O8QaKt8bmKCb1gCSt9u0c/+y
 k4w0ObdWF+6pgEmgVCeVe5Tl3DVgA9dgOdcEPaJQGktj+BNgem3F9WqCIcxJduAjF+zP
 s3oPksqB32RVOGj5MBDgKQL2dpQRfkeVFNyKEU1tZ9NLMCNN11g4+9l8s/vD4VnU4zm5
 DhXXWxlWhXALp1+41+U+s/vO3ybd5Jr/aoQ+S4oBM5ti5iOcIeLZLJyuIXLE/7YFK/Fr
 EIyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL/2wfsTo6rfZe7Ev9ZX8Hh0kcCU+6NaRaOxTpg3Ce4FqNw5oiHCk1+bAeD/sUTEGTJR4/mGPn9w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwCtRmv551z/ywCalh0kuyYr3BeM7TeFuHrK4YvtN/zrIxRcqI0
 mItdeIwGi7uo/u1/+baKSVVOfovRPg87glJRbPJFUd9j0uefKeX6cuE/4f5KuWZSXgsTSU5EPq4
 62gloajXB+zPt9WpzD4LJius0+Xhqw58eM56/clS8kU6OqY3exMbZmm+M4pZCWp9945uFHV3aX1
 wMDw==
X-Gm-Gg: ATEYQzzhqXAHUMUO2tD13laNG6whJuS297Cfzj5PN7d6sQz+h7v5dLM7h7H4DbK+nD2
 9PdM7sbzkD7+tBmm6GFrL/6xR5ZeR+p4fBeWUS6jvh+1X2ZUI+0qX436ZD2jTpnX3NEOlxMkb/m
 KFiVtpj4cLxTiFitaBPC2jHppnVN8uXr+FQeA7notWnJ15gN/oleQ+PLy3WhrQhHrudXUBeTHZY
 0AJcJtGqcWgxK/r0+rgpiGmoYmJflIlx/ZAfBlc5GFNGKiKACoiLyVmHscbMp9xqQld7Hlsg9d7
 2G2NjexH+uJwaphT3L8erHPh50ZnRruFaBNXuG/eEs4kfMUUmgdt/9idBwrjg/J48+ZWyRBntxV
 1cKWfychGuTXdG/NVxWmG4jbQTUzwiUvB13wi9Q==
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id
 d2e1a72fcca58-82a6ae4f234mr1745008b3a.44.1773813851981; 
 Tue, 17 Mar 2026 23:04:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id
 d2e1a72fcca58-82a6ae4f234mr1744994b3a.44.1773813851602; 
 Tue, 17 Mar 2026 23:04:11 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6bbb2f41sm1248682b3a.33.2026.03.17.23.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:04:11 -0700 (PDT)
Message-ID: <42f72eeb-0641-4ac9-bac6-1d0ce1248337@canonical.com>
Date: Tue, 17 Mar 2026 23:04:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260212211516.393031-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260212211516.393031-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: use __label_make_stale in
	__aa_proxy_redirect
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
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	NEURAL_HAM(-0.00)[-0.985];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[canonical.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: CFF582B628B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/12/26 13:15, Ryan Lee wrote:
> The macro is equivalent to OR-ing in the bitflag manually, but using the
> macro consistently makes grepping for these occurrences easier.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/label.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This patch applies cleanly to both the Ubuntu 6.17 kernel and upstream master.
> 
> diff --git a/security/apparmor/label.c b/security/apparmor/label.c
> index 14bbed88aa83..ee9836ebc196 100644
> --- a/security/apparmor/label.c
> +++ b/security/apparmor/label.c
> @@ -81,7 +81,7 @@ void __aa_proxy_redirect(struct aa_label *orig, struct aa_label *new)
>   	tmp = rcu_dereference_protected(orig->proxy->label,
>   					&labels_ns(orig)->lock);
>   	rcu_assign_pointer(orig->proxy->label, aa_get_label(new));
> -	orig->flags |= FLAG_STALE;
> +	__label_make_stale(orig);
>   	aa_put_label(tmp);
>   }
>   


