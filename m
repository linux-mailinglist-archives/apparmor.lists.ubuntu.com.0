Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 01342B10FF
	for <lists+apparmor@lfdr.de>; Thu, 12 Sep 2019 16:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i8Pxb-0000ic-Ic; Thu, 12 Sep 2019 14:20:35 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1i8PxZ-0000iR-PU
 for apparmor@lists.ubuntu.com; Thu, 12 Sep 2019 14:20:33 +0000
Received: by mail-lj1-f180.google.com with SMTP id 7so23753601ljw.7
 for <apparmor@lists.ubuntu.com>; Thu, 12 Sep 2019 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version; bh=r9bjjbAqWxj7oWf4vyAabK7bcZrcKryjfxwXOo/k/tg=;
 b=gJq2u6h8bvnRhG5Y62Q8RNNTyNiEllfW9YzQvWtHzlOtrOvIBX0EGNuF0J63wgJi3Y
 UtHTRE8KPsApKvEG7zLkeqkMb2xLdxdh/YdClCv2SEd4GXI9UG2v+JN9aGMQpA/4GSlo
 ZlMj60W/73aq+uR34woouuKnYeMhmaDqYCuPLmcN3eDFhfEK1fJgMgsP701MgbFBOPn3
 PJvIQBVWvLgaH4KAQ0GhbnnRQwDTt7lovl5vpIS7iAI1e9mogcYu92BT3iUIzexgHoax
 76LZJTEeHJq6f5s63Gz9BmthuM+Y/n5JlGMJhOPnoGUOtSfr+j2PFsNbynnSoO7ePK+F
 FrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version;
 bh=r9bjjbAqWxj7oWf4vyAabK7bcZrcKryjfxwXOo/k/tg=;
 b=QJTgVHatJ2LixdwcJz6/xP07kJBouBx5WC3jjlP+DvYLsnRYJHdhZPreB0GX+ek0Xw
 /TDb0FpRFJl4WVE8+ubifutxSf5V3UO/7AR6K9LDo4tWE/Vu5B0pL8lpTFoHZkiMn945
 tUjliL4N/Y4tuKI92V8SC/USE1Qq3vOpHL1pAGchDZf6/UEPADCgkE/yMBciSM7BtgQV
 KFvFRLr5243lDYkbghHO2OIzHLK84ZVISZCTyRpond1ODL1dBVG8oUF36jSmTFeOTi2W
 nn6xEHUErBT8ZamA5n6oD0NsuP9bXxYSMQexr0ee7tKnxobHXTlZMl0sYF19OPIqlfJx
 eXZw==
X-Gm-Message-State: APjAAAX73ljEBbyC5byTbqo5M1ua0Y+bd+0i6JGDbaCkUKTAFYc0s7cd
 HfVSwIBAki+ysVkL6bBLBfxi7oGK
X-Google-Smtp-Source: APXvYqysKrSV3tEezNONcvtXhKQeOvZCqykd+2dyU770R7tw3OHNWxPEcqflnzr0siJp8pBS1FuK1A==
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr27086891ljj.75.1568298032888; 
 Thu, 12 Sep 2019 07:20:32 -0700 (PDT)
Received: from localhost (public-gprs351335.centertel.pl. [37.47.3.168])
 by smtp.gmail.com with ESMTPSA id i17sm6340533lfj.35.2019.09.12.07.20.31
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 07:20:32 -0700 (PDT)
To: apparmor@lists.ubuntu.com
From: Mikhail Morfikov <mmorfikov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mmorfikov@gmail.com; prefer-encrypt=mutual; keydata=
 mDMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQu0
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+iJYEExYK
 AD4WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXRaJTwIbAwUJAeEzgAULCQgHAwUVCgkICwUW
 AgMBAAIeAQIXgAAKCRAy2ctjR5bMoRS0AP9NEO+t25BNIya+w+I4if6Zv8FgtIMpS06LJdgL
 3QhOXQD/dsoOMLyLNaa7aEvwidUrv7CFd27VdNcSfajciwaXbwO4OARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHiH4EGBYKACYWIQR1
 ZhNYxftXAnkWpwEy2ctjR5bMoQUCXRaE+gIbDAUJAeEzgAAKCRAy2ctjR5bMocLJAQCVr++2
 +63HkY55uXQgTeJf446YbqyKH/TP3WvHCxqDfwD+Ks9eAFnkknOqtMrj1GHIzM4bk2hwKw8v
 V+nbEhOboQI=
Message-ID: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
Date: Thu, 12 Sep 2019 16:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Subject: [apparmor] Question about file_mmap/exec in the case of perl/shell
	scripts
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
Content-Type: multipart/mixed; boundary="===============8147233210112719662=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8147233210112719662==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="VXjPlppBj66GQmE3lyVKXx09Br7HK0UXX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VXjPlppBj66GQmE3lyVKXx09Br7HK0UXX
Content-Type: multipart/mixed; boundary="jkbCTtuCZqsZwi33yPhyLDrJ6IffZKF8l";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
Subject: Question about file_mmap/exec in the case of perl/shell scripts

--jkbCTtuCZqsZwi33yPhyLDrJ6IffZKF8l
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

When I add a profile for some app, and this profile wants to execute or
map some file, it usually wants the "x" (operation=3D"exec") or "m"=20
(operation=3D"file_mmap") permissions. But what about the path the profil=
e=20
confines?=20

For instance, I have a perl script under /usr/bin/some_app . When I creat=
e=20
a profile for this app, the very first message in the log I can see is=20
the following one:

  kernel: audit: type=3D1400 audit(1568295564.314:1537): apparmor=3D"ALLO=
WED" operation=3D"file_mmap" \
  profile=3D"some_app" name=3D"/usr/bin/perl" pid=3D55932 comm=3D"some_ap=
p" \
  requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0

So it is the "file_mmap" operation, but only "r" is in the "requested_mas=
k"
field. Similar thing is with shell scripts -- they only need the read=20
permission on the confined file path and on some shell binary=20
(/usr/bin/dash).=20

In this case I didn't even add the perl abstraction. The only abstraction=
=20
the profile has included is the base one, so the profile's content looks =

like this:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#include <tunables/global>

profile some_app /usr/bin/some_app flags=3D(complain) {
  #include <abstractions/base>

  /usr/bin/some_app r,
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When I add "/usr/bin/perl r," the message won't appear in the log anymore=
=2E

Shouldn't be here some "x" or "m" permissions, or maybe AppArmor assumes =

this automatically for the confined path, so it's redundant to specify it=
=20
manually?


--jkbCTtuCZqsZwi33yPhyLDrJ6IffZKF8l--

--VXjPlppBj66GQmE3lyVKXx09Br7HK0UXX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXXpULQAKCRAy2ctjR5bM
oR3VAQDu1eyPkBiU4JbjhPah1h/9k3Cw9+SZzJRgPuEeU9MGlAEAic7jfILyxlCA
c9dDHuKcrv//fklQWgtDt/kdTfepLQI=
=k3tJ
-----END PGP SIGNATURE-----

--VXjPlppBj66GQmE3lyVKXx09Br7HK0UXX--


--===============8147233210112719662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8147233210112719662==--

