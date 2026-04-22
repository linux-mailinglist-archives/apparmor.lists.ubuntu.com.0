Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF/9JcNO6WlWXgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 00:42:11 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C344B4D7
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 00:42:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFgGh-0007Hm-7n; Wed, 22 Apr 2026 22:42:03 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1wFgGf-0007HU-MU
 for apparmor@lists.ubuntu.com; Wed, 22 Apr 2026 22:42:01 +0000
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 77BC73FEB0
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 22:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1776897721;
 bh=W1xzzRlJ8xgOU4M+Kcr2oZKhnhQvcX7vIzo1PxDipgw=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=op0PZ47n0FGMKE7/is2ik+DhpiY4U+vVjCKrtwByTA2vwVvdBkWjH3A2ythJUfbwm
 WWzmRfZzx/Y9xTxJ7aZFrq0a+19CLvEgpdzuH/joqXR5Qa7kZNX67Kk6vZQncvHGOk
 AQ4kG1uhbO4y3+gD6t2Spv7AGI/p7xRyBfr4h/mAdqm5dOnOOIJgPhX6YbXf6F5KFQ
 BLhxuHtl0HUSvXU80FO0PP2MAZi8TcEKP54RRlyIZT2OdS1dkm/02j0EH/zU/KKQIp
 b4a6o8GM5GamF9b/2UjNa5yymmlXorqtc36OiCRbseEnz6q9Q+HK4qYu/NIDt7qf/4
 8d15XsQyQ//0LfmLDp/1IgA9C6lRUE8KDlct6fhiQ6yG3zTg4nIXiFzaEFAbwTiFo7
 qsDQDDgmERraIXJnZXAYPJUdvPyviGko4fOHUmFRcRNck36WvL8xZQ4QTotA/vsHGB
 LaSL0UOLQyfwNdQBJ5IhR0vFddbUkZWt0qTXkhM4V0SjoD7gGmdPezmiy6qh+iUntQ
 s7LQ2gmyiCId0qUyT/lAL/UPqoy7v4eLHfL3BnnCUJm116eOfrS63046PxFIFoPis0
 1buOm5EQ0mrAij3Z4LX/9DHVXLqcpybGT0o3LhtBvh9r2N9uq4cAy4lDZZmo59tpQf
 rXjl4Jj0zsylMpTT0kgtq4yU=
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-610503b689eso7738837137.0
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 15:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776897720; x=1777502520;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1xzzRlJ8xgOU4M+Kcr2oZKhnhQvcX7vIzo1PxDipgw=;
 b=IJFQTV7myMUAn9/SqjrrOpuGHKCwz1goPwr7xO2IxckzFvh9UEMXhaXRzm+4hLMRaP
 4Aj5AoEBgdmni9uBM+63dT7JkEupbH5vjuMwL0WX7NFDmud2Aoa29/K1ReNvK4jxs8BC
 uA4qZFIY9RXwH3hdeVS72VWvXsan+xKL2utAhiLftgCeHtqOzzMboTZgXMNGnvZWJ0bn
 OxviHy8fn+OTZOUcCb4z6oyWuuulnXVF4TMig1A5+wPD6CM692n8ZLzwRhnrGwkKmx8Q
 tWDUdMWp90W/wvYa3ZzdEIJpTJk+or7L2hl7ChZUV1WE0SUMfCDs9pzhrwES+FkkNrhE
 vdiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/vR/HGMY3xgZmbWHcPv3wig8tNXc1s/POTk9WwIbB+9qHTVtGX4N9WvJqxB68/OKHrlq3Eepa4kQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyVRES/iFzOBHw8vrRfruHoLzu+/pfvJug9+jKam8hiUM8/TEzy
 ofAcxpaHZnfhj9oQ3dsvOeQ33gRHAj8BoL5+3Lg9TssrYOyPmL4mIwpzUkyvj0n9JKhfm9T6kmB
 DWyLq36c3QOwQrIf6EUnGmb0DMeJw7i1Dl7HMyHNEVR17Qeys0qztX8gaPRoJqYkAfyZBzqdNma
 IL9g==
