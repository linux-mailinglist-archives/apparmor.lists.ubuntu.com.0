Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 258BF328C2A
	for <lists+apparmor@lfdr.de>; Mon,  1 Mar 2021 19:46:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lGnYs-0003SE-OS; Mon, 01 Mar 2021 18:46:30 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lGnYq-0003S7-Ij
 for apparmor@lists.ubuntu.com; Mon, 01 Mar 2021 18:46:28 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 013C15C01C0;
 Mon,  1 Mar 2021 19:46:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcVIC0dh3d76; Mon,  1 Mar 2021 19:46:25 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Mon,  1 Mar 2021 19:46:25 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com, TheDiveO@gmx.eu
Date: Mon, 01 Mar 2021 19:46:24 +0100
Message-ID: <3187709.5nqBFa1VBs@tux.boltz.de.vu>
In-Reply-To: <trinity-4db11edf-0285-4025-9734-e819316c1388-1614587672082@3c-app-gmx-bs29>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
 <3193579.oVCXLik4gb@tux.boltz.de.vu>
 <trinity-4db11edf-0285-4025-9734-e819316c1388-1614587672082@3c-app-gmx-bs29>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] What are "AARE"s, exactly?
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
Content-Type: multipart/mixed; boundary="===============5418009987143574923=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5418009987143574923==
Content-Type: multipart/signed; boundary="nextPart4925681.T34NKv1oFC"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4925681.T34NKv1oFC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com, TheDiveO@gmx.eu
Subject: Re: [apparmor] What are "AARE"s, exactly?
Date: Mon, 01 Mar 2021 19:46:24 +0100
Message-ID: <3187709.5nqBFa1VBs@tux.boltz.de.vu>
In-Reply-To: <trinity-4db11edf-0285-4025-9734-e819316c1388-1614587672082@3c-app-gmx-bs29>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53> <3193579.oVCXLik4gb@tux.boltz.de.vu> <trinity-4db11edf-0285-4025-9734-e819316c1388-1614587672082@3c-app-gmx-bs29>

Hello,

Am Montag, 1. M=E4rz 2021, 09:34:32 CET schrieb TheDiveO@gmx.eu:
> What might (still) be left are the grammar definitions for FILEGLOB
> and AARE; are they actually the same or is AARE the "superset" of
> FILEGLOB due to it allowing for VARIABLE? If FILEGLOB and AARE
> actually are the same, would it make sense to then boil them down
> into a single grammar element, preferably AARE? Why AARE: because of
> VARIABLE, to distinguish from "plain" FILEGLOB.

I'd say that FILEGLOB and AARE are very close from a user's point of=20
view, but there are some technical details under the hood (and "funny"=20
things the syntax allows, but that qualify as "please don't try this at=20
home" ;-) so we probably will keep them listed separately.

One of these details is that variable expansion is done first, before=20
doing any plaintext or AARE matching, so strictly speaking variables are=20
not really part of AARE. However, from a user's point of view this=20
doesn't really matter.

> In consequence, it would also help to specifically reference the
> "Globbing (AARE)" section from the "Format" section:
>=20
>   AARE =3D ?*[]{}^ See section "Globbing (AARE)" below for meanings.

Good idea.

Submitted as https://gitlab.com/apparmor/apparmor/-/merge_requests/715=20
(includes the changes from my previous mail).

> Now, that begs for expanding on AARE grammar, which admittedly is a
> gory issue, try finding a proper globbing grammar :/
>=20
> But one important aspect here is that contrary to (sh?) range negation
> "[!]", AppArmor uses [^] similar to typical regex'es.

At least in bash, both   ls [^p]*   and   ls [!p]*   work.

> Another question here is: does AppArmor AARE explicitly support
> character classes, or is this an undocumented and un-guaranteed
> side-effect of the Python-based implementation of the parser?

This is a side effect of the python implementation, which is "close=20
enough" to what apparmor_parser does, but not exactly the same.


Regards,

Christian Boltz
=2D-=20
Infrastructure is, by definition, boring. Whenever people in Infra
have an interesting day, somebody is going to write a postmortem.
[Kris K=F6hntopp in
https://plus.google.com/+KristianK=F6hntopp/posts/MBYz6YRNWQ5]

--nextPart4925681.T34NKv1oFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmA9NoAACgkQxqaC6mPI
LxxhgRAAicUz9DSDGii4ZrPQ+u4pAxQGpK8qb72z/RvveWIvSE2v0jAtGhs1/wXi
1R8XHDejWZ1KjnxQE9oJ1CfrdZ1rWHhALsBFe9dT9pwE7SO3Kj8mnN8F4iSLbXak
fJYD2cFaN8eYh8r3pKtZ6mvYwyyEg41yYXN9GJ5/S0JAC8Oc/ZJzoSPNNj35KcE/
CRpFBehndWbzySDfgizHtMmuDZBo9UJ+C2O7HOZY8IPPzF2SHs3IataBiGG47SzG
OwWk+b6L4zzyDlO6mJ8okKlIPS8Qkwomp80b9QBEF1je6VOg/ioCsGQH+1wZpXgZ
8OZuU07lDr497+XWQOXoi4YimEy15k6SjqgtWuTEkQBSxH8oCJl3nVrldwKv8imZ
IedN3dpzUzRPVkWx6GPaZ9u4OpNhwLMd13HWvzv6fkXBLgA4rsOSTx3QBPbX90yu
FvZQdtwIXygQSTa18re9ZzPSDlu7Anz6CfjaoDXObvsECiGxuGpcNcFysWiTD+RB
GhO4c0Z2u69ryqWuLoZh/wzI1SncD1QJZBNXgCrA82B9RzcUaqe3vTnKYEa8GTm8
8jmZB5e95uTls5irfK8opGduOswEDFUo3bqU1nnlbyvJCjTMd9r4vvqv0ZMtVm2W
Ctd1eB6nC7uP5n7IO/PMpLulJg1scx4yjhKc84bTP3SiB35t3/c=
=Gnxo
-----END PGP SIGNATURE-----

--nextPart4925681.T34NKv1oFC--





--===============5418009987143574923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5418009987143574923==--




