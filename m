Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1F769F99
	for <lists+apparmor@lfdr.de>; Mon, 31 Jul 2023 19:39:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQWro-00082R-3M; Mon, 31 Jul 2023 17:39:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wangzhu9@huawei.com>) id 1qQQtO-000618-8H
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 11:16:50 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RDwds5NZczrS32;
 Mon, 31 Jul 2023 19:15:45 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 19:16:45 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <apparmor@lists.ubuntu.com>,
 <linux-security-module@vger.kernel.org>
Date: Mon, 31 Jul 2023 19:16:14 +0800
Message-ID: <20230731111614.212113-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 31 Jul 2023 17:39:33 +0000
Subject: [apparmor] [PATCH -next] apparmor: remove kernel-doc warnings
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
Cc: wangzhu9@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Remove kernel-doc warnings:

security/apparmor/lib.c:33: warning: Function parameter or member 't' not
described in 'aa_free_str_table'
security/apparmor/lib.c:33: warning: Excess function parameter 'str'
description in 'aa_free_str_table'
security/apparmor/lib.c:94: warning: Function parameter or member 'n' not
described in 'skipn_spaces'
security/apparmor/lib.c:390: warning: Excess function parameter 'deny'
description in 'aa_check_perms'

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 security/apparmor/lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index a630c951bb3b..01943ec184da 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -27,7 +27,7 @@ struct aa_perms allperms = { .allow = ALL_PERMS_MASK,
 
 /**
  * aa_free_str_table - free entries str table
- * @str: the string table to free  (MAYBE NULL)
+ * @t: the string table to free  (MAYBE NULL)
  */
 void aa_free_str_table(struct aa_str_table *t)
 {
@@ -85,6 +85,7 @@ char *aa_split_fqname(char *fqname, char **ns_name)
 /**
  * skipn_spaces - Removes leading whitespace from @str.
  * @str: The string to be stripped.
+ * @n: Number of spaces to be removed.
  *
  * Returns a pointer to the first non-whitespace character in @str.
  * if all whitespace will return NULL
@@ -371,7 +372,6 @@ int aa_profile_label_perm(struct aa_profile *profile, struct aa_profile *target,
  * @profile: profile being checked
  * @perms: perms computed for the request
  * @request: requested perms
- * @deny: Returns: explicit deny set
  * @sa: initialized audit structure (MAY BE NULL if not auditing)
  * @cb: callback fn for type specific fields (MAY BE NULL)
  *
-- 
2.17.1


