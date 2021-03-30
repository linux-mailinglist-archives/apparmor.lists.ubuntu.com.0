Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9ED34F2E0
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 23:13:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRLgJ-0006Bn-Cy; Tue, 30 Mar 2021 21:13:47 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lRLgH-0006Bh-5a
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 21:13:45 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1lRLgG-0003p5-Ht; Tue, 30 Mar 2021 21:13:44 +0000
Date: Tue, 30 Mar 2021 21:13:41 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20210330211341.GA2203519@millbarge>
References: <CAODFaZ5YCf+T1TweGWeR+bpkZ9wxHV2K5Mm--9tMUo6LZZYhwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ5YCf+T1TweGWeR+bpkZ9wxHV2K5Mm--9tMUo6LZZYhwg@mail.gmail.com>
Subject: Re: [apparmor] Apparmor on Embedded devies.
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============3845810343670532513=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============3845810343670532513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 11:41:25PM +0530, Murali Selvaraj wrote:
> -> As we know that code has been merged/updated continuously (day to
> day) on the particular process, Do we have any mechanism to ensure how
> the Apparmor profile  aligns with the latest process/image?

Be sure your continuous integration tests cover everything the product
does, and make adding tests a condition of merging new code into the
tree. Look for DENIED entries in the logs, and fail the tests if there are
new denials.

Also, make it very easy for developers to run the full test suite
themselves on realistic deployment systems -- so they'll be in a position
to spot these problems before they even prepare merge requests.

> -> What is your thought on using embedded device head-set?

Depending upon what you're offering, it might make sense to investigate
compiling the profiles before deploying them to the devices.
(--features-file from the apparmor_parser(8) manpage may be helpful.)

Thanks

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmBjlIIACgkQ8yFyWZ2N
LpeE2wf+KH31TaUrkwCnWezZZByNYy6dyoZDhtBy6uQ2xQeAvPJG/IwSSKAewdJe
7adK952Zk4YBRSs1Dbe8m2a1w6iYLlirGrzuuy4zUt60o09g4w00KnfxuXqdwtIG
o+IOYubKyc3CP4F7Y4SxpI5u6gma/NKqrDoNpeON+T4ctvLd/KJWexiCJezOtztQ
VWg4wdSDpDwvW6OuipsUxkAGPDW9S3hFoCnN/VKsjldDKslligbnO7IWUuFDm5m/
Qb3k8HQxn5etR0/5n8OlvZ3IjvhcvyrrLwXuf5yCiyRWgpSv1bxpxdxaHq4CQF1o
rUFeAhd6B3GK+uk6bC73xqpeW80CKw==
=ZPZ3
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


--===============3845810343670532513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3845810343670532513==--

