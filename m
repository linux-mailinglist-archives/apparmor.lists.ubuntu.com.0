Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8513D8436
	for <lists+apparmor@lfdr.de>; Wed, 28 Jul 2021 01:45:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m8WlH-0004j1-I0; Tue, 27 Jul 2021 23:45:23 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1m8WlF-0004iq-UB
 for apparmor@lists.ubuntu.com; Tue, 27 Jul 2021 23:45:21 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 525C83F240
 for <apparmor@lists.ubuntu.com>; Tue, 27 Jul 2021 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627429521;
 bh=AXq9sz5KMoCADu9P4PmTXH9glXUpzNAOpHY0qVViLcg=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=cqk0shntkW81nk8BR8xvYQMCOoZtdv9IvYg6OGrJYKvnEgfz92BCqbrahvoVzU2BQ
 c2Yr+rI9xR506be1f9ht1SM5CMWTLZYEr/t9iOU0ohuKc1E2X4Qpzmua4Sc38lX9Aw
 nyoDJRtDvPUtOfoSoYAzxG8sT2OWn2XrwPv9O4O1feRNjs3X1qdqCmfI/OxiJdnCRo
 pHuB4Totz/rCgv9ZJdXhqPaP9lg7iNbYW8vDKWn/RPOLAcz7qDzHejEAkJBxgHk324
 XYQNVtWrItMVVJUtyzeV1/77izluJxlYT3O4Cq5WF83pLH6wud1yZVyXxTJh7rk+O8
 yP++jQaqiweaQ==
Date: Tue, 27 Jul 2021 23:45:19 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210727234519.GA2096848@millbarge>
References: <20210727215134.514951-1-georgia.garcia@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20210727215134.514951-1-georgia.garcia@canonical.com>
Subject: Re: [apparmor] [PATCH] apparmor: enable raw text policy
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
Content-Type: multipart/mixed; boundary="===============5984082136838224443=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5984082136838224443==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 06:51:34PM -0300, Georgia Garcia wrote:
> +	if (aa_g_raw_text) {
> +		dent = aafs_create_file("raw_text", S_IFREG | 0444, dir,
> +					rawdata, &rawtext_fops);

Cool :) The only thing that stood out to me is the permission: some people
like to store their policy in /etc/apparmor.d/ with restrictive modes for
whatever reason, and this may be more open than they'd like. 0400 might be
a better fit for some.

Thanks

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmEAmosACgkQ8yFyWZ2N
LpfhBAf/fHfJ1OwVSvXjs794DM5xewqnWYoxVIgLE2+BbUcq4EC6QGg2Z5dCyIFg
RRYcwZWKuOEaz4NJWvssvPfi1KBDkY6FdoUusKFnfT/sWovoJ6RfC7B3jph7zFTC
v3TylS9qo5ETN7Zqayez59+VtIN/T3c2WDFRxU7SO2AzXyTluO63R2CBAIOTbXBT
quVolTcp+6J7jsPYZ4UWlC7t0MyDGWDhN1n3ZZH2XVWMnFyxJ2v2s6Fk43kNqV3O
zacYlhDG8vfy7Dgs/I43D26OJWwamucyVYsm9bFLdI7g60XTtfFZ+CJFhR4Q8jzd
MEVGBLwdNYPDDPchHSeQoAeMcFRzdQ==
=ud4J
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


--===============5984082136838224443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5984082136838224443==--

