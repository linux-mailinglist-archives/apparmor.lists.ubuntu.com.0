Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QbCMA65AOmpb4wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 10:15:42 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F46B5344
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 10:15:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbwI2-0003bv-Gb; Tue, 23 Jun 2026 08:15:26 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <yaolu@kylinos.cn>) id 1wbqI2-0005xD-ID
 for apparmor@lists.ubuntu.com; Tue, 23 Jun 2026 01:51:03 +0000
X-UUID: f8314ae86ea511f1aa26b74ffac11d73-20260623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:0888dc32-b462-4b12-8b01-e3b6f94b13e7, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:e7bac3a, CLOUDID:d4a2e6bf207307ba2fabbbb3674f094e,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|123|136|850|865|898|915,TC:nil,Conte
 nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8314ae86ea511f1aa26b74ffac11d73-20260623
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 608691221; Tue, 23 Jun 2026 09:50:53 +0800
From: yaolu@kylinos.cn
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Tue, 23 Jun 2026 09:50:49 +0800
Message-Id: <20260623015049.41392-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232; envelope-from=yaolu@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Mailman-Approved-At: Tue, 23 Jun 2026 08:15:26 +0000
Subject: [apparmor] [PATCH] apparmor: mv get_loaddata_common_ref() into
	CONFIG_SECURITY_APPARMOR_EXPORT_BINARY block
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
Cc: Lu Yao <yaolu@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:yaolu@kylinos.cn,m:kernel-bot@kylinos.cn,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yaolu@kylinos.cn,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yaolu@kylinos.cn,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,kylinos.cn:mid,kylinos.cn:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A02F46B5344

From: Lu Yao <yaolu@kylinos.cn>

When SECURITY_APPARMOR_EXPORT_BINARY is not set, the compiler emits an
unused-function warning which is promoted to an error with -Werror:
  security/apparmor/apparmorfs.c:177:28: error: ‘get_loaddata_common_ref’ defined but not used [-Werror=unused-function]

Move the function into the #ifdef block to match its only call site,
silencing the warning.

Fixes: 8e135b8aee5a ("apparmor: fix race between freeing data and fs accessing it")
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 security/apparmor/apparmorfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index ededaf46f3ca..f762b101d682 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -174,14 +174,6 @@ static struct aa_proxy *get_proxy_common_ref(struct aa_common_ref *ref)
 	return NULL;
 }
 
-static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
-{
-	if (ref)
-		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
-						      count));
-	return NULL;
-}
-
 static void aa_put_common_ref(struct aa_common_ref *ref)
 {
 	if (!ref)
@@ -1318,6 +1310,14 @@ static const struct file_operations seq_rawdata_ ##NAME ##_fops = {	      \
 	.release	= seq_rawdata_release,				      \
 }									      \
 
+static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
+{
+	if (ref)
+		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
+						      count));
+	return NULL;
+}
+
 static int seq_rawdata_open(struct inode *inode, struct file *file,
 			    int (*show)(struct seq_file *, void *))
 {
-- 
2.25.1


