Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E302C729E63
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000CL-FX; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7bZw-0007DY-4C
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 12:50:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 387FD61DDC;
 Fri,  9 Jun 2023 12:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95034C433D2;
 Fri,  9 Jun 2023 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686315054;
 bh=sciXKJTuFnUY9nWrxAAZ1qAJ1Cp4ErdvEEiDAODqg/U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=upjyEocqQzinZ+OVD6Khhwt5MbyOvuFlp/sJ6q2j6RvVpNlRvipHKI/hIrIMqgYBh
 l0EIrvQ8CVdV7O7ucm8ag0cZDr4zw8NGa2wTrjrkUxskKo/cb+oqW8dI3ZvsQ++u5z
 hqGm/E6z5CoM1hJrIgICg4S7HJvHENSxp9LYAfwLva2tkkBqJjgQ+eRfpH7K76TpjX
 fkancV079fcU3zROG4KRpBxdmlFg8fJdHC+A8HJdEXMylLCuj+qceg9W78aFJ5KfAL
 wJc5U12Ra6wom5m6Zq4maYyF2JafYOD8LtC23iIBSL+R6yE7LtMCyziYVObahi/C63
 rjGOk8B2rKEwg==
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
Date: Fri,  9 Jun 2023 08:50:22 -0400
Message-Id: <20230609125023.399942-9-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: [apparmor] [PATCH 8/9] apparmor: update ctime whenever the mtime
	changes on an inode
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
 security/apparmor/apparmorfs.c    |  7 +++++--
 security/apparmor/policy_unpack.c | 11 +++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index db7a51acf9db..c06053718836 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1554,8 +1554,11 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
 
 	for (i = 0; i < AAFS_PROF_SIZEOF; i++) {
 		new->dents[i] = old->dents[i];
-		if (new->dents[i])
-			new->dents[i]->d_inode->i_mtime = current_time(new->dents[i]->d_inode);
+		if (new->dents[i]) {
+			struct inode *inode = d_inode(new->dents[i]);
+
+			inode->i_mtime = inode->i_ctime = current_time(inode);
+		}
 		old->dents[i] = NULL;
 	}
 }
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index cf2ceec40b28..48a97c1800b9 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -86,10 +86,13 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
 
 	data->revision = revision;
 	if ((data->dents[AAFS_LOADDATA_REVISION])) {
-		d_inode(data->dents[AAFS_LOADDATA_DIR])->i_mtime =
-			current_time(d_inode(data->dents[AAFS_LOADDATA_DIR]));
-		d_inode(data->dents[AAFS_LOADDATA_REVISION])->i_mtime =
-			current_time(d_inode(data->dents[AAFS_LOADDATA_REVISION]));
+		struct inode *inode;
+
+		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
+		inode->i_mtime = inode->i_ctime = current_time(inode);
+
+		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
+		inode->i_mtime = inode->i_ctime = current_time(inode);
 	}
 }
 
-- 
2.40.1


