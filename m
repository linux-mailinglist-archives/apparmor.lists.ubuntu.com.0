Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3C36E014
	for <lists+apparmor@lfdr.de>; Wed, 28 Apr 2021 22:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lbqSf-0007BN-TP; Wed, 28 Apr 2021 20:07:05 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lbqSd-00079f-D5
 for apparmor@lists.ubuntu.com; Wed, 28 Apr 2021 20:07:03 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id CAC2F5C0093;
 Wed, 28 Apr 2021 22:07:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AZy_GTNmyKp; Wed, 28 Apr 2021 22:07:01 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Wed, 28 Apr 2021 22:07:01 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 28 Apr 2021 22:06:58 +0200
Message-ID: <2880435.J7sXRC9dT7@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ7+_anXqMbkyHrupc8CMxS0OfaGTX0EF_mZx46=7TF-=g@mail.gmail.com>
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <1845778.uqYG4e8EI7@tux.boltz.de.vu>
 <CAODFaZ7+_anXqMbkyHrupc8CMxS0OfaGTX0EF_mZx46=7TF-=g@mail.gmail.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] Apparmor: Query on adding many capabilities in the
	custom header file
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
Content-Type: multipart/mixed; boundary="===============5802323114140882230=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5802323114140882230==
Content-Type: multipart/signed; boundary="nextPart26126864.8dQXvbBVOk"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart26126864.8dQXvbBVOk
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Subject: Re: [apparmor] Apparmor: Query on adding many capabilities in the custom header file
Date: Wed, 28 Apr 2021 22:06:58 +0200
Message-ID: <2880435.J7sXRC9dT7@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ7+_anXqMbkyHrupc8CMxS0OfaGTX0EF_mZx46=7TF-=g@mail.gmail.com>
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com> <1845778.uqYG4e8EI7@tux.boltz.de.vu> <CAODFaZ7+_anXqMbkyHrupc8CMxS0OfaGTX0EF_mZx46=7TF-=g@mail.gmail.com>

Hello,

Am Mittwoch, 28. April 2021, 21:01:23 CEST schrieb Murali Selvaraj:
> I have created a header file as follows and included in the apparmor
> profile.
>=20
> admin@test:/etc/apparmor.d# cat caps/default
> capability chown dac_override dac_read_search fowner fsetid kill
> ipc_lock sys_nice setpcap ipc_owner sys_ptrace sys_chroot,
> admin@test:/etc/apparmor.d#
>=20
> profile :
> cat usr.bin.foo
> profile foo/usr/bin/foo flags=3D(attach_disconnected) {

Unrelated to your problem: I'd guess you mean
     profile foo  /usr/bin/foo flags=3D(attach_disconnected) {
with a space between "foo" and the path.

>     #include <caps/default>
[...]
> admin@test:~# sh /etc/apparmor/apparmor_parse.sh
> Warning from stdin (line 1): config file '/etc/apparmor/parser.conf'
> not found AppArmor parser error for /etc/apparmor.d/caps in
> /etc/apparmor.d/caps/default at line 1: syntax error, unexpected
> TOK_CAPABILITY, expecting $end
> admin@test:~#

I tested your usr.bin.foo profile with apparmor_parser, and it can be=20
loaded without problems. [To clarify: I also tested before adding the=20
space mentioned above.]

Can you please show your /etc/apparmor/apparmor_parse.sh script?
I have a feeling that it does something strange - wild guess:

    # apparmor_parser -r caps/default
    AppArmor parser error for caps/default in profile caps/default at=20
    line 1: syntax error, unexpected TOK_CAPABILITY, expecting end of=20
    file

You should only load your profiles with apparmor_parser, but not the=20
include files. Included files get loaded whenever they are included, and=20
are not meant to be loaded separately.

Oh, BTW - the most boring way to load all your profiles is
    apparmor_parser -r /etc/apparmor.d/


Regards,

Christian Boltz
=2D-=20
Wenn schon, dann h=F6chstens Homo Sapiens Sapiens XEmacensis, die
Entwicklungslinie, die im Laufe der Evolution sieben Finger an jeder
Hand entwickelt hat. Und das alles nur um alle Tastenk=FCrzel zur
Bedienung von XEmacs nutzen zu k=F6nnen. [T. Templin =FCber David Haller]

--nextPart26126864.8dQXvbBVOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmCJwGIACgkQxqaC6mPI
Lxxt/A//dFya7KK9IyGfXUodjxsk7L3JhkSaQUsIG02ZqALkQ1mDasJE6ycml2fB
+u2Gvxyqc7fGBkvL6ihldJMihflUk/el2jUXpIoije9LFxZ4EQ8eI/xJIJVk+8ml
AlgfxyPF1HyempnX+mzYehZfooEEl5O0j6JHx3T1CkKF5HAwilkgSOCxpVBxjF5H
XpIeNdtZljL4yKOfWMwKqzpTaiwCGrGynAR6fFbONtQjWcF4g/aQ+3JzG5reCgeT
MuAPoQMCZFxbzo1PAuvSUXqW0OgmHaoFoIaaSDeuWOiiNZX9bjxnN2MG3IrNcI/g
iy4vKSPegQsKe4MNkcFJQmEYcbIDNOGQU+rqF52EKxu704feM/28HaWWBtVC8oqy
33BwMGGwCQq24EXUIgJgoZki1ifm7ewJlTWhjAxlFdgRldX2eHJ7DqlE+4UMDT10
y48BaIcwP0nYlMQPh+pr8NFimNzebTkNG500bgWeQF/ME0hboL1GDBr9o4HDuHc+
QicaaiTR4jbLy2spl5BZV7H3MiGxSHCIF6FThACaRrnsRmVEAlvRQC6uUmNOfQzE
X7TJallLrN7X27WeszwQUBQ6zZOTM57IKwOK44cPIOuJX1Qjs34xnSXR8G1fqFeG
+bgmN8gqljSfcBslnfRd1JX6CWE3v86lTuCtU+ZgMwwykWSUvQg=
=IBG4
-----END PGP SIGNATURE-----

--nextPart26126864.8dQXvbBVOk--





--===============5802323114140882230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5802323114140882230==--




