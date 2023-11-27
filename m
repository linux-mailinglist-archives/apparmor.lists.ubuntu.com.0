Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC47FBCB2
	for <lists+apparmor@lfdr.de>; Tue, 28 Nov 2023 15:27:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1r7z3M-0003eX-Dl; Tue, 28 Nov 2023 14:27:08 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <pchelkin@ISPRAS.ru>)
 id 1r7ftU-0007ir-VR
 for apparmor@lists.ubuntu.com; Mon, 27 Nov 2023 17:59:41 +0000
Received: from fpc.intra.ispras.ru (unknown [10.10.165.13])
 by mail.ispras.ru (Postfix) with ESMTPSA id AF28940F1DC4;
 Mon, 27 Nov 2023 17:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru AF28940F1DC4
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: John Johansen <john.johansen@canonical.com>
Date: Mon, 27 Nov 2023 20:59:04 +0300
Message-Id: <20231127175904.156583-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Nov 2023 14:27:05 +0000
Subject: [apparmor] [PATCH] apparmor: free the allocated pdb objects
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
Cc: lvc-project@linuxtesting.org, Paul Moore <paul@paul-moore.com>,
 linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-security-module@vger.kernel.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

policy_db objects are allocated with kzalloc() inside aa_alloc_pdb() and
are not cleared in the corresponding aa_free_pdb() function causing leak:

unreferenced object 0xffff88801f0a1400 (size 192):
  comm "apparmor_parser", pid 1247, jiffies 4295122827 (age 2306.399s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81ddc612>] __kmem_cache_alloc_node+0x1e2/0x2d0
    [<ffffffff81c47c55>] kmalloc_trace+0x25/0xc0
    [<ffffffff83eb9a12>] aa_alloc_pdb+0x82/0x140
    [<ffffffff83ec4077>] unpack_pdb+0xc7/0x2700
    [<ffffffff83ec6b10>] unpack_profile+0x450/0x4960
    [<ffffffff83ecc129>] aa_unpack+0x309/0x15e0
    [<ffffffff83ebdb23>] aa_replace_profiles+0x213/0x33c0
    [<ffffffff83e8d341>] policy_update+0x261/0x370
    [<ffffffff83e8d66e>] profile_replace+0x20e/0x2a0
    [<ffffffff81eadfaf>] vfs_write+0x2af/0xe00
    [<ffffffff81eaf4c6>] ksys_write+0x126/0x250
    [<ffffffff890fa0b6>] do_syscall_64+0x46/0xf0
    [<ffffffff892000ea>] entry_SYSCALL_64_after_hwframe+0x6e/0x76

Free the pdbs inside aa_free_pdb(). While at it, rename the variable
representing an aa_policydb object to make the function more unified with
aa_pdb_free_kref() and aa_alloc_pdb().

Found by Linux Verification Center (linuxtesting.org).

Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 security/apparmor/policy.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index ed4c9803c8fa..957654d253dd 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -99,13 +99,14 @@ const char *const aa_profile_mode_names[] = {
 };
 
 
-static void aa_free_pdb(struct aa_policydb *policy)
+static void aa_free_pdb(struct aa_policydb *pdb)
 {
-	if (policy) {
-		aa_put_dfa(policy->dfa);
-		if (policy->perms)
-			kvfree(policy->perms);
-		aa_free_str_table(&policy->trans);
+	if (pdb) {
+		aa_put_dfa(pdb->dfa);
+		if (pdb->perms)
+			kvfree(pdb->perms);
+		aa_free_str_table(&pdb->trans);
+		kfree(pdb);
 	}
 }
 
-- 
2.34.1


