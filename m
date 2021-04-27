Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD036BD49
	for <lists+apparmor@lfdr.de>; Tue, 27 Apr 2021 04:26:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lbDQO-0001MG-Ib; Tue, 27 Apr 2021 02:26:08 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lbDQM-0001M9-Ky
 for apparmor@lists.ubuntu.com; Tue, 27 Apr 2021 02:26:06 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1lbDQM-0003OK-0P; Tue, 27 Apr 2021 02:26:06 +0000
Date: Tue, 27 Apr 2021 02:26:04 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20210427022604.GA2825476@millbarge>
References: <CAODFaZ4afdxmm8b0oTTerRWZr+=2LW6_ueT6Y3HuL=mdYRs84A@mail.gmail.com>
 <CAODFaZ4Xj+hHZyta2PEtnk=pqq=poAbr7H03Xk-wAutJqzaU=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ4Xj+hHZyta2PEtnk=pqq=poAbr7H03Xk-wAutJqzaU=A@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: Profile optimization
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============4387633437672271491=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============4387633437672271491==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 08:58:54PM +0530, Murali Selvaraj wrote:
> Hi John/Seth,
>=20
> Please clarify the below queries which we are looking for to define
> the profiles for embedded devices.
> Kindly do the needful.

In what way was my response here not clear enough?

https://lists.ubuntu.com/archives/apparmor/2021-April/012261.html

When you don't understand something in one of our responses, *please*
address whatever it is that you didn't understand rather than just
re-asking the same question over and over again.

It's not worth our time to just keep guessing about what you didn't
understand, or why you didnt understand it. You've got to help us out
here, you can't just demand over and over again.

I'm happy to help people who are trying to learn but you've got to at
least *try* what we suggest and respond in kind.

Thanks

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmCHdjwACgkQ8yFyWZ2N
LpfvUQgAo/LSA0/If4lM+gE3VR26fmPTCxy8dDJqIC/JzJsCEeuyBLpdtXbKPIsa
Qgtv1cRl7WebX1wRp4yNj+cn7lPrOfJds7wObsfg7lF97SKhX1q8dmVJ8SZU34D9
bRBfdq9JM+PiyNbYfTflbOl5K9askfnU8LuitPEE5/NfDyRgRNPQQb02sVwfKKAk
+ZbAttS8mpcit7YhqCnQKE939/gSbxfcI4GL7CMW1dHM4+avxKOfPgnXoe/iCee8
lE7h8zDJv2Rhkci1A7kUy7mUXtJ00MTu0Ffc1YuB+Lgiey23wEEDG4ZrAnvp0cwF
pV1zEJl1oWlvaEMpF5+dC/qL7nz3Yg==
=5pxO
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--


--===============4387633437672271491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4387633437672271491==--

