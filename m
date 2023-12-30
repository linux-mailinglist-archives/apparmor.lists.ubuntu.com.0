Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020F8209D3
	for <lists+apparmor@lfdr.de>; Sun, 31 Dec 2023 06:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rJoZm-0007aT-8q; Sun, 31 Dec 2023 05:41:30 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <carnil@debian.org>) id 1rJbWI-0002HX-1z
 for apparmor@lists.ubuntu.com; Sat, 30 Dec 2023 15:45:05 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1rJbWE-009tUr-II; Sat, 30 Dec 2023 15:44:57 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id BA630BE2DE0; Sat, 30 Dec 2023 16:44:55 +0100 (CET)
Date: Sat, 30 Dec 2023 16:44:55 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: 1050256@bugs.debian.org, John Johansen <john.johansen@canonical.com>,
 John Johansen <john@apparmor.net>
Message-ID: <ZZA69zQAzpzPojD5@eldamar.lan>
References: <ZPMX8Wo1+2ICj8+K@debian.org>
 <d5a0d568-8666-4f4a-a426-757d68215724@debian.org>
 <aea599a6-219c-4158-850f-d7168a595d21@debian.org>
 <da160344-8135-4eab-9261-bb1552238ad3@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXDsAecCKiSuHsO2@eldamar.lan>
X-Debian-User: carnil
X-Mailman-Approved-At: Sun, 31 Dec 2023 05:41:27 +0000
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
Cc: Mathias Gibbens <gibmat@debian.org>, apparmor@lists.ubuntu.com,
 Antonio Terceiro <terceiro@debian.org>, Harald Dunkel <harri@afaics.de>,
 pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>,
 Paul Gevers <elbrus@debian.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi John,

On Wed, Dec 06, 2023 at 10:47:45PM +0100, Salvatore Bonaccorso wrote:
> Hi Paul,
> 
> On Wed, Dec 06, 2023 at 10:21:02PM +0100, Paul Gevers wrote:
> > Hi,
> > 
> > On Mon, 18 Sep 2023 20:54:17 +0200 Paul Gevers <elbrus@debian.org> wrote:
> > > On 09-09-2023 13:06, Paul Gevers wrote:
> > > > All ci.d.n workers (except riscv64) now run the kernel from >
> > > bookworm-backports. systemd passes it's autopkgtest again in unstable, >
> > > testing and stable.
> > > 
> > > We're having issues [1] with the (backports and) unstable kernel on our
> > > main amd64 host, so we reverted back to the stable kernel for amd64.
> > > 
> > > Paul
> > > 
> > > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1052130
> > 
> > We're having issues [2] with the backports kernel on arm64 so our arm64,
> > armhf and armel hosts are back to the previous backports (arm64) kernel.
> > 
> > I'm slightly wondering if the next point release (on Saturday) will bring us
> > a fixed kernel for this issue? Given that this is the second time in 3
> > months we experience an issue with backports kernels, I think we'll have to
> > revert our hosts back to stable kernels for maintainability reasons.
> 
> TTBOMK, a backport of 1cf26c3d2c4c ("apparmor: fix apparmor mediating
> locking non-fs unix sockets") for the 6.1.y stable series has not
> landed yet so it's not included in the 6.1.64-1 update of the upcoming
> point release next weekend.
> 
> John, as it was said you are working on having the fix backpored to
> linux-6.1.y, is this still WIP?

John, did you had a chance to work on this backport for 6.1.y stable
upstream so we could pick it downstream in Debian in one of the next
stable imports? Cherry-picking 1cf26c3d2c4c ("apparmor: fix apparmor
mediating locking non-fs unix sockets") does not work, if not
havinging the work around e2967ede2297 ("apparmor: compute policydb
permission on profile load") AFAICS, so that needs a 6.1.y specific
backport submitted to stable@vger.kernel.org ?

I think we could have people from this bug as well providing a
Tested-by when necessary. I'm not feeling confident enough to be able
to provide myself such a patch to sent to stable (and you only giving
an Acked-by/Reviewed-by), so if you can help out here with your
upstream hat on that would be more than appreciated and welcome :)

Thanks a lot for your work!

Regards,
Salvatore

