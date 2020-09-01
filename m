Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B325862E
	for <lists+apparmor@lfdr.de>; Tue,  1 Sep 2020 05:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCwwi-0006nI-U9; Tue, 01 Sep 2020 03:26:56 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1kCwwg-0006nB-T8
 for apparmor@lists.ubuntu.com; Tue, 01 Sep 2020 03:26:54 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1kCwwg-0002O0-Bb; Tue, 01 Sep 2020 03:26:54 +0000
Date: Tue, 1 Sep 2020 03:26:52 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: swarna latha <sswarnas@gmail.com>
Message-ID: <20200901032652.GC2884930@millbarge>
References: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
 <20200901012007.GA2884930@millbarge>
 <CAJs3c4yASMzrZ40dAsZN7q3BTbDa+M+cpbVqFCzQG8pwaz027w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJs3c4yASMzrZ40dAsZN7q3BTbDa+M+cpbVqFCzQG8pwaz027w@mail.gmail.com>
Subject: Re: [apparmor] Apparmor profile enforce issue,
 when changing from root to non-root
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
Content-Type: multipart/mixed; boundary="===============7004838159994132784=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============7004838159994132784==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 10:34:46PM -0400, swarna latha wrote:
> I am getting the complete set of libraries used by my process with status=
=3D
> AUDIT, right from /etc/ld.so.cache. It looks to me as though the profile =
is
> not applied, though i have rules allowing the /etc/ld.so cache access.
>=20
> As i have these file entries in my profile, i am not getting
> ALLOWED/DENIED, hence not able to regenerate the profile with these event=
s.

Hello Swarna, so, is it the case that your system works fine when the
'capability,' line is in the profile, but when you remove it and reload
the profile, the application doesn't start *and* doesn't log anything
different?

Thanks

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl9Nv3gACgkQ8yFyWZ2N
LpdbvwgAqBuSEZT41Vtq7sFakUDU1L04aV6mF7xuXbrfAj9DSJ98t7QuzJXlFs04
7DZsWfr89ih9tIGYlCJCnC3hkoHS5oK6XNS0XOE5DcchX9S2v+h+cKqpZIbc6w3D
OG/GAEic9ogeMAroyVxAL1haaXgSiKzjTOIVMeC/v6wj7g0eJJfg/VAhZQw5hqER
JgFK/rNAunyNlgGo4307u2j7oFG9MQLT1Zx15u0Oski9++MbAOpwEbFo6W2miYpF
Ko3ZiSlFSQXHMd9OifPqbcWKJ8zGsX3A7OwmYJTfmbWiIKo1aO0ZDQbDPBqzUbQL
zDf8tWlf8PePV1fhM5Qev4151dS8WQ==
=WYKo
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--


--===============7004838159994132784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7004838159994132784==--

