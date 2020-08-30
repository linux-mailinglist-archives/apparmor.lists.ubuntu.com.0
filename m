Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 752AF256E22
	for <lists+apparmor@lfdr.de>; Sun, 30 Aug 2020 15:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCNmS-0006Wf-V7; Sun, 30 Aug 2020 13:54:00 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1kCNmR-0006WZ-Hy
 for apparmor@lists.ubuntu.com; Sun, 30 Aug 2020 13:53:59 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id D42B25C0121;
 Sun, 30 Aug 2020 15:53:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVmfYYYH345V; Sun, 30 Aug 2020 15:53:57 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Sun, 30 Aug 2020 15:53:57 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sun, 30 Aug 2020 15:53:53 +0200
Message-ID: <2582813.ijAbYlV0QE@tux.boltz.de.vu>
In-Reply-To: <20200828214036.772f6ba2@mephala>
References: <20200828212408.0002e474@mephala> <20200828214036.772f6ba2@mephala>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Kernel-regression?
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
Content-Type: multipart/mixed; boundary="===============7173036309341985434=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7173036309341985434==
Content-Type: multipart/signed; boundary="nextPart5498254.Rk7GcYMQuO"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5498254.Rk7GcYMQuO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Jonas =?ISO-8859-1?Q?Gro=DFe?= Sundrup <jgs-apparmor@letopolis.de>
Subject: Re: [apparmor] Kernel-regression?
Date: Sun, 30 Aug 2020 15:53:53 +0200
Message-ID: <2582813.ijAbYlV0QE@tux.boltz.de.vu>
In-Reply-To: <20200828214036.772f6ba2@mephala>
References: <20200828212408.0002e474@mephala> <20200828214036.772f6ba2@mephala>

Hello,

Am Freitag, 28. August 2020, 21:40:36 CEST schrieb Jonas Gro=DFe Sundrup:
> Ok, things get funky, I tried some arbitraty things and found...
> interesting behavior:
[...]
> Does anyone have an idea what could be going on here?

No exact idea, but some guesses: [1]
=2D did you reload the profile after changing it?
=2D did you load the new profiles?
=2D do you see any errors when (re)loading the profiles with    =20
     apparmor_parser -r /etc/apparmor.d/
=2D are the processes confined under the expected profile? Check with
     ps Zaux | grep element

If the above doesn't help, seeing the profile and the output of=20
aa-status   would probably be helpful.


Regards,

Christian Boltz

[1] I'm sorry if some of them look like "silly questions", but please=20
    check them nevertheless ;-)

=2D-=20
Whoa whoa whoa that's WAY too efficient. Using tools that already exist?
Instead of inventing a whole new system and living with bugs?
Blaspheme.   [Brian K. White in opensuse-factory]

--nextPart5498254.Rk7GcYMQuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl9Lr3EACgkQxqaC6mPI
LxxqxA//RdXaduEAv3nTrgB0/HkJay0wdSywtgTaCcFpFqu6AXdThq53yffDqsEm
S0jQqK/ilx2675LUVT3TFcqqMta7+Sd+ngjJgW6y6paE+555qt0JXoNc22E+HVhC
heaX7LM1qlUEPekdUNwb4rwXZg9JUsgSjYbBLk66gJm6H8wTh+qLu/2k1xZ4ar6S
RMZeOaLAkdOkn3t3SYUNPJHVbrWG8MyS2xu4QB76naYVPb1cqgCJkFoaFrdgeKJS
rTEnv3lAKLRlkmPaBG6KyKfOwS2rfLQXEegey5xvOJ61louv4wCIGlkJLy3h7GcH
AYvyKN/bxEa+FEp35vUdLQtVQL1VUpM38xRAi2Qzn7sOaZP8I/AoyQdzQa3ALod5
Ken5g+AHtTHoEgBzDMhTgF64pm3l48sV2NF1nT1DQQPs34Hoo8hJ3w7Rz/9DYp7e
Fse6rgc1PmYiMsCjo5PVsrayg16DfCXdv/4SYbAw1csTta7EbosXgnnF4RcVEMQP
vyNkflWpH86D6Ocxb2/DDQhhur3EpHjUu6Sxa2AJB/l2Wg61y5sXkSBM+TQVd58q
AdAymmNjgIujcqmC6u5pNrXmzaHFPg6gE8FcC7zNBdCogjApxGraAN/W0FG3fIa2
NIKFoUY5RTwdeG8x/gLtnQDuCP/6pMqFAJdeybm/tDXGVUaNCww=
=/vOe
-----END PGP SIGNATURE-----

--nextPart5498254.Rk7GcYMQuO--





--===============7173036309341985434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7173036309341985434==--




