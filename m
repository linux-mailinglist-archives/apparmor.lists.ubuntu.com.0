Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A2157EB5
	for <lists+apparmor@lfdr.de>; Mon, 10 Feb 2020 16:24:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j1Aug-00039m-TJ; Mon, 10 Feb 2020 15:23:54 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1j1Auc-00037g-5A
 for apparmor@lists.ubuntu.com; Mon, 10 Feb 2020 15:23:50 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 660C8160062
 for <apparmor@lists.ubuntu.com>; Mon, 10 Feb 2020 16:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1581348229; bh=w6LzbIbydI5hrwL2OmGGFcErkrYwEkDQ0CBpdw6eY7c=;
 h=To:From:Subject:Autocrypt:Date:From;
 b=cBtinjyVoFavsmrG5Abj6tb5B0qig4YnQCBrkXkhfXSa0NQmz+ek7PxqKOFkNvhev
 thPwyjMwZlJvhl1SZpVv1eh0TRx3E+Ql7BATCnhSN+sr4hXHKPm+dKP/vXx9coivgW
 3oJAkRG9Cdt3LvhKD0RsddwKwiHJf+1vNe6WvpDgEHgr6yb8KKdJqdboZ3w4h0IkmK
 mEguPAgTx8VpxmWLH3xq/cydtqURNObJHWrbkhzk1iq+tC+6zZeECuMROmqaVcVQS3
 zw8lY7UtrNUhFrjnPwnwSlyhFECJ7eLvsEPbIULr2w6i5pLZifDt6yAQWEUrWXzYAl
 J3VGXdmwnuzJg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48GV6r6Lvlz6tm7
 for <apparmor@lists.ubuntu.com>; Mon, 10 Feb 2020 16:23:48 +0100 (CET)
To: apparmor@lists.ubuntu.com
From: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
Autocrypt: addr=mailinglisten@posteo.de; prefer-encrypt=mutual; keydata=
 xsBNBF5BcpoBCADZb0mLAIGCnJ+D3dmaBnQSjC2Ygb3X1m84EFS5gRO3WcMiuiWSlyHzg3ak
 TPWvKKZhdyQZMKDKZ4b3T57MEOR6Zsp7PH7WOViZc4wLvTdoxZJztmxqCJ0plRNnr09Gmhjg
 1Xfj3NWRW4ulZVHlceXFOQIxj6QyDiDMxkO/qJ5FJM9azMrrOAutaLPVCpHsYKBDvga4XxS1
 pRnKycglBCvKXtpIV71lqHstXpzJ8zGw7OMkgfstdDxfNR1gGT5HyEOzuQRO1NbLYmpy3mDA
 yWp4DXqKd7J4tnrgBcTeItotRIeORPxOQvgCIE0F4L3WRLR90xd2iWuH2Jir/l9lhWIrABEB
 AAHNMW1haWxpbmdsaXN0ZW5AcG9zdGVvLmRlIDxtYWlsaW5nbGlzdGVuQHBvc3Rlby5kZT7C
 wKsEEwEIAD4WIQQAbPcp4hwIbwKI3HXmcUJQpV5BogUCXkFymgIbAwUJEpyNAAULCQgHAgYV
 CgkICwIEFgIDAQIeAQIXgAAhCRDmcUJQpV5BohYhBABs9yniHAhvAojcdeZxQlClXkGiLVYH
 /0nPxv4g5IJ88ETm5rtNVvZ08RURd3vwhu/A3noV2savxHgrMElgp9qGKiLAwM+0Dd5aWIqw
 bAkuHWFmXc/l+tl3lNjsJUET8oaY6AUfDAD64qbea3guvAWBfQTWhvs5hiqjFE7CjTLIQtLj
 aBasv/nOOnKIJM6b36i3hm/YPwBTp54IjsxWVxwvLIDRuL90g0uICObTnJWEXFEeIgErxYIX
 f+kJTHYKNJGFQQzQK0XRTiiIx8p1mQ7SEh7xWoT9EvLcjTtu366jhLh8tm1eVa09RyTrN/xv
 aNMLvfMl5FJbLBEV989RqAMm/NliYUkhBZPL3ezyLQ8hG2i83+22HU3OwE0EXkFymgEIAKnT
 kwIHCrqx2JJCWnHwtXsi38ur+19vxg9W0a+cNqGx7E664YW24ZMqrQqjCn/+Z0ntji404L/T
 dRHyM9AnABRcL+yxQZXXUa6GWdtgbkDQg0dwsVljv8GruU2FLDqBuUgekmklniQq8T7YgOwX
 UylKUFgszZ4Ub1X6vCHtQHOzoByAmlyXquRIKbn+qP7cI3qvLJ2IE/QOzrD3mMEd7IDwEpbF
 nX1bOJNIc3GctjuBs7hJWumRRQvUzjXV3em+V5HxVluiNzGcn+UXnYUAwEfmwXEFX4iVPZos
 AIHpDjN+DuKFbmaQCuyWR/9MeB1pYCn54y/88Nf6OBabwvi7JsUAEQEAAcLAkwQYAQgAJhYh
 BABs9yniHAhvAojcdeZxQlClXkGiBQJeQXKaAhsMBQkSnI0AACEJEOZxQlClXkGiFiEEAGz3
 KeIcCG8CiNx15nFCUKVeQaL6EQgA2TygMXibRRjk2Sbb3BWVzF96m4xa8zbaBrQu2n7JyXJU
 afeKcpfWphK9b9VETHp3wQDSwUjxfiqd8HKC4cPf82TwgSSIE6AXe8tsupqvXEMPB+YD1Jg0
 g2PsK7zv20fIDL+UXO9HqobWRq2jhyOmi6L81MZPA4+ilA4NlRdq/g9Xn2+hn5E0vmQ2fME/
 vOKUUivprerJmaJ1TNPdCANcnkM+aE/GpOxopHN0dWjrTR175e4ua9yc7rhzn+wXl0nTKKr3
 zmMsfhwJ0opNtiATJRiyPBi0HICbCMuoXRNQKl3eLYCAaZnxxg9iq7/3QdYwurUimm1zCe3+
 KkQQMhUUYg==
