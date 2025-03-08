Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D7A579F8
	for <lists+apparmor@lfdr.de>; Sat,  8 Mar 2025 12:21:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tqsFV-0001ZS-NB; Sat, 08 Mar 2025 11:21:45 +0000
Received: from mail.cboltz.de ([65.21.65.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <apparmor@cboltz.de>)
 id 1tqsFU-0001ZH-84
 for apparmor@lists.ubuntu.com; Sat, 08 Mar 2025 11:21:44 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 818432329D15
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 12:21:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhFPb1I0vULs for <apparmor@lists.ubuntu.com>;
 Sat,  8 Mar 2025 12:21:43 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 12:21:43 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 08 Mar 2025 12:21:39 +0100
Message-ID: <26796961.1r3eYUQgxm@tux.boltz.de.vu>
In-Reply-To: <20250304205556.290042-4-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
 <20250304205556.290042-4-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2294034.vFx2qVVIhK";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Received-SPF: pass client-ip=65.21.65.108; envelope-from=apparmor@cboltz.de;
 helo=mail.cboltz.de
Subject: [apparmor] Re: [PATCH 3/5] apparmor: create new learning profile in
 complain mode upon disconnect exec
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

--nextPart2294034.vFx2qVVIhK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 08 Mar 2025 12:21:39 +0100
Message-ID: <26796961.1r3eYUQgxm@tux.boltz.de.vu>
In-Reply-To: <20250304205556.290042-4-ryan.lee@canonical.com>
MIME-Version: 1.0

Hello,

Am Dienstag, 4. M=C3=A4rz 2025, 21:55 schrieb Ryan Lee:
> +        * error should only be set at this point if we're complain
> mode

Nitpick: ... if we're _in_ complain mode


Regards,

Christian Boltz
=2D-=20
> > That's the part where we create a flame war and then try to
> > collect some useful ideas afterwards. ;-)
> Let's collect ideas directly ;-)
Humm.. interesting.. never thought about that approach. :-)
[> Andreas Jaeger and (>>) Gustavo Niemeyer in opensuse-packaging]

--nextPart2294034.vFx2qVVIhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmfMKEMACgkQxqaC6mPI
Lxz1Pw//dZqQxWOHo/7aFudHIV3XN5PtpNo9CJI1gwa6Y6HKrdpU+4v34Rmy4Iaa
3oTh5AHZDNKQ6lKqG7NH39pj61gr2VR0Yc0lFI1DEsemLrP5VxN7GdTx0jVH3Yww
1Vxl7H75Cn05ZuVsOnEzfk6jG89wB6nhSQq2+13B4ambDGmkkIny/SBJBg19beva
K1gXwf/XxfFnCGfbqDw4cF9sSktRT6rq9sICOKSxzhpj2ipK4HzNACnOkkrQDm5c
zKZxn641LPmz3QbjbBiTI5WR3KPKL2j14iDJd30OzYeHUNQSbwjFD5RmibTw5GuI
d4Zx6XRzB1X/Y86y4SMrpmbRXrKFCCtTkqJ7bwvKdFE/t0Ut4nNT5lDA3nA55Y6i
JnuIZ1miVNto4ryDIhWGkQ8bnnWhAW7aqXgR3wjMz4mdDVySy4BHjBIru1ztC3ym
Cv+Z5X6xSK3Ku3VtFPcGKLzLn8oF0OiK4C9rJkgYvSBvw/ZZPAxvmr0HFAmQlG+y
8zW33I6Iv+dCaicUWjQl9cJk1Pg1P02HmOsrkSRnWrkNDIaGRL6SrGbN8nEHrmG9
PAKRA8G/R/c1Z0WzdC7ECo7XlzFwB9UQugxiwz1bEj0X3AQjCU7qN4zbr2C2Uq2X
4VvSWRXYhuJyg3tCRw5LYSRW3okm7h19d3nTmB41zsWmNkotd9E=
=dGAG
-----END PGP SIGNATURE-----

--nextPart2294034.vFx2qVVIhK--




