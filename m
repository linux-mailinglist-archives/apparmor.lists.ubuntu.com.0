Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E997BC93942
	for <lists+apparmor@lfdr.de>; Sat, 29 Nov 2025 09:12:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vPG3m-0005dn-9t; Sat, 29 Nov 2025 08:12:02 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOAJq-0003wP-Mh
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 07:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=ESKQjQsauXnAhWqFvMKIHtVXQ0piXgBraZ576m4aBZo=; t=1764143526;
 x=1764748326; b=O9MVvSQJnJ6118wP48CmP3LJWu58RuTnJPBNymTPsfdqFSwluoLgYqR3EvN8W
 92tCvVRSLHwiZQtRGCCwyI/afCcYMcnHGC4/emoLF20mnzTBnj5+C93SJB+V6pITgZw6dEF+PRVvi
 edlYdx6qduvZFCY8a8cFLJ1nyUPRWh8azo4ssWhWVOgowM1rtEJHeWC9pUCDCiHJkMM6NUeXpxJmP
 dnSi2MT2/3xvF4lyEwpHTOzSaKQNj2fWY0/EnxW5lQBhV3rQxGmyVFJA8b3WNqyPHxbUYJkVTjOtP
 HtWQ8DzsWu5vhwbEVZLPXNznEYoRP7XjjzeAi9Vig27Ig0nP3g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOAJp-00000002oDL-2kwS; Wed, 26 Nov 2025 08:52:05 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vOAJp-00000001aEr-1oEF; Wed, 26 Nov 2025 08:52:05 +0100
Message-ID: <78ebb7db92ada9078b419b241d92722f6fc20864.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@kernel.org>, John Johansen
 <john.johansen@canonical.com>
Date: Wed, 26 Nov 2025 08:52:04 +0100
In-Reply-To: <aSXHCyH_rS-c5BgP@p100>
References: <20250531150822.135803-1-deller@kernel.org>
 <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
 <aRxT78fdN5v2Ajyl@p100>
 <90513f85cc8d060ebccd3972cc7709e4b6f13f34.camel@physik.fu-berlin.de>
 <be9c143d-1d5e-4c5b-9078-4a7804489258@gmx.de>
 <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Mailman-Approved-At: Sat, 29 Nov 2025 08:11:54 +0000
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: linux-security-module@vger.kernel.org, Helge Deller <deller@gmx.de>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Helge,

On Tue, 2025-11-25 at 16:11 +0100, Helge Deller wrote:
> Regarding this:
>=20
> > Kernel side, we are going to need to add some extra verification checks=
, it should
> > be catching this, as unaligned as part of the unpack. Userspace side, w=
e will have
> > to verify my guess and fix the loader.
>=20
> I wonder if loading those tables are really time critical?
> If not, maybe just making the kernel aware that the tables might be unali=
gned
> can help, e.g. with the following (untested) patch.
> Adrian, maybe you want to test?
>=20
> ------------------------
>=20
> [PATCH] Allow apparmor to handle unaligned dfa tables
>=20
> The dfa tables can originate from kernel or userspace and 8-byte alignmen=
t
> isn't always guaranteed and as such may trigger unaligned memory accesses
> on various architectures.
> Work around it by using the get_unaligned_xx() helpers.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
>=20
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index c5a91600842a..26e82ba879d4 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -15,6 +15,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/err.h>
>  #include <linux/kref.h>
> +#include <linux/unaligned.h>
> =20
>  #include "include/lib.h"
>  #include "include/match.h"
> @@ -42,11 +43,11 @@ static struct table_header *unpack_table(char *blob, =
size_t bsize)
>  	/* loaded td_id's start at 1, subtract 1 now to avoid doing
>  	 * it every time we use td_id as an index
>  	 */
> -	th.td_id =3D be16_to_cpu(*(__be16 *) (blob)) - 1;
> +	th.td_id =3D get_unaligned_be16(blob) - 1;
>  	if (th.td_id > YYTD_ID_MAX)
>  		goto out;
> -	th.td_flags =3D be16_to_cpu(*(__be16 *) (blob + 2));
> -	th.td_lolen =3D be32_to_cpu(*(__be32 *) (blob + 8));
> +	th.td_flags =3D get_unaligned_be16(blob + 2);
> +	th.td_lolen =3D get_unaligned_be32(blob + 8);
>  	blob +=3D sizeof(struct table_header);
> =20
>  	if (!(th.td_flags =3D=3D YYTD_DATA16 || th.td_flags =3D=3D YYTD_DATA32 =
||
> @@ -313,14 +314,14 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t siz=
e, int flags)
>  	if (size < sizeof(struct table_set_header))
>  		goto fail;
> =20
> -	if (ntohl(*(__be32 *) data) !=3D YYTH_MAGIC)
> +	if (get_unaligned_be32(data) !=3D YYTH_MAGIC)
>  		goto fail;
> =20
> -	hsize =3D ntohl(*(__be32 *) (data + 4));
> +	hsize =3D get_unaligned_be32(data + 4);
>  	if (size < hsize)
>  		goto fail;
> =20
> -	dfa->flags =3D ntohs(*(__be16 *) (data + 12));
> +	dfa->flags =3D get_unaligned_be16(data + 12);
>  	if (dfa->flags & ~(YYTH_FLAGS))
>  		goto fail;
> =20
> @@ -329,7 +330,7 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size,=
 int flags)
