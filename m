Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFE388198
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 22:47:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj6cO-00080e-At; Tue, 18 May 2021 20:47:08 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lj6cM-0007zU-5Y
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 20:47:06 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <seth.arnold@canonical.com>)
 id 1lj6cL-0007Be-Jl; Tue, 18 May 2021 20:47:05 +0000
Date: Tue, 18 May 2021 20:47:03 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Bug 1928360 <1928360@bugs.launchpad.net>
Message-ID: <20210518204703.GD4082368@millbarge>
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
 <162136678892.2376.6200857094716250450.malone@wampee.canonical.com>
MIME-Version: 1.0
In-Reply-To: <162136678892.2376.6200857094716250450.malone@wampee.canonical.com>
Subject: Re: [apparmor] [Bug 1928360] Re: Switch to Fcitx 5 for Chinese
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
Content-Type: multipart/mixed; boundary="===============5093413884551039009=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5093413884551039009==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 07:39:48PM -0000, Gunnar Hjalmarsson wrote:
> On 2021-05-16 22:23, Gunnar Hjalmarsson wrote:
> > As regards apparmor it's possible that no change is needed.
>=20
> Well, I simply tested with the Chromium snap. fcitx5 does not work in
> Chromium, while fcitx4 does. So something needs to be done.

Excellent, can you paste the DENIED lines from your test into the bug
report?

Thanks

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmCkJ8QACgkQ8yFyWZ2N
LpetUwf+ILLNO9aBgYZMk88yvFOBo7fTK0MNT7mLVclDuvl+nBFMslTAukKPIvxn
LvboTMwMHIytKarvjF38+VMcrWbflnfk4BBM/NXasxzbgGWQ0m26uj2XolHE+EnS
U82+6v79yZZlwbcIfS90G8lRTMQO/LMU7mPhnrmWOo/qdtnaaG9PPhV/3QvbTW49
ISdvtjz2Lu7znrbNOg8A8b2yxiiAe0KAoSj9oyiKrHNwgaPpghmfyA95kLCBZq9F
+pezVwuqy6NHp9EyfaONIcPQYTiWnHALVC6NLsB0d34R7J1/NVjhd+cGu5xGWy1u
VVuR5PNcw7ROtUi17UWNN20W295kyQ==
=QZgH
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--


--===============5093413884551039009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5093413884551039009==--

