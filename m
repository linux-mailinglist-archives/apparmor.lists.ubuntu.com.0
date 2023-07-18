Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444975718E
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 04:03:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLa33-0003i3-WA; Tue, 18 Jul 2023 02:02:45 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1qLa32-0003hv-8B
 for apparmor@lists.ubuntu.com; Tue, 18 Jul 2023 02:02:44 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B6A21400E9
 for <apparmor@lists.ubuntu.com>; Tue, 18 Jul 2023 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1689645764;
 bh=IcwSEqbSOHH0mBztMxZlPQl2nx0Ulu+N4IxdIDjD1bQ=;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=WBFnR+gyUAHkME5REz1aY31XT/sq6VE5J50HBtnOdUBhw33SA/JLNkN6aNmquWfaz
 /1trxZawjYPRwXuN1VHkP/RCZsOENZISeTMtGsy7gtjoltZRc+cDcCC5vpUAgGdHW5
 sbuegs38e1s0AdBInKnW3ENIn5rN6Cvg6RfCQMn7NKeZBw2PTWVwzskj5I/qwT/C+7
 gcTlOD7aAGVibWUozPO7Lh2G7X+aPm5KO0x9Ybw8xBh5qNMRpZike+4hOpv+7lQ+3l
 87KzBxk6kk47n3V/I03H9Z8tIQ6ixo4ds24k/btR27VjpakeWCa4pa1N/MwQYOGUM6
 hYqkOVHNN3lmA==
Date: Tue, 18 Jul 2023 02:02:41 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20230718020241.GB3131390@millbarge>
References: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
Subject: Re: [apparmor] apparmor with large profile set
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 12:28:09AM +0100, Alexandre Pujol wrote:
> Updating the doc to clearly show what is already implemented and what is
> planned would be nice too.

What exactly do you mean with "the doc"? The wiki has a lot of syntax
and semantics around future expansion plans and I've seen dozens, if not
hundreds, of questions from people who found it and tried to use it on
live systems, without success.

In fact I think we've done our users a disservice by having these so
readily available.

I don't really know how to address it, but (a) I'm opposed to putting
*future* work in the manpages (b) even the wiki is weird. If it were in
better shape, it might be easier to mark areas that are hypothetical,
but it's currently just a big dump of 25 years of history.

Thanks

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmS18r0ACgkQ8yFyWZ2N
Lpd6eAgAt73utChZkkrkri8H+EoVAVCgqHU7HcKdBj75sAc02OsFaIhgS2hrgQI1
jQeBU3GiBNiQpIkCZwtf8CzfugulWBF2Njg0ddVHd2kJU3uqSB9/0vWP+mT7kf5E
vQA7wPR8Vkl6YchjgdKfGy0IRz/2H5irJef2I8by9+wcOJZf24qbQR4Ob8rUzE7S
F/dQc2Vygt26cTSJZMSMNzgdVYPMxwhIcBkPxO52/Hx249EN2j7noB8Py1KyT6Jv
WxLtIIIpGslulo0bjX6lJKPuZxXBAJiD+dh125sXMyMiMFOvKu0e6/JegfuMi8Q2
9lfQnmseRyUG9I41ai9LBmAH4Vk0NA==
=gdLY
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--

