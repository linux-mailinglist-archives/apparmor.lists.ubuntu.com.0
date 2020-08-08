Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296923F708
	for <lists+apparmor@lfdr.de>; Sat,  8 Aug 2020 11:14:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k4Kvh-0006Qi-KJ; Sat, 08 Aug 2020 09:14:17 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1k4Kve-0006Qb-6G
 for apparmor@lists.ubuntu.com; Sat, 08 Aug 2020 09:14:14 +0000
Received: by mail-ej1-f52.google.com with SMTP id a26so4499899ejc.2
 for <apparmor@lists.ubuntu.com>; Sat, 08 Aug 2020 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id
 :disposition-notification-to:date:mime-version:in-reply-to;
 bh=Zmf3ksQHgprnOoMgogZfVPBbmbyBuOaDI8CD4lZdoMc=;
 b=FC3V7zX7vtqiHn77M5CoeuZGlKv+WmdnnUwqJZU7gP15bgGcbbhOGoOgtnxkBispDW
 28S00KjoMIGjAITZjd2+z+5UdkRnELAaqFKRqidJJqe5fPYQNmx/yw4cYpMwAdPs3Fmd
 AKWTwiHvLG6RM0eQW5Dqiff9xc4CMk3ojU8IxZL+2OOjqNpzY99uE90NbEsDYus9BiaV
 p6gkJpSBQv1ucRBigAgiEpU4G8bO8EMy2f0WgMQLhClnLGFV6NN6NJBsypRTOVaIBT7D
 RLjct0ekuTyDxNwl81vPtXV09tL3mJKW8SH5O34Q6GQnMaN/y3ZIjkBRGVaUeRDDG25i
 2hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :disposition-notification-to:date:mime-version:in-reply-to;
 bh=Zmf3ksQHgprnOoMgogZfVPBbmbyBuOaDI8CD4lZdoMc=;
 b=GEhcbYzJAcYUOuaNDkRWpVIdsGaVze8rcMeKlcwU4xocLA2uP6oaxkUds0WAvkQWCA
 S0D8yLnFuKqbw4fsoLpi0+40e07rQVGlwVwz5L86rCIBVD00vdkUVnST/9eLBxoW/DUJ
 wsCRM4N9vHxZZdRw53pNaTgI8DKTO638d4eTqQOW0XW5Ch3dQJKNSMrFD4mysdYv6OKZ
 hsFpy2hK83sWDayiUEMIGYFJAcmtbGzbWCnCJtWbSSOOI9rggqq3XJXzzG2MD8/zZ8BC
 tILcpxidhGQcH2xmrnFvc6AQrA972hEpjSuJaHiN99VhNSvJjMVRhgniLP4OqfqYT1En
 fxnw==
X-Gm-Message-State: AOAM531VYXVGVSdPmjKO1Fdu7lwd3H046H8gOr2kfOBNZ3a9FRblV2lP
 xC7rB3JaSsKW8eSY6RpG2Of9Tw0w
X-Google-Smtp-Source: ABdhPJyF112o3mm3VyrUhjNxTbrl/GORp+SqolZtlPrcwWLh6mLEeT3NbIkIVqmk+mskJ/v18fe3LA==
X-Received: by 2002:a17:906:d7b1:: with SMTP id
 pk17mr12972874ejb.554.1596878053332; 
 Sat, 08 Aug 2020 02:14:13 -0700 (PDT)
Received: from localhost (public-gprs558449.centertel.pl. [37.225.44.178])
 by smtp.gmail.com with ESMTPSA id dc12sm7583335ejb.124.2020.08.08.02.14.12
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Aug 2020 02:14:12 -0700 (PDT)
To: apparmor@lists.ubuntu.com
References: <20200806110540.1a67cbe2@mephala>
 <22516202-d22a-5975-93f2-fc7606e45e13@canonical.com>
 <20200807190741.70738f15@mephala> <4659696.0Tsaam8APR@tux.boltz.de.vu>
From: Mikhail Morfikov <mmorfikov@gmail.com>
Autocrypt: addr=mmorfikov@gmail.com; keydata=
 mDMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQu0
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+iJYEExYK
 AD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUC
 Xj79nwUJAwmsJQAKCRAy2ctjR5bMoSfMAP9ZBENeQz9MCxZwA11bL9b+ADaYruFlEWVKv9TE
 d+bHjAEApCH8boYJ5QZBD+HYwDCxxKYMiQ7yfhkn8sRWdIThYAq4OARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHiH4EGBYKACYCGwwW
 IQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXj7+CgUJAwmskAAKCRAy2ctjR5bMoZIbAQChdKEJ
 zIXMxUOPs3fMn+cth5CB6NCVXQSF+BPhzJuNuQEA5WTZzlkCfKjXjkcqDGnDd7OHc8Es0OR1
 srTstnmwUAI=
Message-ID: <36b56d00-5488-f65f-a3ed-4379f76a95ea@gmail.com>
Date: Sat, 8 Aug 2020 11:14:05 +0200
MIME-Version: 1.0
In-Reply-To: <4659696.0Tsaam8APR@tux.boltz.de.vu>
Received-SPF: pass client-ip=209.85.218.52; envelope-from=mmorfikov@gmail.com;
 helo=mail-ej1-f52.google.com
Subject: Re: [apparmor] deny and selectively allow in AppArmor?
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
Content-Type: multipart/mixed; boundary="===============2470623727972035751=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2470623727972035751==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dq4zaJh2OzNQoJ6sKY4Vl3gMHqRi41Gjh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dq4zaJh2OzNQoJ6sKY4Vl3gMHqRi41Gjh
Content-Type: multipart/mixed; boundary="Id3PuIWWzJGMc1eUcmb9qbuXqTymsVIjx";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <36b56d00-5488-f65f-a3ed-4379f76a95ea@gmail.com>
Subject: Re: [apparmor] deny and selectively allow in AppArmor?
References: <20200806110540.1a67cbe2@mephala>
 <22516202-d22a-5975-93f2-fc7606e45e13@canonical.com>
 <20200807190741.70738f15@mephala> <4659696.0Tsaam8APR@tux.boltz.de.vu>
In-Reply-To: <4659696.0Tsaam8APR@tux.boltz.de.vu>

--Id3PuIWWzJGMc1eUcmb9qbuXqTymsVIjx
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/08/2020 22.12, Christian Boltz wrote:
>=20
> They get added up - so in your example, you'll get rw.
>=20
> As another example,
>=20
>   /foo rwl,
>   /foo wk,
>=20
> will effectively give you   /foo rwlk,
>=20

I have a question -- what would be in this case?

owner /foo rwl,
      /foo wk,




--Id3PuIWWzJGMc1eUcmb9qbuXqTymsVIjx--

--dq4zaJh2OzNQoJ6sKY4Vl3gMHqRi41Gjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXy5s4wAKCRAy2ctjR5bM
oXXiAP0Zs/jwAa9rDG+nCy4ztX4lJCttX6cKi3cuNmoXB6M/ZAD+OBu6wSpb56b6
BlDtmMksVXYHCnECHRIx325mGE6yWQw=
=6ZjP
-----END PGP SIGNATURE-----

--dq4zaJh2OzNQoJ6sKY4Vl3gMHqRi41Gjh--


--===============2470623727972035751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2470623727972035751==--

