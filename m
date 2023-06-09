Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C6729E6B
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000CS-J2; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7bZz-0007Do-E3
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 12:50:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84994657C6;
 Fri,  9 Jun 2023 12:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30E6C433EF;
 Fri,  9 Jun 2023 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686315058;
 bh=eQm6Y+zTu/uz0gwuTj+8cXTLw76brE6hz27OGkmXwSQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pL17Ys+xev2bf3DDW+7xcYfJAWx7z6K4f31/nAb0ZLsLdhs2bbtFi6cMZVPnRkQKB
 DzV0rko+fDQw+TcIOqaFCZkOCSjdfNJ41ZsqHDE0BrCOrVG1Isuy0TO32aszsuIwLr
 0RSGldhjy7+CGAZxopzTDZn9gyBdZ1CPs4ydVMZ+x6xnu8w7EeGL/YEVW9x/oCeesT
 FgJEpqx3Z1RswS8CDghuaD3WXy+canYVY3bCj3Zf0moLeHj7fdPbrXxOpjxvxIC/mR
 QBcmiIhDE+t/j1iYfJTgMz2pte5jTLIS91rLs7dN00EDoGYcrW8MlgX3v/52Y/jPo7
 ds+6I+rxYQ9rg==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Suren Baghdasaryan <surenb@google.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
Date: Fri,  9 Jun 2023 08:50:23 -0400
Message-Id: <20230609125023.399942-10-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: [apparmor] [PATCH 9/9] cifs: update the ctime on a partial page
	write
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

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index df88b8c04d03..a00038a326cf 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2596,7 +2596,7 @@ static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
 					   write_data, to - from, &offset);
 		cifsFileInfo_put(open_file);
 		/* Does mm or vfs already set times? */
-		inode->i_atime = inode->i_mtime = current_time(inode);
+		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		if ((bytes_written > 0) && (offset))
 			rc = 0;
 		else if (bytes_written < 0)
-- 
2.40.1


