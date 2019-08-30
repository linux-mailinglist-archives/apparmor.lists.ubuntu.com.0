Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BE918A2D49
	for <lists+apparmor@lfdr.de>; Fri, 30 Aug 2019 05:25:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i3XX9-0002no-9E; Fri, 30 Aug 2019 03:25:07 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1i3XX7-0002ng-H8
 for apparmor@lists.ubuntu.com; Fri, 30 Aug 2019 03:25:05 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1i3XX6-0002eB-R1; Fri, 30 Aug 2019 03:25:05 +0000
Date: Thu, 29 Aug 2019 20:25:03 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: =?utf-8?B?0J7Qu9C10LrRgdCw0L3QtNGAINCd0LXRidCw0LTQuNC8?= <olnes@ncu.com.ua>
Message-ID: <20190830032503.GB23820@hunt>
References: <CACROBpxumMCdow_pZqTQXhjjOv3G6YGpztfJ-sLEL9+EUuCaYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACROBpxumMCdow_pZqTQXhjjOv3G6YGpztfJ-sLEL9+EUuCaYA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] Apparmor
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============5380588765887442375=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5380588765887442375==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 04:02:52PM +0300, =D0=9E=D0=BB=D0=B5=D0=BA=D1=81=D0=
=B0=D0=BD=D0=B4=D1=80 =D0=9D=D0=B5=D1=89=D0=B0=D0=B4=D0=B8=D0=BC wrote:
> I want to limit the users of my computer so that they cannot transfer the=
ir
> files to other users. I limited the chmod command.
> But through the Nautilus program, users can change the properties of file=
s.
>=20
> Tell me how to limit users who own files.
>=20
> I wanted to do this through the Apparmore profile for Nautilus, but I don=
=E2=80=99t
> know how.

Hello =D0=9E=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80,

I'm not sure what your security goals are but it's quite possible that
what you want to do isn't possible with AppArmor today.

> I read that there is a chmod rule in Apparmore syntax (
> https://web.archive.org/web/20171230174731/http://wiki.apparmor.net/index=
=2Ephp/AppArmor_Core_Policy_Reference#Chmod_rules
> )
> But for some reason it does not work. Help me please.

I'm sorry, this wiki page isn't documentation -- it was used to sketch out
what new features may look like, how those features could interact, etc.

It was a mistake to put these notes on the public internet.

The apparmor.d(5) manpage is better at documenting what exists;
not all features are available everywhere. On Ubuntu it should be
comprehensive, on other distributions less good. We're working on
upstreaming features so it should improve over time. For today, you can
use this table to help determine what features may exist on your system:
https://gitlab.com/apparmor/apparmor/wikis/Kernel_Feature_Matrix

Alright, back to your problem.

Two users can communicate via files, sockets, shared memory segments,
semaphores, process titles, etc.

AppArmor can help you block sockets, but if you let your users get to the
internet or off the computer at all, they can communicate that way. If
a user can bind a socket and another connect, they can communicate
without getting to the internet.

We currently don't mediate shared memory segments or semaphores.

Process titles can be blocked via procfs(5) mount flag hidepid.

AppArmor can help with files but in a different fashion than mediating
chmod: the 'owner' flag on files. It applies on path. However, rather
than preventing a user from making their files too visible, the 'owner'
flag is a restriction on a potential reading (or writing) process. Here's
a rough, untested, example:

#include <tunables/global>
profile users {
  #include <abstractions/base>

  /bin/** rmix,
  /usr/bin/** rmix,

  owner @{HOME}/** rwlk,
  owner /tmp/** rwlk,
}

It would take some effort to ensure all your user processes are confined
with this profile. (This is also something we intend to make easier in
the future.)

Processes confined with this profile would not be able to read files
owned by other users within their home directories. Executables (and
libraries, other files via abstractions/base) can by owned by anyone
and still be read.

There's no sockets in this, so that route is out. Shared memory segments,
semaphores, and process titles would still work for inter-process
communication.

If this is applied to all user processes, then no user would be able to
change their passwords. They couldn't use any setuid executables owned by
other users. It wouldn't be a standard Unix-like system by a long shot.
But it might be good enough for your use.

I hope this helps.

=D0=94=D1=8F=D0=BA=D1=83=D1=8E

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl1olwoACgkQ8yFyWZ2N
Lpcy5Af+IJbweeoLCaxbob7rVse7MePu6D75aGThJla0EEBY5v3HhYQIdeGb8BCJ
QZB9cIuDzbENBzQahrXOD5y7o8F2NF+2wnux1ryD7z/lNejALR1lCUIez8FUH5bA
yev1HN0eHfQOhgQZxiLDSk1iNprEzx3ryErVgSWaNvC0paurGTAT72v/oe+FP5fH
hOz4OdRhGERBwx2L/UXmd3PRTLGZrBpVBWWLU80RnCtqNxUFSyAX46At1HlfJaXK
bX1oiKeenD2ExRulkuo9Ew8jKifBwBEDv9elyl6FzIZbGtGGRbtXztsOOyZhmXuL
OXHJvhL8TOZCdK1BTki09uvHI756rA==
=h5mI
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--


--===============5380588765887442375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5380588765887442375==--

