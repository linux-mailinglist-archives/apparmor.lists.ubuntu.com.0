Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329734F2AB
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 22:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRLSe-0005bi-2B; Tue, 30 Mar 2021 20:59:40 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lRLSd-0005bb-7c
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 20:59:39 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id CAD555C00FA
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 22:59:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNRd2Z7ByIfr for <apparmor@lists.ubuntu.com>;
 Tue, 30 Mar 2021 22:59:37 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 22:59:37 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Tue, 30 Mar 2021 22:59:34 +0200
Message-ID: <8394045.udUvZY7WZc@tux.boltz.de.vu>
In-Reply-To: <20210330222800.6699c3e3@mephala>
References: <20210330222800.6699c3e3@mephala>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Rule to allow chmod-operations (or reduce dmesg
	suppression)
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
Content-Type: multipart/mixed; boundary="===============0465495786750525566=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============0465495786750525566==
Content-Type: multipart/signed; boundary="nextPart6283068.bXP5IRoyRn"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6283068.bXP5IRoyRn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] Rule to allow chmod-operations (or reduce dmesg suppression)
Date: Tue, 30 Mar 2021 22:59:34 +0200
Message-ID: <8394045.udUvZY7WZc@tux.boltz.de.vu>
In-Reply-To: <20210330222800.6699c3e3@mephala>
References: <20210330222800.6699c3e3@mephala>

Hello,

Am Dienstag, 30. M=E4rz 2021, 22:28:00 CEST schrieb Jonas Gro=DFe Sundrup:
> type=3D1400 audit(1617134745.962:4981): apparmor=3D"DENIED"
> operation=3D"chmod" profile=3D"/usr/lib/signal-desktop/signal-desktop"
> name=3D"/var/cache/fontconfig/" pid=3D246265 comm=3D"signal-desktop"
> requested_mask=3D"w" denied_mask=3D"w" fsuid=3D1000 ouid=3D0
[...]
> /var/cache/fontconfig rw,
> /var/cache/fontconfig/** rw,
>=20
> in the profile I'm testing with, but that doesn't resolve it. Possibly
> because it's a chmod-operation instead of an
> open-operation?=20

chmod is part of  w  permissions, nothing wrong with that.  (You=20
probably don't need  r  permissions, unless you have another log event=20
with a denial for them.)

However, you carefully avoided the correct path ;-) - you'll need
    /var/cache/fontconfig/ w,

Note the trailing  /  which marks it as a directory (without trailing=20
slash, the rule would apply to a file).


Regards,

Christian Boltz
=2D-=20
[20:01] * mrdocs grabs a snack first
[20:01] <suseROCKs> hmm last time mrdocs said he was going to grab
        a snack, we didn't see him again for a week
[from #opensuse-project]

--nextPart6283068.bXP5IRoyRn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmBjkTYACgkQxqaC6mPI
LxyTrxAAszybYDCEe+0F8ekroXa4cVTmbVB7XcRExm8cOXO31WcIwUJhS4P0Kmr+
elGv1s9+1EKEj+jv1H4mMdnrhyDS/Lvhu+c8fXlDZpbtD4/23Vr8How3y44YAl7u
4v3rpU9a0ijSTZ1m9MVqURbsv/Zd0VduKW1YrjNvzua3dZuNYxoocLgeDVWALJEv
0hCEIg73DAoh8zcIsE8MxiiR53u/KknE5moG4HLKMHxrnOFVvRe35a+kS3/WuyC5
t1gDMuIEsUhxUTxREpvcMmEdT+oz9DUKxdFz+K1ONOqGg3G1k2hxfqu7pmvElUYz
QjeZZZXS1/de9D3Qb6Vmzx74qtIQmBItFqcsgb91oKxsFPHUph+8++VvUjGPNF7G
rBYKjLn11lOSfPIDd+s8kwQuMVdzq9HY+G5fZcGyihDjjjwh7ahwOcZBE1fkGPk1
p/EyDQ7yJtBIsz+dlfcKrja9rsbb18N6B6NNKdaOu+poIRrVvmVesSD5g6fQsG8N
I65+wkBiIugvBXtGFRUlWE6+zvTDs6M/jw+ZaDbjCNiFIokIrnr9d8+6gq0/sv9f
4C6h9McdDrQlS7T+9bguimQMUiDGF2Ubg2bT8rGvwtIPq9yNjmiwYh84ehIC1TR2
LfmjbmOOY25YUcOBKg/o5maYs4noqQFa4sPLfbNP5ds7J9bFjf8=
=WiNy
-----END PGP SIGNATURE-----

--nextPart6283068.bXP5IRoyRn--





--===============0465495786750525566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0465495786750525566==--




