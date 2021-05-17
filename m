Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DE115386CA2
	for <lists+apparmor@lfdr.de>; Mon, 17 May 2021 23:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lil7v-0003NP-74; Mon, 17 May 2021 21:50:15 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lil7q-0003Lw-1v
 for apparmor@lists.ubuntu.com; Mon, 17 May 2021 21:50:10 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id AFD185C008E
 for <apparmor@lists.ubuntu.com>; Mon, 17 May 2021 23:50:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvbIrD7ki5bp for <apparmor@lists.ubuntu.com>;
 Mon, 17 May 2021 23:50:07 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Mon, 17 May 2021 23:50:07 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Mon, 17 May 2021 23:50:06 +0200
Message-ID: <2000495.NGGyWjjzmL@tux.boltz.de.vu>
In-Reply-To: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
References: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] apparmor cache dir error messages
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
Content-Type: multipart/mixed; boundary="===============8693462117629560227=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8693462117629560227==
Content-Type: multipart/signed; boundary="nextPart17254037.kLabZn1SE1"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart17254037.kLabZn1SE1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] apparmor cache dir error messages
Date: Mon, 17 May 2021 23:50:06 +0200
Message-ID: <2000495.NGGyWjjzmL@tux.boltz.de.vu>
In-Reply-To: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
References: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>

Hello,

Am Montag, 17. Mai 2021, 10:15:15 CEST schrieb mailinglisten@posteo.de:
> I just discovered an apparmor error message in the logs and I have no
> clue when this first appeared....
>=20
> "apparmor.systemd (...) Cache: failed to add read only location
> '/usr/share/apparmor/cache', does not contain valid cache directory"
>=20
> /usr/share/apparmor/cache/ actually does exist and contains a 1 year
> old subdirectory with profile files inside, as it seems.
>=20
> Is this something to worry about?

Not really, it's quite harmless.

/usr/share/apparmor/cache/ contains a pre-compiled cache, typically=20
shipped by a RPM or DEB package.

You'll notice that it has one or more subdirectories like 2cfa59e0.0,=20
the directory name is [simplified explanation] a hash of the AppArmor=20
features supported by the kernel.

In theory the packaged pre-compiled cache should match the kernel so=20
that the directory actually gets used. Your error message indicates that=20
there is a mismatch - did you install a non-default kernel?
(And BTW, which distribution do you use?)

> Since this subdir in the cache is year old, I guess it=B4s safe to
> delete?

The directory is probably part of a package you've installed [1],=20
therefore I'd recommend to keep it. (Deleting it won't break AppArmor,=20
but your package manager might start to complain about the missing=20
files.)


Regards,

Christian Boltz

[1] on openSUSE it's part of the apparmor-profiles package
=2D-=20
Nun liegen 70 Gigs en bloc darum und nix ist mehr mit LVM.
Ich k=F6nnte sie allenfalls per Mail an eine ung=FCltige Adresse
verschicken und schnell partitionieren, bevor sie zur=FCckkommen.
[Ratti in suse-linux]

--nextPart17254037.kLabZn1SE1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmCi5Q4ACgkQxqaC6mPI
LxzOjxAAlCM7hsG4nujUOuY/49/k5jOwt1LnokhBilTa0WgLJSxFPSyTN0wZj06A
xKPHlh2kU5GFVYweJBU1uYsXuCn9HQD/5QmCo6YTQ1IKAAXqLrVhxBfjy8l0eauS
KhcfCTt/uEvhY9pIJpZhlLoVNd0g0kyqBQLQIhUMtPXFw8uRIcHjwguRJnSd7DJh
3bFbkoZleeFC8jEcb5biEhbKg9RQJsBe3lSD0eu3Qv/YZrlfTgLHBQG6ctFYFEsM
G6QOnz+zykca9rZZW+6j21gE2w1UDnj11PFoXYd33zHb1aQ4c3KzTTCno7JwC52N
gGriKfmIt9vcPBRD7VLdY9nSKofhTyatgVYl3urtx98xqgHmNxffejSj0vMsjc1C
E5XMVAxpd2/tnFA9H2gxm+flfwSdmHkm7VBp5o7OlAnOp5ZLCL6ZMFvIIyL4w+j5
hMj6QZibaDAt7meTy/WuBvsajrwNXbKjpeb2Fs5kIiEjt0oeB8maCv9tAtjyJyHD
ztGuu25zhQKPJ8tqS4TvvXDpJWhX8GG94zWXKyEF0Gz2FcTYjJkLOvvgmiVEyglV
eP0U3LW6y0wHsfbPNBPlSN2yYZAW7zkiAcvYI2FXtsQrpdjjQQcVjBS9SouHr0dh
uI5vZFqhxLK52yQ27qYMsL6KzjvPPaNHNfjCXX44G6Gx6mJ0HtU=
=Jvq4
-----END PGP SIGNATURE-----

--nextPart17254037.kLabZn1SE1--





--===============8693462117629560227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8693462117629560227==--