X-Gm-Gg: AeBDietZogPznwHt3DiWh3i4Vu6LEBOFGmNcWyoKWA+fL3U8jjPLzvvMF5LVcpUKbbE
 HWUHwxzi3VkJyG3HW833OEP640SD4b82Sn63FkuzNssto6YnOCcIy3C8OkHvC07yNhGT6IC1UIR
 621j+Jz3IwyqXq5WHMnB14xF4gzB2krHGah8CM/sc5CcblSVEJvqLFVLKLWBtzvirTGjfwiRJ7w
 qT0S5NN1DQQF6ETuuOXWApR37mr/wFdEzC9PVNbAw4yQms71naFM1C9VFv/lHiatUekZLS3zV2c
 Kl+bHllGoRucdVnPXD78m7BNoglvbAvAPohEXJg1GvK7SrxrDHpWVpTt4lfV3cGheuqE99/UX87
 xEq+xnIPeV4dnC/EEQGalbMOIAdhfO8UEywnNBQdDJsNQHxroC9DrJGEKKpqeNSz3/PqoysWo8/
 29c7Er
X-Received: by 2002:a05:6102:d93:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-616f7c5d67amr13534272137.30.1776897720237; 
 Wed, 22 Apr 2026 15:42:00 -0700 (PDT)
X-Received: by 2002:a05:6102:d93:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-616f7c5d67amr13534257137.30.1776897719832; 
 Wed, 22 Apr 2026 15:41:59 -0700 (PDT)
Received: from [192.168.0.106] ([187.95.109.208])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9589097ec5csm8575275241.4.2026.04.22.15.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 15:41:59 -0700 (PDT)
Message-ID: <86c56735a80e98c23dd0e4f894d424f83d457026.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Daniel J Blueman <daniel@quora.org>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Thorsten
 Blum <thorsten.blum@linux.dev>, apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org
Date: Wed, 22 Apr 2026 19:41:42 -0300
In-Reply-To: <20260327115833.7572-1-daniel@quora.org>
References: <20260327115833.7572-1-daniel@quora.org>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Fix string overrun due to
 missing termination
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [-1.61 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:thorsten.blum@linux.dev,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: 4B7C344B4D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On Fri, 2026-03-27 at 19:58 +0800, Daniel J Blueman wrote:
> This was introduced by previous incorrect conversion from strcpy(). Fix i=
t
> by adding the missing terminator.
>=20

Looks good to me,

Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>

> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Fixes: 93d4dbdc8da0 ("apparmor: Replace deprecated strcpy in d_namespace_=
path")
> ---
> =C2=A0security/apparmor/path.c | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/security/apparmor/path.c b/security/apparmor/path.c
> index 65a0ca5cc1bd..2494e8101538 100644
> --- a/security/apparmor/path.c
> +++ b/security/apparmor/path.c
> @@ -164,14 +164,16 @@ static int d_namespace_path(const struct path *path=
, char *buf, char **name,
> =C2=A0	}
> =C2=A0
> =C2=A0out:
> -	/* Append "/" to directory paths, except for root "/" which
> -	 * already ends in a slash.
> +	/* Append "/" to directory paths and reterminate string, except for
> +	 * root "/" which already ends in a slash.
> =C2=A0	 */
> =C2=A0	if (!error && isdir) {
> =C2=A0		bool is_root =3D (*name)[0] =3D=3D '/' && (*name)[1] =3D=3D '\0';
> =C2=A0
> -		if (!is_root)
> +		if (!is_root) {
> =C2=A0			buf[aa_g_path_max - 2] =3D '/';
> +			buf[aa_g_path_max - 1] =3D '\0';
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return error;
> --
> 2.53.0


