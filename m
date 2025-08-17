Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 160EAB2940C
	for <lists+apparmor@lfdr.de>; Sun, 17 Aug 2025 18:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ung2z-0003mS-4H; Sun, 17 Aug 2025 16:15:53 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <engelflorian@posteo.de>)
 id 1ung2x-0003lk-HN
 for apparmor@lists.ubuntu.com; Sun, 17 Aug 2025 16:15:51 +0000
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 2B663240027
 for <apparmor@lists.ubuntu.com>; Sun, 17 Aug 2025 18:15:50 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4c4gts56qXz9rxG
 for <apparmor@lists.ubuntu.com>; Sun, 17 Aug 2025 18:15:49 +0200 (CEST)
From: engelflorian@posteo.de
To: apparmor@lists.ubuntu.com 
Cc: 
Date: Sun, 17 Aug 2025 16:15:49 +0000
Message-ID: <87qzx9exg1.fsf@nixosThinkpad.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Received-SPF: pass client-ip=185.67.36.65; envelope-from=engelflorian@posteo.de;
 helo=mout01.posteo.de
Subject: [apparmor] file rule not working
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

Hi All!

I'm trying to unterstand why my file deny rule does not work.

I call
vim /home/florian/.my-bookmarks.json
And its open

I expect apparmor to deny that
sudo aa-status says
/nix/store/x9y5la4rs81rkcghxi6h7kka1qrrcla8-vim-9.1.1566/bin/vim (11739) /nix/store/x9y5la4rs81rkcghxi6h7kka1qrrcla8-vim-9.1.1566/bin/*

The corresponding profile is
/nix/store/x9y5la4rs81rkcghxi6h7kka1qrrcla8-vim-9.1.1566/bin/* {
   # Allow other processes to read our /proc entries, futexes, perf tracing and
# kcmp for now (they will need 'read' in the first place). Administrators can
# override with:
#   deny ptrace (readby) ...
ptrace (readby),

# Allow unconfined processes to send us signals by default
signal (receive) peer=unconfined,

# Allow us to signal ourselves
signal peer=@{profile_name},

# Allow us to ptrace read ourselves
ptrace (read) peer=@{profile_name},

file,
audit deny /home/florian/.ssh mrwlkx,
audit deny /home/florian/.ssh/{,**} mrwlkx,
audit deny /root/.ssh mrwlkx,
audit deny /root/.ssh/{,**} mrwlkx,
audit deny /home/florian/.gnupg mrwlkx,
audit deny /home/florian/.gnupg/{,**} mrwlkx,
audit deny /root/.gnupg mrwlkx,
audit deny /root/.gnupg/{,**} mrwlkx,
audit deny /home/florian/Dokumente mrwlkx,
audit deny /home/florian/Dokumente/{,**} mrwlkx,
audit deny /home/florian/paperlessInput mrwlkx,
audit deny /home/florian/paperlessInput/{,**} mrwlkx,
audit deny /var/lib/paperless mrwlkx,
audit deny /var/lib/paperless/{,**} mrwlkx,
audit deny /home/florian/.password-store mrwlkx,
audit deny /home/florian/.password-store/{,**} mrwlkx,
audit deny /home/florian/.mozilla mrwlkx,
audit deny /home/florian/.mozilla/{,**} mrwlkx,
audit deny /home/florian/Maildir mrwlkx,
audit deny /home/florian/Maildir/{,**} mrwlkx,
audit deny /home/florian/.authinfo mrwlkx,
audit deny /home/florian/.authinfo/{,**} mrwlkx,
audit deny /home/florian/.authinfo.gpg mrwlkx,
audit deny /home/florian/.authinfo.gpg/{,**} mrwlkx,
audit deny /run/agenix/backblaze-restic mrwlkx,
audit deny /run/agenix/backblaze-restic/{,**} mrwlkx,
audit deny /home/florian/.my-bookmarks.json mrwlkx,
audit deny /home/florian/.my-bookmarks.json/{,**} mrwlkx,
audit deny /run/agenix/florian mrwlkx,
audit deny /run/agenix/florian/{,**} mrwlkx,
audit deny /run/agenix/github-token mrwlkx,
audit deny /run/agenix/github-token/{,**} mrwlkx,
audit deny /run/agenix/gmail mrwlkx,
audit deny /run/agenix/gmail/{,**} mrwlkx,
audit deny /run/agenix/librem mrwlkx,
audit deny /run/agenix/librem/{,**} mrwlkx,
audit deny /run/agenix/notmuchTags mrwlkx,
audit deny /run/agenix/notmuchTags/{,**} mrwlkx,
audit deny /run/agenix/officeOvpn mrwlkx,
audit deny /run/agenix/officeOvpn/{,**} mrwlkx,
audit deny /run/agenix/posteo mrwlkx,
audit deny /run/agenix/posteo/{,**} mrwlkx,
audit deny /run/agenix/restic-password mrwlkx,
audit deny /run/agenix/restic-password/{,**} mrwlkx,
audit deny /run/agenix/syncthingCert mrwlkx,
audit deny /run/agenix/syncthingCert/{,**} mrwlkx,
audit deny /run/agenix/syncthingKey mrwlkx,
audit deny /run/agenix/syncthingKey/{,**} mrwlkx,
audit deny /run/agenix/thinkpadWireguardPrivate mrwlkx,
audit deny /run/agenix/thinkpadWireguardPrivate/{,**} mrwlkx,
audit deny /run/agenix/vpnPresharedKey mrwlkx,
audit deny /run/agenix/vpnPresharedKey/{,**} mrwlkx,
audit deny /run/agenix/vpnPrivateKey mrwlkx,
audit deny /run/agenix/vpnPrivateKey/{,**} mrwlkx,
audit deny /run/agenix/workMail mrwlkx,
audit deny /run/agenix/workMail/{,**} mrwlkx,

network,
capability,

}

For directories like /home/florian/.ssh the deny does work.

If I copy only that profile into a nixos vm where there are much less
profiles, the deny does also work.

Are there some limits on the size of files in /etc/apparmor.d? The rule
is in a file with 86 profiles and 7012 lines.


Thanks in advance
Florian

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFLBAEBCgA1FiEETi2bJpQODavzdrevdnYkIdRYN94FAmiiAC8XHGVuZ2VsZmxv
cmlhbkBwb3N0ZW8uZGUACgkQdnYkIdRYN95pswf/V2Vr4sMPpWNlNcRcd6++Yfv+
VTibdi0A1JaVhpd0QaDPcY9HW6A1LLuLVsa6Lwxo9niG2fDpAT2yaxbyYhwZ3c9F
Q4Byn6D2iFerLljyzryDFrqy1yGmt/Tqm0B61GfCj8/zLxqYFDIYSVM2u1lXjh5d
oyuC3RmIeV45oHkJNuaElhtYVZq6Us4CafXIRv0xu9z8LtIlAIGhKqMF28Zyl87f
12Shdar8+f77uzC3rtOjaRb9ZiOTSuCm3gPT3fARJBo495N0jq2ay8o9q3zLWkVN
z87dEZmRHzkeIv5fJqtaGADJL3M4vW5gcixy6rP1T/VA5c72Y1H6y1p6jv3zxw==
=z/Jc
-----END PGP SIGNATURE-----
--=-=-=--

