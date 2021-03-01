Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B41328E87
	for <lists+apparmor@lfdr.de>; Mon,  1 Mar 2021 20:36:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lGoLN-0006Bb-R1; Mon, 01 Mar 2021 19:36:37 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lGoLM-0006BV-3R
 for apparmor@lists.ubuntu.com; Mon, 01 Mar 2021 19:36:36 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id B96825C010F;
 Mon,  1 Mar 2021 20:36:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9gBaNcQQ5ST; Mon,  1 Mar 2021 20:36:34 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Mon,  1 Mar 2021 20:36:34 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Date: Mon, 01 Mar 2021 20:36:30 +0100
Message-ID: <1693755.NBhbg4TIZQ@tux.boltz.de.vu>
In-Reply-To: <PS2PR04MB37190144D36EBE2DB14529FFA09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>
References: <PS2PR04MB37190144D36EBE2DB14529FFA09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] File permission mode
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
Cc: Indhuja A V S <indhuja.a@tataelxsi.co.in>
Content-Type: multipart/mixed; boundary="===============5769068020381169948=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5769068020381169948==
Content-Type: multipart/signed; boundary="nextPart2412937.TDg75HRl6A"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2412937.TDg75HRl6A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Cc: Indhuja A V S <indhuja.a@tataelxsi.co.in>
Subject: Re: [apparmor] File permission mode
Date: Mon, 01 Mar 2021 20:36:30 +0100
Message-ID: <1693755.NBhbg4TIZQ@tux.boltz.de.vu>
In-Reply-To: <PS2PR04MB37190144D36EBE2DB14529FFA09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>
References: <PS2PR04MB37190144D36EBE2DB14529FFA09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>

Hello,

Am Montag, 1. M=E4rz 2021, 16:40:56 CET schrieb Indhuja A V S:
> I have the following questions regarding file permission access modes,
>=20
> a) Why multiple writes are used in "/dev/shm/* rww" and
> "/dev/shm/filename www"? What difference does it make by using
> multiple writes instead of a single write?

rw and rrrrrwwwwwww have the same meaning - rw.

Nevertheless, I'd call repeating permissions a (harmless) bug in the=20
profile. So if you found them in a profile, please ask the profile=20
author to collapse rww to rw and www to w.

> b) What is the difference between rwk and krw? I can understand that
> order of execution is different but how is it useful?

No difference, the file permissions can be specified in any order you=20
want.

The only restriction are exec rules - for example, changing Px to xP=20
would be invalid syntax. (Other permissions can be ordered as you want -=20
mrPx, Pxrm, rPxm and even mmmrrrrmmPxmm have the same meaning.)


Regards,

Christian Boltz
=2D-=20
Please, if this thread gets more than 10 posts long and delves into
anecdotes about systems deployed in army conflicts in the 1970s,
please delete it.
[gumb in opensuse-users]


--nextPart2412937.TDg75HRl6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmA9Qj4ACgkQxqaC6mPI
LxxRSQ//e9+d5B5XLQB/MaCw37yakmxDlrF8qc/SJti1uFmKh2sgi0T9K27Zdj/T
LN+m9xVCOjpbPGGi67Bl/VxDy+4RKwb8mlr79Ng6ueDNkAP4PLTgKkbB2cjHZQMz
CDPGSE+DZ72JsiqDDiiso+C6wq7+9SLI2Ck0MsKB2Y2qopjOSy+EwF3VQShuEN1r
2bnWpJlXvIg5NPxmsegGUwmILfZAlrnXN89+iDXlXBC1W0QGLRoHrMJvq2T/qXUl
HkEiFXkNa1gUJV5SPSfBKTom2rVv1PDooapk/YPMKjVP1Bp+uTr4FwLsCigB1Yh3
1CBWC5BEATz56wD8+nB5Acqxm37LBe54XK0QaTyk8R9fN9m2FqhDF+om1ygcB6zl
PTJDS/yaXGBthXPQJ76PgI617EzACYy605jxyI9tOSqvagkhDfWvobF2g3lDYiiN
GQVyoEN0OB4xtICi8bnCQKEHeMpP+9+KGFnmnlVpUe+Ureh2KtVuwpn/IrUa3XOZ
d5WNWHZIGkVtIa1Fp9+PqDPpFgjYDCW3GQiKve7Hl/KakpoEZjWuhAHkWtB2sWHZ
w6p7u/IrrqbuzvJ06XLSkc0ZCP2tCgTWeM7USnokaRXyyIflC/Uf4a/0J23xiqWG
NfyYv0AXFLZdWMz4LQbKcPr1cMNR19NUZkY2cUrMcouWnb8VnjA=
=b5zL
-----END PGP SIGNATURE-----

--nextPart2412937.TDg75HRl6A--





--===============5769068020381169948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5769068020381169948==--




