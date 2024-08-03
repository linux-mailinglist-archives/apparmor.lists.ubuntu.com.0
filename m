Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4B946671
	for <lists+apparmor@lfdr.de>; Sat,  3 Aug 2024 02:21:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sa2WL-0002Yv-6K; Sat, 03 Aug 2024 00:21:17 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1sa2WK-0002Yo-2Q
 for apparmor@lists.ubuntu.com; Sat, 03 Aug 2024 00:21:16 +0000
Received: from localhost (97-120-197-28.ptld.qwest.net [97.120.197.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7D20240FB3
 for <apparmor@lists.ubuntu.com>; Sat,  3 Aug 2024 00:21:15 +0000 (UTC)
Date: Sat, 3 Aug 2024 00:21:13 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20240803002113.GB4104551@millbarge>
References: <4aab8732d80fd346ec9d1b22533410a3@posteo.de>
 <b0624de9-cee6-43e8-8227-d635c0b8b594@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <b0624de9-cee6-43e8-8227-d635c0b8b594@canonical.com>
Subject: Re: [apparmor] Specific kernel version required specific
 apparmor-utils version?
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 02:41:16AM -0700, John Johansen wrote:
> > type=3DAVC msg=3Daudit(1721996490.702:8607): apparmor=3D"ALLOWED" opera=
tion=3D"recvmsg" class=3D"net" profile=3D"/usr/bin/mpv" pid=3D822 comm=3D"m=
pv/vo" family=3D"unix" sock_type=3D"stream" protocol=3D0 requested_mask=3D"=
r>
>=20
> is this the full message? It looks truncated. It might not be the actual =
output does depend on kernel version.

A log line ending with > feels a lot like less -S was involved in viewing
the log entry, rather than looking at the logs directly.

journalctl and dmesg (when supplied by systemd) do these sorts of things
even if your standard less configuration doesn't do the truncation.

Thanks

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmatd/QACgkQ8yFyWZ2N
LpdHWwf/V0mGMPIugQ3nRoDt4ZL/7QQZxssSBRCEI5Dll4ph1JTth3R8ujFUcMhQ
EOaZq2KpqKOObk63Zoh778hlqdH7PhKfBc3D5ven2mA23aLCQZms3A44Ut9unwAq
7HuspRhFa1TRgYOclinuwaMkdUW++/ZeTS6uS0Si1bb8+xyAbTdAD0WVqv8mQ9Mp
RSE/QdCCRCiqt6w4xy3bBAceqTrXa8hyTdAQTkTat+LjBPcq4BDgXR2Tu2CPg2fQ
oUS++I8niZSgXm4VYua0Py6n4Mg6R0ose5oFMmWLHuX+WMt3PvcdVFiAVuvJk1wn
641s02pOjdzygmHJZALxfwq0U1/qxg==
=kz0o
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

