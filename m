Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E09B7C41
	for <lists+apparmor@lfdr.de>; Thu, 31 Oct 2024 14:59:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1t6Vhu-00037u-VG; Thu, 31 Oct 2024 13:59:26 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <valoq@mailbox.org>) id 1t6Vht-00037m-0n
 for apparmor@lists.ubuntu.com; Thu, 31 Oct 2024 13:59:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XfQbG67tPz9tl7
 for <apparmor@lists.ubuntu.com>; Thu, 31 Oct 2024 14:59:22 +0100 (CET)
Date: Thu, 31 Oct 2024 14:59:21 +0100
From: valoq <valoq@mailbox.org>
To: apparmor@lists.ubuntu.com
Message-ID: <ZyONOXXSHjV2zfJU@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3+VIZ0YkL9PX60oG"
Content-Disposition: inline
X-MBO-RS-ID: 91919fb70ac04405ca6
X-MBO-RS-META: bat9ft6493y1rpzchg68oauba7qbmchx
Received-SPF: pass client-ip=80.241.56.171; envelope-from=valoq@mailbox.org;
 helo=mout-p-201.mailbox.org
Subject: [apparmor] Restricted userns
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


--3+VIZ0YkL9PX60oG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ubuntu added a patch last year to allow user namespaces only for processes
confined by apparmor and allegedly the kernel patch for this feature made
it into the upstream kernel as well, but there seems to be no documentation
available about it. Additionaly, apparmor now includes default profiles
with the userns permission making use of this feature, but there is no
documentation about the requirements of this feature.

How can this feature actually be used on other linux distributions and
vanilla linux kernels? It seems like
kernel.apparmor_restrict_unprivileged_userns is not available outside of
ubuntu and most similar flags appear undocumented as well.
Is support for restricted userns actually available outside of ubuntu?


--3+VIZ0YkL9PX60oG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQT5jU1ZXwoI5a0EyGfCaD7hly9gFAmcjjTgACgkQGfCaD7hl
y9gIbg//el/fTWBq24d99NHJf4r7eN3Hz7HOHuOHPHJAkCgown8ppranDhmYkh3e
MpbG7AbkMY8CotGWBNDdWpM2N6AsVoPlSZYMp8wfbxmTJG5tXGztdDZq8EgcTbCm
FoPq1duKM9R7G+2i1u8gPphkREV+w5x6OQD8OPpd6+HJgRaIPzK04I39i0hbrBBS
tv9q6iHO5OhGnSrD+W5lUUZSEv3xSXhgMJlqYaljMgz+mYWEGKmgzrRSavBuUZ9m
XPmhSjU7yJNnLcPefAkzVp4VyJsBtGxb2l/VO3as67zEAlAbr29Imb7YWM8Dl0ha
IClgXu8KuZt2NnhAKVoqNTQafKGexHA1MgQcFKiphVKIQewcB2skyWsuUPuN3s2L
wiHwDWVnC5M5gvVZsHDTJUxCGuWxi0YJqeEfyJsihSV98AURcESnojcVg9j0nq2n
/wdgmknkiXMyxoRFu4G0DX0hJRFpab2dPv95e92MY8OmdgadGY+oUkIWJ3paFDOI
MJQaqqQAZ9ZUPKpflFGfqSPFEievY2PMLPTLiyLZ7O9epYZ7mrGqOzFY4JNEgb2F
k+3i/taEPLHuzC5VpQrzcWAYk9wfCZqNg8kf+5btEm6y8J+9EUq7Cp+zP6Q5zrnj
kqn3uoyHPQIFkaDpoLmUeCnpJm9LF+ISjlj4nAyD8YeflNoeGis=
=DXA6
-----END PGP SIGNATURE-----

--3+VIZ0YkL9PX60oG--

