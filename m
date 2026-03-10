Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK8NNLBGsGn3hgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:28:32 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 87083254C0C
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzzmG-0008Qh-BB; Tue, 10 Mar 2026 16:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <broonie@kernel.org>) id 1vzwJ4-0006rs-Rm
 for apparmor@lists.ubuntu.com; Tue, 10 Mar 2026 12:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 337BD43449;
 Tue, 10 Mar 2026 12:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8179C19423;
 Tue, 10 Mar 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773145714;
 bh=NZ5oTCN6VGzePwnu776uK+3unhTqb8pwokxv1IJtK7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FOutLnoL/seeB/icY17T5kE23weT+c8OWPxsN1CuLtbqZf1qO8twCXpCHPEW4zEb5
 uM5pcZxBh8XK3wQOjz6gQLnb8DbNMsJ6SwgjqzPaDdyeQRMdzDiadj+7d8CVSVSbbp
 WbSnGZkMbwo0cpPlViR1A0oh5e53oFE0sYAJxulW9oCNKaXKAhhACMzXx6XsRo3Hlx
 /XgKdmLcz/EtWl6VZEOUGY5PBqGn3Xb4X+aqLL+l2HoSL3wZMd6NhcSGeVt+ZFpBkn
 8s7ZymgPrZjLjSz7/xRlCoCIsHrVCduE0eaA6Z9IamuK4ZW4bnyThB9ZhLWcSUucoJ
 BJsDSXl6ZXWkQ==
Date: Tue, 10 Mar 2026 12:28:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <19aa26fc-8570-492e-8e17-23d6950676f0@sirena.org.uk>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-18-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7JjDB+7CEHk89uTh"
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-18-bd63b656022d@avm.de>
X-Cookie: A fool and his honey are soon parted.
Received-SPF: pass client-ip=172.234.252.31; envelope-from=broonie@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Tue, 10 Mar 2026 16:17:19 +0000
Subject: Re: [apparmor] [PATCH 18/61] sound: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>,
 linux-s390@vger.kernel.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 87083254C0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:s.nawrocki@samsung.com,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:tiwai@suse.com,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:lgirdwood@gmail.com,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@v
 ger.kernel.org,m:linux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:perex@perex.cz,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:jcmvbkbc@gmail.com,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	FORGED_SENDER(0.00)[broonie@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.samba.org,lists.freedesktop.org,lists.linux.dev,kvack.org,lists.infradead.org,samsung.com,suse.com,st-md-mailman.stormreply.com,lists.osuosl.org,gmail.com,lists.ubuntu.com,perex.cz,inria.fr,lists.sourceforge.net,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,sirena.org.uk:mid]
X-Rspamd-Action: no action


--7JjDB+7CEHk89uTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 12:48:44PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.

I can't tell what the dependency story is here, it looks like there's
none?  If that's the case you shouldn't send things as a single series,
send separate patches to the various subsystems.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--7JjDB+7CEHk89uTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwDmMACgkQJNaLcl1U
h9D4VAf/VCpoXjivQsq8mL1i6sHdID6byBqwG7egrwiRCrsZav80JlvY/F+1fWQl
Fe3Ct+yRv1pWeNy67wSCZD3mtHtNH0JpwRTNxS1XQrnXc7CLjzKunCldDfzTbfom
+QmXWHQB3Qo9ie1ugoAGet9gx/vkV0z+cv9sVHg1o1R7/AKqfgov7xnuP9Hlv9Uk
p1pkMya/NhbXBsrh+BFbktLgp+7sAOMjWgtGZ3NfHzwju9n4Jdbl1JcPxgDl0SHp
6z8kP2+oskOspesqLWw62mZF+bN32Ycjt1N7/EFjtPBdJKIcQJLICoACzxyQBZYg
+i50s/oSRL1HiP4US2lxoy8BqxaqrQ==
=U6jW
-----END PGP SIGNATURE-----

--7JjDB+7CEHk89uTh--

