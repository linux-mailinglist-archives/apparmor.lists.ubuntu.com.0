Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C7748D03
	for <lists+apparmor@lfdr.de>; Wed,  5 Jul 2023 21:05:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qH7oy-0005Am-Rn; Wed, 05 Jul 2023 19:05:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1qH7ox-0005AW-2t
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 19:05:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E546171D;
 Wed,  5 Jul 2023 19:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6872EC433C8;
 Wed,  5 Jul 2023 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688583945;
 bh=TXSxRuiJHKwV/2Aw+LtmUoK8B39D2LWcTb8UoUWUREI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n1SGksING+sQkSnN9pPB8r2jPmytKLeyeNQ0IzlMjkQkcicrH6T9e8aGRlLggrjhe
 J6B4enXwNi16W4Ah8QPypWlzkFqH/iXM7cWqjd/cNYkaPrP0KaV6hjZrjRKHjCyFZa
 g2DUNicQOhlYpSZciRlbC9RcyVoh9r5mjlOaTey4Yv0cMYJdPGvUaZopG8lTw1zb9a
 EhEBFvnzo8gpXeJGfjhh1EeFc2c3kqZzKxVnRrMxUib82DKwTaZtyo9dmJNp/zS653
 XUtANaW6EQC42ddwpG8D/c+sBtdhPJtoTwMnW/QAxTRUrYUfuFm49RseWr/a2IpHJY
 f5QKpWIh9oHFA==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed,  5 Jul 2023 15:01:54 -0400
Message-ID: <20230705190309.579783-87-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 89/92] apparmor: convert to ctime accessor
	functions
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
Cc: Jan Kara <jack@suse.cz>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

In later patches, we're going to change how the inode's ctime field is
used. Switch to using accessor functions instead of raw accesses of
inode->i_ctime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 security/apparmor/apparmorfs.c    | 6 +++---
 security/apparmor/policy_unpack.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 3d0d370d6ffd..7dbd0a5aaeeb 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -226,7 +226,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = iops ? iops : &simple_dir_inode_operations;
@@ -1557,7 +1557,7 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
 		if (new->dents[i]) {
 			struct inode *inode = d_inode(new->dents[i]);
 
-			inode->i_mtime = inode->i_ctime = current_time(inode);
+			inode->i_mtime = inode_set_ctime_current(inode);
 		}
 		old->dents[i] = NULL;
 	}
@@ -2546,7 +2546,7 @@ static int aa_mk_null_file(struct dentry *parent)
 
 	inode->i_ino = get_next_ino();
 	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
 	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
 			   MKDEV(MEM_MAJOR, 3));
 	d_instantiate(dentry, inode);
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index ed180722a833..8b8846073e14 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -89,10 +89,10 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
 		struct inode *inode;
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
-		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode->i_mtime = inode_set_ctime_current(inode);
 
 		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
-		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode->i_mtime = inode_set_ctime_current(inode);
 	}
 }
 
-- 
2.41.0


