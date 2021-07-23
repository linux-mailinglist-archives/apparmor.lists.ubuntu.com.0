Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0A3D4328
	for <lists+apparmor@lfdr.de>; Sat, 24 Jul 2021 00:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m741g-0002PT-BW; Fri, 23 Jul 2021 22:52:16 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1m741e-0002PN-O6
 for apparmor@lists.ubuntu.com; Fri, 23 Jul 2021 22:52:14 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 02DE23F24B
 for <apparmor@lists.ubuntu.com>; Fri, 23 Jul 2021 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627080734;
 bh=JF33D9DYrx0+KtoVW0RJX24nNtkh+p5d3TY68ECIkrs=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=dJFPF6oZahMsdutiGwBI+NO0QOUauN7aNx/0XS+ONedg7H0U/9MrUKF9vOdfiF+2B
 SIhQ6Zm6q4iUc82NTC+vl9+TY1Lov/HupTZ7E1849PA7DBG52h7A+rbHVzAKiKaYLv
 nROoH/L+uWki5zJm/7ybzyYl2S6eAJkOfetR86B5DdfKHpNIyVAkS6HSY1pxh8t3uV
 V982CaJ4JvOXOCut76aK8Kpl6dhJPbsDuBRAauGIW2Qq3tvg+BglRBUIUq55yYdt3w
 2JxNKRASuuUwT4POZgQ9S7aS6QcBznojfa4ReWCehwOlsExO+dxpDS6Mq1PyEjiUkt
 41SSTusd2uKyg==
Date: Fri, 23 Jul 2021 22:52:12 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210723225212.GA3511276@millbarge>
References: <CAODFaZ79FJ2tQBtw_aOuQE5iLQfdqAzCSP7bETeJ8FB9Lq4fuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ79FJ2tQBtw_aOuQE5iLQfdqAzCSP7bETeJ8FB9Lq4fuw@mail.gmail.com>
Subject: Re: [apparmor] Apparmor profile: mount/umount issue [ non-root
 application ]
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
Content-Type: multipart/mixed; boundary="===============7637785409839053081=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============7637785409839053081==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 05:07:23PM +0530, Murali Selvaraj wrote:
> -> Since we have required CAPs CAP_SYS_ADMIN in the profile and it
> applied to the process as well but still observing
>    that mount and unmount fails [ "must be superuser to mount" and
> "must be superuser to unmount" ].

How did you grant CAP_SYS_ADMIN to the process?

> -> Does mount/umount restriction is done by util-linux package? As per
> our understanding CAP_SYS_ADMIN (capable) check
>    would be taken care of in Kernel code. It looks like user space
> (util-linux package) restricts this permission issue.
>    Please clarify my understanding.

No, mount(8) is simply reporting the error message from the mount(2)
system call.

> -> What would be ideal options to resolve the issue ( "non-root" user
> does mount/umount operation ).

If you didn't get any DENIED entries from AppArmor in your logs, then I
suspect that your process didn't actually get the CAP_SYS_ADMIN privilege
=66rom its parent.

Thanks

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmD7SBcACgkQ8yFyWZ2N
Lpdmbgf/d1n0WOuYzOUvlKbLF04pBFBs/jTeqFvLKeEGs/OMe1iVUHJ5dOdRzJCe
Llnoy8TLk2C7h0M3vJkTMvMq1Q9fgv0YOrFJ8zuWA8E7pK51rnR9ATRC9RgnEqo8
J9pMUGTgB+uwZwWq6eyEo0uwOkFKtKmtWOR0BX3xgU3M75unGvu5TB8xd4nnl80+
QQ/Jo2z9tWjDwGOQ/JM0se5pbYW34lbFDFjbesjj7HqntdHjWVWkzeoT37KtA0Sw
BzW8UvsGJMSGFVRZO8Y4ksqeIU+r3Y2wiZaVd1JfvNFpRAo9SumS+Ynbjh6FXjBH
rJGKWMRB8Ho6p+gBZX6VlmM033O/UA==
=Da2x
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--


--===============7637785409839053081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7637785409839053081==--

