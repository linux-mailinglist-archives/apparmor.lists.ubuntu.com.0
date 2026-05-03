Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPVfJkql+GnQxQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 15:55:22 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D694BE1E5
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 15:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJtlF-0007zd-9n; Mon, 04 May 2026 13:55:01 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <zenghongling@kylinos.cn>)
 id 1wJOCR-0006kF-AA
 for apparmor@lists.ubuntu.com; Sun, 03 May 2026 04:12:59 +0000
X-UUID: 57b5430c46a611f1aa26b74ffac11d73-20260503
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
 SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
 CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:c5f66148-d86c-47a3-abc2-9e22791a93fa, IP:10,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-25
X-CID-INFO: VERSION:1.3.12, REQID:c5f66148-d86c-47a3-abc2-9e22791a93fa, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:e7bac3a, CLOUDID:d5eb26756dd2cbda9f9ac99edf304a76,
 BulkI
 D:260503121250KGD6EFPG,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
 |898|915,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:ni
 l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
 :0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57b5430c46a611f1aa26b74ffac11d73-20260503
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
 (envelope-from <zenghongling@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 983381295; Sun, 03 May 2026 12:12:47 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, neil@brown.name, brauner@kernel.org, jlayton@kernel.org,
 jack@suse.cz
Date: Sun,  3 May 2026 12:12:43 +0800
Message-Id: <20260503041243.200895-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=zenghongling@kylinos.cn; helo=mailgw.kylinos.cn
X-Mailman-Approved-At: Mon, 04 May 2026 13:55:00 +0000
Subject: [apparmor] [PATCH 1/3] apparmor: Fix return in ns_mkdir_op
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
Cc: zhongling0719@126.com, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 Hongling Zeng <zenghongling@kylinos.cn>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: E6D694BE1E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	DATE_IN_PAST(1.00)[33];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:neil@brown.name,m:brauner@kernel.org,m:jlayton@kernel.org,m:jack@suse.cz,m:zhongling0719@126.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:zenghongling@kylinos.cn,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zenghongling@kylinos.cn,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[126.com,vger.kernel.org,lists.ubuntu.com,kylinos.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghongling@kylinos.cn,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.761];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]

Return NULL instead of passing to ERR_PTR while error is zero.
  Fixes smatch warning:
    - security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn:
      passing zero to 'ERR_PTR'

Fixes: 88d5baf69082 ("Change inode_operations.mkdir to return struct dentry *")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 security/apparmor/apparmorfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index ededaf46f3ca..1d7b1c70f22a 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1922,7 +1922,7 @@ static struct dentry *ns_mkdir_op(struct mnt_idmap *idmap, struct inode *dir,
 	mutex_unlock(&parent->lock);
 	aa_put_ns(parent);
 
-	return ERR_PTR(error);
+	return error ? ERR_PTR(error) : NULL;
 }
 
 static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
-- 
2.25.1


