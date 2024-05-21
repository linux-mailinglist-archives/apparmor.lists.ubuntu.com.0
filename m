Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D085D8CB4A6
	for <lists+apparmor@lfdr.de>; Tue, 21 May 2024 22:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s9W26-0003pJ-80; Tue, 21 May 2024 20:24:26 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <luca.boccassi@gmail.com>)
 id 1s9SoR-00029l-6E
 for apparmor@lists.ubuntu.com; Tue, 21 May 2024 16:58:07 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-34ef66c0178so2739469f8f.1
 for <apparmor@lists.ubuntu.com>; Tue, 21 May 2024 09:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716310686; x=1716915486;
 h=mime-version:user-agent:in-reply-to:references:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CY1IM5PPbQKmtJ0dYg40iMzmatNiClRUyuIoLoCR5i8=;
 b=gjP5yMPinUEpWi79wbcOaOkvX09tJwthBaFBSCp5W7Li6jbuqvPOiZJSshlbKQa16v
 6J+vPus/VafyY2GY94Rlwn9Y3WlUPHgojBVoOE/1xOzYWt91hnzIb1FT2TT2UE/DDo8c
 IowJ/BzHcCJW3lNe2pEE1LaI5fhZ/uh3x3Z7YDPr5iZAWz5tKvPEePE60QHkDat+J1H7
 fohfXnthLzB4Nt60Is9DAij++dARbyRh2TJPzAUR+b5axSTstbzxa5MLKynSHMcozAtw
 ozxxgKn7KYqdu1286UPqyxdhGvQeDdoiEQ+2fus5kIMb3KzxZ5DNpSY6OXP6KwJjg2fX
 OTqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvp+wUnUs6jrUM7zhZ5NZydUQ8Nog4eEgDIkP+XCCEuMzwSXDpoHs5Vy7r0HHM1b2gRiDTbanjhVxlk7ZyUJBFWYQ7xD8c9ImP
X-Gm-Message-State: AOJu0YwONz2/y7Hby0Fhl2OQE3XQW+ksRJAKXRPFFk6NroDbxffgS0Ty
 gIaobdr7tZBpaF5e7bIwyPnj1/H6Jktu+L/2xJWFkYD5+uRXe2U+
X-Google-Smtp-Source: AGHT+IE4YVybpDd7fVTn5i9S/ueqkyitV3FdX9II+Xp8cuDucTiBMtGMTV08farbDnIa1bTd+4/10Q==
X-Received: by 2002:adf:e8cc:0:b0:34d:b03c:9a97 with SMTP id
 ffacd0b85a97d-3504a95606cmr35786291f8f.48.1716310686286; 
 Tue, 21 May 2024 09:58:06 -0700 (PDT)
