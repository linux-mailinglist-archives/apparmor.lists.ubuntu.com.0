Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34E453AD5
	for <lists+apparmor@lfdr.de>; Tue, 16 Nov 2021 21:20:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mn4wj-0003ff-GW; Tue, 16 Nov 2021 20:20:49 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1mn4wh-0003fN-Db
 for apparmor@lists.ubuntu.com; Tue, 16 Nov 2021 20:20:47 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B5FCC3F211; 
 Tue, 16 Nov 2021 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637094047;
 bh=dbJkjtzFGvLGliEqPmzrW+qTDkUor6+dp8sUoOD0yzs=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=lJofooyY/2oUZxhCMHwZTmqJYi1TGDNkOcCdNYKMVbjqyY6VnKfow2GoAg9H/hlXr
 bhab7mmStzJFIcNhwCEZYlZMSVICIM+ItES/5SURc1ddG9wyUpw/BCuEiR6/Hd5UE2
 Hs/owUMpGrDluGW0QVkEQSNfHa+fynEW63PbY8EbiEOkp5Os8HmHCnmipSePFM6BmF
 Z9iuiVjOrSx1VZIfeZwkiL0oj5kD9G2SmQll02UO1DUhMuhEYKevyHVEgjk7oDTz9C
 3NuLwO8PBggBStFUB7kQpBWJGctjiWKUtwhuRRkzIGbe+8n+oQwtHE/hjpvsRxhoEn
 yYeyJoZapzZqA==
Date: Tue, 16 Nov 2021 20:20:44 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: beroal <me@beroal.in.ua>
Message-ID: <20211116202044.GA1434906@millbarge>
References: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
MIME-Version: 1.0
In-Reply-To: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
Subject: Re: [apparmor] give a permission to a specific process
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
Content-Type: multipart/mixed; boundary="===============3557423794890376545=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============3557423794890376545==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 11:44:15AM +0200, beroal wrote:
> Hi. I wonder whether AppArmor allows to give a permission to a specific
> process. A use case: there are UI programs (editors, viewers) that need
> temporary access to a file specified by a user (to edit, to view).

Work is ongoing to allow delegation of privileges via 'portals'
(similar in spirit to the "PowerBox" style of capability object systems
http://wiki.c2.com/?PowerBox ). I'm not sure if this is what you're
really asking about, however...

> Unfortunately, AppArmor profiles give permissions to executable files. For
> example, if a user gives executable $E access to /tmp/$F, any user will h=
ave
> access to /tmp/$F by executing $E. Hence a user need a feature which gives
> permission $R to any process that executes executable $E **as a user $U**
> where $R, $E, and $U are specified by the user. A feature which gives
> permission $R to process $P would be nice too, but isn't essential. There=
 is
> a problem how a non-root can use this feature, but it's a separate topic.
>=20
> Does AppArmor have such a feature? Maybe, there is a better tool for this
> use case?

Do note that in your description, User A creates /tmp/$F. User B can
access /tmp/$F through cat, vim, dd, cp, etc. even without using
executable $E IFF the permissions on /tmp/$F allow it.

Your security policies need to be developed with a view to the total
system. It's possible to design AppArmor profiles that will keep users
=66rom sharing data with each other: ensure users cannot start unconfined
processes, ensure the profiles require 'owner' access to any locations
that allow users to write to them.

It's hard to give concrete advice for hypotheticals -- about all I can
really suggest is that you need to keep the entire view of everything you
allow on your systems in mind when you're writing policy.

AppArmor's very flexible. You can confine just the network-oriented
servers or clients. You can confine everything users do. You can confine
the elements of a user interface. If you have unconfined processes in your
environment, you've exempted those from AppArmor confinement. Don't lose
sight of these.

Thanks

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmGUEpgACgkQ8yFyWZ2N
LpcHPwgAssmmEQwK6hxR4HVfae1kwLRTEwqmlrPSQ6kug/kexEXvZVhRqfGTCSGt
CmXqc/q+iEnwtl1Ee5Fps5xLmsvxujPGbuspHmZdmx/sVo+V7pSDFfjK3UWpr9uc
PXcFO/KtBY2a+rj7uN6iBDhQ8M/6fcIpZd6TC31AYFlk/Zqg+xB6kd4bf/L9fUd2
J0GGn79bTtfVrAI71IPBJjIv6FaKfroSbG0R8xUEMpKZagjOEXbrEVbRFGRTdFFG
xXyNJUQLJuCh5Je2Tv50PA7533BQ0vhpM96wzTZ4hmZg/Q4j5dWsxzxrXyg7pyWt
0XFHEoiCegSN32bdPaSMXCiniiqmBQ==
=LdGC
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============3557423794890376545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3557423794890376545==--

