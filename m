Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E580761C25
	for <lists+apparmor@lfdr.de>; Tue, 25 Jul 2023 16:45:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qOJIH-0000OS-SO; Tue, 25 Jul 2023 14:45:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huawei.com>) id 1qOInx-0003Hi-NY
 for apparmor@lists.ubuntu.com; Tue, 25 Jul 2023 14:14:26 +0000
Received: from dggpeml100024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R9Jsh0Gq7zrRx5;
 Tue, 25 Jul 2023 22:13:28 +0800 (CST)
Received: from hulk-vt.huawei.com (10.67.174.26) by
 dggpeml100024.china.huawei.com (7.185.36.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 22:14:20 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <mike.salvatore@canonical.com>
Date: Tue, 25 Jul 2023 14:12:59 +0000
Message-ID: <20230725141259.233391-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.26]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100024.china.huawei.com (7.185.36.115)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 Jul 2023 14:45:45 +0000
Subject: [apparmor] [PATCH -next] apparmor: cleanup unused functions in
	file.h
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
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

After changes in commit 33bf60cabcc7 ("LSM: Infrastructure management of
the file security"), aa_alloc_file_ctx() and aa_free_file_ctx() are no
longer used, so remove them, and also remove aa_get_file_label() because
it seems that it's never been used before.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/include/file.h | 37 --------------------------------
 1 file changed, 37 deletions(-)

diff --git a/security/apparmor/include/file.h b/security/apparmor/include/file.h
index 5be620af33ba..23cb6f9dbe6e 100644
--- a/security/apparmor/include/file.h
+++ b/security/apparmor/include/file.h
@@ -45,43 +45,6 @@ struct aa_file_ctx {
 	u32 allow;
 };
 
-/**
- * aa_alloc_file_ctx - allocate file_ctx
- * @label: initial label of task creating the file
- * @gfp: gfp flags for allocation
- *
- * Returns: file_ctx or NULL on failure
- */
-static inline struct aa_file_ctx *aa_alloc_file_ctx(struct aa_label *label,
-						    gfp_t gfp)
-{
-	struct aa_file_ctx *ctx;
-
-	ctx = kzalloc(sizeof(struct aa_file_ctx), gfp);
-	if (ctx) {
-		spin_lock_init(&ctx->lock);
-		rcu_assign_pointer(ctx->label, aa_get_label(label));
-	}
-	return ctx;
-}
-
-/**
- * aa_free_file_ctx - free a file_ctx
- * @ctx: file_ctx to free  (MAYBE_NULL)
- */
-static inline void aa_free_file_ctx(struct aa_file_ctx *ctx)
-{
-	if (ctx) {
-		aa_put_label(rcu_access_pointer(ctx->label));
-		kfree_sensitive(ctx);
-	}
-}
-
-static inline struct aa_label *aa_get_file_label(struct aa_file_ctx *ctx)
-{
-	return aa_get_label_rcu(&ctx->label);
-}
-
 /*
  * The xindex is broken into 3 parts
  * - index - an index into either the exec name table or the variable table
-- 
2.34.1


