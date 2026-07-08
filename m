Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3X8sOLRYTmouLAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 16:03:32 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D77270DB
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 16:03:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whSrw-000555-2N; Wed, 08 Jul 2026 14:03:20 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1whSru-00054y-Fr
 for apparmor@lists.ubuntu.com; Wed, 08 Jul 2026 14:03:18 +0000
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3C66D3F61A
 for <apparmor@lists.ubuntu.com>; Wed,  8 Jul 2026 14:03:18 +0000 (UTC)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7383a52d9beso766093137.2
 for <apparmor@lists.ubuntu.com>; Wed, 08 Jul 2026 07:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783519397; x=1784124197;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :organization:references:in-reply-to:date:cc:to:from:subject
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TnbkErJ6pkrTykU2gTiK0LYVxP5b43GJ8MOXtN09RnQ=;
 b=VmzlJEEUyjCBNiHXL8ay0Ut/MiIkZmyFmh/1ZPjAK8t9ycxigIIl5SM/QJ87ddybSr
 Xk+ZIKmDIawSPJXDec5I5NP7aNoC10fV3OHy4DzQojh94G+PAfla98rmCRw5Zb8pMdlK
 0ZTXHgyqms0qKjYEX3vLG3zzo/x6X5F7fGr0S/W6H2xlGlWcfAsnX6cm0clhzO5293/N
 Q6BYmG+pB012ngebQfNFuAJqoGVEp3kbAKTrrckPZSgQymbYQcZGGMpwHLUMCFr9mfRH
 GbQwSSv/avVjuwfaZWVla0pTnVgJPshMxG2ddeczDtRIX8o6k0bIYceMnuz3iZxcy2K5
 OdjA==
X-Gm-Message-State: AOJu0YyEO8wNhsI4ddYWHXr4QhMEKpl1T1kbM1qonKw7W3lbUenEsVY9
 QjCyso2KrcdLn+frmGlhHr828NufltzF1tUpT/XgczS/pFBw1EK2BpJgKQipGcph346TQNmOwTu
 xqRGdml+7MAu8Uls9LWzfBp8Z1ystolrzYs7hrb5ve17a+RX3s86o05/gCQN5qKm90vLLou36k+
 qTNA==
X-Gm-Gg: AfdE7clEgZPsno4tO5LfIHAthyJqwUwGO/SD5h6qkfjOOVyi6Yb+m0L504iPNtP7ZgN
 IdmhySnB/asPHook+OefzQawydqNYLdyr5avW505ERNWBUBzv7YzSfUZQCd+Qjo+adaXBg2olm8
 ar96LpOYiXHCiZ1O+5z4H4mR+jxF8KzDWdfTNS/r0f049J/qVvgyP+HDOPY1TXSD+WrhTwt+Jtx
 1DJ5L+3dYBV8+PVhbIOKBRLGYqsKafbA3uYvyfyD7YeibB2uLdAS5IHuBLpWCAGX623trfGAIGx
 iUXSzC7PljjxiQvPpq0iJ+jHaTcYpsR26IxrjzWG3bJ8X/e8KEdqcQHlrwaNTQG2AAJThqdD9A0
 mdmu+TWx0Pc5J5l7BX9CHdXQb8ZTitgM0F7ELTaiLUzVryqlHeD9r1QdM
X-Received: by 2002:a05:6102:3e93:b0:737:d2e8:d64b with SMTP id
 ada2fe7eead31-744e03ca766mr1372090137.20.1783519396609; 
 Wed, 08 Jul 2026 07:03:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3e93:b0:737:d2e8:d64b with SMTP id
 ada2fe7eead31-744e03ca766mr1372000137.20.1783519395894; 
 Wed, 08 Jul 2026 07:03:15 -0700 (PDT)
Received: from [192.168.0.106] ([138.36.35.75])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-744d6deb2a3sm1693152137.8.2026.07.08.07.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:03:14 -0700 (PDT)
Message-ID: <f3d7e5567bfbbca959f561f58cb9003b1868186c.camel@canonical.com>
To: Oleg Nesterov <oleg@redhat.com>, John Johansen
 <john.johansen@canonical.com>,  Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 08 Jul 2026 11:03:08 -0300
In-Reply-To: <akqL3YWi28ZUzca3@redhat.com>
References: <akqL3YWi28ZUzca3@redhat.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor: use SEND_SIG_NOINFO instead of
 NULL in aa_audit()
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
From: Georgia Garcia via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_REPLYTO(0.00)[georgia.garcia@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 378D77270DB

Hi Oleg,

On Sun, 2026-07-05 at 18:52 +0200, Oleg Nesterov wrote:
> SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passing
> NULL works, but:
>=20
> - this works "by accident" and looks as if the caller doesn't understand
>   the signal sending API.
>=20
> - more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
>   and this is really bad.
>=20

Acked-by: Georgia Garcia <georgia.garcia@canonical.com>

> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  security/apparmor/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
> index 4a60b6fda75f..15e42e96b163 100644
> --- a/security/apparmor/audit.c
> +++ b/security/apparmor/audit.c
> @@ -192,7 +192,7 @@ int aa_audit(int type, struct aa_profile *profile,
>  	aa_audit_msg(type, ad, cb);
> =20
>  	if (ad->type =3D=3D AUDIT_APPARMOR_KILL)
> -		(void)send_sig_info(profile->signal, NULL,
> +		send_sig_info(profile->signal, SEND_SIG_NOINFO,
>  			ad->common.type =3D=3D LSM_AUDIT_DATA_TASK &&
>  			ad->common.u.tsk ? ad->common.u.tsk : current);
> =20


