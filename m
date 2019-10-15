Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A18D6DF9
	for <lists+apparmor@lfdr.de>; Tue, 15 Oct 2019 05:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iKDy2-0005KC-2L; Tue, 15 Oct 2019 03:57:50 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1iKDy0-0005K6-Ta
 for apparmor@lists.ubuntu.com; Tue, 15 Oct 2019 03:57:48 +0000
Received: by mail-lf1-f49.google.com with SMTP id u3so13298941lfl.10
 for <apparmor@lists.ubuntu.com>; Mon, 14 Oct 2019 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version; bh=kv84csXM007pQRiuVyC4bxrS4z1RYzLmldc3dWclYWE=;
 b=nWTXDUQkzIGVwJlQ1jiZYP2dMPWa7gGjCoTdLL0spTnotpk6GjYOd6MUi3OHtwnsAY
 y+0W6VGSW+A7nMQhMB+s2tQZHmnomQyiSh/5uDMCzhc71T3l082GOn+WguHHA/+A4/0D
 4wDWA7HyVOXwN7Yla9O89QZPWBEgA7LhsRyihhenW4XXOVttCxkybUMInX1wMyDCJbwl
 jmqWQR1wMa6njMk1sSdXvTksyIY2aZZnP9pxX/d1PRaCWiBBiLFU++WAK+JzULz+zhIj
 nIG5CZJqpxdkbGLez+80VH54LfyV0KuDZYnB9/xQwyA+rdqJWUggHHqRokuA6curcL1j
 LfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version;
 bh=kv84csXM007pQRiuVyC4bxrS4z1RYzLmldc3dWclYWE=;
 b=tNzR7pLROnwR3fmSAYqeTKBN6jy3Sjg5Xr1OUad8eOFluijMrz8/HejZ/RGzvipQx2
 7l3l5JrPSYGswdm73gdB909TXZiQNp8oTENicLRo+WBFQI7ayTXHPSejKnD87XDe1XWo
 o3BuL+5ezcju0I3qGojT/NVF80WRLbS+aJMGum+W+nvak8+UAqicsgPzGkmlDR/2F9Nf
 e1j23BEorfTLCy3fl/STi6+cSHToXDV1HtjxNMRCp1/HRUTEBpP+ATIgmx3bQ2FMP1JO
 ZEGKPrlQGOALut4TZJkhhGIEZE4DGpLvwt25wUKQcCh4S3FUqFqOuM1KUn870lk66i5o
 IFcA==
X-Gm-Message-State: APjAAAV0M9GgADNWoaiFSs3Sa5I86ODq/+ShIgIeUBBi4zsH+um2GAm6
 K0Y3CqYm1i2iFYpotRja6wJ0oODa
X-Google-Smtp-Source: APXvYqwEYm0W+fiIQgYocMU3Uu/6go3x7jLxBvDsKm5yJZsQek2iv9bWqDvYGiVsUAvn9pIRhIhHJA==
X-Received: by 2002:a19:f80d:: with SMTP id a13mr17956078lff.6.1571111868069; 
 Mon, 14 Oct 2019 20:57:48 -0700 (PDT)
Received: from localhost (public-gprs351484.centertel.pl. [37.47.4.61])
 by smtp.gmail.com with ESMTPSA id q11sm4799900lje.52.2019.10.14.20.57.46
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 20:57:47 -0700 (PDT)
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
Message-ID: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
Date: Tue, 15 Oct 2019 05:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Subject: [apparmor] Question about "too many specified profile transitions"
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
Content-Type: multipart/mixed; boundary="===============1574774113864789309=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1574774113864789309==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="evpt2glP13W01qfWRT6nIeK9FT2s8Cjug"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--evpt2glP13W01qfWRT6nIeK9FT2s8Cjug
Content-Type: multipart/mixed; boundary="LYdNCh5LAHvqC7KhjwN1TYz8BBylcMb59";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
Subject: Question about "too many specified profile transitions"

--LYdNCh5LAHvqC7KhjwN1TYz8BBylcMb59
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Should the rules in the following test profile count as a profile transit=
ions?

profile test /bin/test {
  /file1 rwl -> /some-file1,
  /file2 rwl -> /some-file2,
  /file3 rwl -> /some-file3,
  /file4 rwl -> /some-file4,
  /file5 rwl -> /some-file5,
  /file6 rwl -> /some-file6,
  /file7 rwl -> /some-file7,
  /file8 rwl -> /some-file8,
  /file9 rwl -> /some-file9,
  /file10 rwl -> /some-file10,
  /file11 rwl -> /some-file11,
  /file12 rwl -> /some-file12,
  /file13 rwl -> /some-file13,
}

When I try to load this profile, I get:

  # apparmor_parser -r test-profile
  Profile test has too many specified profile transitions.



--LYdNCh5LAHvqC7KhjwN1TYz8BBylcMb59--

--evpt2glP13W01qfWRT6nIeK9FT2s8Cjug
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXaVDuQAKCRAy2ctjR5bM
oXDEAQD31LSpDKWVowdrgpzMIBI/msc4KEfR/dFEY0TmxSsK4wEA5mGUTnxYcJUT
7NSMe5btity3/yw3ObBf0WSsqbS2vgM=
=cBbP
-----END PGP SIGNATURE-----

--evpt2glP13W01qfWRT6nIeK9FT2s8Cjug--


--===============1574774113864789309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1574774113864789309==--

