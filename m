Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2DA84289
	for <lists+apparmor@lfdr.de>; Wed,  7 Aug 2019 04:36:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hvBoP-0004Az-0C; Wed, 07 Aug 2019 02:36:25 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1hvBoO-0004Aq-7h
 for apparmor@lists.ubuntu.com; Wed, 07 Aug 2019 02:36:24 +0000
Received: by mail-lf1-f42.google.com with SMTP id v16so8941379lfg.11
 for <apparmor@lists.ubuntu.com>; Tue, 06 Aug 2019 19:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=ePYhzRDbtKV4a11FUNqopDncJ27Cc79UaxdnxYIdkW4=;
 b=caI7CRzKd1gsljRRrDL47yHfyxFit/mJRkNQRd+ZOM2VV2y1kwaq/l5m8Jno2B7/Kd
 ZKIPcIY3LdOfOp5y5EhbPilZquXrKAMJ1GsYexP+ebK1SfnOVH/w1DJZtNhVitROTjsR
 3YsiDBwYieZpQvto5ubPKabPDafjFAGWDOcKKTTm5iAB/iRUm11kYg/42Ry04x77NILC
 hOMA95cht6Vs2l0kYCaafJnGpOjvBNtirHrX9ogY9HepndyxGI5IU/+RzA9daGDh1tjE
 J/E1CrMoCqayBVBYCe8HUzmCq79CEMbhoLVpiOFg49kAyBxEBDhWYiw9yIvFGNLWd7Lh
 4DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=ePYhzRDbtKV4a11FUNqopDncJ27Cc79UaxdnxYIdkW4=;
 b=JQHsAfnbB3tqnLqO0tXYI3YxZCkGFeqJVN9cbnPkvuQe+dfM/CibDEdowfWDj9iYX9
 7JMHqqEponVKR6U6+kG3L97wh7taHvZ/eabZ2f8YH61WokjTsyZFld67kq5uvxvsw6vj
 /O+WszDmwN9SMPKdu0X4pHKsE2tLwax5B3rHejtYpzl/YToDWBW309p3ZtvQvlxu/MtB
 u+sAdsk+RpxeeWCLzZNd/ViUWWVJHvmXHyARMrSC+4YerCOeXi+y+/rcQ7VfTSnrQVNe
 cN06bXd0paRP4BywONMakVBvXGsO1Oc2ssM53NFXKEI+WzCshjzbg/6wttgT5jmGmpza
 kG0Q==
X-Gm-Message-State: APjAAAV1KCA/WRA7OhtB54/P2QEBcuHCKJrP9ydh03Gk7Jc2G3A0ATNJ
 HQGfP8IBDA0bvBoK7YKa/+/KSRhx
X-Google-Smtp-Source: APXvYqw2KCPsZslhNKxznGxoG+7bYirXp8bKDom4kGOJSv77WPHVP8046mTbpEf8ZedmrXqZ/cKZBw==
X-Received: by 2002:ac2:55a3:: with SMTP id y3mr4588999lfg.101.1565145383288; 
 Tue, 06 Aug 2019 19:36:23 -0700 (PDT)
Received: from localhost (user-5-173-185-66.play-internet.pl. [5.173.185.66])
 by smtp.gmail.com with ESMTPSA id
 i23sm18080004ljb.7.2019.08.06.19.36.22
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 19:36:22 -0700 (PDT)
To: apparmor@lists.ubuntu.com
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
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
Message-ID: <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
Date: Wed, 7 Aug 2019 04:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806222444.GB26609@hunt>
Subject: Re: [apparmor] Question about "Failed name lookup - disconnected
 path"
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
Content-Type: multipart/mixed; boundary="===============3175910154675972020=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3175910154675972020==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="yO5pw3KzyhQapkQr94JbnzoJwIq9pArT5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yO5pw3KzyhQapkQr94JbnzoJwIq9pArT5
Content-Type: multipart/mixed; boundary="ASeYpkpqRL934ZqBBnux4QghADD2V9W96";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
Subject: Re: [apparmor] Question about "Failed name lookup - disconnected
 path"
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
In-Reply-To: <20190806222444.GB26609@hunt>

--ASeYpkpqRL934ZqBBnux4QghADD2V9W96
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/08/2019 00:24, Seth Arnold wrote:
> - run both processes in the same filesystem namespace, so files have na=
mes
>   that are meaningful to both
>=20

I though they both run in the same filesystem namespace.=20
It's just /usr/sbin/deluser which executes /usr/sbin/userdel .

Here are the two profiles:
https://pastebin.com/raw/8cDyVh8J
https://pastebin.com/raw/Etxm2h88


--ASeYpkpqRL934ZqBBnux4QghADD2V9W96--

--yO5pw3KzyhQapkQr94JbnzoJwIq9pArT5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXUo5JAAKCRAy2ctjR5bM
oYBGAP9HUgFaNzv7K5poklBAx6jb9iZGaj/H3QnMtIA3F+n6gwD/dqvxdPOSwVe+
4jlYSiCCuqR3y+axOPVVrnxn3EpKbgU=
=EqVI
-----END PGP SIGNATURE-----

--yO5pw3KzyhQapkQr94JbnzoJwIq9pArT5--


--===============3175910154675972020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3175910154675972020==--

