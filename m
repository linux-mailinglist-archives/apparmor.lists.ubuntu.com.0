Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA85E6D7A
	for <lists+apparmor@lfdr.de>; Thu, 22 Sep 2022 23:00:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1obTIn-0002C2-Fs; Thu, 22 Sep 2022 21:00:09 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1obTIl-0002Bu-99
 for apparmor@lists.ubuntu.com; Thu, 22 Sep 2022 21:00:07 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3FEE841C48; 
 Thu, 22 Sep 2022 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1663880406;
 bh=qsplyNvgyNsim6MVlUlsPMjR3IhnmYZwm/z9CjfK33o=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=FPPYMmXcZ4Jeff084D5LHgnAPH5cNUKnS+7FZaLlhm/jkqvR0VUwFy5nDHdbxL1nE
 o6LxJ5C8zPS5ql4s2JcWYIY0lOkoCUmKXAqwJfZGDkm0P0dkeWjE641tNX5qfnudX8
 aKPJVmkw8zQ3tp1GsjcmdNztmd3lYdcv7q379KKZSwqIKE2NBeECWShTEL3eYSmSxz
 DMyyrWm7SUjbIi3/ZQY9dxHLzNEf6izZEL5vGU4YDv0yehfYph05ILr0tFLZJcTVLq
 8n9jNcGrDSXuvyLRidcpuWkO/R8Q5FKH4lP/Be/sDGFU9nvk1azD5ZVPnU1s5L44AE
 83WtIqu78HapQ==
Date: Thu, 22 Sep 2022 21:00:04 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20220922210004.GA473551@millbarge>
References: <CAODFaZ7h_jsi4spSXwygYs4Bz8i8TzphvqRaiCYEVgc+sE2wsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <CAODFaZ7h_jsi4spSXwygYs4Bz8i8TzphvqRaiCYEVgc+sE2wsQ@mail.gmail.com>
Subject: Re: [apparmor] Apparmor : Common Query
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 02:48:43PM -0400, Murali Selvaraj wrote:
> *foo.sh*
> #!/bin/sh
> if condition
>    /bin/sh script_1.sh
> fi
> /bin/sh script_2.sh
> while [ condition ]
> do
>    if [ condition ]
>         /bin/sh script_3.sh
>    else
>         /bin/sh script_4.sh
>    fi
> done
>=20
> *Queries:*
>=20
> -  If we create a separate profile for each script (for instance,
> script1_1.sh)  and consolidate to one profile for foo.sh
> -  However, we will try to perform/exercise all possible test cases to
> execute all code paths while running in complain mode to gather logs
>    for preparing the profiles.
> -  Do we have any recommendations to prepare an Apparmor profile for Linux
> scripts?

Does your actual software use /bin/sh foo.sh intentionally? Why? executing
foo.sh via direct execution will make domain transitions *vastly* easier.
This is worth re-writing your software to directly execute your other
scripts rather than executing your interpreter to execute the scripts.

> *Question 2:*
>=20
> - In my embedded system most of the rootfs files are in READ-ONLY except a
> few directory,files are READ-WRITE (for instance, non-volatile partitions
> and so on).
> - All libraries in my device rootfs are located in READ-ONLY folders (
> /lib/, /usr/lib and so on).
> - While preparing profiles for my applications, I am adding each entry of
> the library as per the application access.
>=20
>   /lib/** mr,
>   /usr/lib/** mr,
>=20
> - Since all libraries are in READ-ONLY, if we allow all libraries (with
> wild-card) any possible security leak?

Yes, though it's hard to say for sure. It's possible to mount new
filesystems on top of read-only mounts, or on top of read-only files and
directories.

If you use the wildcard, it might be easier to drop in a malicious payload
without affecting the rest of the system.

> - Do we still have command-line injection possible to the library too? I =
am
> trying to understand here, how do we affect security leaks if we allow all
> libraries (since they are in READ-ONLY directory).

I'm not entirely sure how to approach this question. Any library that
uses system(3) or popen(3) (or implements their own similar functionaliy)
could have command-line injection problems. AppArmor policies could
prevent the shell from executing at all. AppArmor policies could restrict
which executables the shell could start, which files can be accessed,
which signals could be sent, etc.

I hope this helps.

Thanks

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmMszNAACgkQ8yFyWZ2N
LpdFaAgAvYRM5EsULKppDP5SLrm66mFUjFODh6biwoG/3004JXcSPbc+bMcWmq5O
q9I11szodEhgTupEiMNWSq1ae/IXD9sPWmXHu9y8mYg3gocs7TOVpWZYhC3MWlKU
fBfqnHoByNzRor7Vjy2tlnRBHQpVPrudP4rNELJRbbp5517ayGM93fsjHDksJtuj
edTMLR2DMcbJd3aeVZoy/IKtqiRZvTHK+dRy5oVekqV21e+o5J9LphkfPWoCaMKS
7myOSxYxR61HlQkIlN48/TA7PJjy6M3WLwY5bMF4qoQG+UsSe2ie+85MrJURMjBX
3tyCkdBdM/UiUP3dD5mCo1yySjWt6A==
=E+kb
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

