Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKmZCE9HsGnFhgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:31:11 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B0254D3E
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:31:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzzmD-00083T-CP; Tue, 10 Mar 2026 16:17:45 +0000
Received: from mail.avm.de ([212.42.244.119])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phahn-oss@avm.de>) id 1vzvgR-0005qd-An
 for apparmor@lists.ubuntu.com; Tue, 10 Mar 2026 11:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143729; bh=D3MT7fsInTbF+Q1IcBY1KlhxZOhv8n1GbgMEryPc1iY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FuoIkm8y1r9jmy9XkB/nIcxLjk6bi+LjK6sb5O5ohjTjMY18sKNe5fNP8s8fr+eSE
 cVA8MM9YDRtdE2+c+3jQLNZHyd4epnj5ZDnSjfPWRMAs2R10VO12Ss6TLbgdzang/C
 IuQfXi2yHqFGvraOYFSaQFSWS/mBIxmUmEAiJKQg=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006b0-2367-7f0000032729-7f000001ca2a-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:29 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:28 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=D3MT7fsInTbF+Q1IcBY1KlhxZOhv8n1GbgMEryPc1iY=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAaUcbSjlqDNveOR0T7quZaIRE99Gs4Y40VBm
 M+JmB4D/wiJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGlAAKCRA0LQZT0ays
 29iMCACZFg0QUOFeRuYtY3bNuohm/w3gB25wtydzkEpw1y51B0CHIEYO2D+JTSeLzAXWxzoBnW9
 HXPmPssLJbvCLWKHMMkr0gAWPlZj2r2H5W9oWdTzVn7prfkWfj3QlC8PF6krEUlEdaF6S2eKHnY
 z1zuimMLbUrpcxQrqC7ES4i2d/Rp5LYwIEnS9CU2G4AgF3dSj7KUVqb2Lo1UirL++DC+eGcQfPA
 Ura0HOmvOdmbreSMPuxW3hgubjzqbYDJe+u22CiDbkdU8O1mLNiEw60lO04uucHvbyqPHMrNt0s
 Po0xv5cdM7Uk0fq2L3KaKWcmaytoRStiJNfwvalXm+okYQVa
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143729-974B6E1F-DBF721A0/0/0
X-purgate-type: clean
X-purgate-size: 1923
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
Received-SPF: pass client-ip=212.42.244.119; envelope-from=phahn-oss@avm.de;
 helo=mail.avm.de
X-Mailman-Approved-At: Tue, 10 Mar 2026 16:17:18 +0000
Subject: [apparmor] [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Thomas Gleixner <tglx@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: C48B0254D3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:tglx@kernel.org,m:daniel.lezcano@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_GT_50(0.00)[58];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,avm.de:mid,avm.de:email,baylibre.com:email]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Semantich change: Previously the code only printed the warning on error,
but not when the pointer was NULL. Now the warning is printed in both
cases!

Change found with coccinelle.

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/clk/clk.c               | 4 ++--
 drivers/clocksource/timer-pxa.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..35146e3869a7dd93741d10b7223d4488a9216ed1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4558,7 +4558,7 @@ void clk_unregister(struct clk *clk)
 	unsigned long flags;
 	const struct clk_ops *ops;
 
-	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
+	if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))
 		return;
 
 	clk_debug_unregister(clk->core);
@@ -4744,7 +4744,7 @@ void __clk_put(struct clk *clk)
 {
 	struct module *owner;
 
-	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
+	if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))
 		return;
 
 	clk_prepare_lock();
diff --git a/drivers/clocksource/timer-pxa.c b/drivers/clocksource/timer-pxa.c
index 7ad0e5adb2ffac4125c34710fc67f4b45f30331d..f65fb0b7fc318b766227e5e7a4c0fb08ba11c8f9 100644
--- a/drivers/clocksource/timer-pxa.c
+++ b/drivers/clocksource/timer-pxa.c
@@ -218,7 +218,7 @@ void __init pxa_timer_nodt_init(int irq, void __iomem *base)
 
 	timer_base = base;
 	clk = clk_get(NULL, "OSTIMER0");
-	if (clk && !IS_ERR(clk)) {
+	if (!IS_ERR_OR_NULL(clk)) {
 		clk_prepare_enable(clk);
 		pxa_timer_common_init(irq, clk_get_rate(clk));
 	} else {

-- 
2.43.0


