Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C535E67D
	for <lists+apparmor@lfdr.de>; Tue, 13 Apr 2021 20:33:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lWNqf-0005BP-Ib; Tue, 13 Apr 2021 18:33:17 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lWNqe-0005BI-2w
 for apparmor@lists.ubuntu.com; Tue, 13 Apr 2021 18:33:16 +0000
Received: from 97-120-32-107.ptld.qwest.net ([97.120.32.107] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lWNqd-0002Qq-HN
 for apparmor@lists.ubuntu.com; Tue, 13 Apr 2021 18:33:15 +0000
Date: Tue, 13 Apr 2021 18:33:13 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210413183313.GA3117434@millbarge>
References: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
 <CAODFaZ5xmee-ajxi=_jcB34dEpfnkaDnAOPUgSV40f7gbSWwTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ5xmee-ajxi=_jcB34dEpfnkaDnAOPUgSV40f7gbSWwTg@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: Queries
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
Content-Type: multipart/mixed; boundary="===============4785455885962450319=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============4785455885962450319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 11:18:12PM +0530, Murali Selvaraj wrote:
> We have observed few configuration files are present in /tmp which are
> needed for certain processes.
> For example, few of the files are hidden files located in /tmp/.
>=20
> In that case, shall we add below entry
>=20
> /tmp/** rw,
>=20
> or Do we need to add entries for file specific as below
>=20
> /tmp/file.txt r,
> /tmp/.init_complete rw,
>=20
> Which would be the best way for security concern as well as embedded devi=
ces ?
> Please advise.

I'm worried that applications that are writing to /tmp/ using fixed
filenames like this are likely to be susceptible to file /tmp/ races. You
can enable the kernel's mitigations (see sysctl -a | grep fs.protected)
for this but that's only a partial mitigation for the problem.

Better is for the applications to write their temporary files into
per-application directories as appropriate.

Certainly I'd want to give tighter rules than /tmp/** rw, wherever
possible.

Thanks

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmB14+YACgkQ8yFyWZ2N
LpeT/AgAhhgXfPEHbferbwW6VP1h4kKJfS3uYIUGwfIWYnfKUiE8lEMgRi4I1GT0
y2W9rrujt28/VxISb8/GXZFsiBTwfqxuMj/VtWaG7UFJQhht4b6Ye6+25qxit4nS
5dIA1MDxjJCRzfN+6ewiqe7QJrxrc/rPW3dMLOYkxYXO2N6O1x8MFwFlBH1BYVyC
irJeMxo0bVuzY34xL1k5HE8soDZhFJOZALMo8jXwgUSwaFloPF8Sa0k0p5TxNqNP
3Q+Cv4qhEd+NQOYFz3H7b54/lSw6KaCtzzzRcUOS8H/cQw1DJ13mh6N5OIa7CkIE
jV2JODehl/+UL5lABiXrSYGowKVtEQ==
=x0dS
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============4785455885962450319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4785455885962450319==--

