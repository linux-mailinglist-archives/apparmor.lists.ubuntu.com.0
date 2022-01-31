Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F215F4A3F34
	for <lists+apparmor@lfdr.de>; Mon, 31 Jan 2022 10:28:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nESzM-0008GM-7P; Mon, 31 Jan 2022 09:28:44 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1nESzJ-0008GF-Tq
 for apparmor@lists.ubuntu.com; Mon, 31 Jan 2022 09:28:41 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 0EBDC5C0120
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jan 2022 10:28:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meVNZgwxMOUe for <apparmor@lists.ubuntu.com>;
 Mon, 31 Jan 2022 10:28:35 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jan 2022 10:28:35 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Mon, 31 Jan 2022 10:28:30 +0100
Message-ID: <1778775.8GRcbaBQqG@tux.boltz.de.vu>
In-Reply-To: <eca2206d-562f-a85f-ca51-01afcba63dc8@canonical.com>
References: <20220129025101.38355-1-yang.lee@linux.alibaba.com>
 <20220129025101.38355-2-yang.lee@linux.alibaba.com>
 <eca2206d-562f-a85f-ca51-01afcba63dc8@canonical.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] [PATCH -next 2/3] apparmor: Fix some kernel-doc
	comments
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
Content-Type: multipart/mixed; boundary="===============1788439721911378372=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============1788439721911378372==
Content-Type: multipart/signed; boundary="nextPart2267747.R14BWMJYFq"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2267747.R14BWMJYFq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] [PATCH -next 2/3] apparmor: Fix some kernel-doc comments
Date: Mon, 31 Jan 2022 10:28:30 +0100
Message-ID: <1778775.8GRcbaBQqG@tux.boltz.de.vu>
In-Reply-To: <eca2206d-562f-a85f-ca51-01afcba63dc8@canonical.com>
References: <20220129025101.38355-1-yang.lee@linux.alibaba.com> <20220129025101.38355-2-yang.lee@linux.alibaba.com> <eca2206d-562f-a85f-ca51-01afcba63dc8@canonical.com>

Hello,

Am Sonntag, 30. Januar 2022, 00:59:58 CET schrieb John Johansen:
> > + * @ns_name: pointer of newly allocated copy of %NULL in case of
> > error

Just wondering - should this really be   %NULL   or just   NULL   ?


Regards,

Christian Boltz
=2D-=20
> Yapp, wir hamm uns wieder lieb ;) Pinguine zeigen sich den Schnabel,
> dann geht dat wieder.
M=F6nsch ist das Langweilig.   *poppcornwiederwegr=E4um*
[> Thorsten von Plotho-Kettner und Bernd Brodesser in suse-linux]

--nextPart2267747.R14BWMJYFq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmH3q74ACgkQxqaC6mPI
LxywVBAAnlYIerLqlX8GbQrNoLvlOtrKO6CQgITdxVRlfM20WGEzkptH26CHRYS5
iPTJImqhdZXnenW66iflpsr/NcDa5L9b8z/mY27SNQqgc2OwsVFoQX5+3Sh3TIsJ
8Vyo/nw44WL3YJ58BDkHmf54yrHIHDTtB/wVDIgqNbUzOO2QbwG7M/ngGl7kgO4K
bFhJvaaUgpTpV3U1elVUjXpofV9CcGa3PWcInSnjqtU0t5IXAQ2XotgtIOXaTTJn
vlwwJcqPPjXa2cdAg+zmhnucFd3zu8a8i5B9gQQQfiAEFxfGM/MYXXMoJHLDQBMF
T3FvAGStm77i3vsNUS5gwMSegi3ZUmuhboMyzYRDb680MaAiVpldgAdKDF7FGPw0
Uw4JbgZ2/DM4Hsv7VGawpt5YWM46WJvsXKkd7aCvD7jXqgOsJ2O6OltxKyk6z4vo
Lgl6lwoDQ/q0Qx7PUuFVWhjlgmGvarhlDNy8hz9UBUpW6B+L5kyiY7294xBIDf3n
CGxYs6rUwrNWGwMG0xOpd+x4YJX4r4vKLAxnNxstNBEN+8RlxAKxsiDqJ6AdvgTn
bmFJfwCq0b6DxzLaSS/nmQXsi8BhdtJ4t7te3jM3bYWdr9IQBIaPtVy8cRzw9Jtr
Pcp2zi3b3Ip83vHmK1fObxUGhTdsQRdR7eAzhDdXjuJ9RpKt2d4=
=TXha
-----END PGP SIGNATURE-----

--nextPart2267747.R14BWMJYFq--





--===============1788439721911378372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1788439721911378372==--




