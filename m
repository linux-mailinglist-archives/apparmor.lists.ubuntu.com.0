Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ToQKDgq+WkJ6QIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 01:22:32 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993C4C4CB0
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 01:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wK2cK-0001so-NJ; Mon, 04 May 2026 23:22:24 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wK2cI-0001sP-W1
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 23:22:23 +0000
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B50363F2A8
 for <apparmor@lists.ubuntu.com>; Mon,  4 May 2026 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777936942;
 bh=RKyLuPPcmvU7M09Hc0wtI5Dx+zATJXJHBFN21WehPqs=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=PjjodfmLkIN7NEwEUplHAdFfU3BMfg8VPeCwqO8cWV4psNVmHYNolZG/RcYNglfa4
 OBwl6W0fffxtGiKdU0Ig3lFbhSILTsL4pFyyG7fYZPEMf01APnVmwmHcPM38vNRROb
 fqQ1ecXjck7ozx/W8oSIv+4yWI3SQAKvO/i5Sl+HJJLGfav8kgQ5qDbG457Xa8xYST
 HooBzpt9hSYOpd70KUdvXQu4RpuBXXBcnULll0QAJlixqJG9PZzR+dt1VO17GQS/XK
 T4Kbr/8yi24XZwLKnNaDATRZIczgsgodRVEHYtt28TxJNzUG6S92h+XZYUJ7ZDnuuC
 vUkI9aytLEe/b1GNj3SWFCHKmtINWT4jJ28oFXWQ12obsc3hlFeh6rnvElVuTAEI0o
 bMpyV9kda19s5CmgB+5viYP0FJwq+7ZeeT1xF9lKR6W21ER4qRyvpyr69q+zrgexbB
 oVSwuW+HqT8RWHx5F91iUwJKDHw9L7R6rUKMjBfrSU0/aYe8uE+zNztOmudr14BXLE
 3x2xaKFOgl5dowJwWKfIYeEahAWf4mVEzRt3sJEoEcvOPDZPbJMcdP/O2mvrKAfj94
 oZ0RrTFJ4Hi1a+kdfTOj6w+6fIAuA8k5twjmsI/Kkfarbbxr+8KZcOmCfn80BrLQoo
 8N3XAQXhAdZEAlNzaMsBqu+E=
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-652ddb428beso8973578d50.2
 for <apparmor@lists.ubuntu.com>; Mon, 04 May 2026 16:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777936942; cv=none;
 d=google.com; s=arc-20240605;
 b=krASOjxnyDi3VjkPOUWgfxaZ+t+pSBvRcfGsgmBNw0+syZJYPL2IWg5TRwLGYVUe1H
 eM6/S1tSTFlKgn8nABCkOtlRFpx+MnaanbqIuvEajxJqPY6j397a+ZI9cNdMhZLtsHxF
 L+pgt70ZTblmLAUyajHlpTHa6VJ0sEhjEtCZ6nXAJoiKYk87IV2wZXOfoOxNHgAbBfKW
 T8W3V7e3MB/HreRTRPsKlnYXh4Sst0x7ICX5I8LwVXhlJSqcbQEv5AMICDGBX9OKb/E+
 t9PV3s1OezHGZOs1C5m7yIF98bJLXWehnXgh7IKsAnYn1prnm0H6QZ431ySC6p2k0q0Y
 VluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=RKyLuPPcmvU7M09Hc0wtI5Dx+zATJXJHBFN21WehPqs=;
 fh=B636Utz9yHK8k+4PA3BLD8MTaRH7Gstxrqr8gLiv/Sk=;
 b=c4B/hPYcAYJyHVc9yDsBaVAatPmZIbLwBpI/M9jsODjY1ZsNpy0rxPFYNe31FoY2JN
 hWaSsxsr3Ty4jRG+WLemyb2pMIIWebotDu/Ou9xtHhK1Ke6j4OU+RIzQrja+S7872Kum
 KYYB3qK/joq12yD4QfIAyzSJ+uFCIpP4LEWGgdh/T5C2ElGmgQscREojNpS8xzms4Ny3
 YTDVRdi7+OmcpOhh9U9EUnyYA83UFyI56ynlo7Xqb+hyEi7u3r1qUntJP28Vs+wuuyNB
 HBT6bXSGplIsaLoJ6DcYWxuKSkjse6xpAYOkLUlqZB4db63zlepz+euOIawNQzKj/nTR
 4fwg==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777936942; x=1778541742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RKyLuPPcmvU7M09Hc0wtI5Dx+zATJXJHBFN21WehPqs=;
 b=VobmXfqBWKjZ8l4HkdwyIPZrbD+NqElsxWd8EzhFwuN4/nJHb2jNpfFoeFNArygMnb
 75/S6CNYiLF/iwf+Pjjoa+EYpEGZFrZrwA5muoF7AqF6WYx38/6/WX4ax7IL4osGoUpQ
 /pckKN2bSiJiI5DeV5+UDXhzittllgA2qlmr50izei6p5mc8tY1FV5FIwxvR0uJySLCb
 B7iwdQwQGmmNkxTN7YaWTmwy1AGRMWEBF0jquwVUe4df5Hg+/DM30eaXyCWgc+XBeFj3
 FjuRMTBGeXh/VE4EdgN2TEUhBAs+NZp65xFR3D6YOeCzvAKD2T3na3Na/M8bdHZgUXZ6
 Empw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OxFmr2+9GIjGwLyQQcg6Wao24S+Ml9UGxNL1qyynb4mH4wTpSVxskvQQEfz5NLInUmtWMfbbWLg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwtQhVUmE4h9028u+WvpOEAcrqcCdHOg3tyj/a067QEev2Q6gMM
 qKVbc8+n3BYtAuLMJWwV3osVf297tV7K3CZd/8zWofpZZY8Xl+/PS/E0IOhk3CWvWHXTaaBBHci
 bKupXyct5/uqberF+CgsLOP2D2GAEN3GykQVxYqEGIxOLZqS8GmLrsaZuRCpz9kpw4/DBFoU8Sv
 Cj5nKZsuJtlY7+67zg3F7V3ThMuWVj0cr6MZ0hvhhgOXpgSn7QO83Q
