Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C49E5E09
	for <lists+apparmor@lfdr.de>; Sat, 26 Oct 2019 18:15:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iOOjC-00021K-5G; Sat, 26 Oct 2019 16:15:46 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1iOOjA-00020f-9O
 for apparmor@lists.ubuntu.com; Sat, 26 Oct 2019 16:15:44 +0000
Received: by mail-lj1-f179.google.com with SMTP id v24so6662165ljj.3
 for <apparmor@lists.ubuntu.com>; Sat, 26 Oct 2019 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=64ZRaRTbVL0Ot8pMstjYfNywUbT1WsgjbFpiv77jc4c=;
 b=Zcp4rcDqtj/Qq+xxM4H1a9dAvVUeZYPa4xCDYmOB+2AIS5OA46puqW6OQ/8TEYc8f6
 kjw4SQKfTFq89Zs5n94ymaf57lE1EH8R+xqP+hQwx+8zxWyORAQYAePmiqt87rTKOVHH
 UZi3vFaY9wNF3NGRqGq2SyKbWgbAH3siZrEF61H0YEGrmt9NByEMWt3TEpYnHLRekTiN
 KtfHWvmXkkomT9S+zgPm3pxnb+iTWuthkntdZgE4i0TvJpWIBeZeUIhjoi2oAiyUMWMW
 R6mqRyiCWciHW17AS73vr5AJTSRV7kJfLEyQW7Oi/0RDMb+PIO0iK8hyMu8VEP4jfScc
 PmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=64ZRaRTbVL0Ot8pMstjYfNywUbT1WsgjbFpiv77jc4c=;
 b=jdsiIKVdtqTmk3oijEUChtl2SzENxMvZpypkqY9kgW8ZlENoX1c1wMGswaypmX2g3V
 HZ6/iG5WWKraMPwoBBu49lhys5dGSBt4P3wAw6eS2lYskl2puUM0iHc7xLBeFjFpgmDr
 g91T7j17ruHY5HY5v8ky/NFdUW2BgloS5AzCGu4yENciRDDhcrJfiaHlZ7wZq1ZTaSn1
 xiACfe0yWYBVM2dhdBHGUetDVaq6qpUlYwEi/kmfzlkHCvKKMpWnl+mp/mUPGtfhODnz
 MJQx11EJ9a0e8Bpyg01DccZHLLsQXstCVajcC0JAIodweMv79i+wgNRpew51ldPpxzjG
 ce1Q==
X-Gm-Message-State: APjAAAVWESuwMsRmJugsn4AjACdrLf7vaIHDMX3BdqM3b0g48AomW+Q1
 Uu5xYiinyFUw2pqv6w88UTwNuKIxBDs=
X-Google-Smtp-Source: APXvYqxpqsRwfwQX+s7/J5uJZr/C2zESwmq3gNz7X6G/EVi3CW5GXcgtDJ9Sg4n9Gnlb2TlK9OHA3g==
X-Received: by 2002:a2e:99c7:: with SMTP id l7mr6458007ljj.25.1572106543393;
 Sat, 26 Oct 2019 09:15:43 -0700 (PDT)
Received: from localhost (public-gprs351484.centertel.pl. [37.47.4.61])
 by smtp.gmail.com with ESMTPSA id j2sm2561633ljg.85.2019.10.26.09.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2019 09:15:42 -0700 (PDT)
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
 <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>
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
Message-ID: <66fbcc52-f3a3-c8cc-1fbe-5bacbe9c67b5@gmail.com>
Date: Sat, 26 Oct 2019 18:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>
Subject: Re: [apparmor] Question about "too many specified profile
	transitions"
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
Content-Type: multipart/mixed; boundary="===============0847877682088014410=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0847877682088014410==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="kGxRcOlYZkNtLvdeNcMoZ0hZFI9PRRtt0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kGxRcOlYZkNtLvdeNcMoZ0hZFI9PRRtt0
Content-Type: multipart/mixed; boundary="wjNmk5gvRuDp9MuM4qOuDCxK1YYGtOFHv";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
Message-ID: <66fbcc52-f3a3-c8cc-1fbe-5bacbe9c67b5@gmail.com>
Subject: Re: Question about "too many specified profile transitions"
References: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
 <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>
In-Reply-To: <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>

--wjNmk5gvRuDp9MuM4qOuDCxK1YYGtOFHv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26/10/2019 18:08, John Johansen wrote:
> Unfortunately apparmor only supports 12 of this style of transition in =
a
> profile atm. There are 2 patch sets in the works to help address this. =
A
> smaller patch that can be backported to older kernels, and userspaces. =
It
> will raise the limit to 28 of this style of transition in a profile.
>=20
> There is also a larger rework of how the permission set is stored and
> accessed in apparmor, that will effectively remove the limit, allowing
> for a few billion transitions if your computer can support it. But that=

> is a much larger patchset and will require a newer release of apparmor.=

>=20
Ok, thanks.


--wjNmk5gvRuDp9MuM4qOuDCxK1YYGtOFHv--

--kGxRcOlYZkNtLvdeNcMoZ0hZFI9PRRtt0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXbRxLAAKCRAy2ctjR5bM
oYbPAQCNGVLxAKG4cWpkrL5HFOGPro22uGZDDAtxz38u0fkXvgD+IRNxLvyO57/n
6J28xbqRFFZMVc/U2L+DVwjDQMgASgA=
=RUy4
-----END PGP SIGNATURE-----

--kGxRcOlYZkNtLvdeNcMoZ0hZFI9PRRtt0--


--===============0847877682088014410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0847877682088014410==--

