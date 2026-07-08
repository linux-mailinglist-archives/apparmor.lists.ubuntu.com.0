Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kiu+KSNZTmpZLAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 16:05:23 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91C727146
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 16:05:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whSti-0005CF-KF; Wed, 08 Jul 2026 14:05:10 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1whStf-0005C8-IS
 for apparmor@lists.ubuntu.com; Wed, 08 Jul 2026 14:05:07 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 64F0A3F16B
 for <apparmor@lists.ubuntu.com>; Wed,  8 Jul 2026 14:05:07 +0000 (UTC)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8483e038efeso956195b3a.2
 for <apparmor@lists.ubuntu.com>; Wed, 08 Jul 2026 07:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783519506; x=1784124306;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :organization:references:in-reply-to:date:cc:to:from:subject
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ljrZQ/jSIAbiWPJR1OVwdq7B6Ha9nD8fvWtgiIGymkA=;
 b=bSyOXFYIteiRpBx0mFBUatKNTQfdP7UBuRy7ISxC+uXxeq+j4bcNXUspNnqbUrPDin
 txJeVGUNRi1iIQlZJK3XgekQVkqyjU/ZH/zLq7MtzwT4sPw5L2VMqgUtMhudcSf+/SLJ
 PVh7mVjz5I/ikhy6TZOel6MuceTw39Ta0w46Bl/sFjoGJBD5gEfvSQBFEzaeaZhiVxKE
 iiJS6AT2nYmRWYZAZyyvddzdfrA+ElPoPgjk6RN4nE1TyCyMny5oNXkgaEQCEhgxpWty
 EIB2/ML11xPp0CLtg0sBhex89uCboefAOp990wOe4k233Hu4EBe8wAVhFaf5KdoCWQrA
 P1Og==
X-Gm-Message-State: AOJu0Yxb60jLOBLmWl03tERg3aKufiDlgDBeM++lDp8GakJxiHZIlzww
 IKKRKirCL4tHB8QYCN5jhdiMINlKtbfAeltcMuNwgeOacU3u+Utg+Gyr2EMrhqCZOG/jzcLTHa3
 QmZeTULBrw4Mz2a7onmI5fI7gNsdcX5DgtTuk5t/GtGeLML8LLuYnFpBCdEv+VwqiauhFIVPPUl
 KpvA==
X-Gm-Gg: AfdE7cnlRZTKfnU1pSS5rOZOKaKGuB+RkzaEugXIs8he6l3sx+RS6OuBAQSdSWh2LK3
 AAJKz7rsxlHxo+JvJ+FYoxDNqFBPon+zcLGTmpxs9lQvzcVLURrKApDClxTWPM0WWXWHNHm4pLc
 UeuuMM7hahyzGWrHsHejOwvqNiU+N5lbZ+5dEGS/h/3pjMnxrYzbexypNZ3gO0pTpLlgtMVOKZ4
 vmzKA+adWaTmQiE7PuNH3aKN9damUPLJDM5gt79CTxGliJoNhGTvQHxPNClmmXaMnzQDrTl3GGX
 nAGgykbj6vSoJ1MCThQ0v6ga8cLjrcvsQbN3zrO9rV8f9l9qU+dFTukTlGTZ6hgjowBV1EMUEz/
 VYE+mVIszuq7TMt3zCmOBv4/dgD4JAQX6oDDM2Vwjd0KOrPJrWU1yFI4E
X-Received: by 2002:a05:6a20:3c8d:b0:3c0:9c19:b277 with SMTP id
 adf61e73a8af0-3c0bcc9d22fmr3874597637.69.1783519505915; 
 Wed, 08 Jul 2026 07:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8d:b0:3c0:9c19:b277 with SMTP id
 adf61e73a8af0-3c0bcc9d22fmr3874561637.69.1783519505539; 
 Wed, 08 Jul 2026 07:05:05 -0700 (PDT)
Received: from [192.168.0.106] ([138.36.35.75])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118ee6091dsm11179003eec.14.2026.07.08.07.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:05:04 -0700 (PDT)
Message-ID: <9f37884fc0922254c3d3708794cf1272f4fabdfc.camel@canonical.com>
To: Oleg Nesterov <oleg@redhat.com>, Bradley Morgan <include@grrlz.net>
Date: Wed, 08 Jul 2026 11:05:00 -0300
In-Reply-To: <akqm5EMVZpqM6gnQ@redhat.com>
References: <akqL3YWi28ZUzca3@redhat.com>
 <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
 <akqm5EMVZpqM6gnQ@redhat.com>
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:include@grrlz.net,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
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
X-Rspamd-Queue-Id: 4A91C727146

On Sun, 2026-07-05 at 20:48 +0200, Oleg Nesterov wrote:
> On 07/05, Bradley Morgan wrote:
> >=20
> > > SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passi=
ng
> > > NULL works, but:
> > >=20
> > > - this works "by accident" and looks as if the caller doesn't underst=
and
> > >   the signal sending API.
> > >=20
> > > - more importantly, this hides the usage of SEND_SIG_NOINFO from grep=
,
> > >   and this is really bad.
> > - also drop the now redundant (void)
>=20
> Yes, but the "void" cast was never necessary, I guess.
>=20
> and just in case... To me the usage of SEND_SIG_NOINFO here doesn't look =
right with
> or without this change. Perhaps I am wrong, but please lets not discuss t=
his right
> now, this connects to other cleanups I have in mind.
>=20

Yes, I agree. Perhaps SEND_SIG_PRIV would be more appropriate here.

> The purpose of this change is to make aa_audit() grep-friendly wrt SEND_S=
IG_NOINFO.
> And because send_sig_info(NULL) looks "just wrong" to me, no matter what.
>=20
> > Reviewed-by: Bradley Morgan <include@grrlz.net>
>=20
> Thanks,
>=20
> > Also, feel free to CC me in signal patches, so I can review, from you
> > or from others.
>=20
> OK, will do.
>=20
> Oleg.
>=20


