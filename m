Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C5C93912
	for <lists+apparmor@lfdr.de>; Sat, 29 Nov 2025 09:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vPG3f-0005WS-Do; Sat, 29 Nov 2025 08:11:55 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vO9wV-0007iA-CP
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 07:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=BbRar5ALRK9J3A5yU5VFUuIOPYE6KvC6jWD+BX5+PGA=; t=1764142079;
 x=1764746879; b=Ew2WIFjEfeaKI7JwXwIDdgo1gCPcUs896/KxDXhuiu+pObLFMlC4DW1v++/6T
 elig+a5croHVubxA5Z7BVhkmroFggM9aFGLXnNMKUDfDnc2q1H7gYDQc5G+KUt2ANhUerXqLu0JKN
 hcoCfTTzN8Uo2TLULIXGFI/Q9L4vlWDlMa3FVGgcHhIAWYvJ3oAarq8RTD6Rugs6eTVL13ULDsnK7
 DL7mSruIdwFGlStiXn/rb6EVOwm8JF2e1Hiex95jyjlyPX0nQFiqBHfYfrlQnOI4YIo51uWPn8/KR
 hMyCK3nxyGINywfBds3Yl9GNswnzzi8/k/Dtklo1v81y3SCkXA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vO9wU-00000002dUX-1dZ4; Wed, 26 Nov 2025 08:27:58 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vO9wU-00000001VMY-0gGN; Wed, 26 Nov 2025 08:27:58 +0100
Message-ID: <70e2ea005b090c8b3747c6724a19e6d697f5c9e8.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@kernel.org>, John Johansen
 <john.johansen@canonical.com>
Date: Wed, 26 Nov 2025 08:27:56 +0100
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

Yes, I'll test that one.

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

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

