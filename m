Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041972DC44
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHV-00007z-Ur; Tue, 13 Jun 2023 08:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8f3O-0004MP-Tp
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 10:45:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEE2462430;
 Mon, 12 Jun 2023 10:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4EAC433EF;
 Mon, 12 Jun 2023 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686566741;
 bh=aJO98WciVZrVlZcCKv5j2euy0SAQyZ/0j96e4FBSwR4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oZstYoY1+IwPBj84Mr1zP4YDtRIv3werVGAJ2+b6CsAytp4SAJPSGU+zc4JlpYmBP
 i0I0UZNtMxsP37aH5z4pL54IcZZ1yygHjAAFPKpFU9x2lRdApQdrTuBFVjz/WeesZ7
 C3h04CZRRWYbEH7sB4n6OEWq6BaO6VbnwTsQzY8j062H/Fz0/sgsOt4zwb1ayIP6fZ
 7cG77M+iHxmvYKtuE/PcT/tB175OdEWjDJjk/JilIiutctTDWoidSZHK1hO15R4iQz
 14MIjGOy5mac9sUGgBUCVdt16OnQDBpiwG4wJs6H+LwyCTwvuMy4yWgpjzdVRTkyEd
 39wCWXoZtMX3Q==
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
Date: Mon, 12 Jun 2023 06:45:20 -0400
Message-Id: <20230612104524.17058-5-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612104524.17058-1-jlayton@kernel.org>
References: <20230612104524.17058-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
Subject: [apparmor] [PATCH v2 4/8] bfs: update ctime in addition to mtime
	when adding entries
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

When adding entries to a directory, POSIX generally requires that the
ctime be updated alongside the mtime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/bfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bfs/dir.c b/fs/bfs/dir.c
index 040d5140e426..d2e8a2a56b05 100644
--- a/fs/bfs/dir.c
+++ b/fs/bfs/dir.c
@@ -294,7 +294,7 @@ static int bfs_add_entry(struct inode *dir, const struct qstr *child, int ino)
 					dir->i_size += BFS_DIRENT_SIZE;
 					dir->i_ctime = current_time(dir);
 				}
-				dir->i_mtime = current_time(dir);
+				dir->i_mtime = dir->i_ctime = current_time(dir);
 				mark_inode_dirty(dir);
 				de->ino = cpu_to_le16((u16)ino);
 				for (i = 0; i < BFS_NAMELEN; i++)
-- 
2.40.1


