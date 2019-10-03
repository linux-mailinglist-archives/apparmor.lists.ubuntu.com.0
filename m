Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A7C9CB4
	for <lists+apparmor@lfdr.de>; Thu,  3 Oct 2019 12:50:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iFyh9-0000rU-0I; Thu, 03 Oct 2019 10:50:51 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1iFyh7-0000rJ-OV
 for apparmor@lists.ubuntu.com; Thu, 03 Oct 2019 10:50:49 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 541BD5C00A4
 for <apparmor@lists.ubuntu.com>; Thu,  3 Oct 2019 12:50:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNb_cafu4Emk for <apparmor@lists.ubuntu.com>;
 Thu,  3 Oct 2019 12:50:46 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Thu,  3 Oct 2019 12:50:46 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Thu, 03 Oct 2019 12:50:43 +0200
Message-ID: <4040105.U0bI59Edki@tux.boltz.de.vu>
In-Reply-To: <MAXPR0101MB1849265774BBCC379F1C22CFFB9F0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1849265774BBCC379F1C22CFFB9F0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Query about AppArmor's Profile Transitions
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
Content-Type: multipart/mixed; boundary="===============0368359416683550499=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============0368359416683550499==
Content-Type: multipart/signed; boundary="nextPart2125615.ni1RGCsXW3"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2125615.ni1RGCsXW3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

Am Donnerstag, 3. Oktober 2019, 07:21:26 CEST schrieb Abhishek Vijeev:
> We had a good look at stacking, but it doesn't seem to help accomplish
> quite what we have in mind:
> 
> a) Confine 'init'
> b) When init executes any other process, perform a discrete profile
> transition. But, if no discrete profile exists, transition to a
> 'default' (highly restricted) child profile defined in init's profile
> (this is basically what would be a 'pcx' transition).

Ah, so you are looking for full system confinement with profiles for 
specific programs, and a default profile for everything else.

You might want to check the list archives [1] from May and June 2019 for
    [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2 LTS...
This thread should answer quite some questions around confining init and 
doing a full system confinement.

> Even if we were to specify the default profile as a discrete profile,
> the following example is the closest that stacking can bring us to
> what we would like, and hopefully illustrates our problem better:
> 
> profile init-systemd /**
> {
>      /program px -> program //& default
> }
> 
> profile default
> {
>      . . .
> }
> 
> a) If the discrete profile for 'program' doesn't exist, I understand
> that 'program //& default' would evaluate to just 'default', which is

I'm afraid you are wrong here - either both profiles "program" and 
"default" exist (and get both used), or you'll get an exec denial if one 
of the target profiles doesn't exist.


Regards,

Christian Boltz

[1] https://lists.ubuntu.com/archives/apparmor/
-- 
 ... you start off with a typical message,
let's say a 2.5MB Word document containing
three lines of text and a macro virus ...
[Peter Gutmann]

--nextPart2125615.ni1RGCsXW3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl2V0oMACgkQxqaC6mPI
Lxx9tRAAn/uJWBFnBrU2TZYr17yK90XwZDRd3+WPzzGAegwcoABuVU/EVDlAXWvr
XGQ8tleecRos7tF6s3xXPjJwpPrCvzJxnrJF/bFZHeIM4thVHxdOOqUnSwG3Qjmv
5MPieUuktjiiBaEL8Bkna9M90LWk4iIZ8LrTnTjFmJkCLAANfMnYhcDobArKS9v5
wF+QOKfsbZ6IXqnwL06wESKMxmWRpHlQg4c4j2012W8ASseO/lSUYoXq1TOITvEl
EEqokMd5jJ/OZokLF8d5XArdos5l4EFYRaixlsWhqnWMnq8F4ocVewFYlD4Ad2Kz
riIKG7JSNUCh6g9ES5fG5rGQFVnbVF5CWu0DlyBzXvJ7hl6kB4NAXnRTNZfo7HC+
jDYvgUvRNVusZMdPuwdcGEpdwmjQBope+062v4iqrBWd2BBN2MuL2AmxFqW/f933
ei0pwyHeH5nh1MXNCukq1Eb46qOxDMWuSoAmJdyxkNFP0wZODM30fdzJTSJ7y8m8
cdiwEgR69QhaVuDvNwqWmCAwDvmoadGATET4AeixFmLpdXsCV9G7P3tZjRnCZ9NH
lQ83M7/ftuDYc+8njDy6ab+w6X8DZUmTjY0GbKmoY9i+SiMBUIHar0ao+rUYRryr
kGDhQDCglpq20UbK8gpTU/LSUDRvlfQraZU8FOvOYeC1x47at0o=
=j55D
-----END PGP SIGNATURE-----

--nextPart2125615.ni1RGCsXW3--





--===============0368359416683550499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0368359416683550499==--




