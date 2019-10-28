Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE3E77B8
	for <lists+apparmor@lfdr.de>; Mon, 28 Oct 2019 18:37:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iP8xF-0007BD-SZ; Mon, 28 Oct 2019 17:37:21 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1iP8xD-0007B7-Ln
 for apparmor@lists.ubuntu.com; Mon, 28 Oct 2019 17:37:19 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 2629F5C00FB;
 Mon, 28 Oct 2019 18:37:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yivmt0fgsrmg; Mon, 28 Oct 2019 18:37:18 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Mon, 28 Oct 2019 18:37:18 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Mon, 28 Oct 2019 18:37:14 +0100
Message-ID: <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
In-Reply-To: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] AA-logprof error
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
Content-Type: multipart/mixed; boundary="===============3577893289105648269=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3577893289105648269==
Content-Type: multipart/signed; boundary="nextPart1743226.O1LxdU9Qq4"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1743226.O1LxdU9Qq4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello,

Am Montag, 28. Oktober 2019, 04:54:31 CET schrieb Jacek:
> AA-logprof is not compatible with the apparmor-kernel API, which
> causes errors with some log messages.

I've seen a similar bugreport recently - looks like there's some "fun"=20
with ptrace rules going on :-(

Which AppArmor version do you use?
Which distribution?

Can you please provide the log lines that trigger this bug? You should=20
get them with   grep chrome /var/log/audit/audit.log | grep trace
Note that the filename will differ depending on your distribution - if=20
you don't have auditd running, it could also be /var/log/messages or
/var/log/syslog. (To make things easier - aa-logprof prints the logfile=20
it uses on startup.)

Since this is most likely about the chrome profile, please also attach=20
that profile.


The most relevant lines from the crash report are:

> error
> Python 3.6.9: /usr/bin/python3.6
> Mon Oct 28 04:46:06 2019
[...]
>  /usr/lib64/python3.6/site-packages/apparmor/rule/__init__.py in
> is_covered(self=3D<PtraceRule> ptrace read peer=3D/opt/google/\*/chrome,,
> other_rule=3D<PtraceRule> ptrace read peer=3Dchrome,,
> check_allow_deny=3DFalse, check_audit=3DFalse)



Regards,

Christian Boltz
=2D-=20
"Kann mir jemand seine Erfahrungen mit dem Gigaset Router schildern.
Ich m=F6chte mit dem Ger=E4t meine Kaffemaschine Mitropa 3000+ (SW-Stand
47.11 / HW-Rev.: 08/15) mit Ethernet-Interface fernbedienen, ist das
Ger=E4t geeignet und wie mu=DF ich vorgehen?" [Eric Scheen in suse-linux]

--nextPart1743226.O1LxdU9Qq4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl23J0oACgkQxqaC6mPI
LxxIPA/9F1BL7KjIw9/iN6nO71K0qhPz+FyyQxIdY+BdZkfeB/mf4FgYagMHK8OD
5i01LSlyuRaTWgKhnNmCBiAq1MF+x+djlx5NRAAGtTxqMmioK65OOvgWPLbR/hwi
2szVg6SqbvxbEURdW+1yJlBQAElLrKH91v4ma75d4lkmSVqjhQAYeJfkVaxg5yh/
I9LwkgEyHDR2atr3pB+D7o/w3ZOOr3tmD7Y2VgXa3ZiO/weZvqmwNPbFoNtR+FF8
iLAscq+Qmj8PF4H3Szd6J1siC0+3Y7gs6bB9C1SC4n5p5Ug0u4LiVZb3g5zQZRty
iJIJSUvwfCPlUbd3jJcPyXRIKJg4i7uYeuj7nx7SoohJFPbl3CeycIkxzy3U4c2X
6Gj/Enm5B7ccBL5nJw+z+tzjoCaK50pccLlWPqysApI5nysxwqWrs9mPKRnJSdNO
kGaz7KcNRiDJgYliThnz031oq2PLEFDQaTP3T+2BVVCTib1VVYU8LDVFN3pCLJDN
XwAILksGHkKbJ00Rm7Syk4FQ5eVAtb8zmR0vD7z13GvYmBs0NVrZw0ywIeenMEEM
yv169SWuO3qn+msqIe5uVFGYWBfqa8JcUMXo2Ej1r9laXSfdoRA3KKXBXhb6Kf9y
kxHV2XSYpXkW4S+kKKGvm7Txd9vJVUfgBAgfUdCHZMmGlyo5bXc=
=1Dtt
-----END PGP SIGNATURE-----

--nextPart1743226.O1LxdU9Qq4--





--===============3577893289105648269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3577893289105648269==--




