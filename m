Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FBDA96D9
	for <lists+apparmor@lfdr.de>; Thu,  5 Sep 2019 01:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i5eR7-00079J-PC; Wed, 04 Sep 2019 23:11:37 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1i5eR5-000798-IX
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2019 23:11:35 +0000
Received: from 97-120-111-46.ptld.qwest.net ([97.120.111.46] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1i5eR4-00010Y-Uf
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2019 23:11:35 +0000
Date: Wed, 4 Sep 2019 16:11:33 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20190904231133.GA4082@hunt>
References: <CABRH9Vx7CSxROBCMV5fbNPN-Sct4kFB_D2TawAWt_0KqD_C6KQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABRH9Vx7CSxROBCMV5fbNPN-Sct4kFB_D2TawAWt_0KqD_C6KQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] apparmor & clamav
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
Content-Type: multipart/mixed; boundary="===============6294485898831358985=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============6294485898831358985==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 08:02:56PM +0200, Birger Birger wrote:
> This looks promising to troubleshoot. Any ideas?

Do you know what winbindd does with this pipe? Are there any local
configuration changes that would have put this pipe in this directory?

It feels a lot like a new name for the pipes listed in
<abstractions/winbind>:

  /tmp/.winbindd/pipe  rw,
  /var/{lib,run}/samba/winbindd_privileged/pipe rw,

Does this sound right? Or is this pipe something different from these?

Thanks

> > On Sep 4, 2019, at 03:01, Birger Birger via clamav-users <
> clamav-users@lists.clamav.net> wrote:
> >
>=20
> From Ubuntu syslog:
> > Sep 4 08:40:01 zentyal kernel: [345190.998397] audit: type=3D1400
> audit(1567579201.044:83): apparmor=3D"DENIED" operation=3D"connect"
> profile=3D"/usr/bin/freshclam" name=3D"/run/samba/winbindd/pipe" pid=3D12=
69
> comm=3D"freshclam" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D0 oui=
d=3D0


--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl1wRJ8ACgkQ8yFyWZ2N
LpebMgf/Qo17ytEbcUAf2QlaDWbXqrR9rPslLdBr5O9vZxcmq9HT3Vmq1YCfg0Z6
mue+7jbUFlnFLsfJoLjdZAPMZ5vl5tHfqHWsWCa/gx8hFMCqW3H6Y2dFJUf53Kvf
H9kmJybRB0aKQvGatqbvkWJcRVxqfaU2kunwCvH8Z5brSyI88M5dth+/FAFvShYM
4UDkPgnfmNKYh/CkdWQSZGBUwPY3PHL3iL9kvsRacb69BKBy1D+wTrfIdMXvpqzU
X31K1j0sv6zDZSF9F2pQHX3ycD/9115gAEtA6iYlQBzjHkwB8tOv5KnwlNxMk0dK
Vy/3eXGVZP1YwGpDfF4EWbwGESQvgA==
=tDv/
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--


--===============6294485898831358985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6294485898831358985==--

