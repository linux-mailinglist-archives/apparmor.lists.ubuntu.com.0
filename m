Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A983686BD
	for <lists+apparmor@lfdr.de>; Thu, 22 Apr 2021 20:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZeLC-0006OI-FU; Thu, 22 Apr 2021 18:46:18 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lZeLB-0006O3-F1
 for apparmor@lists.ubuntu.com; Thu, 22 Apr 2021 18:46:17 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lZeLA-0005nv-Ta
 for apparmor@lists.ubuntu.com; Thu, 22 Apr 2021 18:46:17 +0000
Date: Thu, 22 Apr 2021 18:46:15 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210422184615.GB2626178@millbarge>
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <f0c9334a-7b73-8f48-d1ee-4294efb00120@canonical.com>
 <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: Query on adding many capabilities in the
 custom header file
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
Content-Type: multipart/mixed; boundary="===============1002663988395475608=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============1002663988395475608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 09:15:27PM +0530, Murali Selvaraj wrote:
> @{default_caps}=chown,dac_override,dac_read_search,fowner,fsetid,kill,ipc_lock,sys_nice,setpcap,pc_owner,sys_ptrace,sys_chroot

Variables don't work for the capabilities. They aren't like files.

Make a new abstraction file with:

capability chown dac_override dac_read_search fowner fsetid kill ipc_lock sys_nice setpcap pc_owner sys_ptrace sys_chroot,


as the only contents, and use that. instead.

Thanks

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmCBxHYACgkQ8yFyWZ2N
LpcLoQgAju1mGXj+l1Y0SZzeGoDQerp5BkDi5HIivjXnC522t1qAo81Hp6qEgJ+9
8pOtf+XejhLtsS4xXPZXugrA8qD9dVxxj7Kh0Yirhd385JT/u/DnIVUw465e0q3G
GfJvbWfty+tkdnRKTiT1TG8P8beg/OV/XPnMcKGTkFi2SHTJN74B97bv4RDYjycZ
62ZDoYiGYmyOX4GeFpTo1eSzw1vX1BF6LoXFHYPQECmwVv61SzVTuVc8HvMGKdd1
dENoU1TYUkoznnDKP/NaguzJKpUg+9H0SKG6TjUiDm5QCrdMB1VboZtgoZO/9M63
d+4K517EkyvqzP48jAncb862Av7FNw==
=y6It
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--


--===============1002663988395475608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1002663988395475608==--

