Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DAF844D15
	for <lists+apparmor@lfdr.de>; Thu,  1 Feb 2024 00:40:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rVKBY-0004IJ-Rs; Wed, 31 Jan 2024 23:40:05 +0000
Received: from mail.cboltz.de ([65.21.65.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <apparmor@cboltz.de>)
 id 1rVKBU-0004HK-MS
 for apparmor@lists.ubuntu.com; Wed, 31 Jan 2024 23:40:00 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 19AEB859EA;
 Thu,  1 Feb 2024 00:40:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emlVU0xmqtwG; Thu,  1 Feb 2024 00:39:59 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Thu,  1 Feb 2024 00:39:59 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Thu, 01 Feb 2024 00:39:53 +0100
Message-ID: <19399923.fSG56mABFh@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ47MYEqxL8AYErn5rsvsTz-xCr70SyTc=P=u8k=w7cCoQ@mail.gmail.com>
References: <CAODFaZ47MYEqxL8AYErn5rsvsTz-xCr70SyTc=P=u8k=w7cCoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2204513.hkbZ0PkbqX";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] systemd AppArmorProfile
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
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--nextPart2204513.hkbZ0PkbqX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Subject: Re: [apparmor] systemd AppArmorProfile
Date: Thu, 01 Feb 2024 00:39:53 +0100
Message-ID: <19399923.fSG56mABFh@tux.boltz.de.vu>
MIME-Version: 1.0

Hello,

Am Mittwoch, 31. Januar 2024, 04:05:07 CET schrieb Murali Selvaraj:
> *AppArmorProfile-=foo*

Your syntax is slightly wrong, AFAIK it has to be

AppArmorProfile=-foo

In case you don't spot the difference: not   -=   but  =-


Regards,

Christian Boltz
-- 
And if the majority here feels mlmmj should respond in Klingon,
that's what we should consider.  As long as it uses proper MIME
headers, of course. ;-)    [Gerald Pfeifer in opensuse-project]

--nextPart2204513.hkbZ0PkbqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmW62koACgkQxqaC6mPI
LxxtYA/9HcgkSOjnnALkJ2fdy8yBISS+UHf4huotr8cO5RwPatZddsNdBP2iqR+c
Qmthl6+rIpmEnsrxIzLTratZtOUr0Dcx+6kdUCQU6A1wNYWLonRvY4gI1aL/2kaP
GXLP1dXdwIOWc2LljT7dTWVYvIl8oSrWYOMM2Lf9hejWNlV85QcIzTqZLpkYx1qa
svs/LFH2IFK9gUedfS0hOQbbCUyquojcG8qztY8NeP/zU3S9nIl7EXAasKeX+HxY
V1k56Y6FgpUY/tC7wLUlNJvkeF/nEf+yRVTMnrnfLx88vjuRTZOdcAix9Bq8U061
xgFrE0SlWhobaU2ESIMA3fc6wKyGs4TteUp3H1BMgcbps3kFqpCkMCdRf6TqWoc8
0KIwDbSXDH/zXPxjmp6zc52Q3HfUPyL3w6Dzhp1XP8g05N1VFjV7OMobWlhEzNmZ
UFh5gc4P5uHfyzxdiXTXje1SZXkXMXCQuuvDhDmVB8v42U96ge1aXFOzDQjsP+4Z
namianqhlNystOEg/VV7zJFdcv+o1scubwGjWrvQYpryqC1khovRexIZiJUctiNT
stVH75lyCoBCleZ2kbFnJ5EHR6QVVoouhNORrTS3FJYjYacebRCFD0LtIAc83NGI
jNbX+CqOIkhettdH7vLGb09eDOX/MP3M4z/ByafjdFRIWh/DvFQ=
=eX4+
-----END PGP SIGNATURE-----

--nextPart2204513.hkbZ0PkbqX--




