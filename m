Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GRGNkpXsGlciQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 18:39:22 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC06255B9A
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 18:39:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzzmQ-0000oC-JH; Tue, 10 Mar 2026 16:17:58 +0000
Received: from mail.avm.de ([212.42.244.120])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phahn-oss@avm.de>) id 1vzvgR-0005qz-CB
 for apparmor@lists.ubuntu.com; Tue, 10 Mar 2026 11:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143726; bh=xZ7JyJZFZn3iuOZoe5h922zZ5R4/JN/dDbwKPDTDpVg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DinAmxq0LdEBHgGBL7yN+mThFn/2Jhu9YOuH2jhyjRCQP7wX2xayjWDIl59Rrb4CK
 4PIJ1T+7hTwTj8CuijTOHG0Dr5+uZ6nhOuL9PA+MuH5Ju5mtqzXJbLzXEHHZ0RMdiv
 vPLvy7MaYVqTlmV0GJrDdkzJ4sI8MLKN5uuQ6tUg=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ac-b734-7f0000032729-7f000001c02e-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-b4-is_err_or_null-v1-24-bd63b656022d@avm.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=xZ7JyJZFZn3iuOZoe5h922zZ5R4/JN/dDbwKPDTDpVg=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYnEtzR553dJZWqu5r4IUgVMywPaNyCn2Kl0
 rArZNDCQ6GJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGJwAKCRA0LQZT0ays
 22Q3B/0WDcaxg22CSV3J2yK2YCh66cZH85KFq38ggbwHyd5a8WjqQnka33Kdtc08oHARsU9ozqE
 P4ub42oqVPDyOyAfaW0nuVYHNlcCbmh/bxnwLHvjz7DvZynqqfi+81IpwDPL+nf3OHCqA45W3el
 wXFHM9DZ2DjwYG4MfnrZOmjwML1Qt1LKYUAR5WbU3bIh/t6NofmRATpZci0AEY2ACgSBKNBZ+xC
 yT5B0+MsE+np/c9UPC/BM2BZX3AZEATfPCVPaM5j6SGQ910wEhLc3aOja8ish65RkJANbgaQX9X
 HjK5HDFDjBbvCnKAA71XMeOX3I4/FbTzAL7Ez+9Tosk9xWKL
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-D2DE8A3D-E8744539/0/0
X-purgate-type: clean
X-purgate-size: 2019
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
Received-SPF: pass client-ip=212.42.244.120; envelope-from=phahn-oss@avm.de;
 helo=mail.avm.de
X-Mailman-Approved-At: Tue, 10 Mar 2026 16:17:18 +0000
Subject: [apparmor] [PATCH 24/61] net/9p: Prefer IS_ERR_OR_NULL over manual
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paolo Abeni <pabeni@redhat.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 8EC06255B9A
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
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:lucho@ionkov.net,m:pabeni@redhat.com,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:edumazet@google.com,m:horms@kernel.org,m:kuba@kernel.org,m:ericvh@kernel.org,m:davem@davemloft.net,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[63];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,ionkov.net:email,linux.dev:email,avm.de:mid,avm.de:email,davemloft.net:email,crudebyte.com:email]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Eric Van Hensbergen <ericvh@kernel.org>
To: Latchesar Ionkov <lucho@ionkov.net>
To: Dominique Martinet <asmadeus@codewreck.org>
To: Christian Schoenebeck <linux_oss@crudebyte.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: v9fs@lists.linux.dev
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 include/net/9p/client.h | 2 +-
 net/9p/trans_rdma.c     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 838a94218b593f3fb19e6827c472753380193461..4bde6bd716f323c819745e64c7aac0dea7beb72f 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -364,7 +364,7 @@ static inline struct p9_fid *p9_fid_get(struct p9_fid *fid)
 
 static inline int p9_fid_put(struct p9_fid *fid)
 {
-	if (!fid || IS_ERR(fid))
+	if (IS_ERR_OR_NULL(fid))
 		return 0;
 
 	if (tracepoint_enabled(9p_fid_ref))
diff --git a/net/9p/trans_rdma.c b/net/9p/trans_rdma.c
index aa5bd74d333f3b5e6fd1e4344d26bc0201ff7f7f..60461344b536bcb6e94112aace75a88b6a99ad86 100644
--- a/net/9p/trans_rdma.c
+++ b/net/9p/trans_rdma.c
@@ -252,16 +252,16 @@ static void rdma_destroy_trans(struct p9_trans_rdma *rdma)
 	if (!rdma)
 		return;
 
-	if (rdma->qp && !IS_ERR(rdma->qp))
+	if (!IS_ERR_OR_NULL(rdma->qp))
 		ib_destroy_qp(rdma->qp);
 
-	if (rdma->pd && !IS_ERR(rdma->pd))
+	if (!IS_ERR_OR_NULL(rdma->pd))
 		ib_dealloc_pd(rdma->pd);
 
-	if (rdma->cq && !IS_ERR(rdma->cq))
+	if (!IS_ERR_OR_NULL(rdma->cq))
 		ib_free_cq(rdma->cq);
 
-	if (rdma->cm_id && !IS_ERR(rdma->cm_id))
+	if (!IS_ERR_OR_NULL(rdma->cm_id))
 		rdma_destroy_id(rdma->cm_id);
 
 	kfree(rdma);

-- 
2.43.0


