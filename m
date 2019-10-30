Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D85EA47D
	for <lists+apparmor@lfdr.de>; Wed, 30 Oct 2019 20:59:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPu7h-0006ZH-RE; Wed, 30 Oct 2019 19:59:17 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wampir990@gmail.com>) id 1iPu7f-0006ZA-IE
 for apparmor@lists.ubuntu.com; Wed, 30 Oct 2019 19:59:15 +0000
Received: by mail-lf1-f67.google.com with SMTP id f5so2576889lfp.1
 for <apparmor@lists.ubuntu.com>; Wed, 30 Oct 2019 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:mime-version
 :in-reply-to; bh=miQthGzqe1uG7GpsOP5ZxFDU2KLV+wIDNnW2KCy3KSY=;
 b=vg+/v1IjhKfhYAOhZRUEgD6D6IAtl4bfINgm0FrM8EcIEdUYYRO/wzzqF2To+3uSd7
 G2jJhkJLN9fSQXgH5QQlk+v9KL4hG0W+5uiAxH84fPJA7ir/2L0+zAjRoAomE7GGrovk
 xJCiE260IZ0ak3ShtZlJ1iqaYmwVzF378/4x9WuLlZEs82VchybWuQT0xfxDZpRXa1x2
 ED9bgnB6Zfr1JwT2WpSDycQ1P/J4fE9eKogGNBjLxddhTjKqUl/VdT5NVV+3kYCsuaV1
 B9gB9Mys0cbQH93d4ZEZ5LgglxKywzEsCo6zGbDNN3MECvo4iC5Um5Bh5Zd9Ppkjcugg
 TdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:mime-version:in-reply-to;
 bh=miQthGzqe1uG7GpsOP5ZxFDU2KLV+wIDNnW2KCy3KSY=;
 b=Uaa5ct1T04obIIOjFUnwI2bfn7Jogs11JesykKdOnSuJvqNNLx+xn1ZdpydmZVwMLf
 xx4a2JtEI1g3Ij5VaOk8c/p1UkKWRbERR+6sD7SIUlKoDhbutiWJ+O7nvFoa7AfrGpVC
 CqBR/E0bj+S/X6uwBOrMbaGdJ0ZbtKiN4trUT/+o6b7siVI9STCUNoNMO54U0exncBDx
 6BZ0T/e5/1pher5QVmMF0Ig3LSpEwJSHFtSgCTJSrS+HBg5xsrg5WOan6FE1Y52efEBI
 0VcI+aG4i+ImTwleqZLIoNmf1HWtLxTYKTq7DnG0+c5kd+JAwfwA3T+i39Zi/38POrgC
 tCYw==
X-Gm-Message-State: APjAAAWoJH4WFH+ExNp1e+rzae0rUbbOw9zM8ypbPUoZwfhcuAZueQwc
 khhSJu08lI6N4al6GWnM4raK8MDd
X-Google-Smtp-Source: APXvYqybP0kQsNi2CVsNAuaPNWI+FtI4mCk5pijbexbXrBY9zfqdzWUpoqundteMPzMyCVVVfXe0Xg==
X-Received: by 2002:ac2:5195:: with SMTP id u21mr579631lfi.97.1572465554713;
 Wed, 30 Oct 2019 12:59:14 -0700 (PDT)
Received: from mail.wampir.eu (088156103145.zabrze.vectranet.pl.
 [88.156.103.145])
 by smtp.gmail.com with ESMTPSA id c14sm376809ljd.3.2019.10.30.12.59.13
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Oct 2019 12:59:13 -0700 (PDT)
Received: by mail.wampir.eu (Postfix, from userid 990)
 id 1FD031DA70; Wed, 30 Oct 2019 19:59:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin
