Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JKENmI7uGmpagEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 18:18:26 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A180729DFE4
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 18:18:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2Ba6-0006vo-TC; Mon, 16 Mar 2026 17:18:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <arnd@kernel.org>) id 1w28Ze-0004de-L9
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 14:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1897F41AD8;
 Mon, 16 Mar 2026 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DA3C19421;
 Mon, 16 Mar 2026 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773669620;
 bh=ZXniKfwqTuyKAhrEeLyabGQ++dWZYhueNjMLZfQd1c0=;
 h=From:To:Cc:Subject:Date:From;
 b=IOSY8sWEbWN6DC1HmsO30r374zHzdHKF9dTcoaj8q/KiO0UHKS6bw8MrTgsDy0SXB
 J6YUvMj/sWHADhS57aBvnECm3dBuBOL1lKYGReRgWMY1RL6DMK2M7MZ/fHl8tKUnyT
 HN8vuw8Xy1vmQSvmZ1Ucyp1BE2XoMYCy6ZAuiuUaTTQ6bXaYqtkPnB3OK+cqJfzsbH
 p3HQYqa9JDIP1jVLItdYI9ZgxDLe4jWOsNnwOnqmfLtzrVwArnIWrFYUJV9UTlU6H5
 EpDjK4Kd5J9MLS1M5tz0evPnekSGADRTS3F9ySD2CENXOx/3zlklNUlVlECOtaotU1
 eGofhNap7ILFw==
From: Arnd Bergmann <arnd@kernel.org>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>,
 Cengiz Can <cengiz.can@canonical.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
Date: Mon, 16 Mar 2026 14:59:31 +0100
Message-Id: <20260316135935.3321551-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=arnd@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Mon, 16 Mar 2026 17:18:17 +0000
Subject: [apparmor] [PATCH] apparmor: hide unused get_loaddata_common_ref()
	function
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
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Layton <jlayton@kernel.org>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 NeilBrown <neil@brown.name>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:maxime.belair@canonical.com,m:cengiz.can@canonical.com,m:georgia.garcia@canonical.com,m:brauner@kernel.org,m:arnd@arndb.de,m:jlayton@kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:neil@brown.name,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: A180729DFE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The newly introduced function is only used in an #ifdef block,
which causes a harmless warning:

security/apparmor/apparmorfs.c:177:28: error: 'get_loaddata_common_ref' defined but not used [-Werror=unused-function]
  177 | static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)

Move the definition next to the user to avoid the warning.

Fixes: 8e135b8aee5a ("apparmor: fix race between freeing data and fs accessing it")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Alternatively, the #ifdef checks could be replaced with an
'if(IS_ENABLED(CONFIG_SECURITY_APPARMOR_EXPORT_BINARY) return;'
check in __aa_fs_create_rawdata(), relying on the compiler's
dead code elimination.
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
2.39.5


