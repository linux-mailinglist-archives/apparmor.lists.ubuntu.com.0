Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4083F493
	for <lists+apparmor@lfdr.de>; Sun, 28 Jan 2024 09:17:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rU0LM-00072q-7m; Sun, 28 Jan 2024 08:16:49 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <carnil@debian.org>) id 1rTesH-000725-G1
 for apparmor@lists.ubuntu.com; Sat, 27 Jan 2024 09:21:18 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1rTesD-003LFR-Ti; Sat, 27 Jan 2024 09:21:14 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id EB317BE2DE0; Sat, 27 Jan 2024 10:21:12 +0100 (CET)
Date: Sat, 27 Jan 2024 10:21:12 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Mathias Gibbens <gibmat@debian.org>, 1050256@bugs.debian.org,
 John Johansen <john.johansen@canonical.com>,
 John Johansen <john@apparmor.net>
Message-ID: <ZbTLCN8zi8xZ4KsG@eldamar.lan>
References: <da160344-8135-4eab-9261-bb1552238ad3@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
X-Debian-User: carnil
X-Mailman-Approved-At: Sun, 28 Jan 2024 08:16:38 +0000
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
Cc: pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>,
 apparmor@lists.ubuntu.com, Antonio Terceiro <terceiro@debian.org>,
 Harald Dunkel <harri@afaics.de>, Paul Gevers <elbrus@debian.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi John,

On Sun, Dec 31, 2023 at 04:24:47AM +0000, Mathias Gibbens wrote:
> On Sat, 2023-12-30 at 16:44 +0100, Salvatore Bonaccorso wrote:
> > John, did you had a chance to work on this backport for 6.1.y stable
> > upstream so we could pick it downstream in Debian in one of the next
> > stable imports? Cherry-picking 1cf26c3d2c4c ("apparmor: fix apparmor
> > mediating locking non-fs unix sockets") does not work, if not
> > havinging the work around e2967ede2297 ("apparmor: compute policydb
> > permission on profile load") AFAICS, so that needs a 6.1.y specific
> > backport submitted to stable@vger.kernel.org ?
> > 
> > I think we could have people from this bug as well providing a
> > Tested-by when necessary. I'm not feeling confident enough to be able
> > to provide myself such a patch to sent to stable (and you only giving
> > an Acked-by/Reviewed-by), so if you can help out here with your
> > upstream hat on that would be more than appreciated and welcome :)
> > 
> > Thanks a lot for your work!
> 
>   I played around with this a bit the past week as well, and came to
> the same conclusion as Salvatore did that commits e2967ede2297 and
> 1cf26c3d2c4c need to be cherry-picked back to the 6.1 stable tree.
> 
>   I've attached the two commits rebased onto 6.1.y as patches to this
> message. Commit e2967ede2297 needed a little bit of touchup to apply
> cleanly, and 1cf26c3d2c4c just needed adjustments for line number
> changes. I included some comments at the top of each patch.
> 
>   With these two commits cherry-picked on top of the 6.1.69 kernel, I
> can boot a bookworm system and successfully start a service within a
> container that utilizes `PrivateNetwork=yes`. Rebooting back into an
> unpatched vanilla 6.1.69 kernel continues to show the problem.
> 
>   While I didn't see any immediate issues (ie, `aa-status` and log
> files looked OK), I don't understand the changes in the first commit
> well enough to be confident in sending these patches for inclusion in
> the upstream stable tree on my own.

Do you had a chance to look at this for 6.1.y upstream?

Asking/Poking since the point release dates are now clear:

https://lists.debian.org/debian-security/2024/01/msg00005.html

if possible I would like to include those fixes, but only if they are
at least queued fror 6.1.y itself to not diverge from upstream.

Otherwise we will wait another round, but which means usually 2 months
for the point release cadence.

Regards,
Salvatore

