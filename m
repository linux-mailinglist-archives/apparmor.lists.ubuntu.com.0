Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3A403FA6
	for <lists+apparmor@lfdr.de>; Wed,  8 Sep 2021 21:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mO31D-0004Wm-Sx; Wed, 08 Sep 2021 19:13:59 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1mO31C-0004WX-FG
 for apparmor@lists.ubuntu.com; Wed, 08 Sep 2021 19:13:58 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 08C4B5C0116
 for <apparmor@lists.ubuntu.com>; Wed,  8 Sep 2021 21:13:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoWeD1Jwy5uH for <apparmor@lists.ubuntu.com>;
 Wed,  8 Sep 2021 21:13:56 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Wed,  8 Sep 2021 21:13:56 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 08 Sep 2021 21:13:50 +0200
Message-ID: <3415835.JB2sseZfvn@tux.boltz.de.vu>
In-Reply-To: <87pmtkop58.fsf@manticora.bergerie.taz>
References: <87pmtkop58.fsf@manticora.bergerie.taz>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Deprecating the Perl bindings?
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
Content-Type: multipart/mixed; boundary="===============6719702879345846562=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6719702879345846562==
Content-Type: multipart/signed; boundary="nextPart7697435.vEB24yB8Mr"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7697435.vEB24yB8Mr
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Subject: Re: [apparmor] Deprecating the Perl bindings?
Date: Wed, 08 Sep 2021 21:13:50 +0200
Message-ID: <3415835.JB2sseZfvn@tux.boltz.de.vu>
In-Reply-To: <87pmtkop58.fsf@manticora.bergerie.taz>
References: <87pmtkop58.fsf@manticora.bergerie.taz>

Hello,

Am Dienstag, 7. September 2021, 08:50:27 CEST schrieb intrigeri:
> As far as I can tell, in the upstream code base, aa-notify was the
> only thing that depended on the Perl bindings to libapparmor.
> It's been ported to Python so that's not the case anymore.
>=20
> With my Debian hat on, I can say that shipping the Perl bindings
> (libapparmor-perl) makes some stuff more complicated, for example for
> adding cross-building support. So I'm considering dropping them:
> https://bugs.debian.org/993565
>=20
> What would be the drawbacks of dropping the Perl bindings upstream?
>=20
> Are we aware of code that uses them? In openSUSE tooling, perhaps?

Historically the YaST2 AppArmor module used the perl bindings (and even=20
the old perl modules), but since several years YaST is baiscally a=20
graphical frontend to   aa-genprof --json   etc. - and that way solved=20
more than one problem. I was even able to do a "remote bugfix" to YaST=20
by fixing something in aa-genprof ;-)

I'm not sure if other packages use the perl bindings (unfortunately I=20
can only easily find out what depends on AppArmor, but not individually=20
for the perl-apparmor subpackage). At least on my laptop, I could=20
uninstall perl-apparmor without complaints.

> Are we confident they'll keep working, even though we don't actively
> use them upstream anymore?

Well, we didn't get any bugreports ;-) which can mean
=2D it works
=2D nobody uses it   or
=2D it's broken and nobody uses it

> If we want to drop them upstream, what would be a suitable deprecation
> process and timeline? Would it be sufficient to announce this on this
> mailing list and drop them in the next major release?

As long as it doesn't case lots of work, I'd tend to keep the perl=20
bindings upstream. This is not a strong vote, so if we want to add a=20
deprecation note (so that we can say "told you so" whenever the perl=20
bindings cause us headaches), I'm also fine with that.

At the same time - if the perl bindings cause you major headaches on=20
Debian, feel free to drop --with-perl.


Regards,

Christian Boltz
=2D-=20
Journaling erh=F6ht die Stabilit=E4t/Konsistenz des Dateisystems nach einem
n=F6tigen Filesystem-Check, der ohne Journal ein fremdes Kinderzimmer
aufr=E4umen muss ohne zu wissen, wo der Schei=DF eigentlich hin soll,
w=E4hrend er mit Journal einen Zettel vor der T=FCr findet, wo die Rotznase
ihre Sachen zu finden w=FCnscht. [Holger Marzen]

--nextPart7697435.vEB24yB8Mr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmE5C24ACgkQxqaC6mPI
Lxw/NRAAxPyLjUFjfPRkVYG/LyC9Uf50LM6ZP25yqZtgbikVqv0/O7JQeEcJKA+4
1eZm1ALZOYzgJbspLjyxJ2h+9AbCsFWrzYFWoclRZS6RYStkDn7FLP5KOfYS8lAc
JH3YPvTHyk6ckUg5tvatbf2p2bguJr999qVHPfCIfQSq0f8iWf6gt0PrN3OefOYS
BHFYTHlMZNBoTjNPmhWCkUKDdXm9hsXH0ZwC3AMv26sUldScf3d/ndBa4D7jk/9v
Qakj8aKWuvytsoxmH2KjUBc4G0tXUAfdPbDprospIAfRVXWZla0B506uS0XetoDi
N6x05ZklO+Bkkf1wbHGKbgdc69hWv3JyPSzhpk47WpX6BTbA2DFCBMvwQgSd/D95
RLz707pShxP9Tq1jvNL2AwgsxMeZSLOM9g6Jc5405uz4O6LXtuEUx7hayX70pZ3c
8/f+5rl/dUP8ME3qMGJMf7iRPZTcniOiTbsn3Hzkl61ASXE05eK8lbDEPXvFgkSD
KecNYerKqgtmJ5HP44MH8vEpkDK275gTw9QWUAiOfaLY9VD+4LCjs05SzzIgwg7+
xnBRbTWfH9NZ2DB/42/k05EFWVWe61cOfwU7nxi4bVGObjm6HtmQtKtNIM9aA5JH
YOEzs8UNXf0PWlrM9WbyFB0Tjfgf56rxK08vP4ftO5HkxbsgdcA=
=O1Bs
-----END PGP SIGNATURE-----

--nextPart7697435.vEB24yB8Mr--





--===============6719702879345846562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6719702879345846562==--




