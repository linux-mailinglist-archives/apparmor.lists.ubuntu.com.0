Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18BC760E7
	for <lists+apparmor@lfdr.de>; Thu, 20 Nov 2025 20:21:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vMADn-00013O-Nq; Thu, 20 Nov 2025 19:21:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <deller@kernel.org>) id 1vLJiG-0003B9-Te
 for apparmor@lists.ubuntu.com; Tue, 18 Nov 2025 11:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02A8744012;
 Tue, 18 Nov 2025 11:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01B2C19423;
 Tue, 18 Nov 2025 11:09:38 +0000 (UTC)
Date: Tue, 18 Nov 2025 12:09:35 +0100
From: Helge Deller <deller@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <aRxT78fdN5v2Ajyl@p100>
References: <20250531150822.135803-1-deller@kernel.org>
 <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
Received-SPF: pass client-ip=172.234.252.31; envelope-from=deller@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Thu, 20 Nov 2025 19:21:33 +0000
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Adrian,

* John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>:
> On Sat, 2025-05-31 at 17:08 +0200, deller@kernel.org wrote:
> > From: Helge Deller <deller@gmx.de>
> > 
> > Two patches which fix unaligned memory accesses in apparmor.
> > Both triggered on the parisc platform, which is much more
> > memory alignment sensitive and will report violations.
> > Please check and apply.
> > 
> > Helge
> > 
> > Helge Deller (2):
> >   apparmor: Fix 8-byte alignment for initial dfa blob streams
> >   apparmor: Fix unaligned memory accesses in KUnit test
> > 
> >  security/apparmor/lsm.c                | 4 ++--
> >  security/apparmor/policy_unpack_test.c | 6 ++++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> Thanks for looking into this!
> 
> Unfortunately, the problem still persists on SPARC even with v6.18-rc6:
> 
> [   76.209476] Kernel unaligned access at TPC[8dabfc] aa_dfa_unpack+0x3c/0x6e0
> [   76.301115] Kernel unaligned access at TPC[8dac0c] aa_dfa_unpack+0x4c/0x6e0
> [   76.392697] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0x6e0
> [   76.485440] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0x6e0
> [   76.578179] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0x6e0
> 
> I have documented the problem here [1].
> [1] https://github.com/sparclinux/issues/issues/30
> 
> So, I suspect that your fix is incomplete.

My patch fixed two call sites, but I suspect you see another call site which
hasn't been fixed yet.

Can you try attached patch? It might indicate the caller of the function and
maybe prints the struct name/address which isn't aligned.

Helge


diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index c5a91600842a..b477430c07eb 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -313,6 +313,9 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
 	if (size < sizeof(struct table_set_header))
 		goto fail;
 
+	if (WARN_ON(((unsigned long)data) & (BITS_PER_LONG/8 - 1)))
+		pr_warn("dfa blob stream %pS not aligned.\n", data);
+
 	if (ntohl(*(__be32 *) data) != YYTH_MAGIC)
 		goto fail;
 

