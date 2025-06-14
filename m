Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A1AE0EE1
	for <lists+apparmor@lfdr.de>; Thu, 19 Jun 2025 23:15:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSMb7-0004iy-IZ; Thu, 19 Jun 2025 21:15:01 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <carnil@debian.org>) id 1uQX73-0006Rj-DX
 for apparmor@lists.ubuntu.com; Sat, 14 Jun 2025 20:04:25 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1uQX70-00C7HR-LZ; Sat, 14 Jun 2025 20:04:22 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id D3D43BE2DE0; Sat, 14 Jun 2025 22:04:21 +0200 (CEST)
Date: Sat, 14 Jun 2025 22:04:21 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: 1050256@bugs.debian.org, John Johansen <john.johansen@canonical.com>
Message-ID: <aE3Vxepz_y6vXpqM@eldamar.lan>
References: <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZbYk7yOaAq0O8Rid@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZlMfW3I6dcpn2nAv@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <Zq6GfWwlD2oqu2BW@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <Z0ouVKC_dZDIOWeX@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <Z98HhbGvHghlHP_x@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z98HhbGvHghlHP_x@eldamar.lan>
X-Debian-User: carnil
Received-SPF: none client-ip=82.195.75.108; envelope-from=carnil@debian.org;
 helo=stravinsky.debian.org
X-Mailman-Approved-At: Thu, 19 Jun 2025 21:15:00 +0000
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

On Sat, Mar 22, 2025 at 07:55:01PM +0100, Salvatore Bonaccorso wrote:
> Hi John,
> 
> On Fri, Nov 29, 2024 at 10:12:52PM +0100, Salvatore Bonaccorso wrote:
> > Hi John,
> > 
> > On Sat, Aug 03, 2024 at 09:35:25PM +0200, Salvatore Bonaccorso wrote:
> > > Hi John,
> > > 
> > > On Sun, May 26, 2024 at 01:39:07PM +0200, Salvatore Bonaccorso wrote:
> > > > Hi,
> > > > 
> > > > For those watching this bug: John has prepared backports in his tree,
> > > > with both approaches:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-two-patch-1780227
> > > > 
> > > > and
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-backport-1780227
> > > > 
> > > > (but with the open question which one will be submitted for stable.
> > > > >From upstream stable point of view probably the two patch backport
> > > > approach would be the preferred one).
> > > 
> > > We still have tis issue open for 6.1.y upstream TTBOMK. If you are
> > > confident as maintainer with any of the two approaches, would it be
> > > possible to submit them for stable? If the preferred one get then
> > > accepted and queued, we might already cherry-pick the solution for us,
> > > but at this point we can wait for the respective 6.1.y stable version
> > > which will include the fix.
> > 
> > Friendly ping. Any news here?
> 
> Anything we can do there to help on the decision which set of fixes
> could land in the 6.1.y stable series? Would it help if I prod Mathias
> to test both variants for feedback? 
> 
> Or is there a problem you envision already by trying to backport those
> fixes to upstream 6.1.y?
> 
> Thanks for your work, and sorry for pestering you again about it :(

Any news on this?

While at it, I noticed that in the above commits for
https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-two-patch-1780227
or
https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/log/?h=debian-backport-1780227

it might be worth adding a

Link: https://bugs.debian.org/1050256

Do you see any problems with any of the both you prepared? If not, is
there soemthing which you miss from us downstream?

Regards,
Salvatore

