Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7972DC3F
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHW-00008S-IE; Tue, 13 Jun 2023 08:21:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8f3V-0004OF-89
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 10:45:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4954662447;
 Mon, 12 Jun 2023 10:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF9EC4339B;
 Mon, 12 Jun 2023 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686566747;
 bh=KX7S7KoBIOHdIFvOtciMzqUF0ZVLgZ3kkDz1+nuzm5g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oz4WHLbO2jQN18Ove6Yj01Q8O4ys1wPwCmlNiLDNkmgWHI4GseN0zZLHEM92GYoGu
 boxFJi841L5bbyrUSD3RGup9DgX4l4qriaT0pGf+w6tErLMj+72DpzQ0vSvdMBFlbu
 KXSDAZv890DWx+cavMPVeGecLZIAIS0tENSJ08AMARyzUalS9uU1veHX9UzzI6FQoK
 GQ5IcM6JEkKLV02OZ7r4bZ+rjgcKQTK9aoJXpooAwIGA1rf40OBNSpEW02hvFu/dDK
 7SNhtVCZvEX/ybEeXtinwolY6QwBsyPmrCP8B9kIeImVk/kMoxXe8UPrCWqnyVaGqr
 GlER8Exgmr4Sg==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Suren Baghdasaryan <surenb@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Mon, 12 Jun 2023 06:45:22 -0400
Message-Id: <20230612104524.17058-7-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612104524.17058-1-jlayton@kernel.org>
References: <20230612104524.17058-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
Subject: [apparmor] [PATCH v2 6/8] exfat: ensure that ctime is updated
	whenever the mtime is
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

When removing entries from a directory, the ctime must also be updated
alongside the mtime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/exfat/namei.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index e0ff9d156f6f..d9b46fa36bff 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -817,7 +817,7 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 	ei->dir.dir = DIR_DELETED;
 
 	inode_inc_iversion(dir);
-	dir->i_mtime = dir->i_atime = current_time(dir);
+	dir->i_mtime = dir->i_atime = dir->i_ctime = current_time(dir);
 	exfat_truncate_atime(&dir->i_atime);
 	if (IS_DIRSYNC(dir))
 		exfat_sync_inode(dir);
@@ -825,7 +825,7 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 		mark_inode_dirty(dir);
 
 	clear_nlink(inode);
-	inode->i_mtime = inode->i_atime = current_time(inode);
+	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
 	exfat_truncate_atime(&inode->i_atime);
 	exfat_unhash_inode(inode);
 	exfat_d_version_set(dentry, inode_query_iversion(dir));
@@ -979,7 +979,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	ei->dir.dir = DIR_DELETED;
 
 	inode_inc_iversion(dir);
-	dir->i_mtime = dir->i_atime = current_time(dir);
+	dir->i_mtime = dir->i_atime = dir->i_ctime = current_time(dir);
 	exfat_truncate_atime(&dir->i_atime);
 	if (IS_DIRSYNC(dir))
 		exfat_sync_inode(dir);
@@ -988,7 +988,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	drop_nlink(dir);
 
 	clear_nlink(inode);
-	inode->i_mtime = inode->i_atime = current_time(inode);
+	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
 	exfat_truncate_atime(&inode->i_atime);
 	exfat_unhash_inode(inode);
 	exfat_d_version_set(dentry, inode_query_iversion(dir));
-- 
2.40.1


