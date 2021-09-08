Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C9403FCF
	for <lists+apparmor@lfdr.de>; Wed,  8 Sep 2021 21:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mO3Ey-0005H2-Ru; Wed, 08 Sep 2021 19:28:12 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1mO3Ex-0005Gw-8D
 for apparmor@lists.ubuntu.com; Wed, 08 Sep 2021 19:28:11 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 8B7CF4017A; 
 Wed,  8 Sep 2021 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631129291;
 bh=1FXwTE44sH3PRRAR8RYJPB1Tkqiuxp6526k3BZolOqw=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=fKs2fXUdqWLAtylLwa1rsodvRrBH87FIg72t8YBlhg71IU2iZ3VQskOPLOX02nxoh
 iPkr0JkYRNboQgknbA6BnJyR5MjoxOAsI7JF+FDxn+YUC/eAf998jct7Y9gUvo51tQ
 5v8v7g+HZBHCSsHbH91Ow9L7T7O5QPV5pd8NAit9k9QLf58n/D5utuIRl/BBVUJcX9
 0epDOj1cvyCHh7OF5k2qFhg5EmI5wZif/tAhRgX3hFJE38pbs1VbXc44FMRBsgUkUa
 rYj2bsknbBRqCZroozIKvQypWsclBmuRAHibh675qMNrFFolCAUjCWBw1N3Q5oHN0g
 e/7K/BPqgz/UQ==
Date: Wed, 8 Sep 2021 19:28:08 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Message-ID: <20210908192808.GD3402432@millbarge>
References: <20210903213149.92758-1-georgia.garcia@canonical.com>
 <20210904020732.GA4049275@millbarge>
 <50482a0b0f141f0f363baa121410c8b59c50470e.camel@canonical.com>
MIME-Version: 1.0
In-Reply-To: <50482a0b0f141f0f363baa121410c8b59c50470e.camel@canonical.com>
Subject: Re: [apparmor] [PATCH v2] apparmor: enable raw text policy
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
Content-Type: multipart/mixed; boundary="===============8514365802573158449=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============8514365802573158449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 11:43:27AM -0300, Georgia Garcia wrote:
> So when there's a call for raw_data and raw_text by the same process,
> the refcount will be increased twice and loaddata will be decompressed
> twice having the result in two different private variables. That
> applies for two or more processes as well.
>=20
> Just to be sure, I tested these scenarios and it worked as expected.
>=20
> I'm not sure if that's the issues you were concerned about and if I
> made myself clear, so please let me know. I could be missing something
> too :)

Excellent, those were indeed the cases I was worried about -- thanks for
double-checking. (Maybe hold on to those tests so that we can stick them
into our test suite once this is integrated.)

Thanks

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmE5DsgACgkQ8yFyWZ2N
Lpc1FQf/aSuz8KEe5RxPqYYCf5R3QGhrkmfE2U20s/PtaK45fTPNiS0mXGLWai++
GRKfMYt2ASTQSocLXz5FEn3mjQpzAuOlYkh0D8GJb0nhCE+Otnii+eG74Xnf5KHe
sXROa0thYCAkBv/RyZHgdjKwheAyA+QEVBxsoF7sGz52Y3OqBRaFaamLFRn90uJu
QhJHmo0W2oAiLPfUWz/lwuT3acCzXYm5QaN8wcn/9ZharWHClxim16iTr2R4MS51
m6V/wr8fGg706Wccd7GeAsSDK1xjghZ5qUuNy3Ohdt70TTIFBOE2S88tofJNv/NB
jJH1rwWrS1MVnWbK66wMR9fONan7jQ==
=o6Z5
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--


--===============8514365802573158449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8514365802573158449==--

