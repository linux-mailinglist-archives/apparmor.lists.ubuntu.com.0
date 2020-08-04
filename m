Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89C23B941
	for <lists+apparmor@lfdr.de>; Tue,  4 Aug 2020 13:14:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k2utk-00063k-T4; Tue, 04 Aug 2020 11:14:24 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1k2uti-00063c-63
 for apparmor@lists.ubuntu.com; Tue, 04 Aug 2020 11:14:22 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id A3B145C0103
 for <apparmor@lists.ubuntu.com>; Tue,  4 Aug 2020 13:14:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jkvj1D372uBt for <apparmor@lists.ubuntu.com>;
 Tue,  4 Aug 2020 13:14:20 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Tue,  4 Aug 2020 13:14:20 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Tue, 04 Aug 2020 13:14:15 +0200
Message-ID: <16634723.CUffLn1tLP@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
 <20200804002056.GB2250578@millbarge>
 <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Apparmor: Query
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
Content-Type: multipart/mixed; boundary="===============5734020830549555219=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5734020830549555219==
Content-Type: multipart/signed; boundary="nextPart17942749.fLKD95txYv"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart17942749.fLKD95txYv
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

Am Dienstag, 4. August 2020, 05:02:30 CEST schrieb Murali Selvaraj:

> cat /etc/foo   =================> Ensure this file belongs to root

>  ls -ltr /etc/foo
> -rw-r--r--    1 root     root             8 Aug  3 20:31 /etc/foo

This means everybody can read (or cat) the file, therefore no 
capabilities are needed.

Capabilities also won't help if a non-root user tries to read
 -rw-------    1 root     root             8 Aug  3 20:31 /etc/foo
because the file permissions won't allow this.
For a special case, see [1].

However, a process running as root will need the dac_override capability 
to read
 -rw-------    1 some_user    users             8 Aug  3 20:31 /etc/foo
because the file permissions only allow some_user to read the file, but 
not root (unless root has dac_override capabilities).

As a sidenote: you can find a description of all capabilities in
    man 7 capabilities


Regards,

Christian Boltz

[1] You could set your /bin/cat to have the dac_override capability - 
    which is basically a partial suid bit. Something like this gets done 
    for /usr/bin/ping on openSUSE, which gets the net_raw capability 
    instead of a suid bit. 
    Technically "chkstat" does that  (based on some permissions.* files) 
    but I have no idea if there's a command to set the capabilities for 
    a single binary.

-- 
I certainly expected the severity db to turn around and say "So, rule,
I've been asked to determine how severe you are. Why don't you tell me
a little about yourself? Do you like hugs, puppies, and long walks on
the beach?". [Steve Beattie in apparmor]

--nextPart17942749.fLKD95txYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl8pQwcACgkQxqaC6mPI
LxxwiBAAprSeFnkHukQP7H2H4Y0kYtlaG6D2o18tE6LMU57CDRT6JWnmBEUV82bb
5s3U/1PBq+aDHiJWdzkeTAF9ieh+VK+m5y/j7qAeSjN9wUaMyWQgJP2Pq0O3HP1f
6DtaV1A4DS5MkpQAyOt59/qDrTDUNrSrjyP/aaOPYGoWzIt5UAQOzmT/PyIM86Ob
G8yLr64zwWiHYC2lGrf+JyXRyWOVeYF/aAB2DwUwc+b8CGmoWl/8WptiM4CjRFiK
PLTc08T9OGFr39ZetHOa6ebY/5nMrBJALOtQRf6dCL3OAOkoZYUKMrh4OL/kh308
CdEW3tNd7ttzOF5f6Dl7DOIUus6vS513PkD0Iz42pzBsmAvE/6QYZyuAAqZVBj/x
cSrAfVTtkOjpVXt55ulXMkYAiczd9XhUPbYjiopAXgSwzZ+DUCzHU9mZccen065L
4jYcdMWjiztnWy+gCpi1del1ZB4ZDSfIletLKTVQcq1gPbasFuRzI+4vpOoiaC2U
Pft5wwYeKXgUml/A393xX5Rq3OZBIgTjuamWlpw+8iS87mvHHroBRBSPg/p59do8
b+eOzvVFyN0MwuuTzAScJLhIUERnNgNmsdRB1Dq+Yd5uyOe641lgLApx0tHQe0HI
q72Cki+AAFxi39G30iQjDU27fOrJALOyqOWF9da3Ijgs1XR7nUk=
=eM6j
-----END PGP SIGNATURE-----

--nextPart17942749.fLKD95txYv--





--===============5734020830549555219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5734020830549555219==--




