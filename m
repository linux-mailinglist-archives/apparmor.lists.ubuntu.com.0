Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2626AAF
	for <lists+apparmor@lfdr.de>; Wed, 22 May 2019 21:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hTWjz-00055u-1U; Wed, 22 May 2019 19:17:31 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <jamie@canonical.com>)
 id 1hTWjx-00055o-Mn
 for apparmor@lists.ubuntu.com; Wed, 22 May 2019 19:17:29 +0000
Received: from r74-192-138-48.gtwncmta01.grtntx.tl.dh.suddenlink.net
 ([74.192.138.48] helo=iolanthe)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <jamie@canonical.com>)
 id 1hTWjx-0002so-4q; Wed, 22 May 2019 19:17:29 +0000
Date: Wed, 22 May 2019 14:17:25 -0500
From: Jamie Strandboge <jamie@canonical.com>
To: Mikhail Morfikov <mmorfikov@gmail.com>
Message-ID: <20190522191725.GB1447@iolanthe>
References: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
MIME-Version: 1.0
In-Reply-To: <68fc4cc4-887d-57ce-df42-d1e5c222e331@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Reply-To: Jamie Strandboge <jamie@canonical.com>
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============2897898578753740223=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============2897898578753740223==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 20 May 2019, Mikhail Morfikov wrote:

> There's currently an abstraction *abstractions/audio* which=20
> gives access to all devices/files that have something to do=20
> with playing/capturing sounds. Many apps need only the=20
> playback devices to play sounds. Other apps need also the=20
> capture devices, so they could record sounds via a microphone.=20
> Some people don't want to grant the access to the microphone,=20
> for instance, in web browsers, or in a text-only messaging=20
> app. I thought if I denied the access to the devices like=20
> *pcmC[0-9]D[0-9]c* , the app, which wants to use the mic,=20
> wouldn't be able to do it. But it looks like even adding in=20
> the app's apparmor profile a rule that denies access to=20
> anything under the /dev/snd/ dir doesn't really prevent=20
> the app from accessing the microphone, or the soundcard.
>=20
> It looks like PulseAudio is involved here because when I=20
> removed all the PA rules from the *abstractions/audio* file,=20
> the app can't detect the soundcard anymore, and hence it=20
> can't play or record any sound.
>=20
> So how to limit the mic access to certain apps using apparmor=20
> profiles? Is that even possible, or am I only forced to grant=20
> the app the full access to the soundcard?
>=20
> I'm currently using the linux kernel 5.1.2.

Currently when pulseaudio is involved, it will access the sound devices on
behalf of your application to perform multiplexing/etc since many ALSA devi=
ces
can't do that natively. This is also good since application only need to kn=
ow
about a high level API rather than details of specific devices, etc (which =
is
good enough for simple playback/record). With pulseaudio, it is not possibl=
e to
perform fine-grained mediation like record/playback since pulseaudio was not
designed with this in mind. There are patches to pulseaudio that Ubuntu has
carried for mediating this access on the old Ubuntu Phone and today with sn=
apd.
Upstream's answer seems to be that pipewire will be designed with this sort=
 of
thing in mind and make this easier.

I've always liked the idea of apparmor gaining some syntax to specify rules
that an audio server could query using libapparmor API, but this hasn't
materialized (in part because pulseaudio is, aiui, in maintenance mode and =
the
future are things like pipewire that weren't ready to use (this is starting=
 to
change)).

As for devices in /dev/snd, my understanding (but I'm not an expert so feel
free to correct me) is that the devices are not broken up between playback =
and
capture and so simple rules that limit /dev/snd access are not sufficient
(assuming you take pulseaudio out of the equation for your application).

In short, today you can't do this without patching your pulseaudio and deny=
ing
access to /dev/snd. In the future, pipewire should allow this sort of
mediation, but I don't know OTOH what that will look like atm.

--=20
Jamie Strandboge             | http://www.canonical.com

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETCDAa12L3miIVNKKUdvcWMxVlXMFAlzloEAACgkQUdvcWMxV
lXM1Yg//auYA524JqBMOZEpMKBNlLT37ylY731G4hUAsW9iHpBFZGF6oCNOGU1k6
IWfYUjbDs8snIbXOJpxuB7oZ1YA0MW0A03aEJAUaLzU0LB2aBuLTfbfup6woE2cz
ue4avE7vePlGugOq8EKdxogv5AVAKIbC7W2CYsGlf3Nuei3IXEit6rRwFcbycfnt
zDAQ/4GuO3YDOeGzlOZIEMAAtAr/MzCMAG3WUXEAk3JUnmzy+jQeEWcb+oLJDggy
fd0Z1qcrYSq8w04TThsizICLxaDCZXu+b+wKXyKwJUy5qTtDnAwyVYURBCg4VoIq
63pVkxkWXUpD3zC84Ll/e0tUPhwXruCzG/NyC48WRqAwa/sftXMFTL5RhwxsqUdb
t+5N1F78hjWhcea7c9GSf9lU+V9U5ZJAF75aJ+2PY2ad3uvfxxhwdpILiHugBTp/
KHwxNrvXwTV9OdePu/V2yXn+K1CUi03NHm5BdScxjVWJQbEqJNcEwcy9YQjuEUPN
FxroMJBxglR/t3Vc1sOkuEbu1N+OYI8fqt0WcvJet9C65sdHaRmXo3NzFVD0nHdG
AbqvQkNSW1mRmgUZrBkTKZGbP/ZbkJmXUbPyJRRezRli0TOSTiopQSujwvUI9qYF
s7xxN8WLXvGmlF/z3CaJMwOlsY3wqWTaHdE4g7vLhSvbFIf2MXQ=
=x/T7
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--


--===============2897898578753740223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2897898578753740223==--

