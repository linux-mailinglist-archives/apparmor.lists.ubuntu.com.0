Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C376484CAB
	for <lists+apparmor@lfdr.de>; Wed,  5 Jan 2022 04:05:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1n4wbf-0004EM-Q4; Wed, 05 Jan 2022 03:04:55 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1n4wbe-0004EF-DR
 for apparmor@lists.ubuntu.com; Wed, 05 Jan 2022 03:04:54 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 814E73F1D6; 
 Wed,  5 Jan 2022 03:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641351893;
 bh=q+XN3VDyEWsm0V1ZAufYWLtrYf+29uo8QurUjRWPh/s=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=ElG3IaYWCsGyhU+0g7D9bsDSf8vy/xQ2x862hD17vfkHYLiqa7yE9gAwB2syv1H0z
 /nYmkJcY157noc3rETHijEEIc+r2+5DLIC1TAXS9qeDAfA69bML4MK7OiXO75MhMOX
 rjHR/i0s/5+kA6SWqTAFX1N6w8SUZVfoCzM+AyTdpXR+ny/7zpZAUOzgSYSAUfFt/N
 ntFFSQ2+i9uUhGz+jakIC4fNBjxtxgucQqMAY6qORUnsRVQMbr9rmoxmvikcI+zKq3
 4HIwtr8ofvg6+LsnLJh//WZ4w/UqFDrRh60nvCO1nTTuI8UhR4bmysmuA3KuH2Cwg+
 k3mMJJYbpR6DQ==
Date: Wed, 5 Jan 2022 03:04:51 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Sina Kashipazha <s.kashipazha@protonmail.com>
Message-ID: <20220105030451.GB2425831@millbarge>
References: <6IXBC37fMQNZQNToEP-0OJhmnGhUB6wRYPj0f2999S5IfLYBzOZ5mcoYoPhcfLpSzu_NmNznwSb595TFITxi5UbVxk37391PqV4wKlKVxIM=@protonmail.com>
 <a7299be5-f08a-a39d-63da-4e1c3c9e8a58@canonical.com>
MIME-Version: 1.0
In-Reply-To: <a7299be5-f08a-a39d-63da-4e1c3c9e8a58@canonical.com>
Subject: Re: [apparmor] Disable apparmor without restart
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============4939101958399487746=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============4939101958399487746==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 02, 2022 at 08:49:05PM -0800, John Johansen wrote:
> On 12/28/21 2:00 AM, Sina Kashipazha wrote:
> > Hey there,
> >=20
> > I have two hosts in my setup, one of them uses AppArmor (h1), and
> > another one doesn't have it (h2). I want to use virsh to live migrate
> > my VMs from h1 to h2, but I'm not able to do that because the h2 host
> > doesn't have the AppArmor policy.
> >=20
> > I was wondering, is it possible to edit the XML configuration file of
> > the VM and disable AppArmor without restarting the VMs?
> >=20
>=20
> AFAIK no, but you can manually remove the apparmor protection on the VM
> by unloading the profiles.
>=20
> sudo aa-teardown
>=20
> will remove apparmor protections from the whole system.
>=20
> if you want to be more selective you can just unload the the VMs
> profiles. Using apparmor_parser -R

My guess is that you're probably getting stuck on a *libvirt* check
to make sure that source and destination systems are 'identical', and
actually tearing down the apparmor profiles in place at runtime behind
the back of libvirt will just lead to a very confused libvirt environment.

It's my theory that trying to disable AppArmor itself on the sending
machine isn't going to get you to where you want to go.

I don't have an environment available for testing, but my guess is the
virsh dumpxml --migratable may be able to emit XML that omits the security
information.

I hope this helps.

Thanks

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmHVCs8ACgkQ8yFyWZ2N
LpfMiAf/TicrJSMG2OAJKA2ChsON+YdLEHp/ghBTT1rzFHOI8JVAc3kKogp0Q0Qq
FptroVSZcHLhWPI1bDRzJD6C9GbZvOAM+WyJckwjk57EdrsAShJ9isScA79EPLTs
bKil/3k/RZcxJqKNFwg1ip6pa2FfzaxQD4fHGxOeFdGOSbEoTOdypUCSmO3BY3NC
AygldqxF25BoFtEVZ8n3Y3VDUhAiE1ywZuDtlrTN+eoMgt+lpjQS7POiRjb7RFCb
+khs9zW0REPDBLlFJUZEPl0566zmEOjfikskcElHeun+pbLzM2qdtiZXuWXjIi6j
kbRL6fynph+S00dYHVWWhy2KeJWFwQ==
=Titq
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--


--===============4939101958399487746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4939101958399487746==--