X-Gm-Gg: AeBDietcxAu2ERXF4WFBygOwXVUk7o9Vi0SnY+nR87vDoykEGxOZbJl4ONnPVK+XYux
 yEvpuLAVepoj6nfz6m6I67idE7NFnlEvt1AKNnG5dV/NYtiOAwqVZX4mOgcogjd2wN2ziPF7A18
 IKorg+Fc9/Mnv5j3V8wnn4ZGt5i5IleQd/Q8uQfRpzK5QoE8pNtQaT97MkMMQsIF+rz/3cUiC/9
 u0oveLbGbKfFWywIQhPjl4WU5bCJBIQUv6XPqMeMNyg7xtinfTuKgCu2EleIY/5kWLT7DURPQts
 +w==
X-Received: by 2002:a05:690e:1c20:b0:65c:6897:26e4 with SMTP id
 956f58d0204a3-65c68972b13mr1607985d50.56.1777936941625; 
 Mon, 04 May 2026 16:22:21 -0700 (PDT)
X-Received: by 2002:a05:690e:1c20:b0:65c:6897:26e4 with SMTP id
 956f58d0204a3-65c68972b13mr1607969d50.56.1777936941299; Mon, 04 May 2026
 16:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260502113720.185194-1-me@zygoon.pl> <afjFno4Derx5-DOa@yaupon>
 <1aa1e737-3e4a-401e-a8ae-7d12736b5522@app.fastmail.com>
 <afjIRH7bJVtOd-wu@yaupon>
In-Reply-To: <afjIRH7bJVtOd-wu@yaupon>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 4 May 2026 16:22:09 -0700
X-Gm-Features: AVHnY4IrzCv0Wp088sa0WmbFmWGZ8nmZGYTITs1LZP9vfRTzpfC6gMxyObAMzSo
Message-ID: <CAKCV-6v+kK_eRuquGXZvF5f_q3GXfS1CXzudeiuMOe0bKjEZCw@mail.gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: aa_getprocattr free procattr leak
 on format failure
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 0993C4C4CB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid,canonical.com:email,thicks.com:email]

On Mon, May 4, 2026 at 9:25=E2=80=AFAM Tyler Hicks <code@tyhicks.com> wrote=
:
>
> On 2026-05-04 18:17:05, Zygmunt Krynicki wrote:
> >
> >
> > W dniu 4.05.2026 o 18:13 Tyler Hicks pisze:
> >
> > >>                            FLAG_HIDDEN_UNCONFINED);
> > >>    if (len < 0) {
> > >> +          kfree(*string);
> > >> +          *string =3D NULL;
> > >
> > > Upstream doesn't have this call to kfree(). Did you create this patch
> > > from an Ubuntu kernel tree?
> >
> > The kfree is coming from my patch.
> >
> > I think those are all against recent (at most weekend away) upstream ma=
ster.
>
> Yes, I totally misread the trivial patch. My bad!
>
> John, please feel free to add:
>
> Fixes: 76a1d263aba3 ("apparmor: switch getprocattr to using label_print f=
ns()")
> Reviewed-by: Tyler Hicks <code@thicks.com>
>
> Tyler
>
> >
> > Best regards
> > ZK
>

The call of aa_getprocattr in apparmor_getselfattr unconditionally
frees the returned string (which doesn't break with this patch applied
because kfree(NULL) is a no-op), while the call in
apparmor_getprocattr does result in a memory leakage if this case is
not handled correctly. Even if one of the callsites would be fine, I
believe it makes more sense to set the pointer to NULL inside
aa_getprocattr instead of having its callers handle the freeing in the
error case. (I also checked that the single caller of the
security_getprocattr LSM hook, which apparmor_getprocattr is an
implementation of, would be able to handle the pointer being set to
NULL.)

As such:

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

