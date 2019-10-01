Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B240BC3FA7
	for <lists+apparmor@lfdr.de>; Tue,  1 Oct 2019 20:17:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iFMiY-0002YN-Lu; Tue, 01 Oct 2019 18:17:46 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1iFMiX-0002YD-GY
 for apparmor@lists.ubuntu.com; Tue, 01 Oct 2019 18:17:45 +0000
Received: from 97-120-111-46.ptld.qwest.net ([97.120.111.46] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1iFMiX-0001iJ-1p; Tue, 01 Oct 2019 18:17:45 +0000
Date: Tue, 1 Oct 2019 18:17:43 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Message-ID: <20191001181743.GA13903@millbarge>
References: <MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [apparmor] Query about AppArmor's Profile Transitions
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============5668734108653575594=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5668734108653575594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2019 at 05:25:21PM +0000, Abhishek Vijeev wrote:
> Currently, AppArmor allows 'pix' and 'cix' transitions. However, we would like to extend AppArmor to
> allow a 'pcix' transition. To clarify what we mean by 'pcix', we're looking for a way by which we
> can specify the following policy: 'look for a specific profile, but if one doesn't exist, look for a
> child profile, otherwise inherit the current profile'. Are there any challenges to implementing
> this? Also, is this a feature that is planned for release in future versions of AppArmor?

I do have to wonder if whatever you're trying to solve would be better
handled via stacking profiles instead.

What are you trying to achieve?

Thanks

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl2TmEMACgkQ8yFyWZ2N
Lpef9QgAjJWgkSeJQhulQkupFat37KlFL3Lf9Dv0daYHAkUXqUIRnBxvQNqgFK/9
ni4nfxfT9Wu/fIPgXs8NE81LDKs5PssCT4Ba0idZRYugd6rd+sm8fX9APjWPfG1P
arQZI4qHhH4AWpVtbqLueK1gRzQ2FCwkD95yCLJGsUy16/jzMASgktpXeuoPZUfn
HIiyZZmSII+B2V+nf0tl3fRFXu4fDAPjzKEsrbtfGYhx6MBkcRTNFOd48Z6hE9EL
Oss92T2qA18leJX7GOi5XsHAAr7JZYZFXxr3bZknb+uwyb7LKp53r341UcJ3TCfY
jKZAvbdMhZIGuiHx27iuFtpcFOwyVQ==
=I5/I
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


--===============5668734108653575594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5668734108653575594==--

