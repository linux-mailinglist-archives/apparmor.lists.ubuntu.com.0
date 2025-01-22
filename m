Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD27A18D69
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpJ-00040z-Km; Wed, 22 Jan 2025 08:11:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <arnd@kernel.org>) id 1taUeT-0003pe-E1
 for apparmor@lists.ubuntu.com; Wed, 22 Jan 2025 06:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D9DD2A41B1A;
 Wed, 22 Jan 2025 06:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4DAC4CEE2;
 Wed, 22 Jan 2025 06:55:46 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 22 Jan 2025 07:55:35 +0100
Message-Id: <20250122065543.1515519-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91; envelope-from=arnd@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:04 +0000
Subject: [apparmor] [PATCH] apparmor: remove unused variable
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 Colin Ian King <colin.i.king@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Arnd Bergmann <arnd@arndb.de>

The local 'sock' variable has become unused after a change to the
aa_sock_file_perm() calling conventions:

security/apparmor/file.c: In function '__file_sock_perm':
security/apparmor/file.c:544:24: error: unused variable 'sock' [-Werror=unused-variable]
  544 |         struct socket *sock = (struct socket *) file->private_data;

Remove it here.

Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 security/apparmor/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 85f89814af1e..e3a858649942 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -541,11 +541,8 @@ static int __file_sock_perm(const char *op, const struct cred *subj_cred,
 			    struct aa_label *flabel, struct file *file,
 			    u32 request, u32 denied)
 {
-	struct socket *sock = (struct socket *) file->private_data;
 	int error;
 
-	AA_BUG(!sock);
-
 	/* revalidation due to label out of date. No revocation at this time */
 	if (!denied && aa_label_is_subset(flabel, label))
 		return 0;
-- 
2.39.5


