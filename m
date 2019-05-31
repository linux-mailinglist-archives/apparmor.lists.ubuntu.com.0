Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5131579
	for <lists+apparmor@lfdr.de>; Fri, 31 May 2019 21:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hWnNS-00017K-G5; Fri, 31 May 2019 19:39:46 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <jamie@canonical.com>)
 id 1hWnNP-000170-UZ
 for apparmor@lists.ubuntu.com; Fri, 31 May 2019 19:39:43 +0000
Received: from 1.general.jamie.us.vpn ([10.172.64.50] helo=iolanthe)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <jamie@canonical.com>)
 id 1hWnLV-0001dC-Pt; Fri, 31 May 2019 19:37:46 +0000
Date: Fri, 31 May 2019 14:37:42 -0500
From: Jamie Strandboge <jamie@canonical.com>
To: Ian <apparmor@zestysoft.com>
Message-ID: <20190531193742.GL24724@iolanthe>
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
 <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
 <20190530190434.GA30663@horizon>
 <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
MIME-Version: 1.0
In-Reply-To: <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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
Reply-To: Jamie Strandboge <jamie@canonical.com>
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============8311724721173136096=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============8311724721173136096==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lZZ4ablUVnt2XgAh"
Content-Disposition: inline


--lZZ4ablUVnt2XgAh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 31 May 2019, Ian wrote:

> The only thing outstanding is some trouble I run into after the initramfs
> chroot transition but before the apparmor service starts:
>=20
>    May 31 12:10:55 1546-w-dev audit[5162]: AVC apparmor=3D"ALLOWED"
>    operation=3D"exec" info=3D"profile transition not found" error=3D-13
>    profile=3D"init-sys
>    temd" name=3D"/usr/bin/unshare" pid=3D5162 comm=3D"(spawn)"
>    requested_mask=3D"x" denied_mask=3D"x" fsuid=3D0 ouid=3D0
>    target=3D"/usr/bin/unshare"
>    May 31 12:10:54 1546-w-dev audit[5004]: AVC apparmor=3D"ALLOWED"
>    operation=3D"exec" info=3D"profile transition not found" error=3D-13
>    profile=3D"init-sys
>    temd" name=3D"/usr/bin/unshare" pid=3D5004 comm=3D"(spawn)"
>    requested_mask=3D"x" denied_mask=3D"x" fsuid=3D0 ouid=3D0
>    target=3D"/usr/bin/unshare"

Notice it is /usr/bin/unshare here, but you mention below that
'/usr/sbin/unshare' exists, but what you pasted looks correct. Is this a ty=
po
in the email or somewhere else?

> The /usr/sbin/unshare profile exists:
>=20
>    root@1546-w-dev:/etc/apparmor.d# cat usr.bin.unshare
>    profile usr.bin.unshare /usr/bin/unshare
>    flags=3D(complain,attach_disconnected) {
>     =A0=A0=A0 #include <local/whitelist>
>    }

--=20
Jamie Strandboge             | http://www.canonical.com

--lZZ4ablUVnt2XgAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETCDAa12L3miIVNKKUdvcWMxVlXMFAlzxgoEACgkQUdvcWMxV
lXO2vg/8D50KLZOCNhGo0n3AP36Kj8w3xI+WZXXII8rf9LobiBHZYkV5dS02h6Tj
6nVBd7SGy7nBy7cxMb1CfJEgo60DmrDjIC4gQKy/0CnR2Z1yC5kRFBUqPJDEWn58
ErV5yvnxJlVOIEJGV2Dlu1++9YN3d4ENspcvArES1xBIPXkEQqCqyH21pRZ1Fpbs
0AIKduwmxqigQUu1CMPvf/VnuOXqSNqS9dtAGFRB1uC8qGp9Ej4vFIDMgK557fh5
XZPe1XmghrUSpOOTATYC3gV8lQPmAxGfYZxH/e2AjGdcDDEESlsRzjlmd9sRO6zr
HhulEIkvVqOB8Wjod5X3PJ6WdI5RaJ7ANNlT+ERGhVW9PSNpI6YrEgIYS6jtRFg4
xu2j+lfarrVJe6VV0vppDyhPCuZ2gQvXk261MBKn1efVQRxDZ0u2nhL2t0Pxv5Nu
If7KX/WGS77k4MA/g1g9OEf8R5A2Chd6o3JLLf7DBfi5jsgW2qwXI6l8Qi7PRH6t
YK3cp1Sa0bC+JsUZsDBJ2iL+b8j754uK+NHXJYzmp/3LUsBY87VOtL4l8ZKM4f3f
pRl334AMVTOp4vy+ChSgoUsjgfKY+xlZFYc+6VmUOSYivzo/u/oeStF+PNKF6n6K
1/MxtBcMEJLXK71Vu9ccGqks+Du/a1KSwgze0zlXpRueOU6q00k=
=8dS6
-----END PGP SIGNATURE-----

--lZZ4ablUVnt2XgAh--


--===============8311724721173136096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8311724721173136096==--

