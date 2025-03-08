Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4EA57DBA
	for <lists+apparmor@lfdr.de>; Sat,  8 Mar 2025 20:21:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tqzjh-00084l-Fk; Sat, 08 Mar 2025 19:21:25 +0000
Received: from mail.cboltz.de ([65.21.65.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <apparmor@cboltz.de>)
 id 1tqzjg-00081F-4b
 for apparmor@lists.ubuntu.com; Sat, 08 Mar 2025 19:21:24 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 4AF16232F16E
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 20:21:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0n9HEimhkiCs for <apparmor@lists.ubuntu.com>;
 Sat,  8 Mar 2025 20:21:22 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 20:21:22 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 08 Mar 2025 20:21:18 +0100
Message-ID: <3610981.dWV9SEqChM@tux.boltz.de.vu>
In-Reply-To: <20250304205556.290042-6-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
 <20250304205556.290042-6-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5659567.rdbgypaU67";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Received-SPF: pass client-ip=65.21.65.108; envelope-from=apparmor@cboltz.de;
 helo=mail.cboltz.de
Subject: [apparmor] Re: [PATCH 5/5] apparmor: disable aa_audit_file
 AA_BUG(!ad.request) due to fd inheritance
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

--nextPart5659567.rdbgypaU67
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 08 Mar 2025 20:21:18 +0100
Message-ID: <3610981.dWV9SEqChM@tux.boltz.de.vu>
In-Reply-To: <20250304205556.290042-6-ryan.lee@canonical.com>
MIME-Version: 1.0

Hello,

Am Dienstag, 4. M=C3=A4rz 2025, 21:55 schrieb Ryan Lee:
> Inheritance of fd's triggers the lookup logic, and O_PATH fd's are
> checked with an empty request set. If the O_PATH fd corresponds to a
> disconnected path for an application with a profile in complain mode,
> we have an error without a request bit set in aa_audit_file. Until we
> can handle O_PATH fd inheritance better, the best we can do for now
> is disable the AA_BUG line.
>=20
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  security/apparmor/file.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index c430e031db31..3267a597526e 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -271,7 +271,18 @@ int aa_audit_file(const struct cred *subj_cred,
>  	} else {
>  		/* only report permissions that were denied */
>  		ad.request =3D ad.request & ~perms->allow;
> -		AA_BUG(!ad.request);
> +
> +		/*
> +		 * Inheritance of fd's across execution boundaries causes the
> +		 * path name lookup logic to be triggered for all the fd's.
> +		 * This includes O_PATH fd's for which the original requested
> +		 * set is empty. An O_PATH fd with a disconnected path results
> +		 * in a lookup error, which in complain mode, means we reach
> +		 * this branch with an empty request. Until we have a better
> +		 * way to detect and handle this case, we have to disable this
> +		 * AA_BUG line.
> +		 */
> +		// AA_BUG(!ad.request);

Assuming I got your description right, this AA_BUG will only "explode"=20
in complain mode.

Would it be possible to do something like (pseudocode)

    if !complain_mode
        AA_BUG(!ad.request);

so that AA_BUG only gets skipped for complain mode profiles, instead of=20
completely commenting it out?


Regards,

Christian Boltz
=2D-=20
What you need is a list of all unknown bugs.  ;-)
[James Knott in opensuse-factory]

--nextPart5659567.rdbgypaU67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmfMmK4ACgkQxqaC6mPI
LxxffBAArad6LhHyudt9NW4OwZRITArUHWiAphhdtJV+oU8MzaMC05L49xJGtYWQ
mVKl8fXV4XgTgj+uHXRyRZS7o7Nlqd8bEi6cV6Dm+UMoLWApQmAXqgNGLvPKR911
00mrvBwhZuWNJyZKWmvROo0/HobTLklTuiDxb3cosAt/WNB3+fFdnZflNpsv24Yz
fy1+hLoCnOJENR8WFYZaHBFZf/RUxqsXFuC22KST3hTOH3GcEF71xFb5WTaoLvPm
u9et/CmHsiD/9iPwgL+CPDCFyDHV8SGN2cCsDHm1XYPnTZedXWSC/z6lO+alkbvI
UrbHV2M8hfWRr2y7DR9JmpBqVrFFnedtV1cQ6/klXV6oMtq8Fjvc/2cdnsGxzwHR
W279Q+dGLqkx2zR+AGnUZc2vkP/cz1aOWZzOTShVVo5pPh9ReHjUuEqYNABZeA5T
r4+5+pnx+FcXcvODEP4baQMlkwP2d/9k+BlQeCur4eyr2PgXliqV7dFpXXdQNTwv
KW7JBDbVyvWihT4dFlrQlzkaHYLJ2F1TIsWkxEHNY2RNtee2MSoFmSlyt23TmZzE
I/2Cc9ykq3Yy4/8Y7A75TnRwmiaMO7AUjoPBA5z0OLN+nHy6BO82al1MmxaQlQu9
eFDUBaddMlwsgv8QMtEH6olwzqx8YW5Cf1ay0w1znNmApuSdl2I=
=s8UW
-----END PGP SIGNATURE-----

--nextPart5659567.rdbgypaU67--




