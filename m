Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5CC83A6E
	for <lists+apparmor@lfdr.de>; Tue, 25 Nov 2025 08:13:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vNnEX-0007F6-7w; Tue, 25 Nov 2025 07:13:05 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vNnET-0007ER-R5
 for apparmor@lists.ubuntu.com; Tue, 25 Nov 2025 07:13:02 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 432261D000AE;
 Tue, 25 Nov 2025 02:13:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 25 Nov 2025 02:13:00 -0500
X-ME-Sender: <xms:-1YlaSAi2t8mYGs2c2i10uAJGUhNmLW4X7Rj96cOofcB69dZDNAIBw>
 <xme:-1YlaSjnnFi_rjUVc1M0sULXgjfGrAJL8gBHOxmGHJdMpNu0C-VPVIr4fMWAmwb8w
 n34Qi4ISTsM3o7QYNfjxDDxyeuMMH184pEtXzwr2HYqRt9dngIZXw>
X-ME-Received: <xmr:-1YlaTNSpa_dzcaWmzH9mWPh0cXkDxJYmgIA13togo3RvJMfdpKUK1uCiUnPwCAzUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedtkeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhephfehhfefgfejueefteejkeeufeeutdfhledtke
 effeefkeetieetgfehheffjeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopedvpd
 hmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdr
 uhgsuhhnthhurdgtohhmpdhrtghpthhtohepmhgvseiihihgohhonhdrphhl
X-ME-Proxy: <xmx:-1Ylab4aHHp7K-Vrh-J2as3P9NpgJij_zrbUlHPj3xCzh5kKCU0DfQ>
 <xmx:-1YlaZ2U7JK5iLZrh_FPoEeFC0eWfR4C2zgNhk_TB5WlHJ7cy5TkQQ>
 <xmx:-1YlaUZAlOBPpcUdbXgWUgTRBuojY07AYj7IqMhtZHL5UYpiIfHPuQ>
 <xmx:-1YlaZD0-qCW5n_ePJroQM4h4_5X81ivnd4yHCk2yuURSW8SUmxd3A>
 <xmx:_FYlaRF_WEupwE63RMaDopTWYJ697X8JGpS2jhaJlnyW4Ocf_G4vKyPj>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 02:12:57 -0500 (EST)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Tue, 25 Nov 2025 08:12:19 +0100
Message-ID: <20251125071219.1977973-1-me@zygoon.pl>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.147; envelope-from=me@zygoon.pl;
 helo=fout-b4-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: synthesize ACCEPT_FLAG_OWNER bits in
	file pdb
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The file PDB implements "owner" checks by either encoding them in one of
two ways. The, historically, more common way was to use DFA accept{1,2}
tables - which are then picked up by the compatibility logic and work
correctly. The new way is to use the permissions table and index it with
a per-DFA-state index stored in the accept1 table. To indicate presence
of owner/non-owner distinction, the accept2 table contains, at each
index, the ACCEPT_FLAG_OWNER bit. This indicates that the permissions
table is twice as large as the number of states in the DFA, and that
each state corresponds with a pair of permissions, not just one. The
even index is used for owner permissions and the odd index is used for
non-owner permissions.

AppArmor parser 4.1.2 can emit a file PDB without the accept2 table
being defined in the binary blob. This causes the kernel to create a
zero-filled accept2 table for compatibility. The rest of the logic
remains intact and in the absence of the ACCEPT_FLAG_OWNER bits, the
kernel grants "owner" permissions to non-owners.

To remedy this problem, when loading the file PDB, if the accept2 table
is missing but the permission table exists and has size compatible with
the owner/non-owner encoding, set the ACCEPT_FLAG_OWNER bit at every
index of the place-holder table.

Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/policy_unpack.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 7523971e37d9c..bbd5ed805c00e 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -710,7 +710,7 @@ static ssize_t unpack_perms_table(struct aa_ext *e, struct aa_perms **perms)
 }
 
 static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
-		      bool required_dfa, bool required_trans,
+		      bool required_dfa, bool required_trans, bool uses_owner,
 		      const char **info)
 {
 	struct aa_policydb *pdb;
@@ -787,6 +787,14 @@ static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
 			*info = "failed to alloc dfa flags table";
 			goto out;
 		}
+		/* The accept1 table is clearly indexing perms table and is twice the
+		 * number of states (as indicated by the base table), so the user/other
+		 * split is in effect - the permissions table has two entries for each
+		 * state. Synthesize the missing owner flag all entries. */
+		if (uses_owner && pdb->size == 2 * pdb->dfa->tables[YYTD_ID_BASE]->td_lolen) {
+			for (u32 i=0; i<noents; i++)
+				pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_data[i] |= ACCEPT_FLAG_OWNER;
+		}
 		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen = noents;
 		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags = tdflags;
 	}
@@ -895,7 +903,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	(void) aa_unpack_str(e, &profile->attach.xmatch_str, "attach");
 
 	/* xmatch is optional and may be NULL */
-	error = unpack_pdb(e, &profile->attach.xmatch, false, false, &info);
+	error = unpack_pdb(e, &profile->attach.xmatch, false, false, false, &info);
 	if (error) {
 		info = "bad xmatch";
 		goto fail;
@@ -1028,7 +1036,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	if (aa_unpack_nameX(e, AA_STRUCT, "policydb")) {
 		/* generic policy dfa - optional and may be NULL */
 		info = "failed to unpack policydb";
-		error = unpack_pdb(e, &rules->policy, true, false,
+		error = unpack_pdb(e, &rules->policy, true, false, false,
 				   &info);
 		if (error)
 			goto fail;
@@ -1053,7 +1061,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 		rules->policy = aa_get_pdb(nullpdb);
 	}
 	/* get file rules */
-	error = unpack_pdb(e, &rules->file, false, true, &info);
+	error = unpack_pdb(e, &rules->file, false, true, true, &info);
 	if (error) {
 		goto fail;
 	} else if (rules->file->dfa) {
-- 
2.52.0