Message-ID: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
Date: Mon, 10 Feb 2020 16:23:42 +0100
MIME-Version: 1.0
Subject: [apparmor] Accessing DMI data!?
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
Content-Type: multipart/mixed; boundary="===============7586110818812636168=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7586110818812636168==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qmyBeDUXiS2DLH9TDEQfQL7JUZB7N4Krh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qmyBeDUXiS2DLH9TDEQfQL7JUZB7N4Krh
Content-Type: multipart/mixed; boundary="gbglWWNiL4YilwnYau3uXQfGqPPzIesFg"

--gbglWWNiL4YilwnYau3uXQfGqPPzIesFg
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

hello,

i just discovered, some apps desire access to DMI data, precisely to
/sys/devices/virtual/dmi/id/

In the case of audio software i can understand it may need to know on
what hardware it runs.

but a web browser? why would a webbrowser need to know the bios version
or computer model name?

the one who really benefits from such information is a possble attacker,
thus for a web browser i would deny access to this data.

what do you think?



--gbglWWNiL4YilwnYau3uXQfGqPPzIesFg--

--qmyBeDUXiS2DLH9TDEQfQL7JUZB7N4Krh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEAGz3KeIcCG8CiNx15nFCUKVeQaIFAl5BdYQACgkQ5nFCUKVe
QaJQkwgAls0ScSRI+tLm4MfPdjUco/T28/rUAkQ0mLMcNf1hEazXJzG2C5VgTpl6
P0f/Hszl3bBXdO1Yn4wfkFQlZOMsgzAnwLrUIx3DxHJQ9KsP0PZEqx6JkNdyZT8y
yotc3oEyglLQBiievBzxAvZpwwpUb+DzqcP3GaRHtioHj69Qx3lEAS+2w6igBJDX
rB1gWYXS6MTaf42b6zSs7nKDGepdyJ8bJHPuqeBvzLPKNu7/7PJ9UxTsOwQCya/s
j13L6fIzSjcoiW58FoHYLTpZ6fbLPWTxQ2nSg8ddnms2By4IkeGlNzW+E3HYn/j0
LdSFHfIqlbeko0kG0Io8zKqglNgn2Q==
=UR7f
-----END PGP SIGNATURE-----

--qmyBeDUXiS2DLH9TDEQfQL7JUZB7N4Krh--


--===============7586110818812636168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7586110818812636168==--

