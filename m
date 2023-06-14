Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F1729E60
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000CE-Cc; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7bZZ-00078a-0N
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 12:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01CFD657CD;
 Fri,  9 Jun 2023 12:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54684C4339B;
 Fri,  9 Jun 2023 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686315031;
 bh=hip9OBUVCq8AfrEVIdBD05U3CyPcXD5Vb4CyWwwRC3g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MQ2ViBoypaWzJIm06BN1Xtsc/qeOFaexGyEEzNtKJanH5XPHZxMVbuSDV1uAyIlU4
 rbodYRn8EcF+Q2AmfEqxjK7GyHJZ2xmWDBv1YsyfbjumzmCz2ByL26u2fyUJCnJyod
 ibAOulu974oShLTpyfIEQf8A+54+tiXxg6MGRxQ9DNbTpaIyAjs8D6Y/W/bkDdNGRT
 7joDEb/mbY7zrdmS5a0kILBHqLOieXmoNm+OsvaoWwBM+YMYKzDsdQU6+0cmvS+0Nt
 VEyOYqKAm0U6WIgIpUsgZP+1Y5vqalcMonrvL1MjdTosq1Ge33JXn61E1c8Ah6Ha2S
 pCTPEiryNspJw==
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
Date: Fri,  9 Jun 2023 08:50:15 -0400
Message-Id: <20230609125023.399942-2-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: [apparmor] [PATCH 1/9] ibmvmc: update ctime in conjunction with
	mtime on write
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

When updating the mtime for a write, you must always update the ctime as
well.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/misc/ibmvmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
index cbaf6d35e854..d7c7f0305257 100644
--- a/drivers/misc/ibmvmc.c
+++ b/drivers/misc/ibmvmc.c
@@ -1124,7 +1124,7 @@ static ssize_t ibmvmc_write(struct file *file, const char *buffer,
 		goto out;
 
 	inode = file_inode(file);
-	inode->i_mtime = current_time(inode);
+	inode->i_mtime = inode->i_ctime = current_time(inode);
 	mark_inode_dirty(inode);
 
 	dev_dbg(adapter->dev, "write: file = 0x%lx, count = 0x%lx\n",
-- 
2.40.1


