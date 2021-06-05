Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48439C4D8
	for <lists+apparmor@lfdr.de>; Sat,  5 Jun 2021 03:40:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lpLIv-0002K9-3g; Sat, 05 Jun 2021 01:40:49 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lpLIt-0002Jx-M6
 for apparmor@lists.ubuntu.com; Sat, 05 Jun 2021 01:40:47 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <seth.arnold@canonical.com>)
 id 1lpLIt-0008MI-57; Sat, 05 Jun 2021 01:40:47 +0000
Date: Sat, 5 Jun 2021 01:40:45 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Bug 1928360 <1928360@bugs.launchpad.net>
Message-ID: <20210605014045.GD2766784@millbarge>
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
 <162285643961.2791.2343187171891122867.malone@soybean.canonical.com>
MIME-Version: 1.0
In-Reply-To: <162285643961.2791.2343187171891122867.malone@soybean.canonical.com>
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
Content-Type: multipart/mixed; boundary="===============0616124342348763109=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============0616124342348763109==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 05, 2021 at 01:27:19AM -0000, Gunnar Hjalmarsson wrote:
> It means that it explicitly looks for the fcitx 5 gtk im module, while
> Chromium only has access to the fcitx 4 one.

Oh! Excellent debugging to find the root cause.

Thanks

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmC61hgACgkQ8yFyWZ2N
LpebZAf/fzBRaW9iGR3j0np70VOkT/XCCQ/NDp342e8k1XMEglQwHwFWHDcHnrFv
BzlE/w49Q2u7MvXROnnPWDXzNVYFDfqarIQMFPz80i2wtglDAGiv8kb7JjKT/TVd
PcW24hywlYqT8IX9vqulohV4ypFMWaAh9cxVSNGmcf+xnkN+m59IGd5OfejIo7/G
eXb4pF7fX4onBBWQ2kv3wu8ApQryyzfB7AmB4lRyiPFRVwMLDffTBsA/5BZF57Yw
2OD49ICHA3qxcOy/c/CahdDKKV1WHXruHpt4KXuTuOtg70YZD+4SXK3j0+8d+WFZ
vsBHZOakcJV8arr2nHqmifQ9uf2wcw==
=yimW
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--


--===============0616124342348763109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0616124342348763109==--

