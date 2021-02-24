Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 59422323C75
	for <lists+apparmor@lfdr.de>; Wed, 24 Feb 2021 13:56:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lEtiS-0004wV-JU; Wed, 24 Feb 2021 12:56:32 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lEtiQ-0004wP-NF
 for apparmor@lists.ubuntu.com; Wed, 24 Feb 2021 12:56:30 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 46BD25C01AF;
 Wed, 24 Feb 2021 13:56:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHB85G7gs9UM; Wed, 24 Feb 2021 13:56:28 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Wed, 24 Feb 2021 13:56:28 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 24 Feb 2021 13:56:21 +0100
Message-ID: <6901047.gQ41x59yMm@tux.boltz.de.vu>
In-Reply-To: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
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
Content-Type: multipart/mixed; boundary="===============4906238696027740832=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============4906238696027740832==
Content-Type: multipart/signed; boundary="nextPart1782560.tNmzakEp8Y"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1782560.tNmzakEp8Y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: TheDiveO@gmx.eu
Subject: Re: [apparmor] What are "AARE"s, exactly?
Date: Wed, 24 Feb 2021 13:56:21 +0100
Message-ID: <6901047.gQ41x59yMm@tux.boltz.de.vu>
In-Reply-To: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>

Hello,

Am Mittwoch, 24. Februar 2021, 11:17:01 CET schrieb TheDiveO@gmx.eu:
> The man page for apparmor.d mentions the "AARE" element in a lot of
> places, such as for specifying peers. Unfortunately, the man page (or
> its source parser/apparmor.d.pod) only says "AARE have special
> meanings; see below. May include VARIABLE". Further down, there is a
> terse "definition" in form of "?*[]{}" which I simply do not
> understand.
> 
> Disclaimer: I've even found and read the documents in
> apparmor/documentation/*.odt, but might very well missed a crucial
> hint about AARE there.
> 
> I can imagine that "AARE" means "AppArmor reg exp" and also found
> utils/apparmor/aare.py. Unfortunately, I'm still not clear from
> reading the Python source of aare.py about what AAREs really are and
> how they might differ from regular expressions (which ones) and if
> they include globbing or not?
>
> Can you please help out and explain what AAREs are from a user's
> perspective?

It seems the apparmor.d manpage lacks a mention of AARE at one place - 
the place they are explained ;-)

That place is the "Globbing" section. Have a look at it, it should help 
to understand the AARE syntax.

If you still have questions, feel free to ask - maybe the manpage needs 
more improvements ;-)


Regards,

Christian Boltz
-- 
...........why use Windows, if there is a door.............

--nextPart1782560.tNmzakEp8Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmA2TPUACgkQxqaC6mPI
LxwBtQ//akBD2sTfQygK1xCti8+U+Foi1ECHo9aQnfOwLSvlDQDk6sBqwYPpEajP
NASVpOOMInaPRD5KfEx9yZbcBQ3d9Hfer9COpLWEEL2AiTqC8NlKM5dv0TlMRWMj
S9j4iOPuTc42bQ87ewp6//5Ea1+PqW7T8MQ4FhCHB7W0EL7jvCvIkwqc7TMdogWc
ejV30TrwksTB6z0RB/gaCt5K57KjtFDgXDOBf5g7bYAV44e2XwOCZ+oGJEiSSSDX
VpCIRs/yqhbincX81gIA1IiyCoFjDAkUWxEidEHL+J16YVtYNzasY7rpf7prn7n+
AZDRonJDLsQsBVj1rFdG9+9NqYD/TQctY61KvZFCgx73yGMXn08pSZY4CpBTTU+2
uSeEsI5huSsgs+Xj9YDA8/fG+Ni/JzBHufjy9uj30FMlIy7z8u7r3O+mD3B9F8nu
qlv5sLJ/3alesIC5eTmVOn6gdc5i0+jCrIBb8Z2o9ZA9vmpZCfG+siRuEJBIdZJS
0355/QkEZ1blC/7/feshb1aZD/G/wLhk1Mj5cg4jMGyo2xIBJ2iHbz9aoVMz9VjI
qh9mfd9q7SahT/QjVFbyTCPVM5JHcYCdFlxgQ492X+HP2xTfhyAe/Z8Vc2l3JFY1
pPYjCtgXVSy++Te2+rWn1dteLYNsesD7HsPw2IxQrV/o8YQZHN4=
=6YkP
-----END PGP SIGNATURE-----

--nextPart1782560.tNmzakEp8Y--





--===============4906238696027740832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4906238696027740832==--




