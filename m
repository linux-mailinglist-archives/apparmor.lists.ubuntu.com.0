Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4546DB4D
	for <lists+apparmor@lfdr.de>; Wed,  8 Dec 2021 19:39:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mv1qG-0006pH-4r; Wed, 08 Dec 2021 18:39:00 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1mv1qF-0006pA-Kc
 for apparmor@lists.ubuntu.com; Wed, 08 Dec 2021 18:38:59 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id EF18C5C01A7
 for <apparmor@lists.ubuntu.com>; Wed,  8 Dec 2021 19:38:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCZvi4Z7Owfo for <apparmor@lists.ubuntu.com>;
 Wed,  8 Dec 2021 19:38:57 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Wed,  8 Dec 2021 19:38:57 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 08 Dec 2021 19:38:53 +0100
Message-ID: <3143579.6J4DOfBNSB@tux.boltz.de.vu>
In-Reply-To: <20211206215516.274310-1-georgia.garcia@canonical.com>
References: <20211206215516.274310-1-georgia.garcia@canonical.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] [PATCH] apparmor: add module mediation
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
Content-Type: multipart/mixed; boundary="===============8789937562914806564=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8789937562914806564==
Content-Type: multipart/signed; boundary="nextPart2601200.OQ7YROi5pB"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2601200.OQ7YROi5pB
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] [PATCH] apparmor: add module mediation
Date: Wed, 08 Dec 2021 19:38:53 +0100
Message-ID: <3143579.6J4DOfBNSB@tux.boltz.de.vu>
In-Reply-To: <20211206215516.274310-1-georgia.garcia@canonical.com>
References: <20211206215516.274310-1-georgia.garcia@canonical.com>

Hello,

Am Montag, 6. Dezember 2021, 22:55:16 CET schrieb Georgia Garcia:
> + * Returns: %0 or error on failure
               ^^
I'd guess that should just be   0   instead of   %0   ;-)

Note that you have 3 copies of this (probably) typo in your patch, 
please fix all of them.


Regards,

Christian Boltz
-- 
looks like you have some special code in yast for password "x", maybe I
should use the even more secure new password "y" in the future  ?! ;-)
[Harald Koenig in https://bugzilla.novell.com/show_bug.cgi?id=148464]

--nextPart2601200.OQ7YROi5pB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmGw+70ACgkQxqaC6mPI
Lxyo3w/9HMrs/C4xCGMbzeVHCYZ1/Gj919angGWRiLDUrPweSskrsQlvs1Jf62A6
ifpmPvJsxkOYw0Fr6cU+dnYWkTAL+F1V2lxm/ALmpY7rRpOuiJZMUFWulmxfhXY8
DHmlHjAtz8OaHAP3+ZfykqFFk7c2xhe09tyAwcrx1fMFNgzEgp2efqvGJ9EUGnW1
9oEKlQHDT50sUvJPDIbbJvA70WmAiW+M+jpGhtsRh5/8F4WIF5+H2c0iXpORMFqT
F1jBc/lGR02bPP7MfpbesZHpEgE6st0nuccDO0i4XC9vzYHM+vk3YNXjkTs+7rnt
5kmB4wCQDtYMlinkjGLlyMBmc+iG8D2ri1FicdMgd3I4zoGx9Sf2bZ5Xv90AmHzG
vrx/9OG4uPwQo1lgYz1/IO0fBaAGTth+LpBOsDSFamOKCBucIQtG9Ge9//MfRYqh
+cGi4yjeDjHXh1C7g5NH6rwcEukC7qz1YTd1wppYV+npeQlqwAxF/9MSxJqN1voa
qBANNYCdsK/ZFGkdOEk93xzmCbYnL6AmqFUIS62AR+8GGTKaJksHh4OdTUvhcTL/
cgH7pLgtGF+TKrDhQpp0GPfLWyqkrDngsT8VWNdgF+uiJoxJoo9SOeOkGxQNtBq9
5utXyH61nKAzB3XhG3rUNdQK5HkZvM371yiTaJ/CPmp6hlPu+co=
=OCX2
-----END PGP SIGNATURE-----

--nextPart2601200.OQ7YROi5pB--





--===============8789937562914806564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8789937562914806564==--




