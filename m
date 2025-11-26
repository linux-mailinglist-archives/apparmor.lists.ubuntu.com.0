Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEFC93933
	for <lists+apparmor@lfdr.de>; Sat, 29 Nov 2025 09:12:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vPG3g-0005XQ-RP; Sat, 29 Nov 2025 08:11:56 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOICM-0006mp-K0
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 16:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=Gg5/D68mHg67K6ACJ/qySf1Tuf5DCYbgvIMuPbJ81jA=; t=1764173814;
 x=1764778614; b=K8SYocF/b+QrsxxeFidmpXGIDrqfK2akoEKmPzAZhfoarO4FBBQEz1bYwnZ+I
 ND6URdsvDX38w5y3V6JAD1wtosD4NkewdcbBpbyCEa7PA5l5AHXVGjtAY8B7Y8a0V+NIZBDdNkaQw
 6OxkMnFDDxKOzGHXHz9WbtS4fuE7ZpciVSOMlXQSjszkloX0ptJncajDrACpkLBBUX0deTJ8hdew+
 OKPkDW3cf5d0cFjpec1C7aIGSCaHTnJGrdPwBn8jQq9kf8z1JurkSbfmgMJjCuq+FfEKX8kLcBeAw
 yT6lsN7ST4yx4cG3k7pNXUEflHGcGnd3AuzgiZph5cXO6mxsZg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vOICL-00000002PRw-0ZHl; Wed, 26 Nov 2025 17:16:53 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.99)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vOICK-00000003I3Z-3pko; Wed, 26 Nov 2025 17:16:53 +0100
Message-ID: <78f1ff26f06c0e61d71c1a7f05a7c03c4ec03bef.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@kernel.org>, John Johansen
 <john.johansen@canonical.com>, david laight <david.laight@runbox.com>
Date: Wed, 26 Nov 2025 17:16:52 +0100
In-Reply-To: <aSblGNyoSV4LfKji@carbonx1>
References: <aRxT78fdN5v2Ajyl@p100>
 <90513f85cc8d060ebccd3972cc7709e4b6f13f34.camel@physik.fu-berlin.de>
 <be9c143d-1d5e-4c5b-9078-4a7804489258@gmx.de>
 <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100>
 <e88c32c2-fb18-4f3e-9ec2-a749695aaf0a@canonical.com>
 <c192140a-0575-41e9-8895-6c8257ce4682@gmx.de>
 <d35010b3-7d07-488c-b5a4-a13380d0ef7c@canonical.com>
 <20251126104444.29002552@pumpkin>
 <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de> <aSblGNyoSV4LfKji@carbonx1>
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Helge,

On Wed, 2025-11-26 at 12:31 +0100, Helge Deller wrote:
> Like this (untested!) patch:
>=20
> [PATCH] apparmor: Optimize table creation from possibly unaligned memory
>=20
> Source blob may come from userspace and might be unaligned.
> Try to optize the copying process by avoiding unaligned memory accesses.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
>=20
> diff --git a/security/apparmor/include/match.h b/security/apparmor/includ=
e/match.h
> index 1fbe82f5021b..225df6495c84 100644
> --- a/security/apparmor/include/match.h
> +++ b/security/apparmor/include/match.h
> @@ -111,9 +111,14 @@ struct aa_dfa {
>  		typeof(LEN) __i; \
>  		TTYPE *__t =3D (TTYPE *) TABLE; \
>  		BTYPE *__b =3D (BTYPE *) BLOB; \
> -		for (__i =3D 0; __i < LEN; __i++) { \
> -			__t[__i] =3D NTOHX(__b[__i]); \
> -		} \
> +		BUILD_BUG_ON(sizeof(TTYPE) !=3D sizeof(BTYPE)); \
> +		/* copy to naturally aligned table address */ \
> +		memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
> +		/* convert from big-endian if necessary */ \
> +		if (!IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) \
> +			for (__i =3D 0; __i < LEN; __i++, __t++) { \
> +				*__t =3D NTOHX(*__t); \
> +			} \
>  	} while (0)
> =20
>  static inline size_t table_size(size_t len, size_t el_size)

So, is this patch supposed to replace all the other proposed patches?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

