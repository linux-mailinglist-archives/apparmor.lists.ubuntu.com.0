Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4187B19E6
	for <lists+apparmor@lfdr.de>; Thu, 28 Sep 2023 13:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qloqY-0004Hl-09; Thu, 28 Sep 2023 11:06:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jlayton@kernel.org>)
 id 1qloqC-0004Do-Gm
 for apparmor@lists.ubuntu.com; Thu, 28 Sep 2023 11:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 621DECE1D22;
 Thu, 28 Sep 2023 11:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E7C433C7;
 Thu, 28 Sep 2023 11:05:51 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 28 Sep 2023 07:03:31 -0400
Message-ID: <20230928110413.33032-81-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 82/87] security/apparmor: convert to new inode {a,
	m}time accessors
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 security/apparmor/apparmorfs.c    | 7 ++++---
 security/apparmor/policy_unpack.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index bd6a910f6528..53a0070ff5df 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -226,7 +226,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = iops ? iops : &simple_dir_inode_operations;
@@ -1557,7 +1557,8 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
 		if (new->dents[i]) {
 			struct inode *inode = d_inode(new->dents[i]);
 
-			inode->i_mtime = inode_set_ctime_current(inode);
+			inode_set_mtime_to_ts(inode,
+					      inode_set_ctime_current(inode));
 		}
 		old->dents[i] = NULL;
 	}
@@ -2543,7 +2544,7 @@ static int aa_mk_null_file(struct dentry *parent)
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
 			   MKDEV(MEM_MAJOR, 3));
 	d_instantiate(dentry, inode);
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 8b8846073e14..913ec8d0eb63 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -89,10 +89,10 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
 		struct inode *inode;
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 	}
 }
 
-- 
2.41.0


