Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA6842EC
	for <lists+apparmor@lfdr.de>; Wed,  7 Aug 2019 05:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hvCix-0007NQ-M3; Wed, 07 Aug 2019 03:34:51 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1hvCiw-0007NK-Dr
 for apparmor@lists.ubuntu.com; Wed, 07 Aug 2019 03:34:50 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <john.johansen@canonical.com>)
 id 1hvCiv-00007V-Jy; Wed, 07 Aug 2019 03:34:50 +0000
To: Mikhail Morfikov <mmorfikov@gmail.com>, apparmor@lists.ubuntu.com
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
 <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
From: John Johansen <john.johansen@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>
Date: Tue, 6 Aug 2019 20:34:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
Subject: Re: [apparmor] Question about "Failed name lookup - disconnected
 path"
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
Content-Type: multipart/mixed; boundary="===============7575153891705467151=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7575153891705467151==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="NMesqhmqCU6gbPMuWz9JfOHFB4y4A8wlm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NMesqhmqCU6gbPMuWz9JfOHFB4y4A8wlm
Content-Type: multipart/mixed; boundary="fC0wiNHlkTnoiraowifEvtzGY0EDbFvtl";
 protected-headers="v1"
From: John Johansen <john.johansen@canonical.com>
To: Mikhail Morfikov <mmorfikov@gmail.com>, apparmor@lists.ubuntu.com
Message-ID: <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>
Subject: Re: [apparmor] Question about "Failed name lookup - disconnected
 path"
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
 <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
In-Reply-To: <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>

--fC0wiNHlkTnoiraowifEvtzGY0EDbFvtl
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 8/6/19 7:36 PM, Mikhail Morfikov wrote:
> On 07/08/2019 00:24, Seth Arnold wrote:
>> - run both processes in the same filesystem namespace, so files have n=
ames
>>   that are meaningful to both
>>
>=20
> I though they both run in the same filesystem namespace.=20
> It's just /usr/sbin/deluser which executes /usr/sbin/userdel .
>=20
> Here are the two profiles:
> https://pastebin.com/raw/8cDyVh8J
> https://pastebin.com/raw/Etxm2h88
>=20
>=20

info=3D"Failed name lookup - disconnected path" tends to happen when the =
applications
are in different mount namespaces, and an fd is passed between them, eith=
er through
inheritance or explicitly over a socket.

It does not guarantee that it is due to the tasks being in a separate mou=
nt namespace.
Looking further we see

name=3D"apparmor/.null" says that it is an fd that was inherited and appa=
rmor did a
revalidation on it and the access was denied so the fd was duped to a spe=
cial null
device files instead of out right closing it (there are good reasons for =
doing this).

So you will need to look back in your log for an apparmor=3DDENIED messag=
e, with
operation=3D"file_inherit" that should give you the actual file in this c=
ase.

I should note that on newer kernels we don't generally audit apparmor/.nu=
ll so
you will only get the file_inherit denial logged.


--fC0wiNHlkTnoiraowifEvtzGY0EDbFvtl--

--NMesqhmqCU6gbPMuWz9JfOHFB4y4A8wlm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7cSDD705q2rFEEf7BS82cBjVw9gFAl1KRs8ACgkQBS82cBjV
w9hdyhAAstjRWeuI60JGG3+3VOyT7N9s1GngLjrgJQy9Am1j37QfGEy966rXElCt
TXPwqfY1a93MOhJGEGkfIFvp2/GfNgAav/PSQn4rou7BMb/eIhQ6HDBNGDbXocVE
PWShyaTvRTg3eahJTnHliGManv0uzTUap2LgMVOGgypVwsLNVglERrZjvflYKtUh
r3jcUG/iROF53jQqiYpzK8ZRqJwK3YsIqf1yqYsMhOZig423EwIpef8frAbGhyce
z8BoBca+vvDL6yQnATVqzMwI0OXrj/ua4JBsf4CWbcytJVhZ4fBvF3BHHiYYm46m
V4S5M2DN2Vof3no4aSm/UqZM19lZ4aPCvMkK1I0YUuT5BhXxnEjpafhopkwAzOJ3
mQZshhuA6PXaexHecJXufqhGPauxbSGSeF4pII8NK5RpTy8Zky3gHymbBih+FdGn
NQU1zPVU3H6aGFGnQvdmZdtKb/ElNUfkV9aPk4HUSLpittZ4gAzivp1AWXembJb+
wZZYBogzxxpwCZUdqo5wexdkY3D7HXurijXRAWXDuO4lBgmNQGlWkffrJWNoczP5
NNSSN+v0gR3mM7EU9b9qsKJcf6uRxxnYgZwVZRig1VDjPmoaB5aFZXBiaLybYHFi
eMG4KX4VRwpy6EKjklzucGyvrBR7oUFneaxEA80PVdDfUoTmSwY=
=h7RG
-----END PGP SIGNATURE-----

--NMesqhmqCU6gbPMuWz9JfOHFB4y4A8wlm--


--===============7575153891705467151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7575153891705467151==--

