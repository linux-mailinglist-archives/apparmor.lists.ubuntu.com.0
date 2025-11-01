Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE2C28315
	for <lists+apparmor@lfdr.de>; Sat, 01 Nov 2025 17:41:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vFEei-0004QO-DT; Sat, 01 Nov 2025 16:40:44 +0000
Received: from mout02.posteo.de ([185.67.36.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <engelflorian@posteo.de>)
 id 1vFEef-0004OJ-3S
 for apparmor@lists.ubuntu.com; Sat, 01 Nov 2025 16:40:41 +0000
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 9AACF240101
 for <apparmor@lists.ubuntu.com>; Sat,  1 Nov 2025 17:40:39 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4czNrR1Srvz6v0C
 for <apparmor@lists.ubuntu.com>; Sat,  1 Nov 2025 17:40:39 +0100 (CET)
From: engelflorian@posteo.de
To: apparmor@lists.ubuntu.com 
Cc: 
Date: Sat, 01 Nov 2025 16:40:39 +0000
Message-ID: <877bw9bta5.fsf@nixosThinkpad.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Received-SPF: pass client-ip=185.67.36.66; envelope-from=engelflorian@posteo.de;
 helo=mout02.posteo.de
Subject: [apparmor] Deny messages for systemd rule
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

--=-=-=
Content-Type: text/plain

Hi all,

Why do I get this deny rule

AVC apparmor="DENIED" operation="exec" class="file" info="no new privs" error=-1 profile="/nix/store/ksz6ygnl9f1l6jff3mwmjsmw7qyyxa59-systemd-257.7/**" name="/nix/store/s71mkxsqwlhgjvpdjgnz6wrcah1wfbk3-dhcpcd-10.1.0/sbin/dhcpcd" pid=872 comm="(dhcpcd)" requested_mask="x" denied_mask="x" fsuid=999 ouid=0 target="/nix/store/s71mkxsqwlhgjvpdjgnz6wrcah1wfbk3-dhcpcd-10.1.0/**

for the profile

profile /nix/store/ksz6ygnl9f1l6jff3mwmjsmw7qyyxa59-systemd-257.7/** {
  capability,
  network,
  mount,
  remount,
  umount,
  pivot_root,
  ptrace,
  signal,
  dbus,
  unix,
  /** rwmklPux,
}

Shouldn't x be allowed?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFLBAEBCgA1FiEETi2bJpQODavzdrevdnYkIdRYN94FAmkGOAIXHGVuZ2VsZmxv
cmlhbkBwb3N0ZW8uZGUACgkQdnYkIdRYN965qwf/cEZOpya0SUxdhsk5yJ6Q2yct
PS3VuhIEOAf1xKcQ4ecqXSD4j6X6HMfLhHKhNmYC+tFlVMHSPU4bu/fBJifoWVC7
AYarqpzG7y3KBQ2b/ZYoziFJwGBCvsUGIRt3EvU48J4TPS8261/poh5xUueFvbQG
cvG4cKvd1ms8UOTSuP3y0cgtjaWhqOKJLhk3FyyDYgqTnTjIHCgJAKNEbGKNqcA2
5mUJ60D0OYafRr6sZzb5722ubAppd7y1kdpEJFKaw4L7pVWDMqMyvtJOD3mn1EzM
Hff121gk3FQaSvoTWF1dYbfGbmPGkjhWDUHpT0KMY1GsKpAa6yANT9wNihl7zg==
=SLNt
-----END PGP SIGNATURE-----
--=-=-=--

