Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD8400941
	for <lists+apparmor@lfdr.de>; Sat,  4 Sep 2021 04:07:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mML5k-0005og-Qa; Sat, 04 Sep 2021 02:07:36 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1mML5j-0005oa-7u
 for apparmor@lists.ubuntu.com; Sat, 04 Sep 2021 02:07:35 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6A4AB3F0AB
 for <apparmor@lists.ubuntu.com>; Sat,  4 Sep 2021 02:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630721254;
 bh=NegrsaUW5kL9VSUeq82w3vu9rIFZcZlpLLaVR2KiAbI=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=cMK72OtWyF0QkLHGmcHGxzMoeSn3ciYAAM46Ue+NqrZkmBvx5A0DGU/KzN4dW77XJ
 NvSkw+RUB+lqf6izEyf7jwfJMtVw/RIBbttBDfnR9p/Mj/H1k/7QLZ6VwVJKCtNAxY
 VXK51tOyEWHC7LbbKjawtNr4DrnBcgY8xkaaOrP1/a9hl+twD0Cne8YYUdBBtXgXbO
 gpeTe2hRfPKWAzD8ySZzrTp/jm6vgxPavJ99YY32/wd5L2v2o0zlNxujVWH1A2xPGN
 rkCVKjQ1+soONt8XN5nA7IOn/kl4GDm44uZrm//Kl3RvNbLHl+Xlt3AbSvyuWbrBNg
 uiaV9xMclyYQg==
Date: Sat, 4 Sep 2021 02:07:32 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210904020732.GA4049275@millbarge>
References: <20210903213149.92758-1-georgia.garcia@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20210903213149.92758-1-georgia.garcia@canonical.com>
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
Content-Type: multipart/mixed; boundary="===============9050015505931542522=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============9050015505931542522==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 06:31:49PM -0300, Georgia Garcia wrote:
> +static const struct file_operations rawtext_fops = {
> +	.open = rawdata_open,
> +	.read = rawtext_read,
> +	.llseek = generic_file_llseek,
> +	.release = rawdata_release,
> +};

Hey Georgia, I'm curious if the rawdata_open and rawdata_release here are
correct. If they are correct, is there any problem if the same process
opens both the raw_text and the raw_data files? Is there any problem if
two or more processes open both raw_text and raw_data?

Thanks

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmEy1N8ACgkQ8yFyWZ2N
LpdrWgf/bq1QQV0ixeS0uytosvrXH6W0tDBptOYkMYGTZkjvUgtCCy+1Sg3VnZPh
YTH/UnD9WAxiKqi0uHmYJW288ljMGb+qgcE+Riy1fj/DoGnR9PK3eTbOsFMxriuM
NrTjWLIw8Pl85vbhw6Aid22tI0vTtSNs99d6nXKTa6gBya8u915ZWLkHa1CvddbN
ZLlj4MgoMtAprGzix6O9h9R00QnI8VQYmxPgKfObB63hJuiFErcw+QRRyOJ9wiy+
S2tJwOKP5RT2njP/osh6rvlCZqNt86TOCJYnLbEulsBBvStblgC9Da8v435tqAQw
SsIKr6ITV1HcpLOhwqgPie+XVKrKvQ==
=GP3t
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--


--===============9050015505931542522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============9050015505931542522==--

