Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DB279C5
	for <lists+apparmor@lfdr.de>; Thu, 23 May 2019 11:56:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hTkSg-0002XX-R0; Thu, 23 May 2019 09:56:34 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1hTkSe-0002XR-7w
 for apparmor@lists.ubuntu.com; Thu, 23 May 2019 09:56:32 +0000
Received: by mail-lf1-f44.google.com with SMTP id c17so3942562lfi.2
 for <apparmor@lists.ubuntu.com>; Thu, 23 May 2019 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=9wsWu3nuL7nq0XhAaIUe/4hjCsx+eghpPC60W+MsKj8=;
 b=Pb6wB3Z/fBvqMWak3VXoBHCSmm6xxaGGGemfVUeitYHtZMJqIEsCaKWMePEYVoVWQe
 niOaElKpRRo6pHVuJuHuyZnDnJuUUwvvP+ES5UQU++r+1aiGgwQ3ShRDYBzbBlYoUFtJ
 5wWE41L0+Sz1yZ45nMGxYgNpkN3zpfgwm+vPd0Z01vtguyFaw6AO9RjzCGV8+Vrx/3R/
 K4oMVLSfukzISUpqLH+oGka9ug50fGytlztS0ewAOgcd9xwN3pHat59YwYAQKPurYmel
 idc3xPsoQ9IeMadkVnVWlWY/FgNsL7JrfU1Df6H68AG6sftc7tTZ40etG8OnRIz/mISA
 rZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=9wsWu3nuL7nq0XhAaIUe/4hjCsx+eghpPC60W+MsKj8=;
 b=acPC60BEU8AM6c3Zj0W7uKWUfjFVuj4qA+DYiCrIs72lds6UyVbu1rDCjoJM2RtESu
 GFrin5InghUAD2+bqBhN3XelTnBTrCGVf4DYd0cvAWw5kplGAQ/wPuFNFpWtdMMKZ738
 aPPIxPwt7UYaCa2JP3QN+KnuPXtJWcSvOumL93BQQqcqKvJ5AKaPXHqoRpE2axiwUw28
 /9fg7lFp/h96Fi95l/UvxWmdF6IoSJkShnmbebEeHhdjF1HM9iD9RELKSyDa/kXbKfad
 Xdksi+J5lTAqS+pzW7WCj+WLINdEh9P/vTPOcx3bEwGpUvx2U96xBUkD0OmCCC5WUate
 Ft8w==
X-Gm-Message-State: APjAAAVZxXbYvn+Kk3sA06G5B8NZ8jHYIjqbRRQjOkISQRWiuAMQ9+xA
 6+baENz7Wd0MlYaEqHyfba4byCHl
X-Google-Smtp-Source: APXvYqxXyiuPGqxYybAuIK8QXL85gJYxnjWrYx++GXZLu9EN4qcoyjfYAQ110H8GHsRYoIqwCZuv1g==
X-Received: by 2002:ac2:5212:: with SMTP id a18mr46763588lfl.166.1558605391315; 
 Thu, 23 May 2019 02:56:31 -0700 (PDT)
Received: from localhost (public-gprs354460.centertel.pl. [37.47.15.221])
 by smtp.gmail.com with ESMTPSA id w27sm5958969lfn.19.2019.05.23.02.56.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 02:56:30 -0700 (PDT)
To: Jamie Strandboge <jamie@canonical.com>
References: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
 <20190522191725.GB1447@iolanthe>
From: Mikhail Morfikov <mmorfikov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mmorfikov@gmail.com; prefer-encrypt=mutual; keydata=
 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
 VyIzwTcJuLgTKoPQBcfsUkg=
Message-ID: <07b6e8df-f76f-486a-5104-55f95296df15@gmail.com>
Date: Thu, 23 May 2019 11:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522191725.GB1447@iolanthe>
Subject: Re: [apparmor] How to limit the microphone access to certain apps?
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============0853537656142564006=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0853537656142564006==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="pCyU5acuzRzq8zkpYo3yKdQJsTE5Se1zB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pCyU5acuzRzq8zkpYo3yKdQJsTE5Se1zB
Content-Type: multipart/mixed; boundary="3buRUuWjzJLvyRPCjvcCx2cjcHbVMPEm3";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: Jamie Strandboge <jamie@canonical.com>
Cc: apparmor@lists.ubuntu.com
Message-ID: <07b6e8df-f76f-486a-5104-55f95296df15@gmail.com>
Subject: Re: [apparmor] How to limit the microphone access to certain apps?
References: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
 <20190522191725.GB1447@iolanthe>
In-Reply-To: <20190522191725.GB1447@iolanthe>

--3buRUuWjzJLvyRPCjvcCx2cjcHbVMPEm3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22/05/2019 21:17, Jamie Strandboge wrote:
> In short, today you can't do this without patching your pulseaudio and =
denying
> access to /dev/snd. In the future, pipewire should allow this sort of
> mediation, but I don't know OTOH what that will look like atm.
>=20

I see... Thanks for the answer.


--3buRUuWjzJLvyRPCjvcCx2cjcHbVMPEm3--

--pCyU5acuzRzq8zkpYo3yKdQJsTE5Se1zB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE5JPPWm5C7TFDUMqpzQRoEHcbZSAFAlzmbkwACgkQzQRoEHcb
ZSDALRAA0TrBvyvZLWACHrvv02vCcCm6njB9gCXHOg43pvsA+HY7+znhTv/DuE7T
vyylkOv9zG3O2pD6vXhymw4R9A4GQrAVCkK+YYetqwYhRIBq+cA1AV7ymKqNx1GD
R+3FvcfiTvPQgUJCHJjvkBaMWn9TVW2INnk41m2jUD0l6cAnFnX185eL0SxWkUUL
jbcayUitX6GUJDE9/kM70hSNJ7L45zCmEM0quS0Utpr6vqaMOMnl3lnh5dsarhX8
qECdZTLjs6ewWDeJIJnT/Qn1qwDgAEcLXVMxhTSOGepbY2YT2IcjszseVjGvFacQ
P3vCkXmX1HwV59chbaI+88oY1LeV0oVl/GSjDHsJUcdFB6B4W5hGp0nbS9pncqYr
lejTJRmyS3BVC2RwJsq+oqOIOtZPpAYYFkiCf8XZhnyqP6WzhiT8xFVRzdnmLt5z
fFj8ZakWClpYCGmSj+01h6OyJJI+cNL8lO9kE4MtaGl5b4Rs1C9yy183E1vzSVym
HD/9NGTgNVgAPSz2ZvWZgEwjk5vKyefUWazkr17zqasSFkSvdOmbwm1orO/BEWI+
hjwDSg2Pe3AS3Jdwsy0T8E+0Fv036D05qNYopj9Cj+FdZ2NuXp8MLzLeD5p9/B5k
GM9KGSDzGFM6/MwiO+V0vkXGwsVads7ZGOCTKCwNIHJn5havtR8=
=RJpA
-----END PGP SIGNATURE-----

--pCyU5acuzRzq8zkpYo3yKdQJsTE5Se1zB--


--===============0853537656142564006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0853537656142564006==--

