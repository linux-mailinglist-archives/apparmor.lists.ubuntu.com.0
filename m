Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64C6A8BF8
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWa-0003yb-Bv; Thu, 02 Mar 2023 22:35:44 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpY9-0005OX-Vj
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/B53CtexeyD9Bd10s0zaJAUsHZrSjOaoezyvPxx8LTk=; b=kRovkSM5K1GhgJjJe0utOQ9MZY
 hpy6mdK+hdW7jylca3OqRuGOqomE9o3CJgh4EGuz6lp4VM+DigRs+oMJLZbx1vPfYAJGYvE/AZwdR
 zZMqIaZw9YNZrnir2UYXxGBYxi/AOSq6sF5ZDXLpiyr8lp6UjqhN/VKoOTg8OCGk9qa6qaxPQ/cFv
 /zAiY16rKO6TLzH1g2wL004PtEqFK9PR7b5zQiS749hfGIwUIGGJkzbEseFVd7V08//at3INtBAsB
 ehall8mmM0GZyxzilQRwnIGiLlRqdOFLBF5J1OIcHnXiivobw3jlcxCB7V9Z2lFMd/l7y5EuA2dCg
 f+aooOFA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXR-003FxB-Uq; Thu, 02 Mar 2023 20:28:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:17 -0800
Message-Id: <20230302202826.776286-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 02/11] proc_sysctl: move helper which creates
	required subdirectories
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

Move the code which creates the subdirectories for a ctl table
into a helper routine so to make it easier to review. Document
the goal.

This creates no functional changes.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/proc/proc_sysctl.c | 56 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 1df0beb50dbe..6b9b2694d430 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1283,6 +1283,35 @@ static int insert_links(struct ctl_table_header *head)
 	return err;
 }
 
+/* Find the directory for the ctl_table. If one is not found create it. */
+static struct ctl_dir *sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
+{
+	const char *name, *nextname;
+
+	for (name = path; name; name = nextname) {
+		int namelen;
+		nextname = strchr(name, '/');
+		if (nextname) {
+			namelen = nextname - name;
+			nextname++;
+		} else {
+			namelen = strlen(name);
+		}
+		if (namelen == 0)
+			continue;
+
+		/*
+		 * namelen ensures if name is "foo/bar/yay" only foo is
+		 * registered first. We traverse as if using mkdir -p and
+		 * return a ctl_dir for the last directory entry.
+		 */
+		dir = get_subdir(dir, name, namelen);
+		if (IS_ERR(dir))
+			break;
+	}
+	return dir;
+}
+
 /**
  * __register_sysctl_table - register a leaf sysctl table
  * @set: Sysctl tree to register on
@@ -1334,7 +1363,6 @@ struct ctl_table_header *__register_sysctl_table(
 {
 	struct ctl_table_root *root = set->dir.header.root;
 	struct ctl_table_header *header;
-	const char *name, *nextname;
 	struct ctl_dir *dir;
 	struct ctl_table *entry;
 	struct ctl_node *node;
@@ -1359,29 +1387,9 @@ struct ctl_table_header *__register_sysctl_table(
 	dir->header.nreg++;
 	spin_unlock(&sysctl_lock);
 
-	/* Find the directory for the ctl_table */
-	for (name = path; name; name = nextname) {
-		int namelen;
-		nextname = strchr(name, '/');
-		if (nextname) {
-			namelen = nextname - name;
-			nextname++;
-		} else {
-			namelen = strlen(name);
-		}
-		if (namelen == 0)
-			continue;
-
-		/*
-		 * namelen ensures if name is "foo/bar/yay" only foo is
-		 * registered first. We traverse as if using mkdir -p and
-		 * return a ctl_dir for the last directory entry.
-		 */
-		dir = get_subdir(dir, name, namelen);
-		if (IS_ERR(dir))
-			goto fail;
-	}
-
+	dir = sysctl_mkdir_p(dir, path);
+	if (IS_ERR(dir))
+		goto fail;
 	spin_lock(&sysctl_lock);
 	if (insert_header(dir, header))
 		goto fail_put_dir_locked;
-- 
2.39.1


