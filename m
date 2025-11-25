Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B32C875B4
	for <lists+apparmor@lfdr.de>; Tue, 25 Nov 2025 23:38:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vO1fZ-0003iG-VM; Tue, 25 Nov 2025 22:37:57 +0000
Received: from mail.cboltz.de ([65.21.65.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <apparmor@cboltz.de>)
 id 1vO1fY-0003hr-Ae
 for apparmor@lists.ubuntu.com; Tue, 25 Nov 2025 22:37:56 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 95426356D5C2;
 Tue, 25 Nov 2025 23:37:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty-bx4u39HtQ; Tue, 25 Nov 2025 23:37:55 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Tue, 25 Nov 2025 23:37:55 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Tue, 25 Nov 2025 23:37:51 +0100
Message-ID: <2710950.vYhyI6sBWr@tux.boltz.de.vu>
In-Reply-To: <20251125071219.1977973-1-me@zygoon.pl>
References: <20251125071219.1977973-1-me@zygoon.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5240008.Qq0lBPeGtt";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Received-SPF: pass client-ip=65.21.65.108; envelope-from=apparmor@cboltz.de;
 helo=mail.cboltz.de
Subject: [apparmor] Re: [PATCH] apparmor: synthesize ACCEPT_FLAG_OWNER bits
 in file pdb
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

--nextPart5240008.Qq0lBPeGtt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Zygmunt Krynicki <me@zygoon.pl>
Date: Tue, 25 Nov 2025 23:37:51 +0100
Message-ID: <2710950.vYhyI6sBWr@tux.boltz.de.vu>
In-Reply-To: <20251125071219.1977973-1-me@zygoon.pl>
References: <20251125071219.1977973-1-me@zygoon.pl>
MIME-Version: 1.0

Hello,

Am Dienstag, 25. November 2025, 08:12 schrieb Zygmunt Krynicki:
> +               /* The accept1 table is clearly indexing perms table and is twice the
> +                * number of states (as indicated by the base table), so the user/other
> +                * split is in effect - the permissions table has two entries for each
> +                * state. Synthesize the missing owner flag all entries. */

The last sentence in the comment doesn't parse well.

Maybe   ... owner flag _for_ all entries.   would be better?


Regards,

Christian Boltz
-- 
The plural of regex is regrets.
[https://nitter.net/j_opdenakker/status/1437350281637990401]

--nextPart5240008.Qq0lBPeGtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmkmL78bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEMamgupjyC8cpQQP/j0h7yEM5YNX7Y0IBCpZ
Z7nXOe9Bcg+8ZaJmMUWlReXvnSba1Oc4qLm93TLK7qQMQ3aROLpFlDLL/zvafiEG
Gn3XXv4yBc+677F7zQUA969cqg38QlVpd5iUIWNwF3wdyNWkSK8Gj3zj8f+bhnij
LNYhYCZqbm+HDOZHWDsmdGSjGy/U/nhvmhhUJxA+iMsSYXJewAwPX3rXAfyCCYd3
rPuSPJorlV1HIXlLDkZeJ9pcncaQkbrJcw7L9eMWYcPjZ91MIEXSct5EY7aAzcXK
0d4mweWDfRSboCVXOidhI/K6DcfSyOPQh0d/E8yrAl/fC9bCO87yo6bM+E87RbKH
129DuUw7ZDgmmqVc8Y518nwUehruHXPu6mmBHhgYcwddT1wkiIB2xVdPk/kUNYPL
V96RJax8XEPtONtXJ1HGWCpHNUJcy35euZfS8W0FYIo5rznp129c1JFGLmD7yvJC
oxO2drwfVINvo+cB6eDrSjofSNbtU/OrhnSc4LWK+AGAkPwrIQvuiZC/L+V0xP2F
PjVvJSAU7/8HJhlaGGhGnpsx5dxaQMOgdx++BPDajiRn0GKIIUX7vqPgWhRG5elC
oaDtrC25wtNQgYrV3pmfKdgiGx7O8wldw5LJ120d1BybkIzBW6TL7Q2OtkjV7HWa
WVcB8SX0B7o4CySLYRDj7mvE
=PTIv
-----END PGP SIGNATURE-----

--nextPart5240008.Qq0lBPeGtt--




