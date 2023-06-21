Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 544647393D4
	for <lists+apparmor@lfdr.de>; Thu, 22 Jun 2023 02:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qC8Hi-0002VY-HU; Thu, 22 Jun 2023 00:34:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1qBz9a-0001wc-2y
 for apparmor@lists.ubuntu.com; Wed, 21 Jun 2023 14:49:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 143EA6159D;
 Wed, 21 Jun 2023 14:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FB8C433C0;
 Wed, 21 Jun 2023 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687358988;
 bh=9L7A8/A6LFjcabA1gjfSYeoHiy7VK9nCxB9xPTQPT0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mb+pna0LDACr8Gs3OHfYiWOfyO9fFLyB+1ed0LtE3cjVeob0Z64b+z1tNq3zJkQXL
 1EKb/gVprD6ec3dfcMjIYJae+Njg1eVQEWSl5Go1mVLO+v1M2+/QRs05KhFeVF6ztA
 yHu9xCiDpzJSRavYfm7uvpx4F/yxPiNGCjXRvrSg6lBgRYdmcoJOj93+EtUXFvUrqg
 gEeJXmg/eqMCx+26qe136b56eVBKAEucaBbW7Xf+9ZJ7CkVQ5u7Su+XdTjTyK6Cl0r
 SzDe1HIsCf68e2wHRAzrsFvmlwEN/f4tG+m+KDQq6eth67GIYWvFyA51t11YY4tpxa
 3716NO77xi/Zw==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 21 Jun 2023 10:46:29 -0400
Message-ID: <20230621144735.55953-75-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621144735.55953-1-jlayton@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144735.55953-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jun 2023 00:34:46 +0000
Subject: [apparmor] [PATCH 76/79] apparmor: switch to new ctime accessors
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
Cc: apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

In later patches, we're going to change how the ctime.tv_nsec field is
utilized. Switch to using accessor functions instead of raw accesses of
inode->i_ctime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 security/apparmor/apparmorfs.c    | 6 +++---
 security/apparmor/policy_unpack.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 3d0d370d6ffd..8c72a94dd9e3 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -226,7 +226,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_atime = inode->i_mtime = inode_ctime_set_current(inode);
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = iops ? iops : &simple_dir_inode_operations;
@@ -1557,7 +1557,7 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
 		if (new->dents[i]) {
 			struct inode *inode = d_inode(new->dents[i]);
 
-			inode->i_mtime = inode->i_ctime = current_time(inode);
+			inode->i_mtime = inode_ctime_set_current(inode);
 		}
 		old->dents[i] = NULL;
 	}
@@ -2546,7 +2546,7 @@ static int aa_mk_null_file(struct dentry *parent)
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_atime = inode->i_mtime = inode_ctime_set_current(inode);
 	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
 			   MKDEV(MEM_MAJOR, 3));
 	d_instantiate(dentry, inode);
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 4c188a44d65c..334d69b118a9 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -89,10 +89,10 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
 		struct inode *inode;
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
-		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode->i_mtime = inode_ctime_set_current(inode);
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
-		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode->i_mtime = inode_ctime_set_current(inode);
 	}
 }
 
-- 
2.41.0


