Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CE23F39C
	for <lists+apparmor@lfdr.de>; Fri,  7 Aug 2020 22:12:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k48in-0007Ra-3Y; Fri, 07 Aug 2020 20:12:09 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1k48il-0007RU-Cb
 for apparmor@lists.ubuntu.com; Fri, 07 Aug 2020 20:12:07 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id E88705C012B
 for <apparmor@lists.ubuntu.com>; Fri,  7 Aug 2020 22:12:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNKcavShcnV6 for <apparmor@lists.ubuntu.com>;
 Fri,  7 Aug 2020 22:12:05 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Fri,  7 Aug 2020 22:12:05 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Fri, 07 Aug 2020 22:12:01 +0200
Message-ID: <4659696.0Tsaam8APR@tux.boltz.de.vu>
In-Reply-To: <20200807190741.70738f15@mephala>
References: <20200806110540.1a67cbe2@mephala>
 <22516202-d22a-5975-93f2-fc7606e45e13@canonical.com>
 <20200807190741.70738f15@mephala>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] deny and selectively allow in AppArmor?
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
Content-Type: multipart/mixed; boundary="===============7272957699315086058=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7272957699315086058==
Content-Type: multipart/signed; boundary="nextPart6217562.69fOiX1Uyh"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6217562.69fOiX1Uyh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello,

Am Freitag, 7. August 2020, 19:07:41 CEST schrieb Jonas Gro=DFe Sundrup:
> I have one question left, when we're at it: If I do have conflicting
> directives, such as
>=20
>     /my/directory r,
>     /my/directory rw,
>=20
> which one takes precedence? the first, the last, the stricter or the
> broader?

They get added up - so in your example, you'll get rw.

As another example,

  /foo rwl,
  /foo wk,

will effectively give you   /foo rwlk,

> In case of nested I'd suspect that AppArmor will just nest the
> policies accordingly, no matter in which order they occur, right?

The rule order doesn't matter.


> On 2020-08-06, Christian Boltz wrote:
> > You could do some trickery with regexes. Annoying, but still better
> > than having to deny each and every file separately. Something like
> >
> >this:
> > deny owner @{HOME}/,  # deny directory listing of the home directory
> > deny owner @{HOME}/[^.]**,
> > deny owner @{HOME}/[^.][^m]**,
> > deny owner @{HOME}/[^.][^m][^o]**,
> > deny owner @{HOME}/[^.][^m][^o][^z]**,

Looking at this again, I noticed a bug - it needs to be

deny owner @{HOME}/[^.]**,
deny owner @{HOME}/.[^m]**,
deny owner @{HOME}/.m[^o]**,
deny owner @{HOME}/.mo[^z]**,

> I thank you kindly for the proposal, but I think I'll avoid this
> approach. ;)

Good decision ;-)


Regards,

Christian Boltz
=2D-=20
<jdstrand> [after 4 bugreports] that should be all of them
<cboltz> well, at least until there's an openSUSE kernel with stacking
         available ;-)
<jjohansen> cboltz: no, no, no, see this is why we can't upstream,
            cboltz will break everything
[from #apparmor]

--nextPart6217562.69fOiX1Uyh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl8ttZEACgkQxqaC6mPI
Lxy2LBAAhmoMNinJACaWDDWY+POA5BhQq04PisUHBw/ek8nn3PIrTV+WmB74/HdY
DiMnlc1a+YaZZwqyGuB9VCzUlTuICmI6nEUKxuFYjH6BAjmxzhnDZNFBekGJXOQF
Q0udmLZTvCZmvPoieafY95GkDI7nNOasSUkdzOg+XeFVsPgBXg8mWRXNKvHRb+fG
zj8PoJaWdj08x/cSPdMjbGBPzulTduc8g622YsmPfmIwaQIb9wPfeWLd1V36bLHe
8to/8//iIq69hCmPPbP/QEWs1D8JEcX3qmNDFsfrV9JBsEdpFlMQvolTexF3XTqK
uPyQDBi6qvlIfaCFdtonwLlE3HG1ChwRtQWldnQtTlzQ8wG6Jtc+ZOQvosfZuNSh
j/7o+bpqvuNjjOMOSZRmR575w7lqUdnzL4p0nh6pSIiNq+07axe0cRrgSocukVa3
78daCHhnflNbSnloNzEhpD0qtDeXeSut3NF9mZpWMqPQsx1C2/Za4AmMTyW1HPFh
VE2Sr6crltLpWj7Xr5P5Nmv2Z947pnQZCV+/4J0PMXrGgyhzj8YOYxgJ9tHxidTw
aroY88bV2A0KvzeqdEfJmyUuaYa5HYOC8wTXJOH1Pb5GkKPYQVN3YzMPjIC00QRr
rApGZKI6gfZhGZ2O33bmLEn3L2u30Chjy1wZShMx5VusLdwgaYc=
=LxJh
-----END PGP SIGNATURE-----

--nextPart6217562.69fOiX1Uyh--





--===============7272957699315086058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7272957699315086058==--




