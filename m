Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54A38989A
	for <lists+apparmor@lfdr.de>; Wed, 19 May 2021 23:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljTmg-0001j1-VB; Wed, 19 May 2021 21:31:18 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1ljTme-0001iu-SP
 for apparmor@lists.ubuntu.com; Wed, 19 May 2021 21:31:16 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 5ECB95C01C3
 for <apparmor@lists.ubuntu.com>; Wed, 19 May 2021 23:31:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDMOxvgbj3CR for <apparmor@lists.ubuntu.com>;
 Wed, 19 May 2021 23:31:15 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Wed, 19 May 2021 23:31:14 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 19 May 2021 23:31:11 +0200
Message-ID: <26584956.dEFYxv8rk7@tux.boltz.de.vu>
In-Reply-To: <65166ba6-2550-7596-5c74-2a3dd7255ceb@posteo.de>
References: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
 <2000495.NGGyWjjzmL@tux.boltz.de.vu>
 <65166ba6-2550-7596-5c74-2a3dd7255ceb@posteo.de>
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
Content-Type: multipart/mixed; boundary="===============2544323291322562273=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2544323291322562273==
Content-Type: multipart/signed; boundary="nextPart1656511.VWL2ksyWSN"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1656511.VWL2ksyWSN
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] apparmor cache dir error messages
Date: Wed, 19 May 2021 23:31:11 +0200
Message-ID: <26584956.dEFYxv8rk7@tux.boltz.de.vu>
In-Reply-To: <65166ba6-2550-7596-5c74-2a3dd7255ceb@posteo.de>
References: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de> <2000495.NGGyWjjzmL@tux.boltz.de.vu> <65166ba6-2550-7596-5c74-2a3dd7255ceb@posteo.de>

Hello,

Am Dienstag, 18. Mai 2021, 19:54:55 schrieb mailinglisten@posteo.de:
> Am 17.05.21 um 23:50 schrieb Christian Boltz:
> >>(...)
> >>
> > In theory the packaged pre-compiled cache should match the kernel so
> > that the directory actually gets used. Your error message indicates
> > that there is a mismatch - did you install a non-default kernel?
> > (And BTW, which distribution do you use?)
>=20
> opensuse leap 15.2 and actually I do use a non default kernel

OK, that non-default kernel explains why the packaged cache doesn't get=20
used.

> > The directory is probably part of a package you've installed [1],
> > therefore I'd recommend to keep it. (Deleting it won't break
> > AppArmor, but your package manager might start to complain about
> > the missing files.)
>=20
> I would expect a cache directory below /var and actually there is also
> a cache dir, /var/lib/apparmor/cache/ that contains just a hidden
> filed named .features.

That's an old cache location (up to AppArmor 2.12). IIRC we had to use=20
it because of the quite complex btrfs layout older openSUSE releases=20
used (with several /var/$whatever subvolumes) + the condition that the=20
cache should be available as early as possible on boot.

Newer openSUSE releases have the btrfs subvolumes simplified a lot,=20
which also allowed to move the cache to /var/cache/apparmor/ starting=20
with AppArmor 2.13. This directory should contain at least one=20
subdirectory with cache files that match your running kernel.

> What is the benefit of a pre-compiled cache in contrast to the
> profiles in /etc/apparmor.d/?

The profiles get loaded faster, which is especially noticable on boot.

The exact numbers depend on the profiles you have. For example, on my=20
laptop (with several additional non-default profiles, it's 7 seconds=20
without cache vs. 0.2s when using the cache.


Regards,

Christian Boltz
=2D-=20
> Womit erstellt ihr so eure Homepages?
mit vim *g*.  Wobei es Leute gibt, die tats=E4chlich behaupten, das soll
auch mit diesem Betriebssystem - wie hei=DFt es doch gleich - *=E4h* Emacs
gehen. <SCNR>   [> Bernd St=E4glich und Philipp Zacharias in suse-linux]

--nextPart1656511.VWL2ksyWSN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmClg58ACgkQxqaC6mPI
LxybmQ/8D98mBvQdRL4NIRTbaqVR9eO3QjKX9RarMCp8aCsHdLloEogFKAWLlDtP
aYiq8f3Y4+QqqrWxwFE6JV4iYGqByI9gF9VqszOYrDvwnca6epTqT1w164axXTQ5
UfWNarpQ+fkJ2YUQ8fpAChHv/YsSA+Z9e0X1kHUxanR+9CBrH+FC9Vy1wDhy/obM
qBMkLX7DEb0EcZET4guaHiRa0cnpq9xzJ3gVlMTmpnkXTfHtoTX4H8lSZlZcK+uD
K3VD7CZirTdJOm3SoRfxfunJcCPIvy5WX4dGiDhnbeKvj+Ei7HyC9fAWvNEsKOqK
cY3W9Z1RDjUAzaQdZeax5uhm+QkDREDlmkIaRgiNGUq6D3mxNRysRxp5vMpgugob
2k53Bwul71R/uHoG5QD4AsY6hxwFNUWh430NJa/ThMUKsf8N+N7vJgF2fxQA4xNR
pBkh/B9Q5RSHnZCNNj4lxxdJT6rZjS1YcWF7Rs1EebZFQLyLpdGZg44k8osM4nF5
SGoTQNKrC7P2r3KByVFnYkP3E33KlBE7Dvv+POs9zmW/i7zAcMBOKahefjL6oF/O
hNwXrpaJw2AFPExzMQPS4CUoX6N6qmRi0iexchi2S5Za0HL5GICHXfgQEXzP8q7Y
o9ImPG2RujzE5TboB+/TX0X98nUQjf8VEeQWGQH2YLRYzeh/Vag=
=SdYo
-----END PGP SIGNATURE-----

--nextPart1656511.VWL2ksyWSN--





--===============2544323291322562273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2544323291322562273==--




