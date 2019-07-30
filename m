Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D787B5B0
	for <lists+apparmor@lfdr.de>; Wed, 31 Jul 2019 00:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hsaYS-0002d6-GQ; Tue, 30 Jul 2019 22:25:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1hsaYQ-0002d0-LY
 for apparmor@lists.ubuntu.com; Tue, 30 Jul 2019 22:25:10 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1hsaYP-0005in-UA; Tue, 30 Jul 2019 22:25:10 +0000
Date: Tue, 30 Jul 2019 15:25:08 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Message-ID: <20190730222508.GA15178@hunt>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
 <9240f8b1-3b4a-ebad-85c3-5dfd938d8aa2@canonical.com>
 <PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>
 <84a65fdd-a6eb-ce58-ffe1-080adb0936cf@canonical.com>
 <MAXPR0101MB1132051BC16EE16163A38898FBDC0@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB1132051BC16EE16163A38898FBDC0@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============0122595232540276653=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============0122595232540276653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 12:42:48PM +0000, Abhishek Vijeev wrote:
> Thank you for the correction John.
>=20
> Despite changing the code to use strdup( ), the kernel still crashes. I
> have attached the modified file for reference.
>=20
> Is there anything else that might be causing the crash?

Hello Abhishek,

Please consider sharing your modification via diffs; passing along entire
files is pretty difficult to read and understand your changes.

Also be sure to include the full kernel messages when trying to debug
crashes. That's the best lever any has to prise apart the problem.

Thanks=09

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl1Aw78ACgkQ8yFyWZ2N
LpcWAQf+OJwE2Fg/zsF/LaCKAn6UDmhDf9uTJgpgC29QIRTIVmhRJKyyGF2I6dXb
imr9aO3f2dwFvBfo0WSNXmSF8lBNalKKXcxPsomyUFS7qJmfHI6L6LkhsBYeLEbW
0YK0rtN7qYYzMySdg5KmkhX2V2ArjTG98FP4KCpQQWVW4Fg+0kN7VC+mk1PPfpG8
DwhpEQrzIJEOY5yZ41sZeQFoWCuJLDK65QVfjpoWfSOpg1AtmIn+1fux3XcXM/Ge
1BVhXmnCzZUatxY/RPRYghbamS6XDqK5pBZEzfM9qLkaF8sp0P1q0Uj/OD7e+Zqn
0ij6AHE4I7O9/RgZF0Gae6y7YjXETA==
=A+en
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--


--===============0122595232540276653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0122595232540276653==--

