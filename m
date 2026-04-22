Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KERJ+JC6WmqWwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 23:51:30 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8D44B240
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 23:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFfTV-0008G9-C6; Wed, 22 Apr 2026 21:51:13 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1wFfTU-0008G0-0x
 for apparmor@lists.ubuntu.com; Wed, 22 Apr 2026 21:51:12 +0000
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C990B3F86E
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1776894671;
 bh=6VLo/yUVeRMGUhJnZEuYHpDbSPtBEUiWsLgK1CGuy4E=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=dqx0d0eMcZBH1jCgrF5lya5tOtA3m/dUvnsrugO52AAXLMQEnOXnntMymD27nYf3t
 mhiMGDwqM0BYnaKpKoY/z8/QspDU8nDNtJO0Msaf7JBl0vTs7DDMtIaFSxhzLV5BwT
 yWtTEcPhbfxvZpU7xMrjCIgkBvYpGV7ZGHu1Eco0zltZSLsAuzCPCC9x9HwKhi2gt2
 qolLlnfnAWDyHNCGyWtKQd4FT6X/JQNB2P02mO463oK5t+PXTvkKlaRtdev4KgTMp1
 /NCO/P6Li3sXAZ0clOwM6INrLetuZ/Xy2p+XlMGi18Ihff5fKTsRBP5au1oQbxT9Fa
 A1zGxUUuA15jMMptVrD18fBcSbSrNccFUfEyNqsT/x7+8O2O0LRs0fz//7nAY7fi/q
 vi7Ttz6kpjcXj8W2luzFoaoN6gm2+L3aXaiyfJUeOEcrIdOd1Z7PdciqgYm8oKTQ+Q
 bkMtKPlo2hL7EJtaJghSinTv96WIaglaao6ASn/knI1uCKLQ8+rPZ3T0yuHwD7kpW5
 xM7qN8GrCzWY6GJaWmXh97CeLEum06Amx3LnxwXpNZ77fa6Ej5JYcZohXStJY3+weQ
 yD31v4Q0SEwFgq+lh85MGqD5FMDKrwPdAcz7znvqiGLiETlUVdH71LDF1WG6cWJObd
 ShqwpbggLz5Wcg078Q5fl4x0=
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9568707f486so4180027241.0
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 14:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776894671; x=1777499471;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VLo/yUVeRMGUhJnZEuYHpDbSPtBEUiWsLgK1CGuy4E=;
 b=SvgkrA5jNCaVSVEMb6z0yEzt4SP4dszIy6oy8ANX9k1ksuZAXsaYWqrQVpMxfq5bXM
 P9Gt3KGykrtPQjOGFXwE02PDoSDVBq0CpvCnQLs81eZesSLn25frxMHl5U9nnld9vBid
 CBzQqMTRqAwS9swNMKjWb4tc6MrKl9T8YQPUHQz1G1rh79WMR2ki+6o985r6/MGWz06D
 DVc/+rraW2eGdoN1jFnGuUA9Q7CWaFXtV3aVFrYHRcmL3XZg8PxkHrqWleXAqGY3uORv
 lffOGrMsxm5cOU9MJCCc0h9M3MGETW7EzBUuLDfY1PaAW4GxUspuJ7wnRW6NEZFz5/J8
 nSvw==
X-Gm-Message-State: AOJu0YxdrvYeh7TQWqxyDQiCgMU3fuMQE5LaMOg8kDV1r3K1KZMmU18L
 d8na+iBe+Z/OLvDT5mdVbrimIL7Fr9SIKDQ7dw+gqUXT2RNJS34vGhHm3rTYoelMDH4jbBC6n6Z
 uKsGplvKaFNXMHisO5JWn9rpLhPA+T2pe677H7YWyCscb1V3LQAvNQryg9He4MISuf1bCdZJcwa
 X3pA==
