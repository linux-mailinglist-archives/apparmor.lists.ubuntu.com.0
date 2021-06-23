Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 458363B1125
	for <lists+apparmor@lfdr.de>; Wed, 23 Jun 2021 02:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lvr64-0002sF-0W; Wed, 23 Jun 2021 00:50:28 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lvr61-0002s8-8y
 for apparmor@lists.ubuntu.com; Wed, 23 Jun 2021 00:50:25 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <seth.arnold@canonical.com>) id 1lvr60-0004us-Od
 for apparmor@lists.ubuntu.com; Wed, 23 Jun 2021 00:50:25 +0000
Date: Wed, 23 Jun 2021 00:50:23 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210623005023.GA3015297@millbarge>
References: <CAMhqiMoZbABJ5yRL4O8tN14ur0H+2cCXP=g00QgPSjuPmN0Z0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMhqiMoZbABJ5yRL4O8tN14ur0H+2cCXP=g00QgPSjuPmN0Z0w@mail.gmail.com>
Subject: Re: [apparmor] apparmor is not getting started
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
Content-Type: multipart/mixed; boundary="===============5274340662081716058=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5274340662081716058==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 12:56:10PM +0530, Ratan Gupta wrote:
> root@abc:~# systemctl status apparmor
> * apparmor.service - AppArmor initialization
>      Loaded: loaded (/lib/systemd/system/apparmor.service; enabled; vendor
> preset: enabled)
>      Active: inactive (dead)
>=20
> *Condition: start condition failed at Thu 1970-01-01 00:00:14 UTC; 51 yea=
rs
> 5 months ago             `- ConditionSecurity=3Dapparmor was not met*

Hello Ratan, I'm not entirely certain about this condition, I get
lost in the systemd sources trying to find where these conditions
are populated. Part of the equation is the value of the file
/sys/module/apparmor/parameters/enabled -- try:

namei -l /sys/module/apparmor/parameters/enabled
cat /sys/module/apparmor/parameters/enabled

and see what the results are, it should look something like:

f: /sys/module/apparmor/parameters/enabled
drwxr-xr-x root root /
dr-xr-xr-x root root sys
drwxr-xr-x root root module
drwxr-xr-x root root apparmor
drwxr-xr-x root root parameters
-r--r--r-- root root enabled

Y

cat /proc/cmdline  may also be useful

Thanks

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmDShUoACgkQ8yFyWZ2N
Lpc/EQf8DqIPadDgLT5N52VIy7lVNi1DGKiPLoIampcThfPHojqMsol7kROafX9S
KF72tjECcv3Ir4Pp6u/YyjyOnYJN9c4hXmGTlTI5sIWn2UY0s10Ek6QyGOXwkK1p
hd+a2FKSrwWDVQQHa7GSnnTr6B/opc+FTx3xR5tWlOTItjJPqtQiq1UL5VTePnrO
ID3bPgJ4MwE+qnTQY3AyUTrCIlckLgD4wJ5k25TutR5vbO/AT19ES8VUovo+LV7X
TqjIr+re0asxUvkFPvrZ1hcl1nyVeZFbrwlsODTFk6kb6Pou95fg6FvuDBgZskhs
KgHzCEL8wEhSdPGKH58MttQ0SLWhWg==
=Z7zb
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


--===============5274340662081716058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5274340662081716058==--

