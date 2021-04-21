Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF4367559
	for <lists+apparmor@lfdr.de>; Thu, 22 Apr 2021 00:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZLiz-0007xN-Fe; Wed, 21 Apr 2021 22:53:37 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lZLix-0007xB-Dc
 for apparmor@lists.ubuntu.com; Wed, 21 Apr 2021 22:53:35 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lZLiw-0000Fb-R8
 for apparmor@lists.ubuntu.com; Wed, 21 Apr 2021 22:53:35 +0000
Date: Wed, 21 Apr 2021 22:53:33 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210421225333.GA2367494@millbarge>
References: <CAJs3c4xaFpc52=XGW9=Xk_mTOzZ1wcRAexFNUTbMaFKXihuWWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJs3c4xaFpc52=XGW9=Xk_mTOzZ1wcRAexFNUTbMaFKXihuWWQ@mail.gmail.com>
Subject: Re: [apparmor] Regarding header file for default capabilities
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
Content-Type: multipart/mixed; boundary="===============5048469242229249675=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5048469242229249675==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 21, 2021 at 09:41:23AM -0400, swarna latha wrote:
> Can someone throw lights on how to implement  a set of default
> capabilities to be added in all profiles (preferably in header file)

Hello Swarna, I gave advice to someone else recently that's probably
applicable to your case, too:

https://lists.ubuntu.com/archives/apparmor/2021-April/012264.html

Thanks

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmCArOkACgkQ8yFyWZ2N
LpdSnQf/cGexN7/NV9Jnn+KzD3/bIzuAFj3Aay44EeCrPnw8JYDyndCBAxASuZp3
9vSF07oLhsRYuA6k8meXgMzwl63OagBtSM2tPTOlI9vrZZoFTbicXT2Hdp1v/lda
I4M7e5INMjiK0d7z0wgoEGX9c7lbdE6xZoVejmwHd8jxAKMgTnOEsOScpf1aQdQr
b1q66K2+yLDh0b6vdXZtpO//Htssf76pHekm4slYDhvRhlB/YTl9lHIoo24IOMHd
6kyPp6DixQIGn3/kV8yYugB4MiuSbwb8BCIfcQxq89q2LjSsM8q6LENQ/+rkkD+V
iOU2VW7Nu4yE9lPhf2qAuUyWF0Zr1w==
=y3JL
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============5048469242229249675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5048469242229249675==--

