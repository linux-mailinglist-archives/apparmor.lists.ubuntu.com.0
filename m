Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B77797A5CDC
	for <lists+apparmor@lfdr.de>; Tue, 19 Sep 2023 10:47:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qiWOU-0003W4-AY; Tue, 19 Sep 2023 08:47:42 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
 by lists.ubuntu.com with smtp (Exim 4.86_2)
 (envelope-from <kunyu@nfschina.com>) id 1qiPyy-0004Pl-H3
 for apparmor@lists.ubuntu.com; Tue, 19 Sep 2023 01:56:57 +0000
Received: from localhost.localdomain (unknown [219.141.250.2])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 76CBC60292B81;
 Tue, 19 Sep 2023 09:56:25 +0800 (CST)
X-MD-Sfrom: kunyu@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li kunyu <kunyu@nfschina.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Tue, 19 Sep 2023 09:56:08 +0800
Message-Id: <20230919015608.8390-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Tue, 19 Sep 2023 08:47:35 +0000
Subject: [apparmor] [PATCH v2] apparmor/file: Removing unnecessary initial
	values for variable pointers
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
Cc: linux-security-module@vger.kernel.org, Li kunyu <kunyu@nfschina.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

These variable pointers are assigned during use and do not need to be
initialized for assignment.

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 v2: Fix timestamp issues

 security/apparmor/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 698b124e649f..12eafdf18fc0 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -264,7 +264,7 @@ int aa_path_perm(const char *op, struct aa_label *label,
 {
 	struct aa_perms perms = {};
 	struct aa_profile *profile;
-	char *buffer = NULL;
+	char *buffer;
 	int error;
 
 	flags |= PATH_DELEGATE_DELETED | (S_ISDIR(cond->mode) ? PATH_IS_DIR :
@@ -412,7 +412,7 @@ int aa_path_link(struct aa_label *label, struct dentry *old_dentry,
 		d_backing_inode(old_dentry)->i_uid,
 		d_backing_inode(old_dentry)->i_mode
 	};
-	char *buffer = NULL, *buffer2 = NULL;
+	char *buffer, *buffer2;
 	struct aa_profile *profile;
 	int error;
 
-- 
2.18.2


