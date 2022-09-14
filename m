Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEE5B9D1D
	for <lists+apparmor@lfdr.de>; Thu, 15 Sep 2022 16:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oYpsN-0003bE-1u; Thu, 15 Sep 2022 14:29:59 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huawei.com>) id 1oYN9U-0004r7-Ht
 for apparmor@lists.ubuntu.com; Wed, 14 Sep 2022 07:49:45 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MSC7B06xcz14QPP;
 Wed, 14 Sep 2022 15:45:42 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 15:49:39 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>
Date: Wed, 14 Sep 2022 15:46:07 +0800
Message-ID: <20220914074607.194838-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 15 Sep 2022 14:29:57 +0000
Subject: [apparmor] [PATCH] apparmor: make __aa_path_perm() static
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Make __aa_path_perm() static as it's only used inside apparmor/file.c.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/file.c         | 6 +++---
 security/apparmor/include/file.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index e1b7e93602e4..14f7d7ef3f54 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -265,9 +265,9 @@ unsigned int aa_str_perms(struct aa_dfa *dfa, unsigned int start,
 	return state;
 }
 
-int __aa_path_perm(const char *op, struct aa_profile *profile, const char *name,
-		   u32 request, struct path_cond *cond, int flags,
-		   struct aa_perms *perms)
+static int __aa_path_perm(const char *op, struct aa_profile *profile, const char *name,
+			  u32 request, struct path_cond *cond, int flags,
+			  struct aa_perms *perms)
 {
 	int e = 0;
 
diff --git a/security/apparmor/include/file.h b/security/apparmor/include/file.h
index 029cb20e322d..17dca3502230 100644
--- a/security/apparmor/include/file.h
+++ b/security/apparmor/include/file.h
@@ -189,9 +189,6 @@ unsigned int aa_str_perms(struct aa_dfa *dfa, unsigned int start,
 			  const char *name, struct path_cond *cond,
 			  struct aa_perms *perms);
 
-int __aa_path_perm(const char *op, struct aa_profile *profile,
-		   const char *name, u32 request, struct path_cond *cond,
-		   int flags, struct aa_perms *perms);
 int aa_path_perm(const char *op, struct aa_label *label,
 		 const struct path *path, int flags, u32 request,
 		 struct path_cond *cond);
-- 
2.17.1


