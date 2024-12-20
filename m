Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B04FF9F9A53
	for <lists+apparmor@lfdr.de>; Fri, 20 Dec 2024 20:23:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tOiad-0007e7-NP; Fri, 20 Dec 2024 19:23:11 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1tOiab-0007cL-S6
 for apparmor@lists.ubuntu.com; Fri, 20 Dec 2024 19:23:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Fri, 20 Dec 2024 20:22:42 +0100
Message-ID: <20241220192243.1856-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.170;
 envelope-from=thorsten.blum@linux.dev; helo=out-170.mta0.migadu.com
Subject: [apparmor] [RESEND PATCH] apparmor: Use str_yes_no() helper function
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

Remove hard-coded strings by using the str_yes_no() helper function.

Fix a typo in a comment: s/unpritable/unprintable/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/apparmorfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 2c0185ebc900..1bce9a7d2129 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -997,7 +997,7 @@ static int aa_sfs_seq_show(struct seq_file *seq, void *v)
 
 	switch (fs_file->v_type) {
 	case AA_SFS_TYPE_BOOLEAN:
-		seq_printf(seq, "%s\n", fs_file->v.boolean ? "yes" : "no");
+		seq_printf(seq, "%s\n", str_yes_no(fs_file->v.boolean));
 		break;
 	case AA_SFS_TYPE_STRING:
 		seq_printf(seq, "%s\n", fs_file->v.string);
@@ -1006,7 +1006,7 @@ static int aa_sfs_seq_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "%#08lx\n", fs_file->v.u64);
 		break;
 	default:
-		/* Ignore unpritable entry types. */
+		/* Ignore unprintable entry types. */
 		break;
 	}
 
@@ -1152,7 +1152,7 @@ static int seq_ns_stacked_show(struct seq_file *seq, void *v)
 	struct aa_label *label;
 
 	label = begin_current_label_crit_section();
-	seq_printf(seq, "%s\n", label->size > 1 ? "yes" : "no");
+	seq_printf(seq, "%s\n", str_yes_no(label->size > 1));
 	end_current_label_crit_section(label);
 
 	return 0;
@@ -1175,7 +1175,7 @@ static int seq_ns_nsstacked_show(struct seq_file *seq, void *v)
 			}
 	}
 
-	seq_printf(seq, "%s\n", count > 1 ? "yes" : "no");
+	seq_printf(seq, "%s\n", str_yes_no(count > 1));
 	end_current_label_crit_section(label);
 
 	return 0;
-- 
2.47.1


