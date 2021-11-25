Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D345D263
	for <lists+apparmor@lfdr.de>; Thu, 25 Nov 2021 02:13:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mq3KR-0006My-CF; Thu, 25 Nov 2021 01:13:35 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1mq3KQ-0006Mr-5T
 for apparmor@lists.ubuntu.com; Thu, 25 Nov 2021 01:13:34 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7DA643F0FC
 for <apparmor@lists.ubuntu.com>; Thu, 25 Nov 2021 01:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637802813;
 bh=DU7n16xZnfepuXIBERbsGnG2H1+dSfmlrdNAl6W4zAw=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=rrYbWNHExFV2AHe3eq1e6jc76rffQmvQYJP77EDZjji0LKq5NWJv3Si+1ooBI+wks
 nvDx9PwwmdnHXSb7q+9rYQrknwIrZfdMuNepl7pb7dlkVvaYZmm0GaAszTkbDwotiT
 bAJXQifNAoqPLeHAiLGlDsoXsWnuoYcGtcs6mIZMWIfyJMRKCRVxb5frCdbdZoWmUs
 iKITZvVTf7aKs1JR0R0O8qnffbogfbkQk64OX4UrxR/4qgtKmFC/vTw16L1aoLp1V+
 FeypMnLyWj47wuvo1CKsjooy4htrrodD1hBOABPGccj+lSXGqS+m2Zex6E2PP8ZHZo
 H8pi6pOG2SfHA==
Date: Thu, 25 Nov 2021 01:13:31 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20211125011331.GA3695345@millbarge>
References: <e901d24c-2299-e91e-f40d-27644c2bdc57@beroal.in.ua>
MIME-Version: 1.0
In-Reply-To: <e901d24c-2299-e91e-f40d-27644c2bdc57@beroal.in.ua>
Subject: Re: [apparmor] profile injection
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
Content-Type: multipart/mixed; boundary="===============8498447998811519201=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============8498447998811519201==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 02:01:21PM +0200, beroal wrote:
> into the file referred by $RP. This allegedly replaces the contents of
> profile $NM with $RM which is not what the sysadmin intended.
>=20
> Reading the `include_filename` function in `parser/parser_lex.l` and my
> experiment gave me an impression that this attack is totally possible. Is
> there any way to protect from it?

Whoever writes AppArmor policy has complete control over the resulting
rules. There's no equivalent of execv(2) style arrays or sql parameterized
queries -- there's no way to say "the following untrusted input is to be
interpreted as a filename and only a filename".

If you want to accept input from untrusted users and feed it to
apparmor_parser, you'll have to supply the sanitization yourself. Yes,
this is a very high bar.

You'd be a lot better placed to use a template system of some sort that
can have rules placed on smaller pieces of policy -- eg, allow access to:

/path/to/package/data/$PACKAGENAME/ r,
/path/to/package/data/$PACKAGENAME/**/ r,
/path/to/package/data/$PACKAGENAME/** rwlk,

and make sure that $PACKAGENAME matches a regex [a-zA-Z0-9]+ before
rendering the template into policy.

Thanks

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmGe4zgACgkQ8yFyWZ2N
LpcD/Qf9HUbrAaGjuegTgyJjGaqxT06PP432xEACMDSlvlap6MAUgMXXG31hVqBV
NZ4AIrTIhp3wYG02qFD66vk4p4G+uhC7cNzHufFrPFrTK1A/6j4CUb3O05y/4Pp8
3BTqK+n4aJKu7aGfUy5iIyXX6l9lmLN5Sb8WvtOZYpp+Ftl8/Vsm1LVtdUHnVVIL
crcKIGOJUv10Nu1l4gu3U/smLWLuHvT1FJPyd4bzVuS3YcUs7LRSvdMNIA+1CiL1
K27KCvyUWllqTOUWL6jwogsSM2csqFDoWYFRuElm6T7El8BVcAAinc1NCOCFWLoP
W8/xdF1IBl8HQmRxT8Cbqd4clkHQTw==
=6qqa
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--


--===============8498447998811519201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8498447998811519201==--

