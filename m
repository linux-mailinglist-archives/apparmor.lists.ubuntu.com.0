Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B91A178F
	for <lists+apparmor@lfdr.de>; Tue,  7 Apr 2020 23:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jLwEl-0007Ip-BM; Tue, 07 Apr 2020 21:58:27 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1jLwEk-0007II-09
 for apparmor@lists.ubuntu.com; Tue, 07 Apr 2020 21:58:26 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 7B5D55C011C;
 Tue,  7 Apr 2020 23:58:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZYkaRpp4m7N; Tue,  7 Apr 2020 23:58:23 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Tue,  7 Apr 2020 23:58:23 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Tue, 07 Apr 2020 23:58:19 +0200
Message-ID: <4280201.n71hg86BJg@tux.boltz.de.vu>
In-Reply-To: <20200407162210.vlnmrao7e7dd25xm@fiona>
References: <20200407162210.vlnmrao7e7dd25xm@fiona>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] [PATCH] mdns: Allow reading /etc/mdns.allow
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
Cc: ebischoff@suse.com
Content-Type: multipart/mixed; boundary="===============8883230688142271986=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8883230688142271986==
Content-Type: multipart/signed; boundary="nextPart3642764.o21d1vORkW"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3642764.o21d1vORkW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello,

Am Dienstag, 7. April 2020, 18:22:10 CEST schrieb Goldwyn Rodrigues:
> This is for custom configuration for mdns as defined at:
> https://github.com/lathiat/nss-mdns/blob/master/README.md#etcmdnsallow
>=20
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
>=20
> diff --git a/profiles/apparmor.d/abstractions/mdns
> b/profiles/apparmor.d/abstractions/mdns index 2aa6fff2..9102d27e
> 100644
> --- a/profiles/apparmor.d/abstractions/mdns
> +++ b/profiles/apparmor.d/abstractions/mdns
> @@ -11,6 +11,7 @@
>    # mdnsd
>    /etc/nss_mdns.conf r,
>    /{,var/}run/mdnsd w,
> +  /etc/mdns.allow r,

You are late - this was already added a week ago ;-)


commit eeac8c11c935edf9eea2bed825af6c57e9fb52e3 (HEAD -> master, origin/mas=
ter, origin/HEAD)
Author: Rich McAllister <Nopublic@address.provided>
Date:   Tue Mar 31 21:01:21 2020 -0700

    abstractions: add /etc/mdns.allow to /etc/apparmor.d/abstractions/mdns

    In focal users of mdns get denials in apparmor confined applications.
    An exampel can be found in the original bug below.

    It seems it is a common pattern, see
    https://github.com/lathiat/nss-mdns#etcmdnsallow

    Therefore I'm asking to add
       /etc/mdns.allow r,
    to the file
       /etc/apparmor.d/abstractions/mdns"
    by default.

    --- original bug ---

    Many repetitions of

    audit: type=3D1400 audit(1585517168.705:63): apparmor=3D"DENIED" operat=
ion=3D"open" profile=3D"/usr/sbin/chronyd" name=3D"/etc/mdns.allow" pid=3D1=
983815 comm=3D"chronyd" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D123 =
ouid=3D0

    in log. I use libnss-mdns for .local name resolution, so /etc/nsswitch.=
conf contains

    hosts: files mdns [NOTFOUND=3Dreturn] myhostname dns

    and /etc/mnds.allow contains the domains to resolve with mDNS (in may c=
ase, "local." and "local"; see /usr/share/doc/libnss-mdns/README.html.)

    Presumably cronyd calls a gethostbyX() somewhere, thus eventually trick=
ling down through the name service switch and opening /etc/mdns.allow, whic=
h the AppArmor profile in the chrony package does not allow.

    Fixes: https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/1869629
    Signed-off-by: John Johansen <john.johansen@canonical.com>

diff --git a/profiles/apparmor.d/abstractions/mdns b/profiles/apparmor.d/ab=
stractions/mdns
index 6cd842cf..89b199be 100644
=2D-- a/profiles/apparmor.d/abstractions/mdns
+++ b/profiles/apparmor.d/abstractions/mdns
@@ -9,6 +9,7 @@
 # ------------------------------------------------------------------

   # mdnsd
+  /etc/mdns.allow r,
   /etc/nss_mdns.conf r,
   @{run}/mdnsd w,



Regards,

Christian Boltz
=2D-=20
Mein Name ist Ratti. Ich bin heute Abend hier hergekommen, weil ich ein
Problem habe, =FCber das ich gerne sprechen w=FCrde.
Ich arbeite seit l=E4ngerer Zeit mit Linux und habe noch niemals einen
Kernel kompiliert. Ich sch=E4me mich deswegen sehr. [Ratti in suse-linux]

--nextPart3642764.o21d1vORkW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl6M93sACgkQxqaC6mPI
LxzjSxAAlfhlo2RBBmE4MgEt3Hk+w0LTCu/MQenyLu4KaDzICr8oOECh1J/34fX+
DhdjwYOkv/nZ5BeHQZAfgUVh3pVKd9qobBpOHU2MsVGqZ+aNuibJOwtLypREubIM
NJpPmgwV1ML0WY6ByEOrOGTn8VD+8mqy4YHPrXzJAzgbGaQeTEqUs1VlYEoESs/p
VlVA/f308pQ0re1DoY2inaTE3jMWGtQJQdBOFUpmbXJ8XacQiUaLa7gd05FGPFmN
HvxVkQy99F33vzf8TPxnjTmmQwfr6Osoth4T2LobSTngo+HZLYBhmxJ5hnmuSJ1o
DpsDgfSO+oHo8qCrFIYSZTmY8ePBcirTE3lVvKxiPF67rvFkDPPtex22gaYLTp+G
sfV0tzyt03Cjryh1C/oRykRfh9vjqiL33JVsNB70wAMuVBBUvNYzwtU7G0AGqcYn
3hh1xbl/tp4iaD7j7/XKICa9+F1cm3vd0FHJUCkTOTRrAaaoDH9sqOWCmnL1ydgU
ewGgJh2FpxP+bpSLIFLT5R6SJUu5lSYe4R4yVGeHyl+lfO4DNCr/mn3ZFZc6tyoJ
IhDJnrz7z8bJL1sS2tooG849v2/v/MT7/oeonZQR5+lb238LbY78goKxcdTlF295
xtCwQsBL4numP881tBoVqFCdQ1Knj6K9+FUVvyHMFIFA/XojJ44=
=pE4V
-----END PGP SIGNATURE-----

--nextPart3642764.o21d1vORkW--





--===============8883230688142271986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8883230688142271986==--




