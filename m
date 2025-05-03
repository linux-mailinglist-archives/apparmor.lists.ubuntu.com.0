Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C1AA7E7E
	for <lists+apparmor@lfdr.de>; Sat,  3 May 2025 06:49:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uB4oZ-00055v-Dx; Sat, 03 May 2025 04:49:27 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rdunlap@infradead.org>)
 id 1uB4oX-00055Z-2m
 for apparmor@lists.ubuntu.com; Sat, 03 May 2025 04:49:25 +0000
Received: from [50.39.124.201] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uB4oS-00000003UxL-2jDO; Sat, 03 May 2025 04:49:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  2 May 2025 21:49:19 -0700
Message-ID: <20250503044919.2251962-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.137.202.133;
 envelope-from=rdunlap@infradead.org; helo=bombadil.infradead.org
Subject: [apparmor] [PATCH v2] apparmor: fix some kernel-doc issues in
	header files
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
Cc: Paul Moore <paul@paul-moore.com>, John Johansen <john@apparmor.net>,
 Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix kernel-doc warnings in apparmor header files as reported by
scripts/kernel-doc:

cred.h:128: warning: expecting prototype for end_label_crit_section(). Prototype was for end_current_label_crit_section() instead
file.h:108: warning: expecting prototype for aa_map_file_perms(). Prototype was for aa_map_file_to_perms() instead

lib.h:159: warning: Function parameter or struct member 'hname' not described in 'basename'
lib.h:159: warning: Excess function parameter 'name' description in 'basename'

match.h:21: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * The format used for transition tables is based on the GNU flex table

perms.h:109: warning: Function parameter or struct member 'accum' not described in 'aa_perms_accum_raw'
perms.h:109: warning: Function parameter or struct member 'addend' not described in 'aa_perms_accum_raw'
perms.h:136: warning: Function parameter or struct member 'accum' not described in 'aa_perms_accum'
perms.h:136: warning: Function parameter or struct member 'addend' not described in 'aa_perms_accum'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Ryan Lee <ryan.lee@canonical.com>
Cc: John Johansen <john.johansen@canonical.com>
Cc: John Johansen <john@apparmor.net>
Cc: apparmor@lists.ubuntu.com
Cc: linux-security-module@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
v2: add better commit message (Ryan)

 security/apparmor/include/cred.h  |    2 +-
 security/apparmor/include/file.h  |    2 +-
 security/apparmor/include/lib.h   |    2 +-
 security/apparmor/include/match.h |    2 +-
 security/apparmor/include/perms.h |    8 ++++----
 5 files changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20250501.orig/security/apparmor/include/cred.h
+++ linux-next-20250501/security/apparmor/include/cred.h
@@ -117,7 +117,7 @@ static inline struct aa_label *aa_get_cu
 #define __end_current_label_crit_section(X) end_current_label_crit_section(X)
 
 /**
- * end_label_crit_section - put a reference found with begin_current_label..
+ * end_current_label_crit_section - put a reference found with begin_current_label..
  * @label: label reference to put
  *
  * Should only be used with a reference obtained with
--- linux-next-20250501.orig/security/apparmor/include/file.h
+++ linux-next-20250501/security/apparmor/include/file.h
@@ -104,7 +104,7 @@ void aa_inherit_files(const struct cred
 
 
 /**
- * aa_map_file_perms - map file flags to AppArmor permissions
+ * aa_map_file_to_perms - map file flags to AppArmor permissions
  * @file: open file to map flags to AppArmor permissions
  *
  * Returns: apparmor permission set for the file
--- linux-next-20250501.orig/security/apparmor/include/lib.h
+++ linux-next-20250501/security/apparmor/include/lib.h
@@ -170,7 +170,7 @@ struct aa_policy {
 
 /**
  * basename - find the last component of an hname
- * @name: hname to find the base profile name component of  (NOT NULL)
+ * @hname: hname to find the base profile name component of  (NOT NULL)
  *
  * Returns: the tail (base profile name) name component of an hname
  */
--- linux-next-20250501.orig/security/apparmor/include/match.h
+++ linux-next-20250501/security/apparmor/include/match.h
@@ -17,7 +17,7 @@
 #define DFA_START			1
 
 
-/**
+/*
  * The format used for transition tables is based on the GNU flex table
  * file format (--tables-file option; see Table File Format in the flex
  * info pages and the flex sources for documentation). The magic number
--- linux-next-20250501.orig/security/apparmor/include/perms.h
+++ linux-next-20250501/security/apparmor/include/perms.h
@@ -101,8 +101,8 @@ extern struct aa_perms allperms;
 
 /**
  * aa_perms_accum_raw - accumulate perms with out masking off overlapping perms
- * @accum - perms struct to accumulate into
- * @addend - perms struct to add to @accum
+ * @accum: perms struct to accumulate into
+ * @addend: perms struct to add to @accum
  */
 static inline void aa_perms_accum_raw(struct aa_perms *accum,
 				      struct aa_perms *addend)
@@ -128,8 +128,8 @@ static inline void aa_perms_accum_raw(st
 
 /**
  * aa_perms_accum - accumulate perms, masking off overlapping perms
- * @accum - perms struct to accumulate into
- * @addend - perms struct to add to @accum
+ * @accum: perms struct to accumulate into
+ * @addend: perms struct to add to @accum
  */
 static inline void aa_perms_accum(struct aa_perms *accum,
 				  struct aa_perms *addend)

