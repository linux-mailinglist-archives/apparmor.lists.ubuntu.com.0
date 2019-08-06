Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B4830C5
	for <lists+apparmor@lfdr.de>; Tue,  6 Aug 2019 13:36:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1huxlU-0000ku-LF; Tue, 06 Aug 2019 11:36:28 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1huxlT-0000kj-Ki
 for apparmor@lists.ubuntu.com; Tue, 06 Aug 2019 11:36:27 +0000
Received: by mail-lf1-f43.google.com with SMTP id v16so6952698lfg.11
 for <apparmor@lists.ubuntu.com>; Tue, 06 Aug 2019 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version; bh=dKCHDjQcPg9N1FOtYhUUnjy9NEySgHBh48DEYxO6KO8=;
 b=AaBTP8oojeklNO/9SFAdDN5aprZyv3BLUKeglxxrVjSWjCmLFgxkd2OlhnWquTMRLO
 vDk68V82d/MxHTWpoHhk2qv8JKmJbkSny/lNcP7lgQGBB5V9ag5v5LwubJu16/kUHhDz
 qEF3C3Xjvm5SHbckrKWjjKQ3DOzkcxUX2p6xqQi9bOeDfANI7Pu8P8/IXBSCRy8IyfEX
 yCSwsByaJ3CiQ/1FwuqYIiMSXmXG2coSCwBkioJM/9k5dIDqiuNELYZYeHpE+vDR/Nh3
 KFrBNU0DyspXQPR26QZalda0/nQRXu+Ksc7/WGbRnKX/SoHOorN6vSDTZtPZHJd3t8mw
 xXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version;
 bh=dKCHDjQcPg9N1FOtYhUUnjy9NEySgHBh48DEYxO6KO8=;
 b=PA7BoYh1gmEMVW0+V3NJp+RI9LinsAAnLnw/RlUM+PqbJ1BM2lO1eheR5KVf5UkN9K
 eadPGW7/82fX7Dfd1J/gNP1iyybHmY1YsWmpRuAHU8jWnzPyS54cUBbx+8thBbrwvuMd
 Pe15ujgXR32JW630KQoV8ZyVgoeXw1LPY2wtkGdtsv97/nmK3IlMHcadevXv36+eh2ja
 rQuTvI8427m3ra3z7Bx4ijaMt1Luyh8dgl7qinngQTIodvew3EsMoOvRbPB3l5A2D695
 oxdcGYWAiMPXM+Vswx4yFjDyBqi3BxkyKgfb6cIogTpFwEdviISoQutCmP3xbIXJKrJM
 W24Q==
X-Gm-Message-State: APjAAAV7DbLK8xUsFOAdd+IbWi+WXi029wRlKpBlhbpUJk9VPMuQZTAx
 6bxa8cpaJdkITIkQ8tVcH307U3QV
X-Google-Smtp-Source: APXvYqwhOmhRD31OSHlr2lv+5EHcW4mB9MgtkVomE9N5eyP4TX+H0uRAHeyQZwuw7dcBzmbMa6reuA==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr2228063lfn.20.1565091386646;
 Tue, 06 Aug 2019 04:36:26 -0700 (PDT)
Received: from localhost (user-5-173-201-156.play-internet.pl. [5.173.201.156])
 by smtp.gmail.com with ESMTPSA id k27sm17120248lfm.90.2019.08.06.04.36.25
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 04:36:25 -0700 (PDT)
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
Message-ID: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
Date: Tue, 6 Aug 2019 13:36:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Subject: [apparmor] Question about "Failed name lookup - disconnected path"
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
Content-Type: multipart/mixed; boundary="===============0210476369317221617=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0210476369317221617==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="IovrSg4MVVVa9ts0FLWs7D7nwB192wW82"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IovrSg4MVVVa9ts0FLWs7D7nwB192wW82
Content-Type: multipart/mixed; boundary="kxrnqokYgvBiFrKbj7xtbWEp9CdleJHU4";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
Subject: Question about "Failed name lookup - disconnected path"

--kxrnqokYgvBiFrKbj7xtbWEp9CdleJHU4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I have two apps: *app1* and *app2*, and *app1* calls/executes *app2* at=20
some point in time.

When I create an AppArmor profile for *app2* only, the *app2* works
well, and there's no problem with its confinement. When now I create an=20
AppArmor profile for *app1* and inside of this profile I use=20
"/bin/app2 rPUx," rule to execute *app2*, I get:

apparmor=3D"DENIED" operation=3D"getattr" info=3D"Failed name lookup - di=
sconnected path" error=3D-13 profile=3D"app2" \
  name=3D"apparmor/.null" pid=3D55644 comm=3D"app2" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1 ouid=3D0

So when the confined *app1* calls the confined *app2*, I get the "Failed =

name lookup - disconnected path" error, but when the unconfined *app1*=20
calls the confined *app2*, I don't get this error. Also when I execute=20
the *app2* manually, I don't get the error.

It looks like this situation happens only for a small amount of apps in=20
my system, but I don't really know why. So what's wrong with it?=20
Shouldn't the error be in all cases (the app executed manually and=20
executed from the other confined/unconfined app)?


--kxrnqokYgvBiFrKbj7xtbWEp9CdleJHU4--

--IovrSg4MVVVa9ts0FLWs7D7nwB192wW82
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXUlmOAAKCRAy2ctjR5bM
oYZFAP9ETjKXQKR4ofbW03OIg0f+os5yWEYu0WP0+DV6CSyqhgD/TYCtZNvzLgWe
7PIgCjIygakUJOgLLB2m/MzdRx2CdAY=
=jdRY
-----END PGP SIGNATURE-----

--IovrSg4MVVVa9ts0FLWs7D7nwB192wW82--


--===============0210476369317221617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0210476369317221617==--