X-Spam-Status: No
X-Spam-Score: 1.2  required: 5.0
Authentication-Results: mail.wampir.eu; dkim=none; dkim-atps=neutral
To: apparmor <apparmor@lists.ubuntu.com>
References: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>
From: Jacek <wampir990@gmail.com>
Autocrypt: addr=wampir990@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFucrmUBEACySUY39H++IF8VLBSSO5ZjcsbedIvkvIxNSs4WtfuMB3SxvFn4TljIdufv
 keMUurW6kvr+CgslM+Zt2ZzUUqUhGPsf83oCWka01+4XEIyPTH+mAvOqrp8BlMf6J3eJWngz
 gRGCUx7p7Ens3941Q+1+S942a/KhwvRba1uofsjl+3yjx/sBkTZ+n4N3q406uktu/4M3+As8
 HXGPyR4caOPZtyOgA+N4gFoFkJhtRtnqyJOphtR2hkCZ34ZVeT9WdATPyh0k4SU28LeDNnpV
 KYRXmubDjK6P02xwaQiB+xUCG4WhVNo+Xc7yXp/rBiuvMLX+t1KeS6tdYC5NuTTf9SD4Ue9a
 nycYw35ohBC4PcSZRqpLP5IftMpP06wda0W1T7iZK7WSsHquqPXriWUkkZh4a7GN32u+gEIc
 1nql2PWyU0m67AyNab47QT/mffJjaCVg0Hur6AujmD4yB4PQiBsr9b6/IqAYflytLiTCgtGZ
 FBq32uQnO8ZqjBr82/KFGjWl5QMCB7AgmFvgUlbzauNKWy2FqZHYDcoml8iWVT+VYVMq9EBj
 EskEIs/+nQCdTSlj4cBckpi+l7HDBoS+PIwt1oY5LeWYpWFru5NkMH70/f6K8S8acfIpa3X2
 90qYEbCWoa3UIp+iOSPwUnB32Cbley/+CAPBTQRnW28XwDJ25QARAQABtBtKYWNlayA8d2Ft
 cGlyOTkwQGdtYWlsLmNvbT6JAlQEEwEKAD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AW
 IQSyr8fKV6eL7qeqIEA67TrsB1Ca8QUCXSd56wUJDSs1OwAKCRA67TrsB1Ca8dw5EACiG6nO
 LLzbmK3nF6dgzoVnAaPdBuE7bue9JyrNgZ4PJPob3fR+rfWI644enkbb2zlFI6XD+fqvxnQR
 PaqTHnOcjV2NFuL0UJsLi/ZxCHtWSmKLvo0CMrCMsP3o4wX4tilVLjf3HADVPQoi3acM3Sgz
 pQB0LpAh5GCRftAdFoXwyWXOOfYcvNLO52Ar2dCid8imwugb3EC2fS2Pdz2SOoG2aEADQNwO
 DcU/XyuOaEl+4U1ULeTXo88f1DaCq2xM6XjjDrGQgh3YM9aImlYsesjCrXFIvK+9Pp2LpHyc
 mqxg3W6vIXWfCjyDvdBc6MKIU+V6lpT/XZuL+sNGy42wafK6w22zRwIzgK1RdRduHCGXpwC3
 DJtU+8ENbO25sWlMkGpWRD4eXF6HTarAT1cOEzs1W41CPNhOHg/mQrYF9rae129pq61UoASl
 CpjvaPuHiFBPOkJV4J1xUEK6q36z0XDn+KnCii9yl8bkn0oY6OwmzqxNwzKTHBBiDt4NFCPT
 zQzxxay+BoqcHJxMMIhPiaUoeCKmndyesVjczQTR68Rn6aOQVPhmYDadzAdBXIEiG+/DSb0R
 4I1qLopar+GmBeI3wOeQtPsg9+ozFZ8lfUm7B/8ERTwWWmgF9lcjc48xrQKgBcvhN/smj2XZ
 ZIBdbd71v/mgeS/x3qMaY+yU4w1JOg==
Message-ID: <6350c6cb-0301-fb03-8f15-ab073f8b8e45@gmail.com>
Date: Wed, 30 Oct 2019 20:59:12 +0100
MIME-Version: 1.0
In-Reply-To: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>
Subject: Re: [apparmor] Missing /sys/kernel/security/apparmor
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
Content-Type: multipart/mixed; boundary="===============1396709353204555843=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1396709353204555843==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="tzhywNDhEBGLbsrO5QGvGLJ1cehIb8Yq9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tzhywNDhEBGLbsrO5QGvGLJ1cehIb8Yq9
Content-Type: multipart/mixed; boundary="dISt0c5dFpCpQpRA2URyFMcD0LynnfgE9";
 protected-headers="v1"
From: Jacek <wampir990@gmail.com>
To: apparmor <apparmor@lists.ubuntu.com.>
Message-ID: <6350c6cb-0301-fb03-8f15-ab073f8b8e45@gmail.com>
Subject: Re: [apparmor] Missing /sys/kernel/security/apparmor
References: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>
In-Reply-To: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>

--dISt0c5dFpCpQpRA2URyFMcD0LynnfgE9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello

You can try mount securityfs manualy:

mount -t securityfs none /sys/kernel/security

Mount on boot?

https://bbs.archlinux.org/viewtopic.php?id=3D153701

Cheers






--dISt0c5dFpCpQpRA2URyFMcD0LynnfgE9--

--tzhywNDhEBGLbsrO5QGvGLJ1cehIb8Yq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEsq/Hyleni+6nqiBAOu067AdQmvEFAl2565AACgkQOu067AdQ
mvHmzQ/9Esezx+itBktEtqFOq20YldcY1M8yk1+jPSTfrXfZt/uWeqYhTFPq5OWU
e3wBEEUISAnjca1nLaP6QIaFNJjgSnEU7uS/MS8SfDMdzVcAR0VvYDJ7rLFSHuFP
VzC01Kc70jaVEgfyCVQmD9B1WdnjaZh1w9eOc1Lp2lODG4lIcncmbtNwPtPeDbqA
ABWBaevwc53ZgmPsdstChzCNvWf1Kzgjz3NbdQp82wXBFMV+Bsv6BQHzhAo5oMGT
t3q+NiMUprEfXzd+YLBDsaSKTC64VdJc11MhwOZdcu27hKdB2uNBXEoRS2ph/lEJ
1xMUV1KhieqC6j4f85E0CIIm5aXOBU6oWhNniOXhtiL45GisfLiA0Ut6N2QNT9dP
8q30R9t5IhvJzdqVQL2lY1akG8vRe/crPBbmVPOY7T67f6gLIkqTDvD+LesHPKB3
/FTqFJCdLtU+QQyTXxCZ/WzAY+fHPdn5rbcFRCo4/ikSxri6n3T64iYfcct7xv3i
xQuLsObfW145PQpqAgnVM2rTwqlFwkuqmVUGukwxMlJOcRKy9uPtsZEjkTE8LHf5
0JsP4y8K9vfaTOuuJAW/xB0GSn6sbiwYbwIwlDMFWfETo6PjfzSdD9bYo2F4Vuei
em54ACuIWY5tt188bbBrmIa8pvEEuA24hPV7UVTxehZb0dZiAAE=
=kNn8
-----END PGP SIGNATURE-----

--tzhywNDhEBGLbsrO5QGvGLJ1cehIb8Yq9--


--===============1396709353204555843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1396709353204555843==--

