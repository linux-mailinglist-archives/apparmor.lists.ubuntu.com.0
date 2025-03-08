Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A511A57A50
	for <lists+apparmor@lfdr.de>; Sat,  8 Mar 2025 14:04:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tqtqL-0006ei-Ad; Sat, 08 Mar 2025 13:03:53 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <engelflorian@posteo.de>)
 id 1tqtqK-0006eQ-KQ
 for apparmor@lists.ubuntu.com; Sat, 08 Mar 2025 13:03:52 +0000
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 5FECB240027
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 14:03:50 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Z93J606nHz6txf
 for <apparmor@lists.ubuntu.com>; Sat,  8 Mar 2025 14:03:49 +0100 (CET)
From: engelflorian@posteo.de
To: apparmor@lists.ubuntu.com 
Cc: 
Date: Sat, 08 Mar 2025 13:03:48 +0000
Message-ID: <878qpfwu6j.fsf@nixosThinkpad.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Received-SPF: pass client-ip=185.67.36.65; envelope-from=engelflorian@posteo.de;
 helo=mout01.posteo.de
Subject: [apparmor] Priority of two matching profiles
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
Content-Transfer-Encoding: quoted-printable

Hi,

What is the priority if two profiles match. E.g. /usr/bin/cat matches on
profiles /usr/bin/c* and /usr/bin/ca*. What profile is it using?

I use Nixos and have generate profiles for all programs which are
installed by my configuration. I then want to add a default profile
which is only used if no other profile matches.

I don't think I can do that wit profile inheritence, because if i switch
from the default profile it always switches to the systemd profile. If i
add inheritence to the systemd profile it selects the default profile
and not the more specific ones

I tried it with a config like this
```
profile /nix/store/***-systemd/**  flags=3D(attach_disconnected) {
  # allow everything
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
  file,
}
...
profile default /** flags=3D(attach_disconnected) {
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
  file,

  # Deny some sensitive files
  deny /home/florian/.ssh/{,**} mrwlk,
  }
```

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFLBAEBCgA1FiEETi2bJpQODavzdrevdnYkIdRYN94FAmfMQDUXHGVuZ2VsZmxv
cmlhbkBwb3N0ZW8uZGUACgkQdnYkIdRYN96CQQf9HMEECh1hmuj75hEWmn7ed9UG
fixTpKauRR8Fhjz7xr5eIKWYes4fBxQQCWcNAEwmANjzvh/5yqb5AaSYrq3owwjM
tPCcp8dUvibhhVgSkPfM9Yk4rXvjk0kjguIfpM6N6YSKXHTNvjx0Ar5Sy7h81IY1
vfwdCvaVywL1Jy+6XRYUZEk+AB7k8Yz/Gg3Xkoh4NbIEfS2co+wCQbXMO8Bb/7l2
7ciO+HvqrUo4klOtfrnlqNjE6bHBxVive2ks941zx1nSVDwfcFJ+Iar0Aj0OoCxo
gTD2hp61QPnKdo1/wIyStEvLRMkbpqvxCg20cKzq2qABMZVp4esSu1ug6z0jHA==
=I8Uh
-----END PGP SIGNATURE-----
--=-=-=--

