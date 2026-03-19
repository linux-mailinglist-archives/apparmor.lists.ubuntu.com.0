Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LFEDoZEvGmAwAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 19:46:30 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7572D1409
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 19:46:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w3INw-0000rS-4K; Thu, 19 Mar 2026 18:46:20 +0000
Received: from mail.cboltz.de ([65.21.65.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <apparmor@cboltz.de>)
 id 1w3INu-0000q3-Ep
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 18:46:18 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 8A6DD3E2A299;
 Thu, 19 Mar 2026 19:46:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zx6QjqtiOLKT; Thu, 19 Mar 2026 19:46:17 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Thu, 19 Mar 2026 19:46:17 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Thu, 19 Mar 2026 19:46:13 +0100
Message-ID: <2336310.vFx2qVVIhK@tux.boltz.de.vu>
In-Reply-To: <CAM3NJSLjedYiA=NA=fBFHdX_x7v1AuRwii3f8v8zh-iUAFh_bw@mail.gmail.com>
References: <CAM3NJSLjedYiA=NA=fBFHdX_x7v1AuRwii3f8v8zh-iUAFh_bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2777028.lGaqSPkdTl";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Received-SPF: pass client-ip=65.21.65.108; envelope-from=apparmor@cboltz.de;
 helo=mail.cboltz.de
Subject: Re: [apparmor] question about profile name when it is a symlink
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
Cc: Martin =?UTF-8?B?RnLDqXRpZ27DqQ==?= <martin.fretigne@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [-3.01 / 15.00];
	SIGNED_PGP(-2.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com];
	DMARC_NA(0.00)[cboltz.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[apparmor@cboltz.de,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.696];
	TAGGED_RCPT(0.00)[apparmor];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,tux.boltz.de.vu:mid]
X-Rspamd-Queue-Id: DB7572D1409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--nextPart2777028.lGaqSPkdTl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Martin =?UTF-8?B?RnLDqXRpZ27DqQ==?= <martin.fretigne@gmail.com>
Date: Thu, 19 Mar 2026 19:46:13 +0100
Message-ID: <2336310.vFx2qVVIhK@tux.boltz.de.vu>
MIME-Version: 1.0

Hello,

Am Donnerstag, 19. M=C3=A4rz 2026, 12:10 schrieb Martin Fr=C3=A9tign=C3=A9:
> I'm currently trying to set up an apparmor profile for ntp on my
> system. There is a profile for /usr/sbin/ntpd. However, on my system
> /usr/sbin/ntpd is a symlink to /usr/bin/ntpd.ntp (the real
> executable, it is symlinked by update-alternatives). Hence the
> profile is not active.
>=20
> I could change the profile name to /usr/sbin/ntpd.ntp, but is it the
> right way or is there another ?

Yes, this is the right way.

You can also change the profile to   /usr/bin/ntpd{,.ntp}   so that it=20
covers both filenames - just in case that the symlink becomes a real file=20
one day.

And since this will look ugly in your audit.log, you can (and should)=20
give the profile a name:

    profile ntpd /usr/bin/ntpd{,.ntp} {


Regards,

Christian Boltz
=2D-=20
if this crashes as well, make sure to create a bnc entry, add a
backtrace, a copy of your sysconfig/proxy file and some cheese (Want
to make a fondue). [Dominique Leuenberger in opensuse-factory]

--nextPart2777028.lGaqSPkdTl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmm8RHUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEMamgupjyC8c0iwP/1pRIYWsEsZZ22k06NPZ
tZ5LesuPtlmh+lLTEMoEKOV0CQCJHryBjn5bsEyOTRqKTVfiRVKEt1XRBIhl5dND
Hq6bbGgO6b12mztXbcOi729I2oH9NejhL5RMrztF4z53dvACzxQ0iZd9Em1n9e15
SKh6MTm5ZmNffSabER0Ap+6xe1DuKvhRQ2lbsmxIjd/1xeoICmP2TUFrSdKkuQCp
QwQe0DCxXQqXxMkZuYCeJ58lWGUBr4nK4qSHmzuM9EFfx4F9q6KknNyEcTkI8jN1
9l0regSdUCULEg3qOgwqN1ySGWWf4srohSOE7ZgW5W5o/fSXhU93tTNPTATF1Gp5
50olLaK8nB87zBBZh8eBk0ZI/XaE9RidiBjMvOQvhjV+MOuI+WjmH0HNu2p/mT/b
DUhRXbScGwbwq0A1n36bufkGfZ7Pn3vJUOh/2ifN8hcdj0o4yMBx2g8X3LykyXy2
nwgKhauZAZ+fpCE4OK3srWe0+D0es92tOxMIWRFlP1ClQP5249riFFn9DpPW+mim
FHtPMNB0fg72Q0Jj5eJRXLjgHTzIZYodbvSe2JuWMRGJwcZVVrOXB7f/QsOPKG5t
MXRJwV9t09DUzJwhrIioD8uKThH2k36hDmyad5sfqbqCJjybtnxWhDEbiLl7sdM9
Y2+OwDkL0epXMd2GMycBoRWd
=CnWP
-----END PGP SIGNATURE-----

--nextPart2777028.lGaqSPkdTl--