Received: from localhost ([137.220.120.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbc7easm32194134f8f.110.2024.05.21.09.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 09:58:05 -0700 (PDT)
Message-ID: <c2d004fd01c5b085f74ea4dfa4fc99a971c812e8.camel@debian.org>
From: Luca Boccassi <bluca@debian.org>
To: john.johansen@canonical.com
Date: Tue, 21 May 2024 17:58:03 +0100
References: <da160344-8135-4eab-9261-bb1552238ad3@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
 <b8bb1a0e-9b50-4f78-8473-4f0151677f25@canonical.com>
 <ZbYk7yOaAq0O8Rid@eldamar.lan>
In-Reply-To: <ZbYk7yOaAq0O8Rid@eldamar.lan>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-GBw+pduBJVyORMpez2lA"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=209.85.221.48;
 envelope-from=luca.boccassi@gmail.com; helo=mail-wr1-f48.google.com
X-Mailman-Approved-At: Tue, 21 May 2024 20:24:25 +0000
Subject: Re: [apparmor] Bug#1050256: AppArmor breaks locking non-fs Unix
	sockets
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
Cc: Harald Dunkel <harri@afaics.de>,
 Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>,
 John Johansen <john@apparmor.net>, Mathias Gibbens <gibmat@debian.org>,
 apparmor@lists.ubuntu.com, Antonio Terceiro <terceiro@debian.org>,
 Paul Gevers <elbrus@debian.org>,
 pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>,
 1050256@bugs.debian.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--=-GBw+pduBJVyORMpez2lA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jan 2024 10:57:03 +0100 Salvatore Bonaccorso
<salvatore.bonaccorso@gmail.com> wrote:
> Hi John,
>=20
> On Sun, Jan 28, 2024 at 12:43:33AM -0800, John Johansen wrote:
> > On 12/30/23 20:24, Mathias Gibbens wrote:
> > > On Sat, 2023-12-30 at 16:44 +0100, Salvatore Bonaccorso wrote:
> > > > John, did you had a chance to work on this backport for 6.1.y
stable
> > > > upstream so we could pick it downstream in Debian in one of the
next
> > > > stable imports? Cherry-picking 1cf26c3d2c4c ("apparmor: fix
apparmor
> > > > mediating locking non-fs unix sockets") does not work, if not
> > > > havinging the work around e2967ede2297 ("apparmor: compute
policydb
> > > > permission on profile load") AFAICS, so that needs a 6.1.y
specific
> > > > backport submitted to stable@vger.kernel.org=C2=A0?
> > > >=20
> > > > I think we could have people from this bug as well providing a
> > > > Tested-by when necessary. I'm not feeling confident enough to
be able
> > > > to provide myself such a patch to sent to stable (and you only
giving
> > > > an Acked-by/Reviewed-by), so if you can help out here with your
> > > > upstream hat on that would be more than appreciated and welcome
:)
> > > >=20
> > > > Thanks a lot for your work!
> > >=20
> > >=C2=A0=C2=A0=C2=A0 I played around with this a bit the past week as we=
ll, and
came to
> > > the same conclusion as Salvatore did that commits e2967ede2297
and
> > > 1cf26c3d2c4c need to be cherry-picked back to the 6.1 stable
tree.
> > >=20
> > >=C2=A0=C2=A0=C2=A0 I've attached the two commits rebased onto 6.1.y as=
 patches to
this
> > > message. Commit e2967ede2297 needed a little bit of touchup to
apply
> > > cleanly, and 1cf26c3d2c4c just needed adjustments for line number
> > > changes. I included some comments at the top of each patch.
> > >=20
> > >=C2=A0=C2=A0=C2=A0 With these two commits cherry-picked on top of the =
6.1.69
kernel, I
> > > can boot a bookworm system and successfully start a service
within a
> > > container that utilizes `PrivateNetwork=3Dyes`. Rebooting back into
an
> > > unpatched vanilla 6.1.69 kernel continues to show the problem.
> > >=20
> > >=C2=A0=C2=A0=C2=A0 While I didn't see any immediate issues (ie, `aa-st=
atus` and
log
> > > files looked OK), I don't understand the changes in the first
commit
> > > well enough to be confident in sending these patches for
inclusion in
> > > the upstream stable tree on my own.
> > >=20
> > > Mathias
> >=20
> > Your backports look good to me, and you can stick my acked-by on
them.
> > The changes are strictly more than necessary for the fix. They are
> > part of a larger change set that is trying to cleanup the runtime
> > code by changing the permission mapping from a runtime operation
> > to something that is done only at policy load/unpack time.
> >=20
> > The advantage of this approach is that while it is a larger change
> > than strictly necessary. It is backporting patches that are already
> > upstream, keep the code closer and making backports easier.
> >=20
> > Georgia did a minimal backport fix by keeping the version as part
> > of policy and doing the permission mapping at runtime. I have
> > included that patch below. Its advantage is it is a minimal
> > change to fix the issue.
> >=20
> > I am happy with either version going into stable. Do you want to
> > send them or do you want me to do it?
> Thanks a lot, that is *really* much appreicated!
>=20
> if you can send them that would be great, because think then they
> come
> directly from you, the trust from Greg or Sasha is higher. otherwise
> I
> think they will then explicitly want an ack on that submission thread
> from you (or pointing to this Debian downstream bug).
>=20
> Greg will probably want the backport apporach of the two commits if
> it
> feasible and we do not expect regression from it. But you are
> definitively in a better position to judge this :)
>=20
> Thanks again!
>=20
> Regards,
> Salvatore
>=20
> p.s.: feel free to CC us as well in the upstream stable submission.

Hi John,

Is there any update on this? As far as I am aware this patch has not
been sent for backporting yet, so apparmor in 6.1 is still borken, and
the CI still fails because of it.

Is there any chance you could please take care of that, so that we can
finally fix this issue?

Thanks!

--=20
Kind regards,
Luca Boccassi

--=-GBw+pduBJVyORMpez2lA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmZM0psACgkQKGv37813
JB6UVhAAuRcbyh6mRRDl7Hsr2ETRyIR/YfOS7hQPHR5QcUDkfUO1iYzj32Z5P4FS
ChtymFM/zky8qGO/N9NBo6JWzV5PWfw5TFGBE6bgEZ8F5tYvIGd+8+BtHcc3jA6h
64dY0U9s7ZK/b6jqKplHRwH+nvy3+3pg5aOCeoOl4WNuNi0GPWLfQ7um6xqQl0kQ
vsxcALn/FaU+wQjYSeZYNk7mWvZRQfsNEWWTNdhDYrdzrl55ISJzHkWsjeZ1pKTF
4IzqVQMzEZcaEn0FePLCM7Lp1QARFwmTDlsUaWXXRPTXQ3xrM/hfNjyzppMKl+vO
vRg+4QY1PC7lfgDwVlRf+R0y/KDyGth8YwL0SJzPh1aE0vLKfQAymGlEGVgiNmp0
mORHBlx/PCcs1ECkHrocwAICOYLICupEC5gpGw1KKVSfkphTqqpPPQtOh+ME56Zm
oGv4oSEytrsQQYqBhUsS8Wpd1kwF1MyJt2xddgPU64PIuPFe2KHH/rDkUpS5Jzfn
KYSq2qrMDhnoy4xXG0Q8T1Uw25+5IlXhZTbG5Dan5Dp/aHzDqcceffROENf1Chi+
dwvYujf79laMyk+DMBvsc22x1hXKSsU7jj9dA1IQJUwzvpP2kvZaqKivKMvepYUW
Q0e7U0Q5HsMGDRIIcVh14IfGwNdMKwYGlcvgsr8qQ/hbUXtXdaI=
=J2pa
-----END PGP SIGNATURE-----

--=-GBw+pduBJVyORMpez2lA--

