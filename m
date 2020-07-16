Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0A222E2B
	for <lists+apparmor@lfdr.de>; Thu, 16 Jul 2020 23:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jwBms-00041y-PH; Thu, 16 Jul 2020 21:51:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1jwBmp-00041f-Fl
 for apparmor@lists.ubuntu.com; Thu, 16 Jul 2020 21:51:27 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1jwBmo-0005LM-Sz
 for apparmor@lists.ubuntu.com; Thu, 16 Jul 2020 21:51:27 +0000
Date: Thu, 16 Jul 2020 21:51:25 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20200716215125.GB1808886@millbarge>
References: <375a90df-1a79-649e-7c99-5dde32280c44@posteo.de>
MIME-Version: 1.0
In-Reply-To: <375a90df-1a79-649e-7c99-5dde32280c44@posteo.de>
Subject: Re: [apparmor] rkhunter profile oddities
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
Content-Type: multipart/mixed; boundary="===============2003753957681907567=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============2003753957681907567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 09:36:11PM +0200, mailinglisten@posteo.de wrote:
> Instead, as you can see, apparmor reports:
>$
> Name: usr/sbin/ModemManager
> Name: usr/sbin/NetworkManager
>$
>$
> Is this probably an error in rkhunter and not in apparmor?

This is because rkhunter is executing in its own filesystem namespace for
whatever reason, and the LSM interface isn't passing to AppArmor
sufficient information for AppArmor to know the mountpoint that was used
to access those files.

You can add flags=(attach_disconnected) near the start of the profile to
cause these accesses to be treated as if they were mounted at /.

eg

profile rkhunter /usr/bin/rkhunter flags=(attach_disconnected) {
  /** r,
  ...
}

Thanks


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl8Qy9kACgkQ8yFyWZ2N
LpfAqQf8Cbw72Howdbe2SgYgPacxwCzobPy5mVeuJQcbepsC0BAAuAS3RRJVyaew
WPz3W06fZbWOX5P3MftX7GfBafRKjV6KEeaYH06DFTvyC2dlO5YiJ0nrTB68pU/X
Yn6aYbeV7QxOQLIJM+LcVan7bLR6s0vCKa21DjUz8uMwywr3ryNDNv05eKO6OsVI
sCfMA/ajSsPo5nWbkoUNz3A9ecmSlvH5Lx0sx3qlVTlkuk5D9dEMVlgJSAdTkUzW
AWDA2WW1j7hAP6NdVFiaLHPuUNerlOFIMrNZn5xSGya8OxEJHfn/ROPhsNiNT69z
NL+IIsveu74KWkBr569NiV85dYEODw==
=BdN4
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--


--===============2003753957681907567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2003753957681907567==--

