Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 484356A8BF0
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003tZ-2B; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYC-0005Pj-Fp
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xBLSlmQtAyz0qvRsNFvWuwWpKiVVHBEV1aJjBlE0tQE=; b=4T8dlcCaoBdPNTMUrPR4ZbnWKQ
 U/IiQYDF39ySJMrN6t8k85pINxzuzMBynHpatoaVq6IXt382QmOz4MCgHXk4gQyssT+L2V6r2Xgp0
 mHMRuBldnqbFgWlOBCQJ3Wr1Se7TbGQGcfyx4FUCT8tHP9Yz7384pJlViVAMhMm1yVlDrykvbhx8A
 oDhxb2B5OrxGxRGCsnlNBqirlR8fG48v1/jZurECPr7nqG8Ax/uhyLvYwpFRcqf/eGQvfIOCYuLVY
 kjnFShUFiauUdPpIKvVPSmPerkyLZy0SUhMx1g5sR934vN3pnwjtbVdx3dtsOvNTV+bIB+yvThhWJ
 e44/VfRA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXR-003Fx9-Rz; Thu, 02 Mar 2023 20:28:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:16 -0800
Message-Id: <20230302202826.776286-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 01/11] proc_sysctl: update docs for
	__register_sysctl_table()
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Update the docs for __register_sysctl_table() to make it clear no child
entries can be passed. When the child is true these are non-leaf entries
on the ctl table and sysctl treats these as directories. The point to
__register_sysctl_table() is to deal only with directories not part of
the ctl table where thay may riside, to be simple and avoid recursion.

While at it, hint towards using long on extra1 and extra2 later.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/proc/proc_sysctl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 5851eb5bc726..1df0beb50dbe 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1287,7 +1287,7 @@ static int insert_links(struct ctl_table_header *head)
  * __register_sysctl_table - register a leaf sysctl table
  * @set: Sysctl tree to register on
  * @path: The path to the directory the sysctl table is in.
- * @table: the top-level table structure
+ * @table: the top-level table structure without any child
  *
  * Register a sysctl table hierarchy. @table should be a filled in ctl_table
  * array. A completely 0 filled entry terminates the table.
@@ -1308,9 +1308,12 @@ static int insert_links(struct ctl_table_header *head)
  * proc_handler - the text handler routine (described below)
  *
  * extra1, extra2 - extra pointers usable by the proc handler routines
+ * XXX: we should eventually modify these to use long min / max [0]
+ * [0] https://lkml.kernel.org/87zgpte9o4.fsf@email.froward.int.ebiederm.org
  *
  * Leaf nodes in the sysctl tree will be represented by a single file
- * under /proc; non-leaf nodes will be represented by directories.
+ * under /proc; non-leaf nodes (where child is not NULL) are not allowed,
+ * sysctl_check_table() verifies this.
  *
  * There must be a proc_handler routine for any terminal nodes.
  * Several default handlers are available to cover common cases -
@@ -1352,7 +1355,7 @@ struct ctl_table_header *__register_sysctl_table(
 
 	spin_lock(&sysctl_lock);
 	dir = &set->dir;
-	/* Reference moved down the diretory tree get_subdir */
+	/* Reference moved down the directory tree get_subdir */
 	dir->header.nreg++;
 	spin_unlock(&sysctl_lock);
 
@@ -1369,6 +1372,11 @@ struct ctl_table_header *__register_sysctl_table(
 		if (namelen == 0)
 			continue;
 
+		/*
+		 * namelen ensures if name is "foo/bar/yay" only foo is
+		 * registered first. We traverse as if using mkdir -p and
+		 * return a ctl_dir for the last directory entry.
+		 */
 		dir = get_subdir(dir, name, namelen);
 		if (IS_ERR(dir))
 			goto fail;
-- 
2.39.1


