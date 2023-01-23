Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593C677BC3
	for <lists+apparmor@lfdr.de>; Mon, 23 Jan 2023 13:53:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pJwKC-0001pw-Dz; Mon, 23 Jan 2023 12:53:24 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1pJwKA-0001pp-M3
 for apparmor@lists.ubuntu.com; Mon, 23 Jan 2023 12:53:22 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 44D4F5C0523;
 Mon, 23 Jan 2023 13:53:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S41ILjSMc4tw; Mon, 23 Jan 2023 13:53:21 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Mon, 23 Jan 2023 13:53:21 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Mon, 23 Jan 2023 13:53:14 +0100
Message-ID: <2131651.irdbgypaU6@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
References: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13188848.uLZWGnKmhe";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Apparmor: global profile queries
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
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--nextPart13188848.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Subject: Re: [apparmor] Apparmor: global profile queries
Date: Mon, 23 Jan 2023 13:53:14 +0100
Message-ID: <2131651.irdbgypaU6@tux.boltz.de.vu>
MIME-Version: 1.0

Hello,

Am Montag, 23. Januar 2023, 02:47:38 CET schrieb Murali Selvaraj:
> I am trying to use a global/system-wide Apparmor profile to restrict
> the executing of any scripts from /tmp folder.
> As a first step, I added this entry (audit deny /tmp/* x,) and I was
> expecting Apparmor audit logs while executing the script from /tmp/
> (sh /tmp/foo.sh).
   ^^
That's the problem: you called
    sh /tmp/foo.sh
which means   sh   (/bin/sh) gets executed. sh then _reads_ the script,=20
but does not _execute_ it.

=46or comparison, try
    chmod +x /tmp/foo.sh
    /tmp/foo.sh
which should get blocked.


Unfortunately I can't offer an easy way to block   sh /tmp/foo.sh
Maybe you could execute interpreters like sh, bash, perl, python etc. in=20
a separate profile that doesn't allow access to /tmp/, but that will also=20
block/break valid uses of files in /tmp/.


Regards,

Christian Boltz
=2D-=20
Das einzige Instrument, das ich beherrsche, ist MP3-Player.
[Kristian K=F6hntopp]

--nextPart13188848.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmPOgzoACgkQxqaC6mPI
LxxIDRAAxdkqMzUMgS8lEFiWATb5MUWClxmJ+IzWTlSA3XtfFKQqWBlxNwsxvrpr
drMczdPlvovbYMSM8BUZxSOoZuFUrNy13hHUYpES5TsKAsVG6m5i1ziUcToTCNpz
vH3P+/yyPMXYuYNXxJugrcKAbBWdKAZKmX9kgqYEKbiIjy6MNQxbfq+YfdKl+yz+
eIUy6XzESeiNYm4+H5/mjxH0v0NJNXEw1I3wUNBu1EweZxJr6X+2AIUQrIFrRvaj
mql6ZtnLW5m/28c4bHWy4Ez3DjdLTaFymG+mTwnjwRgRFKvUOAWq6wNstM392Ajo
UYi4CEAx+itBRMOhHPNXTf7RPFtM5yZKqzrARch4GuCZE4t0tAfx96QeqxIo653X
BnL5OwYJOsasCpuyQP8xtEgi12IT1TlGUZQhvwKQomrglRrCnE6lvtC8ZyIsNScS
kVnmLsA0ec7w+NrbVjxhAzbcFhzn6MZ8FvpS1Wu4AdUTKo/IKgrULtpl2apfvU6k
5ohFKDg3spsy0+pCxc1VQJNgRS0QaVytJNJnFwxy9WM/a/C5JiNbridQNGHH/cI2
oL44q8dAs2xfo72wJYdDFUO+ZPjvRVsXTz0VRoq5GLr9V/aTCHdXRNqTPlFCAvDE
7jaS3RREW62f7JfuQltPQQ/2/5nJasXFgvInq46SeRJV0dmQfR4=
=KNMb
-----END PGP SIGNATURE-----

--nextPart13188848.uLZWGnKmhe--




