Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CFC93919
	for <lists+apparmor@lfdr.de>; Sat, 29 Nov 2025 09:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vPG3h-0005Y0-Gq; Sat, 29 Nov 2025 08:11:57 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOYFd-0004lB-9C
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 09:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=i42dTfiGDnlPRdQ/xPGyaB6FM4LqJLuJS/OfgBUfGtY=; t=1764235521;
 x=1764840321; b=gMPUCa+08YVh6txBzItUylC1GPYZdsn1PimqJFB58HQWSdiihjKpL/mdNoJQA
 D4nlmCdSmuQfVW7Q63XOmAXlcfAAUCrXAShywvTRt9Rel+e6CYLSfxn16TwJ/joR5R0SLTIPDmXt3
 RvP8Le+NI9jiKHjIGLJWCN0+DInlmvnrJ2NcVZIurqfei1O72EN5B9ZykDUmiWeWvimBpRPDnaOmv
 yNXyElp+yfY984SLafsi/ZBxmW3XzIY6vSb8+SpT97ifKCU9ZKpGudmd2MxQtA4UkQlYXFWelKpDN
 VqdSBU9MjITgkUIuPUvvQW2I0+BvsFh3AARVBNVQ/LbtZNNInw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOYFa-00000002SzL-1BUq; Thu, 27 Nov 2025 10:25:18 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vOYFa-00000001ITL-0FZh; Thu, 27 Nov 2025 10:25:18 +0100
Message-ID: <6d80f9bc5fd6d91ed2451d140227b866d6273af4.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@kernel.org>, John Johansen
 <john.johansen@canonical.com>
Date: Thu, 27 Nov 2025 10:25:17 +0100
In-Reply-To: <aSdfyGv2T88T5FEu@carbonx1>
References: <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100>
 <e88c32c2-fb18-4f3e-9ec2-a749695aaf0a@canonical.com>
 <c192140a-0575-41e9-8895-6c8257ce4682@gmx.de>
 <d35010b3-7d07-488c-b5a4-a13380d0ef7c@canonical.com>
 <20251126104444.29002552@pumpkin>
 <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de>
 <20251126142201.27e23076@pumpkin> <aScY13MEBATreotz@carbonx1>
 <f5637038-9661-47fe-ba69-e461760ac975@canonical.com>
 <aSdfyGv2T88T5FEu@carbonx1>
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
Cc: david laight <david.laight@runbox.com>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Helge,

On Wed, 2025-11-26 at 21:15 +0100, Helge Deller wrote:
> So, here is a (untested) v3:
>=20
>=20
> [PATCH v3] apparmor: Optimize table creation from possibly unaligned memo=
ry
>=20
> Source blob may come from userspace and might be unaligned.
> Try to optize the copying process by avoiding unaligned memory accesses.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
>=20
> diff --git a/security/apparmor/include/match.h b/security/apparmor/includ=
e/match.h
> index 1fbe82f5021b..19e72b3e8f49 100644
> --- a/security/apparmor/include/match.h
> +++ b/security/apparmor/include/match.h
> @@ -104,16 +104,18 @@ struct aa_dfa {
>  	struct table_header *tables[YYTD_ID_TSIZE];
>  };
> =20
> -#define byte_to_byte(X) (X)
> -
>  #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
>  	do { \
>  		typeof(LEN) __i; \
>  		TTYPE *__t =3D (TTYPE *) TABLE; \
>  		BTYPE *__b =3D (BTYPE *) BLOB; \
> -		for (__i =3D 0; __i < LEN; __i++) { \
> -			__t[__i] =3D NTOHX(__b[__i]); \
> -		} \
> +		BUILD_BUG_ON(sizeof(TTYPE) !=3D sizeof(BTYPE)); \
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) \
> +			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
> +		else /* copy & convert convert from big-endian */ \
> +			for (__i =3D 0; __i < LEN; __i++) { \
> +				__t[__i] =3D NTOHX(&__b[__i]); \
> +			} \
>  	} while (0)
> =20
>  static inline size_t table_size(size_t len, size_t el_size)
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index c5a91600842a..1e32c8ba14ae 100644
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
> @@ -66,14 +67,13 @@ static struct table_header *unpack_table(char *blob, =
size_t bsize)
>  		table->td_flags =3D th.td_flags;
>  		table->td_lolen =3D th.td_lolen;
>  		if (th.td_flags =3D=3D YYTD_DATA8)
> -			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u8, u8, byte_to_byte);
> +			memcpy(table->td_data, blob, th.td_lolen);
>  		else if (th.td_flags =3D=3D YYTD_DATA16)
>  			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u16, __be16, be16_to_cpu);
> +				     u16, __be16, get_unaligned_be16);
>  		else if (th.td_flags =3D=3D YYTD_DATA32)
>  			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
> -				     u32, __be32, be32_to_cpu);
> +				     u32, __be32, get_unaligned_be32);
>  		else
>  			goto fail;
>  		/* if table was vmalloced make sure the page tables are synced

This one does not apply:

glaubitz@node54:/data/home/glaubitz/linux> git am ../20251125_app_armor_una=
lign_2nd.mbx
Applying: apparmor unaligned memory fixes
error: patch failed: security/apparmor/match.c:15
error: security/apparmor/match.c: patch does not apply
Patch failed at 0001 apparmor unaligned memory fixes
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"
glaubitz@node54:/data/home/glaubitz/linux>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