>  	 * if (dfa->flags & YYTH_FLAGS_OOB_TRANS) {
>  	 *	if (hsize < 16 + 4)
>  	 *		goto fail;
> -	 *	dfa->max_oob =3D ntol(*(__be32 *) (data + 16));
> +	 *	dfa->max_oob =3D get_unaligned_be32(data + 16);
>  	 *	if (dfa->max <=3D MAX_OOB_SUPPORTED) {
>  	 *		pr_err("AppArmor DFA OOB greater than supported\n");
>  	 *		goto fail;

I can confirm that this fixes the unaligned access warnings.

Without the patch:

[   72.073526] audit: type=3D1400 audit(1764145307.711:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"1password" pi=
d=3D292 comm=3D"apparmor_parser"
[   72.413269] audit: type=3D1400 audit(1764145308.051:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"Discord" pid=
=3D294 comm=3D"apparmor_parser"
[   72.645135] audit: type=3D1400 audit(1764145308.283:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D4D6F6E676F4442=
20436F6D70617373 pid=3D296 comm=3D"apparmor_parser"
[   72.901297] audit: type=3D1400 audit(1764145308.539:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"QtWebEnginePr=
ocess" pid=3D297 comm=3D"apparmor_parser"
[   73.245252] audit: type=3D1400 audit(1764145308.879:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"Xorg" pid=3D2=
98 comm=3D"apparmor_parser"
[   73.468571] audit: type=3D1400 audit(1764145309.107:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"balena-etcher=
" pid=3D299 comm=3D"apparmor_parser"
[   73.688642] audit: type=3D1400 audit(1764145309.327:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"brave" pid=3D=
300 comm=3D"apparmor_parser"
[   73.897068] audit: type=3D1400 audit(1764145309.531:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"buildah" pid=
=3D301 comm=3D"apparmor_parser"
[   74.104434] audit: type=3D1400 audit(1764145309.739:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"busybox" pid=
=3D302 comm=3D"apparmor_parser"
[   74.313359] audit: type=3D1400 audit(1764145309.951:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"cam" pid=3D3=
03 comm=3D"apparmor_parser"
[   74.808437] Kernel unaligned access at TPC[8dabdc] aa_dfa_unpack+0x3c/0x=
6e0
[   74.900032] Kernel unaligned access at TPC[8dabec] aa_dfa_unpack+0x4c/0x=
6e0
[   74.991608] Kernel unaligned access at TPC[8dacd0] aa_dfa_unpack+0x130/0=
x6e0
[   75.084339] Kernel unaligned access at TPC[8dacd0] aa_dfa_unpack+0x130/0=
x6e0
[   75.176997] Kernel unaligned access at TPC[8dacd0] aa_dfa_unpack+0x130/0=
x6e0

With the patch:

[   78.058157] audit: type=3D1400 audit(1764145018.691:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"1password" pi=
d=3D294 comm=3D"apparmor_parser"
[   78.294742] audit: type=3D1400 audit(1764145018.927:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"Discord" pid=
=3D295 comm=3D"apparmor_parser"
[   78.516989] audit: type=3D1400 audit(1764145019.127:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D4D6F6E676F4442=
20436F6D70617373 pid=3D297 comm=3D"apparmor_parser"
[   78.748842] audit: type=3D1400 audit(1764145019.379:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"QtWebEnginePr=
ocess" pid=3D298 comm=3D"apparmor_parser"
[   79.101544] audit: type=3D1400 audit(1764145019.731:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"Xorg" pid=3D2=
99 comm=3D"apparmor_parser"
[   79.335655] audit: type=3D1400 audit(1764145019.967:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"balena-etcher=
" pid=3D300 comm=3D"apparmor_parser"
[   79.559475] audit: type=3D1400 audit(1764145020.191:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"brave" pid=3D=
301 comm=3D"apparmor_parser"
[   79.768389] audit: type=3D1400 audit(1764145020.399:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"buildah" pid=
=3D302 comm=3D"apparmor_parser"
[   79.974008] audit: type=3D1400 audit(1764145020.607:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"busybox" pid=
=3D303 comm=3D"apparmor_parser"
[   80.194378] audit: type=3D1400 audit(1764145020.827:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"cam" pid=3D3=
04 comm=3D"apparmor_parser"

So, it seems your approach works as expected.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

