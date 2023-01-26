Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F967C2B4
	for <lists+apparmor@lfdr.de>; Thu, 26 Jan 2023 03:17:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pKror-0000zl-Rm; Thu, 26 Jan 2023 02:16:53 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1pKrop-0000zb-Ug
 for apparmor@lists.ubuntu.com; Thu, 26 Jan 2023 02:16:51 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 731803FDA9; 
 Thu, 26 Jan 2023 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1674699408;
 bh=2qKMOgKjnZpbKuMYdLMfG0VEE3MKKnqFV+K1H2eZRxM=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=PSCp0ChyLfZ6SC8/nD9OiCCUHCMW2zLsQZXgOxj4Yxglo3vbefOrqGN2PKJ0Uhhg+
 spK6N99rqMxUMqpPvItTWi59hax3oR/6RzpxxkGDe15jVAH+pElTZDQ4dPA8xrB702
 7ELcCxViOKJiYCq51b/H9KopVabATEfkSccfEtNgVg8+I/lch6/D9Ss/+YLcR6kGOn
 mnO9OvK32nUyTCXnM1u+YkeskQD5ACKBAGa77bGthklhlESifKmMqbh1KNZPdM+FSJ
 MtoasOQLyXTxUmxWxziY9tfLYneLBqSH0GbeVEzeqhGYvZSwDBNi6j6kLHsUTpsAjW
 Nj0XqASVqHhiw==
Date: Thu, 26 Jan 2023 02:16:45 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20230126021645.GC3391678@millbarge>
References: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
 <2131651.irdbgypaU6@tux.boltz.de.vu>
 <CAODFaZ6FDOGi1OsET1BjWVY6hfFmmHD+gwHL0=3rVnfaeUc2uw@mail.gmail.com>
 <2270135.ElGaqSPkdT@tux.boltz.de.vu>
 <CAODFaZ52Y0unjbWZWUZEr5EX74M+SMDv8PFOuFXk2OkHuLZ4mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <CAODFaZ52Y0unjbWZWUZEr5EX74M+SMDv8PFOuFXk2OkHuLZ4mQ@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: global profile queries
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 25, 2023 at 01:49:09PM -0500, Murali Selvaraj wrote:
> profile sh_restriction /bin/sh  flags=(attach_disconnected,complain) {
>   /tmp/** r,
> }

If a shell can read it, then a shell can execute it. The only real options
I can think of:

- prevent the shell from reading it
- modify the shell to prevent it from executing anything it reads --
  perhaps require shell scripts to be signed? Disable interactive use?

Do you even need a shell installed on your computer? If you can remove
system(3) and popen(3) calls from all your software, you might be able to
remove the shell, too.

Thanks

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmPR4okACgkQ8yFyWZ2N
LpcmNAgAj/adctjxKvRPr0m3xABLwPoqE404z+Tp9hEQjkOKtVV6NCRXoDRvrl7c
nYZlA8lVWhn/Gb4rWDZ6TwYTd23q75Hd2Bs4mHDogGdM2IkFvTMfkVzoxZK8EbZ8
LsP2y7ba0BsM3yEq7ai3hOoPYDLooLnz7sLutHfp3EoIJ6vNyHMXW4U8wyraqpkE
aWqY6HtXqrO6Nj4PEQytn6tnKO7VobE4jiWu27kRwLBJVTTPdL1mmos9gOyR10hP
cJ8eyAsZDK53AvjB9Bsu6f7/wzAtLBYZHPvDBOvisBZ0gjLlkktB0ecjjTjgvQSw
MlXMHJzvb/MFLGk1L22rZmawyuVuXA==
=3wqm
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

