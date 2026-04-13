Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJPlJ1ie3GkeUgkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 09:42:16 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DBB3E8622
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 09:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wCBvo-0005AI-S6; Mon, 13 Apr 2026 07:42:04 +0000
Received: from n169-113.mail.139.com ([120.232.169.113])
 by lists.ubuntu.com with smtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <1468888505@139.com>)
 id 1wCAAm-0002zv-Tr
 for apparmor@lists.ubuntu.com; Mon, 13 Apr 2026 05:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=139.com; s=dkim; l=0;
 h=from:subject:message-id:to:cc:mime-version;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=hTGNW2lxzVW+exODemMDyEwIlfVYrpYdUpv9SKMUnRgi/1iYCTtqz82EDyyq+OuFnK0fhBNOH6ROr
 mXWMdTzPWnvLOilAhCq6HKQ775hQ71pBgzqU49VzH9niFmWOCJvff6i1hTYR64NeCMLtmMLMwJRg1K
 1pY06PpBXQ1+k1AQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
 by rmsmtp-lg-appmail-29-12034 (RichMail) with SMTP id 2f0269dc83e0836-00841;
 Mon, 13 Apr 2026 13:49:22 +0800 (CST)
X-RM-TRANSID: 2f0269dc83e0836-00841
From: Li hongliang <1468888505@139.com>
To: massimiliano.pellizzer@canonical.com
Date: Mon, 13 Apr 2026 13:49:21 +0800
Message-Id: <20260413054921.2244728-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=120.232.169.113; envelope-from=1468888505@139.com;
 helo=n169-113.mail.139.com
X-Mailman-Approved-At: Mon, 13 Apr 2026 07:42:02 +0000
Subject: [apparmor] [PATCH 5.15.y] apparmor: fix memory leak in verify_header
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
Cc: qsa@qualys.com, paul@paul-moore.com, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-security-module@vger.kernel.org, carnil@debian.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[139.com:s=dkim];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:massimiliano.pellizzer@canonical.com,m:qsa@qualys.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:carnil@debian.org,m:serge@hallyn.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[139.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[1468888505@139.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[139.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1468888505@139.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[139.com:email,139.com:mid,canonical.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,qualys.com:email];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_SPAM(0.00)[0.841];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[139.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 56DBB3E8622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Massimiliano Pellizzer <massimiliano.pellizzer@canonical.com>

[ Upstream commit e38c55d9f834e5b848bfed0f5c586aaf45acb825 ]

The function sets `*ns = NULL` on every call, leaking the namespace
string allocated in previous iterations when multiple profiles are
unpacked. This also breaks namespace consistency checking since *ns
is always NULL when the comparison is made.

Remove the incorrect assignment.
The caller (aa_unpack) initializes *ns to NULL once before the loop,
which is sufficient.

Fixes: dd51c8485763 ("apparmor: provide base for multiple profiles to be replaced at once")
Reported-by: Qualys Security Advisory <qsa@qualys.com>
Tested-by: Salvatore Bonaccorso <carnil@debian.org>
Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>
Reviewed-by: Cengiz Can <cengiz.can@canonical.com>
Signed-off-by: Massimiliano Pellizzer <massimiliano.pellizzer@canonical.com>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Li hongliang <1468888505@139.com>
---
 security/apparmor/policy_unpack.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 851fd6212831..3bbd28603c8c 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -959,7 +959,6 @@ static int verify_header(struct aa_ext *e, int required, const char **ns)
 {
 	int error = -EPROTONOSUPPORT;
 	const char *name = NULL;
-	*ns = NULL;
 
 	/* get the interface version */
 	if (!unpack_u32(e, &e->version, "version")) {
-- 
2.34.1



