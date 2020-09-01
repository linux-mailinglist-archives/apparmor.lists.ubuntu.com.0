Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C93258513
	for <lists+apparmor@lfdr.de>; Tue,  1 Sep 2020 03:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCuy4-0000M9-8A; Tue, 01 Sep 2020 01:20:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1kCuy2-0000Lt-NZ
 for apparmor@lists.ubuntu.com; Tue, 01 Sep 2020 01:20:10 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1kCuy2-0001k7-2E; Tue, 01 Sep 2020 01:20:10 +0000
Date: Tue, 1 Sep 2020 01:20:07 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: swarna latha <sswarnas@gmail.com>
Message-ID: <20200901012007.GA2884930@millbarge>
References: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8429088783560098191=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============8429088783560098191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2020 at 08:25:26PM -0400, swarna latha wrote:
> For non-root mode, tried to add the capabilities manually, all the 36
> capabilities it did not work. But if i add the capability, (which is to
> grant all capabilities, the last one highlighted below) the process starts.

What messages do you get in dmesg or audit logs when you run your service
without the 'capability,' line?

Thanks

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl9NocQACgkQ8yFyWZ2N
LpeC+gf/Qehys8Ekh0NP9YaiKrVHCmNdRMGjytlfLECjrYkQNwumh7ujW9ZwW0vO
+nROcv7MDDlwjuk/PHej+9k2qNdMDPcOzaQa4GXXKkZedGlDzjvQr5cZQ890gvbe
02lAZkaNFAjPijLwpxlY9wnI6rKavBbSe38KlecREG0CeVwXxLFvML9ps23t5zWA
bhCVex9JqEM/dKF1J0zbUVYZR7BFXsmfR5FiYTpV7gwJF5xdSWPKkw+7MhkAYe2L
BLVkr6sxUa4DkqtJ0gvDqGanppEeqVv5giJgO1Trz4bQ6mZ5ea4aPIjzks2lIMCX
/Xj174wYUl/WIo3IAnNR5+srwzebTg==
=dJDt
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--


--===============8429088783560098191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8429088783560098191==--

