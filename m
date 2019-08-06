Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3783D50
	for <lists+apparmor@lfdr.de>; Wed,  7 Aug 2019 00:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hv7st-0000HO-Pi; Tue, 06 Aug 2019 22:24:47 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1hv7ss-0000HH-HY
 for apparmor@lists.ubuntu.com; Tue, 06 Aug 2019 22:24:46 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1hv7sr-0008HI-UI
 for apparmor@lists.ubuntu.com; Tue, 06 Aug 2019 22:24:46 +0000
Date: Tue, 6 Aug 2019 15:24:44 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20190806222444.GB26609@hunt>
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Content-Type: multipart/mixed; boundary="===============3635604594127670982=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============3635604594127670982==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 01:36:23PM +0200, Mikhail Morfikov wrote:
> apparmor=3D"DENIED" operation=3D"getattr" info=3D"Failed name lookup -
> disconnected path" error=3D-13 profile=3D"app2" \ name=3D"apparmor/.null"
> pid=3D55644 comm=3D"app2" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D=
1 ouid=3D0
>=20
> So when the confined *app1* calls the confined *app2*, I get the "Failed=
=20
> name lookup - disconnected path" error, but when the unconfined *app1*=20
> calls the confined *app2*, I don't get this error. Also when I execute=20
> the *app2* manually, I don't get the error.

I believe this case, app1 is opening a file descriptor and giving that
file descriptor to app2. There's some amount of filesystem namespace
operations in play -- app2's view of the filesystem doesn't include that
file.

This means that when a file with a name in the filesystem like etc/shadow
is resolved, apparmor can't tell you if it's from /var/chroot/ or from /.

You've got several approaches possible:

- run both processes in the same filesystem namespace, so files have names
  that are meaningful to both

- use the flags=3D(attach_disconnected) modifier to your second profile;
  this will cause apparmor to 're-root' files on / and give them a name.
  You might get a new DENIED message after this to report which file
  you'll need to add to your profile.

Hopefully we'll have something more pleasing in the future, but this is
where it's at today.

I hope this helps.

Thanks

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl1J/iYACgkQ8yFyWZ2N
Lped4Af/RpELTh0M6p9+29GWs8cXxI6EjUDVdooFjhvq/pxTjGoPR9gpU9ha6sDW
USqnEnWC2gNrMayEwRRuB8wMf3Y7IFVhBV7f5ARCxFFYjuXilpcgU5vlkuDcgoFd
uJ9gCHilM/cLhoxY2W2IzP/Gg2Nu8uIXs7JFtc/l1DctH2IsB22bfYCv6F+FK0P+
04G+t7Y2WmWkM2si8RPpT9ETPcXQJ7f0XLHOcmsvqKtv/yMjl487yDKJ8wHeAA27
1+dr5+cotO/Hm1cWfE2XGWPOcD//mgjQE6h/gX6voeNBYAzdgi7AxvOy7bTwTZP4
q5xByk3LNh/hsvbOkp9buHMRSXc6ww==
=NUmk
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--


--===============3635604594127670982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3635604594127670982==--

