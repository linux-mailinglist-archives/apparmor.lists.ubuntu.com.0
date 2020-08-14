Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B901E244FD9
	for <lists+apparmor@lfdr.de>; Sat, 15 Aug 2020 00:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k6iDG-0007sH-Eh; Fri, 14 Aug 2020 22:30:14 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1k6iDF-0007sB-F4
 for apparmor@lists.ubuntu.com; Fri, 14 Aug 2020 22:30:13 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1k6iDE-0004JK-O4
 for apparmor@lists.ubuntu.com; Fri, 14 Aug 2020 22:30:13 +0000
Date: Fri, 14 Aug 2020 22:30:10 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20200814223010.GC3096694@millbarge>
References: <20200812002037.77fa6505@mephala> <20200815000955.59888117@mephala>
MIME-Version: 1.0
In-Reply-To: <20200815000955.59888117@mephala>
Subject: Re: [apparmor] Confinement inheritance with ix
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
Content-Type: multipart/mixed; boundary="===============6688225832746517879=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============6688225832746517879==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2020 at 12:09:55AM +0200, Jonas Gro=DFe Sundrup wrote:
> The executable in question, in whose profile the ix-confinement did not
> work, was in fact not the executable, but a symlink to it, which I
> didn't directly notice. While htop will then note the process via its
> *executed* name, aka the name of the symlink, AppArmor triggers only
> for the *actual* executable. After realizing this and adapting the
> profiles accordingly, everything now works smoothly according to the
> documentation. :)

Oh, excellent, thanks for reporting back.

Thanks

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl83EG4ACgkQ8yFyWZ2N
LpfcMggAqKzoHDWZVxhkRZaR0f7kMU/+xfviWfGod/pWiZPaxZIyFG+Rr3bMUYWq
q5e64lhmFVTd2sp7pD4AEE8xI7oBY8CRddSFFDsYpnV8Me6VtpdwGDyP0PrwwVzB
izh+FQBTM/L25Y6krPdJfcSURyjDXXQUB/vMxCfwYaqoui9Ni/AOZRWLOWoB7j/3
Fm/4OScmUvN28ypMzxZ59mibKy03tTMIBKujwHROD5yE7A6AV0DQQU5laBpj7m4O
xm1GagseBnxzfwUVF/LzPOtPcEsfoQlJH01PMx6LRfjh1jouhh0TImtG2XBVUDDL
Te2V++KiYX8C10jsbeDEczkZhC7krw==
=t+Ca
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--


--===============6688225832746517879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6688225832746517879==--

