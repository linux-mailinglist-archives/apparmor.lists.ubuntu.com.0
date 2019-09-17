Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F64EB4E8A
	for <lists+apparmor@lfdr.de>; Tue, 17 Sep 2019 14:53:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iACz6-0004x3-4e; Tue, 17 Sep 2019 12:53:32 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1iACz5-0004wt-A9
 for apparmor@lists.ubuntu.com; Tue, 17 Sep 2019 12:53:31 +0000
Received: from static-dcd-cqq-121001.business.bouyguestelecom.com
 ([212.194.121.1] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1iACz4-00040k-SM
 for apparmor@lists.ubuntu.com; Tue, 17 Sep 2019 12:53:31 +0000
Date: Tue, 17 Sep 2019 12:53:27 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20190917125327.GA21433@millbarge>
References: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [apparmor] Question about file_mmap/exec in the case of
 perl/shell scripts
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
Content-Type: multipart/mixed; boundary="===============1875410137914898632=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============1875410137914898632==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 04:20:22PM +0200, Mikhail Morfikov wrote:
> Shouldn't be here some "x" or "m" permissions, or maybe AppArmor assumes=
=20
> this automatically for the confined path, so it's redundant to specify it=
=20
> manually?

Interpreters are handled differently:

https://bugs.launchpad.net/apparmor/+bug/1346553

I'm not sure if we'll be able to change this behaviour in the future or
not.

Thanks

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl2A10IACgkQ8yFyWZ2N
Lpe94ggAvCnAzBnoE+79ibdlUv7ehsHHhlXlbLKMPo+xM9JL304iyMa1hGaCfMC5
kNWVzPvO5hSzk7xLVzewCFb12jKlZ5q/iv4ZuYUQfBOmyf+1CLEUik1YLhd76KQy
X/b7ZK/8Zin7eTQvV/3V1WxaXdAUstbq2cFU3iDyTSFUDakDf7rm+f6AkXKJ27ch
s1FMCAdCkBWOmuwwi7fm3PZOy/05aRFIvgHf/53thbZHNDqXB22WDx5ocJzsoZeq
DNVeXu/PKodYcCaS7G107N3//8YHZSILaltelkGEFPfVG2Oo6zV7KZARM84aUPNC
ugYf7rtNMhdD+O4TO/2ENDR580x4Sw==
=9f6F
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--


--===============1875410137914898632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1875410137914898632==--

