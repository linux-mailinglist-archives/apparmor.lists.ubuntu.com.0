Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F823D9CF
	for <lists+apparmor@lfdr.de>; Thu,  6 Aug 2020 13:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k3dvh-0004b6-3I; Thu, 06 Aug 2020 11:19:25 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1k3dvf-0004az-Lx
 for apparmor@lists.ubuntu.com; Thu, 06 Aug 2020 11:19:23 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 2D3665C00E3
 for <apparmor@lists.ubuntu.com>; Thu,  6 Aug 2020 13:19:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3eXkIq5N5YZ for <apparmor@lists.ubuntu.com>;
 Thu,  6 Aug 2020 13:19:22 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Thu,  6 Aug 2020 13:19:22 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Thu, 06 Aug 2020 13:19:18 +0200
Message-ID: <4378726.9qQuxWz8ge@tux.boltz.de.vu>
In-Reply-To: <20200806110540.1a67cbe2@mephala>
References: <20200806110540.1a67cbe2@mephala>
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
Content-Type: multipart/mixed; boundary="===============7287466668763312156=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7287466668763312156==
Content-Type: multipart/signed; boundary="nextPart4902062.hpCz76mtWx"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4902062.hpCz76mtWx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hello,

Am Donnerstag, 6. August 2020 schrieb Jonas Gro=DFe Sundrup:
> I would like to generally disallow acces to the owner's
> home-directory, but then selectively allow certain paths in it, for
> example firefox may rmwx ~/.mozilla and subfiles/folders and write
> things into my downloads-folder, but should not have
> access to anything else.
>=20
> So I'd like to do something like
>=20
>     deny owner @{HOME},
>     owner @{HOME}/.mozilla rwmx,
>     # ... other selective whitelistings
>=20
> Unfortunately, this doesn't work, because (if I remember
> the documentation correctly) deny-directives are subtracted from the
> allowed set after everything else was applied, so the deny-directive
> above would effectively overwrite the allow-directive.

Correct.

Let me start with a simple question - do you have any rule in your=20
profile that _allows_ access to the home directory?
If not, you can simply drop the deny rule, because AppArmor denies=20
everything that isn't explicitely allowed.

> A solution is to explicitly list any paths besides ~/.mozilla for
> deny, but that is quite cumbersome and error-prone if one would like
> to achieve a tight security net as well as creating a very extensive
> profile directory, as every file and directory not allowed has to be
> listed explicitly.

You could do some trickery with regexes. Annoying, but still better than=20
having to deny each and every file separately. Something like this:

deny owner @{HOME}/,  # deny directory listing of the home directory
deny owner @{HOME}/[^.]**,
deny owner @{HOME}/[^.][^m]**,
deny owner @{HOME}/[^.][^m][^o]**,
deny owner @{HOME}/[^.][^m][^o][^z]**,
deny owner @{HOME}/[^.][^m][^o][^z][^i]**,
deny owner @{HOME}/[^.][^m][^o][^z][^i][^l]**,
deny owner @{HOME}/[^.][^m][^o][^z][^i][^l][^l]**,
deny owner @{HOME}/[^.][^m][^o][^z][^i][^l][^l][^a]**,

This will become terribly scary and unreadable if you need to handle=20
more than one exception.

Needless to say that the recommended way is to write your profile in a=20
way that you don't need deny rules ;-)

As a sidenote - instead of "deny owner" consider to use a plain "deny" -=20
when denying something, not using "owner" makes the profile more=20
restrictive.


Regards,

Christian Boltz
=2D-=20
P.S.: In der kommenden Version sollen die besten Eigenschaften von
Windows CE, Me und NT vereinigt werden zu "Windows CEMENT". Wenn das
mal nicht'n stabiles OS wird. ;-))))) [Ratti in suse-linux]

--nextPart4902062.hpCz76mtWx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl8r5zYACgkQxqaC6mPI
LxwBAA//Zpi4zqTKrYqOw85WP3b6tilYwLLFaV3OnKJcwJPjgy99u7GCF6kcdH7Z
5By8COX/nVU6kVvChe4D42ck0X030agJkyt+dt1JOaJTtTNmUtarZGU5r/Up3Zlj
fWmddj5zOvS7qI0re+F39TaB+NQwLZJq+qgYyyxB6bGnKv1gm/IRB5dnDcKjlyj3
1jY2nh48jmIKHsAEBZfKSHaDCv6vMfBUaMbFa/EI81nqJy2kafiwxATGVfGCebJS
GWzKxhNFq9dlqJktIIprQZ6GxWffNXew5QFNRoUG5wWB28rUhrn0h30GkbiBHUxt
raSkQxhRzT1Y1PjooUeh5UItSyn3+oes6GNo5B0ve7dDu7dqO8Gq5p5ABjQKuhiu
Yq2EDXOCVfDlBfsRF6WFnmHEo22hhV1JpGxW0NsbvWNcClHBJLWjpHW0FyVR1qTn
a8lqSbFg/co1l+akopdJjCL0ciS+aCBavTcA5OSH76F46BkAzB5mgigN8KpvnpWQ
BGJVrmm7/plze2P8A9Q0ULQ4mAayUhcV6R6g4MGaOR1Fg7mlkayvblIgsaWtcJFX
5IsWSwP3ssZyCeKKNq6UCnfTCmeOot7tSGMZOwPTZmQqlpGLXxfhZ0R0QWzMg64W
s9Nq/QnikrdgnqJ1n2cK7vl3uh3r286OPgC5/0TR1m30NB/0kjc=
=SZw6
-----END PGP SIGNATURE-----

--nextPart4902062.hpCz76mtWx--





--===============7287466668763312156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7287466668763312156==--




