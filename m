Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CF236C7CEF8
	for <lists+apparmor@lfdr.de>; Sat, 22 Nov 2025 12:55:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vMmCf-0000Vx-S6; Sat, 22 Nov 2025 11:54:57 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vMmCe-0000Vp-6O
 for apparmor@lists.ubuntu.com; Sat, 22 Nov 2025 11:54:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Sat, 22 Nov 2025 12:54:46 +0100
Message-ID: <20251122115446.447925-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.180;
 envelope-from=thorsten.blum@linux.dev; helo=out-180.mta0.migadu.com
Subject: [apparmor] [PATCH RESEND] apparmor: replace sprintf with snprintf
	in aa_new_learning_profile
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

Replace unbounded sprintf() calls with snprintf() to prevent potential
buffer overflows in aa_new_learning_profile(). While the current code
works correctly, snprintf() is safer and follows secure coding best
practices.  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/policy.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 50d5345ff5cb..b09323867fea 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -697,24 +697,27 @@ struct aa_profile *aa_new_learning_profile(struct aa_profile *parent, bool hat,
 	struct aa_profile *p, *profile;
 	const char *bname;
 	char *name = NULL;
+	size_t name_sz;
 
 	AA_BUG(!parent);
 
 	if (base) {
-		name = kmalloc(strlen(parent->base.hname) + 8 + strlen(base),
-			       gfp);
+		name_sz = strlen(parent->base.hname) + 8 + strlen(base);
+		name = kmalloc(name_sz, gfp);
 		if (name) {
-			sprintf(name, "%s//null-%s", parent->base.hname, base);
+			snprintf(name, name_sz, "%s//null-%s",
+				 parent->base.hname, base);
 			goto name;
 		}
 		/* fall through to try shorter uniq */
 	}
 
-	name = kmalloc(strlen(parent->base.hname) + 2 + 7 + 8, gfp);
+	name_sz = strlen(parent->base.hname) + 2 + 7 + 8;
+	name = kmalloc(name_sz, gfp);
 	if (!name)
 		return NULL;
-	sprintf(name, "%s//null-%x", parent->base.hname,
-		atomic_inc_return(&parent->ns->uniq_null));
+	snprintf(name, name_sz, "%s//null-%x", parent->base.hname,
+		 atomic_inc_return(&parent->ns->uniq_null));
 
 name:
 	/* lookup to see if this is a dup creation */
-- 
2.51.1


