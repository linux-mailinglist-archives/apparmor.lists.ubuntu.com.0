Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB62345F
	for <lists+apparmor@lfdr.de>; Mon, 20 May 2019 14:42:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hShci-0004S5-BK; Mon, 20 May 2019 12:42:36 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1hShcg-0004Rz-Ie
 for apparmor@lists.ubuntu.com; Mon, 20 May 2019 12:42:34 +0000
Received: by mail-lj1-f195.google.com with SMTP id j24so12348020ljg.1
 for <apparmor@lists.ubuntu.com>; Mon, 20 May 2019 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:openpgp:autocrypt:subject:message-id:date:user-agent
 :mime-version; bh=UPM55mMJ5Advr+NSwRikwfF+gX6dlhRtkCyLM+rw3YE=;
 b=ENFMF1k25EXCqnLP+Yc4AJwvExYrayl3AoLQJ6YJb6pFaEHpAmwxxufBPXLRArL4GX
 fhmwA+FCbSISo6B0Y1bULiCfIa3iJK4xnX6/7259BAn7+dhUOe6W6DYwcZmaOAp7t+4j
 B5zEM0asYG8viuzIoCIMmfFDvOoUHzszzDPETbCUJHX6rkq32bhivbDpmUp6AUpqert8
 T7GvirO/eiCAy20E5GiTGh1tfvxQ9CiNys+nVG8bCGEQE+zGF8q68c+wWCGPRAbGK+Cv
 lc3o8fbk+dbhYJEL0+mv8lPe2izwOdvdUAVZhk6Rb0/NlxNSmkkM0zDV9fqlCkdPzVCp
 SmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:openpgp:autocrypt:subject:message-id
 :date:user-agent:mime-version;
 bh=UPM55mMJ5Advr+NSwRikwfF+gX6dlhRtkCyLM+rw3YE=;
 b=GxFJBhLqkek+Fr6ObCfmG5crV2EL2V1IDtV4y0C5O5se4ziG0kUxb/c6RmdCIxW+of
 nom1XjN80Z4cK/61Bck3NWOZHj1WTkH8GKVpRNpZuVfqoDGmT2jF9vMY000h69Ypm1r0
 5XhGgodKXm3mzB+rYd1NKmPflzirbQixIg71x3NXsqYdhiS1HVvJT3DHQwQmaQi/1sCv
 dnVh8LNCP5qjGHpSEUL3ICELS4YV3OmqPBwCQldd9Mb9WVRmDuhhMJb1TvSHBfBBbHUX
 e+YNa9xaDmJ19DXKhcOsWNgkGTioicMQP/rqAECMAy+SGr1zaLYbq+SKTa9k5Q9YWzZs
 zFOQ==
X-Gm-Message-State: APjAAAWf0HfX5YQL7uB8IhyY5KU+H7WumxIuUGofQa29vIatNxmESI9o
 TPZCwun/Xo3wCcqMy2KctWGuD45/
X-Google-Smtp-Source: APXvYqxZd4qu9aWnKlvUq7E9kOMalBasnc/1p8fqU886+mDwUdoE5EQ1FmLOou9IwKQLSDNETl601w==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr34239232ljt.148.1558356153713; 
 Mon, 20 May 2019 05:42:33 -0700 (PDT)
Received: from localhost (public-gprs354460.centertel.pl. [37.47.15.221])
 by smtp.gmail.com with ESMTPSA id f189sm3932045lfe.66.2019.05.20.05.42.32
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 05:42:32 -0700 (PDT)
To: apparmor@lists.ubuntu.com
From: Mikhail Morfikov <mmorfikov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mmorfikov@gmail.com; prefer-encrypt=mutual; keydata=
 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
 VyIzwTcJuLgTKoPQBcfsUkg=
Message-ID: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
Date: Mon, 20 May 2019 14:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Subject: [apparmor] How to limit the microphone access to certain apps?
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
Content-Type: multipart/mixed; boundary="===============7328612883883718394=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7328612883883718394==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WV4YSbneZP7YPKcL1fCOscnDjxvhf1ZrZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WV4YSbneZP7YPKcL1fCOscnDjxvhf1ZrZ
Content-Type: multipart/mixed; boundary="sblF00mBq3Zo0PndVBarCUd2aaiRNiDCR";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
Subject: How to limit the microphone access to certain apps?

--sblF00mBq3Zo0PndVBarCUd2aaiRNiDCR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

There's currently an abstraction *abstractions/audio* which=20
gives access to all devices/files that have something to do=20
with playing/capturing sounds. Many apps need only the=20
playback devices to play sounds. Other apps need also the=20
capture devices, so they could record sounds via a microphone.=20
Some people don't want to grant the access to the microphone,=20
for instance, in web browsers, or in a text-only messaging=20
app. I thought if I denied the access to the devices like=20
*pcmC[0-9]D[0-9]c* , the app, which wants to use the mic,=20
wouldn't be able to do it. But it looks like even adding in=20
the app's apparmor profile a rule that denies access to=20
anything under the /dev/snd/ dir doesn't really prevent=20
the app from accessing the microphone, or the soundcard.

It looks like PulseAudio is involved here because when I=20
removed all the PA rules from the *abstractions/audio* file,=20
the app can't detect the soundcard anymore, and hence it=20
can't play or record any sound.

So how to limit the mic access to certain apps using apparmor=20
profiles? Is that even possible, or am I only forced to grant=20
the app the full access to the soundcard?

I'm currently using the linux kernel 5.1.2.


--sblF00mBq3Zo0PndVBarCUd2aaiRNiDCR--

--WV4YSbneZP7YPKcL1fCOscnDjxvhf1ZrZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE5JPPWm5C7TFDUMqpzQRoEHcbZSAFAlzioLYACgkQzQRoEHcb
ZSBG9BAAmZHbGS7ZMnUcgEjNGpHRwoIMGYM7kHJRUIDqRXzmgr5IsFdMD/ZxThkd
Ukva4gU2Qxe04cne2wwqwdrnG0VABWBC5LEKokD8LvR/v9FPViVMFZ6Axxg622EG
liZOwCJh/bnks5lLqHdhV5LYlxsRON9ngN5arIPnXjcMXpVngcGn5W/2J1ivtRhY
YnOeWNaZBXogNo47BiQU+D27uvWH7aDAz3NpA1Z6db3ob39KJMkGSp9Ev8xDJSUb
PwtZZcVOJl8po/mTzDG5BGXDc06fZZy+2XZcJEj2EnA2pQyaw0hyaoC4lNwTzoHf
oyg8iPdbDytOtuhP769J1oqQylwSjXjdXEloEZwcXnwI80WSGYbVvoAaZ+ZHItqu
82Omuo2edQXCsukGKdy+tKaZbKRFhzYB3BsMojZJJDDc+DdSPo9byVEPFZVih7m3
9e445qxkxSzg1MBU0Vj3bYflt9+iw1KE3SX9B7l+q5FRU51NIDNnReI05RJeJUKv
38U4DlrNPMyiuYpdRAw416V8WuTfH8j1WceFKcrkCn8C4YOxzISFvan+M3GcPi/o
5Mja4N5s5VfZiK2lQxo99xRZ+N4KmUAG9VwXTkVdE4+yzmdQOE4YeXtSjn0x8vPB
uT07aSFHtg4KrSOghkYahLItEPXbPTbyNZprYMnDmEYzWgmptww=
=O13D
-----END PGP SIGNATURE-----

--WV4YSbneZP7YPKcL1fCOscnDjxvhf1ZrZ--


--===============7328612883883718394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7328612883883718394==--

