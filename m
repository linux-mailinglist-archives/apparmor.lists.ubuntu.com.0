Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B19B8318
	for <lists+apparmor@lfdr.de>; Thu, 31 Oct 2024 20:11:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1t6aa6-0000Fe-Ap; Thu, 31 Oct 2024 19:11:42 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <valoq@mailbox.org>) id 1t6aa5-0000FT-7u
 for apparmor@lists.ubuntu.com; Thu, 31 Oct 2024 19:11:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XfYWZ6z9Gz9sWh;
 Thu, 31 Oct 2024 20:11:38 +0100 (CET)
Date: Thu, 31 Oct 2024 20:11:33 +0100
From: valoq <valoq@mailbox.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <ZyPWZZcSHsLkhZpD@mailbox.org>
References: <ZyONOXXSHjV2zfJU@mailbox.org>
 <6335362c-28f2-48ae-bdcc-8ab04de9b69d@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MEbZtfywfk+iAFuN"
Content-Disposition: inline
In-Reply-To: <6335362c-28f2-48ae-bdcc-8ab04de9b69d@canonical.com>
X-MBO-RS-ID: e121624f5566fec0ff4
X-MBO-RS-META: namsgcufdsq6imhkhqe4p1nkimaubhup
Received-SPF: pass client-ip=80.241.56.152; envelope-from=valoq@mailbox.org;
 helo=mout-p-102.mailbox.org
Subject: Re: [apparmor] Restricted userns
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--MEbZtfywfk+iAFuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 07:54:04AM -0700, John Johansen wrote:
> On 10/31/24 06:59, valoq wrote:
> Currently it is not.
>=20
> The ability to mediate userns creation in profiles landed in 6.7.
>=20
> The 2 and 3rd parts have not landed upstream yet. This is largely because
> the Ubuntu patches hard code the behavior where for upstream we want the
> behavior to be properly part of policy.
>=20
> There is a patch to extend the current mediation that is a requirement
> for parts 2/3 that I will try to post out this week. The other parts
> I still need to evaluate. But I don't think landing full support for
> is possible for 6.13. So I am currently planning to try and land full
> support in 6.14.

Thanks for the replay and the upcoming patch.

If there is anything I can help, please let me know. While I do not have
experience with kernel development, I would like to support this patch
however possible.


--MEbZtfywfk+iAFuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQT5jU1ZXwoI5a0EyGfCaD7hly9gFAmcj1mUACgkQGfCaD7hl
y9gtMw/+NItLxDHPJ2kpVO0n4KkZB9Yiuts6NTMP/SNIfpIrIFltE0SQPvL8cDXy
x0m90rj9CtHmi3V4W+oSnSnK+d9J8M6iWupvGIGxsZ+sIuzIkgWswD7RbWqEO3L6
92daIJ8oLCftoNmE6smMyyw9pc2fVQ0U8sDFo7XcQITawlNI7kGzybKoYps2zpTn
qINCgpjuV4wyeNQxesCAXCidmq3pape368U+Z6EsgTIE17JqY4NS5cDBkyDUDGOb
cNDDsVCaVv4USp3ynx5ZYmwUNRXrhzDf1r1eVwvVTcrIq+XFj5eokzj4bgR4GyLg
hTDkcnsb/4SHgVEwSqZUBTn5GAXrRJBjHG/JyS+BEPtT7rGnaidG9Zucj/gkLogK
PBCQK1PzSXbqa+wC1sxhAIBVpYA/OxYlht0AgBss9lAEmp5qMKBnBc49Jio07m/g
0CkxE47oS8RtUKy8Ug8NZzpwwUcNcyDuXOaHB734DO+KKPebUiadcdZyaYavfRi+
lSqPeBKswJsAW1LbSYuChEQl6G6kRP9WRvQn7cTa5pwqe+45Ws2kFk+lSUkLWpNI
fdVCrgdKtlLTn9GJbAkZgUZcm2Dd9bwMSNBLdzwh/KG4iNfGB6RJ2qO5wOpiZQ6W
99PETapa9gTRemA5SlFtRG34F2K0QwR0b8/eR41C/uiGXCwwt20=
=fwiw
-----END PGP SIGNATURE-----

--MEbZtfywfk+iAFuN--

