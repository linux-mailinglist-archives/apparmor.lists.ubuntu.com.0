Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F01684A87
	for <lists+apparmor@lfdr.de>; Wed,  7 Aug 2019 13:19:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hvJyv-0001Hp-8I; Wed, 07 Aug 2019 11:19:49 +0000
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1hvJyt-0001He-Cp
 for apparmor@lists.ubuntu.com; Wed, 07 Aug 2019 11:19:47 +0000
Received: by mail-lf1-f66.google.com with SMTP id p197so63696781lfa.2
 for <apparmor@lists.ubuntu.com>; Wed, 07 Aug 2019 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=Lo7KPNbBqO15lleyrL5ttTrT2TDx1CcO6HZHEOlm5rg=;
 b=bpW2Z4UnBSFvk3ZJsfyMHhUC/HU3LneuLX9vBqHmEWn2EvSrLMI0nuMDDUb1vp4j6Q
 pNCJc/RcjY0gdXv0lxUJoenJqt7dtaKY3EHnoASmHIjqiWnB5WrxNGmcKexU7Qu5oQfA
 uC+J59eXVbVF+iCzeln/Vg2CZGwNNaWQuFz5iIptJjXPQrMReM1dxJ4QY+DUhNQj83tE
 EoDftLsaMzWyrgY/GtqlIypef9Cc6zcHXoxaTy+SlXPMw43QLKXauoE03hn8NcUjC2fd
 9KkZZSJuMRkn7Z7C7HAPAYo7d7yglCm+5UD2o7bSniiaGcSU3tKOERq92I9lwjr62um4
 9btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=Lo7KPNbBqO15lleyrL5ttTrT2TDx1CcO6HZHEOlm5rg=;
 b=eX6QCfsgLbUkutVJ2jhkYsk6JMRHpQbZ+s12sL+x1LvLKfyk4npUBssvfLThYHKVb/
 Xz3zsn/BR21S6Ivb2T6g9cppl/6heumCidZS61RXC+L+l3p9XcfxEIBRiHkhM5vf9ar4
 bRrIKdIrm2nQ+J/QHQtvo6sRlF+TY7/cfRce+yctXPMNO63NwherKIoqL8+jFuOn+AUf
 HF/3G53AhfKnH68kl3MHxdCzDfvIagAU1nVkVKmLB5ASDD3bhiivyRLffcAS2aRAUem7
 NYYLFUpOwkqpoQfxOCP9XagXtVZFDtOrCHSMMBjGLDq2dbKBONK09BZohDOCYq8J+bd4
 j91w==
X-Gm-Message-State: APjAAAUwZ1kXNh+sCffGM5RRz7GsvncDZxsBhEgdn2aGlNRI2feQNjEV
 wdes25PYh6+Jb1hMoexa6YskmVET
X-Google-Smtp-Source: APXvYqyD2OMMtz+vngG08K5aj74KKEyJg2t9kK2XnWTeobxAA/kNioNgEhxEqx6zths1tga2c+lbQQ==
X-Received: by 2002:a19:be03:: with SMTP id o3mr5557539lff.88.1565176786444;
 Wed, 07 Aug 2019 04:19:46 -0700 (PDT)
Received: from localhost (user-5-173-185-66.play-internet.pl. [5.173.185.66])
 by smtp.gmail.com with ESMTPSA id
 t63sm18342293lje.65.2019.08.07.04.19.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 04:19:45 -0700 (PDT)
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
 <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
 <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>
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
Message-ID: <18e7e5cf-6431-0128-5981-f580210e6685@gmail.com>
Date: Wed, 7 Aug 2019 13:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>
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
Content-Type: multipart/mixed; boundary="===============3117498051025033889=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3117498051025033889==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="31WUfchJsbrvhkdXKV6RoKTjO5lwy68RT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--31WUfchJsbrvhkdXKV6RoKTjO5lwy68RT
Content-Type: multipart/mixed; boundary="ZyCzw1gETFuL08a8DTt6obukYV8lyu5WZ";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
Message-ID: <18e7e5cf-6431-0128-5981-f580210e6685@gmail.com>
Subject: Re: [apparmor] Question about "Failed name lookup - disconnected
 path"
References: <6f11fe69-b263-e961-6dbd-684a0bb9a74b@gmail.com>
 <20190806222444.GB26609@hunt>
 <9f2d30ed-0fd3-4c5b-188b-6df19b094f7b@gmail.com>
 <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>
In-Reply-To: <03a2a7d8-e8df-747e-dd39-7fc3d0e6caf0@canonical.com>

--ZyCzw1gETFuL08a8DTt6obukYV8lyu5WZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/08/2019 05:34, John Johansen wrote:
> name=3D"apparmor/.null" says that it is an fd that was inherited and ap=
parmor did a
> revalidation on it and the access was denied so the fd was duped to a s=
pecial null
> device files instead of out right closing it (there are good reasons fo=
r doing this).
>=20
> So you will need to look back in your log for an apparmor=3DDENIED mess=
age, with
> operation=3D"file_inherit" that should give you the actual file in this=
 case.
Ok, I see.
>=20
> I should note that on newer kernels we don't generally audit apparmor/.=
null so
> you will only get the file_inherit denial logged.
>=20
I have 5.2.6 kernel and usually I use the latest stable.

I have another question, what about this message?

kernel: [42605.998291][   T22] audit: type=3D1400 audit(1565176324.321:85=
1): apparmor=3D"ALLOWED" \
  operation=3D"getattr" info=3D"Failed name lookup - disconnected path" e=
rror=3D-13 profile=3D"userdel" \
  name=3D"" pid=3D24997 comm=3D"userdel" requested_mask=3D"r" denied_mask=
=3D"r" fsuid=3D0 ouid=3D0

Here *name=3D""* is empty. So what about this case?


--ZyCzw1gETFuL08a8DTt6obukYV8lyu5WZ--

--31WUfchJsbrvhkdXKV6RoKTjO5lwy68RT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXUqzyQAKCRAy2ctjR5bM
oWZGAP48oAAR79maxsiDZTj5GD2M9F4XQDmSPSaX/Jc8QYIBaAD/cH5wQdpkvs0k
cn+FKVF67z1DpHWXPQuktTGr0ilEXA0=
=OjX8
-----END PGP SIGNATURE-----

--31WUfchJsbrvhkdXKV6RoKTjO5lwy68RT--


--===============3117498051025033889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3117498051025033889==--

