Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BE15C364EF2
	for <lists+apparmor@lfdr.de>; Tue, 20 Apr 2021 02:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lYdup-000089-WB; Tue, 20 Apr 2021 00:06:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lYduk-000083-1H
 for apparmor@lists.ubuntu.com; Tue, 20 Apr 2021 00:06:50 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lYduj-0006dQ-Fc
 for apparmor@lists.ubuntu.com; Tue, 20 Apr 2021 00:06:49 +0000
Date: Tue, 20 Apr 2021 00:06:47 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210420000647.GA615286@millbarge>
References: <CAODFaZ4-QRvLugoUo55UJnPNqoaU8N+eVMqhfNYVboOM7s970w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ4-QRvLugoUo55UJnPNqoaU8N+eVMqhfNYVboOM7s970w@mail.gmail.com>
Subject: Re: [apparmor] Apparmor profile: custom header file query
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
Content-Type: multipart/mixed; boundary="===============1786857597201797331=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============1786857597201797331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 11:16:11PM +0530, Murali Selvaraj wrote:
> As per our design , we are applying certain capabilities to all my profil=
es.
>=20
> -> created custom include files as follow #include "relative_path"
>    @{default_caps}=3Dchown,dac_override,dac_read_search,fowner,fsetid,kil=
l,ipc_lock,sys_nice,setpcap,ipc_owner,sys_ptrace,sys_chroot
>=20
> -> Adding this header file in the required apparmor profiles.
>    #include "relative_path"
>    capabilty @{default_caps},
>=20
> -> While parsing the apparmor profiles into Kernel, observing below error=
s.
>    syntax error, unexpected TOK_EQUALS, expecting TOK_MODE

The set variables in AppArmor aren't a generic text replacement tool,
they're specialized for managing the combinatorial explosion of different
distributions putting 'the same' files in different locations, managing
typical unix usernames in directory structures, etc.

You could get something very similar by making a new abstraction file just
for your capabilities:

path/to/whatever/abstractions/default_service_capabilities:
capability chown dac_override dac_read_search fowner fsetid kill ipc_lock s=
ys_nice setpcap ipc_owner sys_ptrace sys_chroot,

And then in your profiles:

#include "path/to/whatever/abstractions/default_service_capabilities"


I hope this helps.

Thanks

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmB+GxQACgkQ8yFyWZ2N
LpdDaAf/ShLiSkPfaePCLNaPGmXAfNKoyCQ4LDulou9zpYVgaANcN5uV9Z/zDga3
PttNL2Wk1Uhc7GAuSgtc46O8NRscyVH+VgcQrnwig/zawMidAUnDH2ADBQH+KLxN
DoGQSFhQHw5vwcgeLJH7f0KHtSew6zuwm1j9Q9K6z4Xy2bY/RqIN7Y3A32fSpcdQ
EDULzffqQRB6OmWocwkVwobARQGh+BKmfqkd/TnFTvC9qMV0lF8jErVdtK8nBtKP
4tms8rhg3bdg8fdy1TalPgioV9d/Ih+smi4GgvyKqZz3o0boJEtY7SKXSKTEgrg1
TjULTRIE1/c/KD+HJTNnu23oSFDnZg==
=cbXY
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--


--===============1786857597201797331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1786857597201797331==--

