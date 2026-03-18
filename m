Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJH7FCTtuWm3PgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 01:09:08 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6F2B4852
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 01:09:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2eT3-0005MW-7Q; Wed, 18 Mar 2026 00:08:57 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1w2eT1-0005MO-Ok
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 00:08:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1773792534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pqRHy8JbQicQsBHcZ+eKAi0Ca32HRah2sJYF31zlPKw=;
 b=wOviO17uEOQwip1j+OajqN6gz7c2gw18JxP3Qa3sbnY/3hzSx7kFwEuPzAAiiQeB1v+Bfa
 sN2CVcDMNOFk/D3DnVYpd2AlvqtfhHx6JBGdjoJpuS4yQKanrE46oZxbfXw2cuq1L11F3H
 RQqvPNWNCdMheDYVFdDBYQTE5EzTq8Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 18 Mar 2026 01:08:00 +0100
Message-ID: <20260318000758.1568-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=thorsten.blum@linux.dev;
 h=from:subject; bh=IqCJM3FjwfMNActdutaMiOyRmFhcucmB4ElZwJRaP4g=;
 b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk739xrD9n35MJmtlqH7weW1ZZz7f7ZGNBwMc8/LNG6V
 z/4jHxLRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwkN5KR4SbPOfdZC205rLY/
 k3vz7Z35Q+nu2dYMtlynX0hHMinbijD8L1lwWkOZ9U2nV/p7N90v38q2ySkH1n/8tXfxrT7epqI
 ATgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp;
 fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.174;
 envelope-from=thorsten.blum@linux.dev; helo=out-174.mta0.migadu.com
Subject: [apparmor] [PATCH RESEND] apparmor: Use sysfs_emit in
	param_get_{audit, mode}
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
 Thorsten Blum <thorsten.blum@linux.dev>, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:thorsten.blum@linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: 8AC6F2B4852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace sprintf() with sysfs_emit() in param_get_audit() and
param_get_mode(). sysfs_emit() is preferred for formatting sysfs output
because it provides safer bounds checking.  Add terminating newlines as
suggested by checkpatch.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/lsm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..cdf19a5e7626 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -17,6 +17,7 @@
 #include <linux/ptrace.h>
 #include <linux/ctype.h>
 #include <linux/sysctl.h>
+#include <linux/sysfs.h>
 #include <linux/audit.h>
 #include <linux/user_namespace.h>
 #include <linux/netfilter_ipv4.h>
@@ -2073,7 +2074,7 @@ static int param_get_audit(char *buffer, const struct kernel_param *kp)
 		return -EINVAL;
 	if (apparmor_initialized && !aa_current_policy_view_capable(NULL))
 		return -EPERM;
-	return sprintf(buffer, "%s", audit_mode_names[aa_g_audit]);
+	return sysfs_emit(buffer, "%s\n", audit_mode_names[aa_g_audit]);
 }
 
 static int param_set_audit(const char *val, const struct kernel_param *kp)
@@ -2101,8 +2102,7 @@ static int param_get_mode(char *buffer, const struct kernel_param *kp)
 		return -EINVAL;
 	if (apparmor_initialized && !aa_current_policy_view_capable(NULL))
 		return -EPERM;
-
-	return sprintf(buffer, "%s", aa_profile_mode_names[aa_g_profile_mode]);
+	return sysfs_emit(buffer, "%s\n", aa_profile_mode_names[aa_g_profile_mode]);
 }
 
 static int param_set_mode(const char *val, const struct kernel_param *kp)

