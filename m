Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98423F435
	for <lists+apparmor@lfdr.de>; Fri,  7 Aug 2020 23:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k49u9-0003le-Q6; Fri, 07 Aug 2020 21:27:57 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1k49u7-0003lV-DN
 for apparmor@lists.ubuntu.com; Fri, 07 Aug 2020 21:27:55 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1k49u5-0006am-ET; Fri, 07 Aug 2020 21:27:53 +0000
Date: Fri, 7 Aug 2020 21:27:51 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200807212751.GB3169683@millbarge>
References: <20200807165055.3756-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200807165055.3756-1-rdunlap@infradead.org>
Subject: Re: [apparmor] [PATCH] security: apparmor: delete repeated words in
 comments
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
Cc: linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>
Content-Type: multipart/mixed; boundary="===============6393699246185520584=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============6393699246185520584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 09:50:55AM -0700, Randy Dunlap wrote:
> Drop repeated words in comments.
> {a, then, to}
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: apparmor@lists.ubuntu.com
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org

Reviewed-By: Seth Arnold <seth.arnold@canonical.com>

Thanks

> ---
>  security/apparmor/include/file.h  |    2 +-
>  security/apparmor/path.c          |    2 +-
>  security/apparmor/policy_unpack.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> --- linux-next-20200731.orig/security/apparmor/include/file.h
> +++ linux-next-20200731/security/apparmor/include/file.h
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
> --- linux-next-20200731.orig/security/apparmor/path.c
> +++ linux-next-20200731/security/apparmor/path.c
> @@ -83,7 +83,7 @@ static int disconnect(const struct path
>   *
>   * Returns: %0 else error code if path lookup fails
>   *          When no error the path name is returned in @name which point=
s to
> - *          to a position in @buf
> + *          a position in @buf
>   */
>  static int d_namespace_path(const struct path *path, char *buf, char **n=
ame,
>  			    int flags, const char *disconnected)
> --- linux-next-20200731.orig/security/apparmor/policy_unpack.c
> +++ linux-next-20200731/security/apparmor/policy_unpack.c
> @@ -39,7 +39,7 @@
> =20
>  /*
>   * The AppArmor interface treats data as a type byte followed by the
> - * actual data.  The interface has the notion of a a named entry
> + * actual data.  The interface has the notion of a named entry
>   * which has a name (AA_NAME typecode followed by name string) followed =
by
>   * the entries typecode and data.  Named types allow for optional
>   * elements and extensions to be added and tested for without breaking
>=20
> --=20
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at: https://lists.ubuntu.com/mailman/listi=
nfo/apparmor

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl8tx1YACgkQ8yFyWZ2N
LpeN+Qf+OkvGh9PooJZWP1r+NZGJt4P/B/3fK5qaEZmnHpJafI5S2SIjDeD2N82S
t7JYEeRnOCRkoI3awiL0TL4rGQ87mevJKwrZgthbGWdnnb5FBLcOA+R3Xrm1FUtl
EXChzjoYe5ObfbGluB4zWJTtFNQNcSgvFnizGqfSrDNLKf9tCXPxgLyJIaR1C7vF
JONeSYhvwisK5kgoXXnPUdhfmrPM0OiO7LXWRkeAbta20fp2SaQyRCjEj2itnjOS
M5Nd6oILXRi8FW6F1vSmw/XYz3ohR2R/WEAiAdhGK8pMMkqOuSwMoWrItKUr4w4y
trBH6c8l432rLmlUFA4Zn0Ve09QKDw==
=WcjH
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--


--===============6393699246185520584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6393699246185520584==--