X-Gm-Gg: AeBDievATEvDttb2SzE6Qk/Abxsro2IE/xRuAg/thle4c8TqJgKI5sKooxN+PznGZO0
 2OkliN8/3Pyz+DT5nIHlg/OQGbwgcFiPqMgWdYX62W9j8XQATD68cteoogUtXph+9yMhzlmtYc8
 9LQSofZUYiRUQwzN4olCQ+vOEu+z0rKH7wzMzhDAqjF8UH3q03NSWmHYVxD7ky9AU+EibFGYOjl
 oQfTiEXnlRMPK9/fk0PXJLG5hZtlsyUc22TfYzMXVZs3O+DnAEYN+EcSgIralw/hZIam6Edcz0b
 TE0Hl8I2dXLLIi8Z7LFqKZBfjUuqE7+gqVxGJlw2EiUnBJigMzkz5iMdpJwRMR5g9P5+K8w9yU7
 kXwjyL9Tmc/O6sFAyF7DlwY/cakzULI2DxXFbbMw/pB3do7uXexml6kLr3SViY6bOgZMyurt8x2
 q9HmbX
X-Received: by 2002:a05:6102:41ab:b0:608:706b:dc5f with SMTP id
 ada2fe7eead31-616f71f0b71mr12058839137.23.1776894670647; 
 Wed, 22 Apr 2026 14:51:10 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:608:706b:dc5f with SMTP id
 ada2fe7eead31-616f71f0b71mr12058831137.23.1776894670293; 
 Wed, 22 Apr 2026 14:51:10 -0700 (PDT)
Received: from [192.168.0.106] ([187.95.109.208])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-95890937db2sm8334640241.2.2026.04.22.14.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 14:51:09 -0700 (PDT)
Message-ID: <1b87ab3652ca165364e1bb86623f2b26a135dae7.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>
Date: Wed, 22 Apr 2026 18:51:05 -0300
In-Reply-To: <20260403035119.2132418-1-gongruiqi1@huawei.com>
References: <20260403035119.2132418-1-gongruiqi1@huawei.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor: Fix two bugs of
 aa_setup_dfa_engine's fail handling
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
 linux-kernel@vger.kernel.org, lujialin4@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gongruiqi1@huawei.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 37C8D44B240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On Fri, 2026-04-03 at 11:51 +0800, GONG Ruiqi wrote:
> First, aa_dfa_unpack returns ERR_PTR not NULL when it fails, but
> aa_put_dfa only checks NULL for its input, which would cause invalid
> memory access in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.
>=20
> Second, aa_put_pdb calls aa_pdb_free_kref -> aa_free_pdb -> aa_put_dfa,
> i.e.  it will free nullpdb->dfa. But there's another aa_put_dfa(nulldfa)
> after aa_put_pdb(nullpdb), which would cause double free. Remove that
> redundant aa_put_dfa to fix that.
>=20
> Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> ---
>  security/apparmor/lsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..be82ec1b9fd9 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -2465,6 +2465,7 @@ static int __init aa_setup_dfa_engine(void)
>  			    TO_ACCEPT2_FLAG(YYTD_DATA32));
>  	if (IS_ERR(nulldfa)) {
>  		error =3D PTR_ERR(nulldfa);
> +		nulldfa =3D NULL;
>  		goto fail;
>  	}
>  	nullpdb->dfa =3D aa_get_dfa(nulldfa);
> @@ -2486,7 +2487,6 @@ static int __init aa_setup_dfa_engine(void)
> =20
>  fail:
>  	aa_put_pdb(nullpdb);
> -	aa_put_dfa(nulldfa);

This isn't right. aa_dfa_unpack does kref_init(&dfa->count), and later
we have nullpdb->dfa =3D aa_get_dfa(nulldfa);
So the second is put on aa_put_pdb but the first, from the init, does
need to be put too.

>  	nullpdb =3D NULL;
>  	nulldfa =3D NULL;
>  	stacksplitdfa =3D NULL;


