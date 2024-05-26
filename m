Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB18D28AE
	for <lists+apparmor@lfdr.de>; Wed, 29 May 2024 01:22:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sC68f-0000qI-Ug; Tue, 28 May 2024 23:21:53 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <carnil@debian.org>) id 1sBCDY-0004QG-Qa
 for apparmor@lists.ubuntu.com; Sun, 26 May 2024 11:39:12 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1sBCDU-00HG5H-R3; Sun, 26 May 2024 11:39:09 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id 8040DBE2EE8; Sun, 26 May 2024 13:39:07 +0200 (CEST)
Date: Sun, 26 May 2024 13:39:07 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: 1050256@bugs.debian.org
Message-ID: <ZlMfW3I6dcpn2nAv@eldamar.lan>
References: <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
 <b8bb1a0e-9b50-4f78-8473-4f0151677f25@canonical.com>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZbYk7yOaAq0O8Rid@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbYk7yOaAq0O8Rid@eldamar.lan>
X-Debian-User: carnil
Received-SPF: none client-ip=82.195.75.108; envelope-from=carnil@debian.org;
 helo=stravinsky.debian.org
X-Mailman-Approved-At: Tue, 28 May 2024 23:21:53 +0000
Subject: Re: [apparmor] Bug#1050256: AppArmor breaks locking non-fs Unix
	sockets
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
Cc: Harald Dunkel <harri@afaics.de>, John Johansen <john@apparmor.net>,
 Mathias Gibbens <gibmat@debian.org>, apparmor@lists.ubuntu.com,
 Antonio Terceiro <terceiro@debian.org>, Paul Gevers <elbrus@debian.org>,
 pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi,

For those watching this bug: John has prepared backports in his tree,
with both approaches:

https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-two-patch-1780227

and

https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-backport-1780227

(but with the open question which one will be submitted for stable.
From upstream stable point of view probably the two patch backport
approach would be the preferred one).

Regards,
Salvatore

