Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 89098B57BD
	for <lists+apparmor@lfdr.de>; Tue, 17 Sep 2019 23:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iALKK-00043S-PQ; Tue, 17 Sep 2019 21:48:00 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1iALKJ-00043D-Js
 for apparmor@lists.ubuntu.com; Tue, 17 Sep 2019 21:47:59 +0000
Received: by mail-lj1-f169.google.com with SMTP id 7so5091898ljw.7
 for <apparmor@lists.ubuntu.com>; Tue, 17 Sep 2019 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=wrB2itwfi5Yt7ALmNqGILS9hN00q5OmV7qBFyNMeiV8=;
 b=VENyo8wZt6447xByCFr6dACNO1SDvaS+xwtTvnI829n/fTO9Ip3h7x/O1PwaMq6o8B
 iaEj25FUnSUazGUVnM5a9+sROVlgPcURMJi+YiC0m76dChXGsTGJ+aHQedqhBiSD7P3o
 0FFVmg0IySoj6HnDK9W9LCzusaa9fQMgOWVC3e4WNlIQ9zpO9b7OGuB1qOnxnyyItXrR
 ZYNlMFmdlWEdVRjv6Mp9YkC6nACwTyrWW0GdNAacJoRmya/8q8k4apoRDrmm20uNwSI6
 XjtZ3J5XCmZdNYn1TWXjKCF+V396tsFfpYWH9IJ3/C/e7laBj9We00W15XtqVNQjyNR9
 jtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=wrB2itwfi5Yt7ALmNqGILS9hN00q5OmV7qBFyNMeiV8=;
 b=DI03N3s4k2VWNSBaB8CohOoRAjxUWk2Ia/ZGqRm+7ftd/wxBZVT3DI7x7gaPoL3m/X
 9nvlKAN2tYYijE+ObwcxZyv+0q9iL8udxwtIQAT/QXAIbVwJ/QWaLG59oyjdRqG/fFFL
 QbgNzGUKouOoZGc7N9oETYwq4faIj2ClqsH4/RXPfdTOyagtt9ucF8h5YCRZgNxFvzkK
 7PPLyEzt7FoJ3lX7dAFjhauf26bbTrMwr6+HCSD36MGc+JaBx/Q7aOhsbN8npuHkq3u/
 roeUzCidS2qDOl81p4Sum5i8KcoQBYvOPQf4ZbMiGLP6AgoVnpZ3Yk7pyhBExz+Ya9A7
 wgCg==
X-Gm-Message-State: APjAAAXB28I4LyxBwe9N77sgTiGOpwWfWsb7RuTkIR65CdLOzSQ0RYz5
 G+3+8lSidPOgpOD5W6SL59jeJ4VY
X-Google-Smtp-Source: APXvYqyllbkMkFeUmjR5uvudgr9W2YOq8xg6i0qfWrejUcdnRD+iBYee7AbZnEK6Oa3nKgvhHM91Og==
X-Received: by 2002:a2e:9586:: with SMTP id w6mr253776ljh.47.1568756878588;
 Tue, 17 Sep 2019 14:47:58 -0700 (PDT)
Received: from localhost (public-gprs351335.centertel.pl. [37.47.3.168])
 by smtp.gmail.com with ESMTPSA id a8sm660797ljf.47.2019.09.17.14.47.56
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 14:47:57 -0700 (PDT)
To: apparmor@lists.ubuntu.com
References: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
 <20190917125327.GA21433@millbarge>
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
Message-ID: <8d35ab8d-5181-34a7-a822-d9d839407609@gmail.com>
Date: Tue, 17 Sep 2019 23:47:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917125327.GA21433@millbarge>
Subject: Re: [apparmor] Question about file_mmap/exec in the case of
 perl/shell scripts
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
Content-Type: multipart/mixed; boundary="===============5299558732563478118=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5299558732563478118==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WFOrxamPNBBxjvBJQKg3bLcZJgKtH7w67"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WFOrxamPNBBxjvBJQKg3bLcZJgKtH7w67
Content-Type: multipart/mixed; boundary="fbgdvDQZhCBjeULIsdkmzRNPQeKb2FXOJ";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <8d35ab8d-5181-34a7-a822-d9d839407609@gmail.com>
Subject: Re: [apparmor] Question about file_mmap/exec in the case of
 perl/shell scripts
References: <5991785a-1f0d-0a7b-46c6-1ddc4189f69a@gmail.com>
 <20190917125327.GA21433@millbarge>
In-Reply-To: <20190917125327.GA21433@millbarge>

--fbgdvDQZhCBjeULIsdkmzRNPQeKb2FXOJ
Content-Type: text/plain; charset=utf-8
Content-Language: pl-PL
Content-Transfer-Encoding: quoted-printable

On 17/09/2019 14:53, Seth Arnold wrote:
> On Thu, Sep 12, 2019 at 04:20:22PM +0200, Mikhail Morfikov wrote:
>> Shouldn't be here some "x" or "m" permissions, or maybe AppArmor assum=
es=20
>> this automatically for the confined path, so it's redundant to specify=
 it=20
>> manually?
>=20
> Interpreters are handled differently:
>=20
> https://bugs.launchpad.net/apparmor/+bug/1346553
>=20
> I'm not sure if we'll be able to change this behaviour in the future or=

> not.
>=20
Hmm, I see...


--fbgdvDQZhCBjeULIsdkmzRNPQeKb2FXOJ--

--WFOrxamPNBBxjvBJQKg3bLcZJgKtH7w67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXYFUigAKCRAy2ctjR5bM
obDEAP9RGoFblhZ34NEXiXdOx9FTtKgs7dkBbXzWQdWyoQhWlAEA75M4h2ZB1gqS
QWVI9WBtR1WF6yEZwJsuKja5K57cVAc=
=eKVc
-----END PGP SIGNATURE-----

--WFOrxamPNBBxjvBJQKg3bLcZJgKtH7w67--


--===============5299558732563478118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5299558732563478118==--

