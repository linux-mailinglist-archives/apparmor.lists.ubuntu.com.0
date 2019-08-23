Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C96449A43F
	for <lists+apparmor@lfdr.de>; Fri, 23 Aug 2019 02:19:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i0xI7-0000zC-OS; Fri, 23 Aug 2019 00:18:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1i0xI6-0000yg-I0
 for apparmor@lists.ubuntu.com; Fri, 23 Aug 2019 00:18:54 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1i0xI5-0007L9-JQ; Fri, 23 Aug 2019 00:18:53 +0000
Date: Thu, 22 Aug 2019 17:18:52 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Message-ID: <20190823001852.GA25024@hunt>
References: <MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] Help with AppArmor Full System Policy
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
Content-Type: multipart/mixed; boundary="===============4431462966522992674=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============4431462966522992674==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 06:10:30AM +0000, Abhishek Vijeev wrote:
> profile init-systemd /lib/systemd/** flags=(complain) {
>   /usr/bin/colord/**  cx ->  colord_profile,
>   profile colord_profile flags=(complain) {
>   }
> }

> However the dmesg audit logs show the profile name for colord-sane as:
> 'init-systemd//colord_profile//null-/usr/lib/colord/colord-sane' (sample
> logs are attached for reference). We don't understand where the suffix
> 'null-/usr/lib/colord/colord-sane' originates from, since we have
> specified an explicit 'cx' transition for all files within
> /usr/bin/colord/. Due to this problem, we are unable to confine colord
> and a bunch of other processes.

Your logs start after the profile transitions involved; the profile name
here shows the chain of execs that were taken to reach this point:

init-systemd//colord_profile//null-/usr/lib/colord/colord-sane

your init-system profile executed something in /usr/bin/colord/** and then
transitioned into the colord_profile child profile

that process then executed /usr/lib/colord/colord-sane

Because the init-systemd//colord_profile profile is in complain mode,
AppArmor ALLOWED the execution and created a new //null- profile.

If you take the profile out of complain mode, you'll get a DENIED when
the process tries to execute a program that isn't in the profile. You
can decide what profile the process should use after the exec by adding
appropriate Px, Cx, ix, etc rules to the init-systemd//colord_profile
profile.

I hope this helps.

Thanks

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl1fMOYACgkQ8yFyWZ2N
LpcwgwgAuzWpStDJCI5gfpUtpsHAVw2vMzsvK3srt2e6rGwHzIGhaJTAQ3Hqk1cc
1SBYT+orWA1+z2eoT2iYPpHtHKPpIuMFduXOjgGPq7W4ngrnNp1CoFxZoOybge4P
RujqyUbhUymAM9AmjwOGxHv7Z2fb2FAg0OI0/xVeeqTNb+0M6PocvQvoZvCHY2jc
/p80nUuHTRXWdAB8701ySuU8XtMQDtmipu0NF3YAEJdL+M45n0W1xfHacvnC1wL6
jOCaD56W44o9ZirApyuMcqLxjkQ0o48FWp/DxJEF/+Yp5S9YJcYxkcU2hd1v3ik7
EunXORcBSH35FEkWe3mqb0tVWns61g==
=W92R
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--


--===============4431462966522992674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4431462966522992674==--

