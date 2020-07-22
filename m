Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E448822A0CF
	for <lists+apparmor@lfdr.de>; Wed, 22 Jul 2020 22:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jyLSR-0001ZK-BC; Wed, 22 Jul 2020 20:35:19 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1jyLSQ-0001ZE-JR
 for apparmor@lists.ubuntu.com; Wed, 22 Jul 2020 20:35:18 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1jyLSP-0006Dv-4C; Wed, 22 Jul 2020 20:35:17 +0000
Date: Wed, 22 Jul 2020 20:35:14 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200722203514.GB84486@millbarge>
References: <20200719180835.24658-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200719180835.24658-1-rdunlap@infradead.org>
Subject: Re: [apparmor] [PATCH] security: apparmor: file.h: delete
 duplicated word
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
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3564270461022006850=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============3564270461022006850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2020 at 11:08:35AM -0700, Randy Dunlap wrote:
> Delete the doubled word "then" in a comment.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: apparmor@lists.ubuntu.com

Reviewed-by: Seth Arnold <seth.arnold@canonical.com>

Thanks

> ---
>  security/apparmor/include/file.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- linux-next-20200717.orig/security/apparmor/include/file.h
> +++ linux-next-20200717/security/apparmor/include/file.h
> @@ -167,7 +167,7 @@ int aa_audit_file(struct aa_profile *pro
>   * @perms: permission table indexed by the matched state accept entry of=
 @dfa
>   * @trans: transition table for indexed by named x transitions
>   *
> - * File permission are determined by matching a path against @dfa and th=
en
> + * File permission are determined by matching a path against @dfa and
>   * then using the value of the accept entry for the matching state as
>   * an index into @perms.  If a named exec transition is required it is
>   * looked up in the transition table.
>=20

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl8Yov4ACgkQ8yFyWZ2N
Lped0wf7BOUDobQFJ75lulsDDZ+njuj+aWldahIGtNOsBSkxOxo8jU/yFQ3CcvOV
K1VxjYqkhxU5QhWceVFsQ8DN8ILghdb6yofJ9vfnuSgdqcifzwoHbku3Ul99hZyo
sN5MkQKlLdMsksQCWEvHvB7ofMguuHjHbsYlqPOspdMMLPOEetFzte+irh0cNUyg
T+oIcWtW9ZUZLSOzmMCM8siFK9lZ2f72zzUpiG1jHxWq9RqVivcKDXGIsvuJtBvZ
oPALNws2CAWFpwwHj217PkTwVifdPhdvT80ujs27vIim0I2bmSYBF21pYZ5K9pOW
iAA3GhT6OVL5aXhhQIA6btoyPWbsnw==
=GKRw
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--


--===============3564270461022006850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3564270461022006850==--

