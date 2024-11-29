Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38C9E13E9
	for <lists+apparmor@lfdr.de>; Tue,  3 Dec 2024 08:22:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tINEx-0002J4-74; Tue, 03 Dec 2024 07:22:35 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <carnil@debian.org>) id 1tH8IS-0006Oy-J0
 for apparmor@lists.ubuntu.com; Fri, 29 Nov 2024 21:13:04 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1tH8IH-00FdIG-Vu; Fri, 29 Nov 2024 21:12:54 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id C1A58BE2EE7; Fri, 29 Nov 2024 22:12:52 +0100 (CET)
Date: Fri, 29 Nov 2024 22:12:52 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: 1050256@bugs.debian.org, John Johansen <john.johansen@canonical.com>
Message-ID: <Z0ouVKC_dZDIOWeX@eldamar.lan>
References: <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
 <b8bb1a0e-9b50-4f78-8473-4f0151677f25@canonical.com>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZbYk7yOaAq0O8Rid@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZlMfW3I6dcpn2nAv@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <Zq6GfWwlD2oqu2BW@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq6GfWwlD2oqu2BW@eldamar.lan>
X-Debian-User: carnil
Received-SPF: none client-ip=82.195.75.108; envelope-from=carnil@debian.org;
 helo=stravinsky.debian.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 07:22:34 +0000
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

Hi John,

On Sat, Aug 03, 2024 at 09:35:25PM +0200, Salvatore Bonaccorso wrote:
> Hi John,
> 
> On Sun, May 26, 2024 at 01:39:07PM +0200, Salvatore Bonaccorso wrote:
> > Hi,
> > 
> > For those watching this bug: John has prepared backports in his tree,
> > with both approaches:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-two-patch-1780227
> > 
> > and
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-backport-1780227
> > 
> > (but with the open question which one will be submitted for stable.
> > >From upstream stable point of view probably the two patch backport
> > approach would be the preferred one).
> 
> We still have tis issue open for 6.1.y upstream TTBOMK. If you are
> confident as maintainer with any of the two approaches, would it be
> possible to submit them for stable? If the preferred one get then
> accepted and queued, we might already cherry-pick the solution for us,
> but at this point we can wait for the respective 6.1.y stable version
> which will include the fix.

Friendly ping. Any news here?

Regards,
Salvatore

