Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNZWOLJRsGmBiAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 18:15:30 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B522825558D
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 18:15:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzzmR-0000rQ-8K; Tue, 10 Mar 2026 16:17:59 +0000
Received: from mail.avm.de ([212.42.244.119])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phahn-oss@avm.de>) id 1vzvgR-0005s5-Jy
 for apparmor@lists.ubuntu.com; Tue, 10 Mar 2026 11:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143730; bh=BZdZKAXpTi8WGNXN2fiMzetM/noYEEE0kBAl+EzvNzY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SoumYKRreG/py1h5mHUmmcf5MNhTA0IWVyuhwVtBQDsB3zjLeFZGYUpB8dmBQK885
 8zp8zOhWINTswvz/8Dpb4sCQeiaM8MeFzyXeYCejwMtQ6v6ZBfw76CXpeNeZINOkH+
 x4yAkEpkA6PhpBthZhWBkiZQBi3374fgQonGrnmw=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006b1-2367-7f0000032729-7f000001ca68-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:29 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:29 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-b4-is_err_or_null-v1-61-bd63b656022d@avm.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=BZdZKAXpTi8WGNXN2fiMzetM/noYEEE0kBAl+EzvNzY=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAamjmr2YH1D6NIv4bWMOoOgSjqlNw1AkTnEk
 z4zblGz3BCJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGpgAKCRA0LQZT0ays
 24dkB/9I2IH2WVtNuAbc4pN8k/UWfzfn7IBk5SYldKbG4a3vAt2BCQOMLY6KBgHTT+SL+30NFE0
 eqhT72U09tRMvyWUaeodCCSJABvxL6Unq+gQWaX6/P1+X8+kVa/Fa0v8GHtiYqiopntbOsAjZBr
 sS0Bbptn0GuVsdoMNke4vQD0A9rA3xW5nWOgDpK1U8FjC9uaXfz1Bfzn2XQq/Me0fZtcNCJpNlZ
 qjNOLRSw3BZGb7IPqnUrcjHIuuNd6dYbs6wYHOgbyiibTqQrj6tp6SnoDxHnYU93V6GBh2lMfHt
 9qSEynUbZNIYOnoqI2ah9KWLVKFkMsTrddsdp5JisL6z2WZS
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143729-96CB1E1F-80912B69/0/0
X-purgate-type: clean
X-purgate-size: 1022
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
Received-SPF: pass client-ip=212.42.244.119; envelope-from=phahn-oss@avm.de;
 helo=mail.avm.de
X-Mailman-Approved-At: Tue, 10 Mar 2026 16:17:18 +0000
Subject: [apparmor] [PATCH 61/61] file: Drop unlikely() around
	IS_ERR_OR_NULL()
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
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: B522825558D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:brauner@kernel.org,m:jlayton@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:mid,avm.de:email,lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Action: no action

IS_ERR_OR_NULL() already uses likely(!ptr) internally. checkpatch does
not like nesting it:
> WARNING: nested (un)?likely() calls, IS_ERR_OR_NULL already uses
> unlikely() internally
Remove the explicit use of unlikely().

Change generated with coccinelle.

To: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 include/linux/file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/file.h b/include/linux/file.h
index 27484b444d3155685cdbb89f546f26ef66e3e1b4..007b9b9d365a052c1c056e12571eaf4f8ef5a45c 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -163,7 +163,7 @@ static inline void class_fd_prepare_destructor(const struct fd_prepare *fdf)
 {
 	if (unlikely(fdf->__fd >= 0))
 		put_unused_fd(fdf->__fd);
-	if (unlikely(!IS_ERR_OR_NULL(fdf->__file)))
+	if (!IS_ERR_OR_NULL(fdf->__file))
 		fput(fdf->__file);
 }
 

-- 
2.43.0


