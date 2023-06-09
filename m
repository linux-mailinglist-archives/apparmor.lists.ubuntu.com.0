Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF97729E69
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0U-0000Eq-Sl; Fri, 09 Jun 2023 15:26:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7bZm-0007Bi-8v
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 12:50:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41CD1657CB;
 Fri,  9 Jun 2023 12:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BB7C433EF;
 Fri,  9 Jun 2023 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686315044;
 bh=C+VzTLw0w0g9nKyYEhFUZrnWGPtk5Bk31eEt6nAAZUA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UU0QSo/Tqesjy1sfws4iEFGWbc1aWk7WgTcqFHMP/zkXRbTbKg0RIhASJtBj0wj/O
 94UxGVPWvkUD+lTjh8/pd9mgd1ex2niBDqkSUwU+jS16RmnnrWCOT/J0GvLH9xwn8C
 BWzjzjXPlcUgnEi0SDC56NVC06LBeyXGg6z3Fob14cqan5Np7tRBERq4mJuL79nS7v
 Kv7LWrkcvSwg+6rEeEQkQa2rllPcEmFCl68BWQbd5nrPmAAZiPR8xyXyYEVnXiwVi1
 Ili690n+HfGsH7jEd0Ri/5bbF4tHd8uY0r4EgtCH5FoE3k5hfztlZN3zrioC5MCzG1
 OdbuqepssoZhg==
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
Date: Fri,  9 Jun 2023 08:50:19 -0400
Message-Id: <20230609125023.399942-6-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: [apparmor] [PATCH 5/9] efivarfs: update ctime when mtime changes on
	a write
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
 fs/efivarfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/efivarfs/file.c b/fs/efivarfs/file.c
index d57ee15874f9..375576111dc3 100644
--- a/fs/efivarfs/file.c
+++ b/fs/efivarfs/file.c
@@ -51,7 +51,7 @@ static ssize_t efivarfs_file_write(struct file *file,
 	} else {
 		inode_lock(inode);
 		i_size_write(inode, datasize + sizeof(attributes));
-		inode->i_mtime = current_time(inode);
+		inode->i_mtime = inode->i_ctime = current_time(inode);
 		inode_unlock(inode);
 	}
 
-- 
2.40.1


