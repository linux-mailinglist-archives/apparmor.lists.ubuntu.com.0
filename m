Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DF6076D4
	for <lists+apparmor@lfdr.de>; Fri, 21 Oct 2022 14:21:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1olr24-0007Vq-Aw; Fri, 21 Oct 2022 12:21:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huawei.com>) id 1oloV7-0000qr-Py
 for apparmor@lists.ubuntu.com; Fri, 21 Oct 2022 09:39:38 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mtzp02GvDz15Lwd;
 Fri, 21 Oct 2022 17:34:48 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:39:34 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <serge@hallyn.com>
Date: Fri, 21 Oct 2022 17:36:02 +0800
Message-ID: <20221021093602.102839-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Oct 2022 12:21:46 +0000
Subject: [apparmor] [PATCH] apparmor: Fix memleak issue in unpack_profile()
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

Before aa_alloc_profile(), it has allocated string for @*ns_name if @tmpns
is not NULL, so directly return -ENOMEM if aa_alloc_profile() failed will
cause a memleak issue, and even if aa_alloc_profile() succeed, in the
@fail_profile tag of aa_unpack(), it need to free @ns_name as well, this
patch fixes them.

Fixes: 736ec752d95e ("AppArmor: policy routines for loading and unpacking policy")
Fixes: 04dc715e24d0 ("apparmor: audit policy ns specified in policy load")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/policy_unpack.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 2e028d540c6b..1bf8cfb8700a 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -858,8 +858,11 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	}
 
 	profile = aa_alloc_profile(name, NULL, GFP_KERNEL);
-	if (!profile)
-		return ERR_PTR(-ENOMEM);
+	if (!profile) {
+		info = "out of memory";
+		error = -ENOMEM;
+		goto fail;
+	}
 	rules = list_first_entry(&profile->rules, typeof(*rules), list);
 
 	/* profile renaming is optional */
@@ -1090,6 +1093,10 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	if (error == 0)
 		/* default error covers most cases */
 		error = -EPROTO;
+	if (*ns_name) {
+		kfree(*ns_name);
+		*ns_name = NULL;
+	}
 	if (profile)
 		name = NULL;
 	else if (!name)
@@ -1392,6 +1399,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 {
 	struct aa_load_ent *tmp, *ent;
 	struct aa_profile *profile = NULL;
+	char *ns_name = NULL;
 	int error;
 	struct aa_ext e = {
 		.start = udata->data,
@@ -1401,7 +1409,6 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 
 	*ns = NULL;
 	while (e.pos < e.end) {
-		char *ns_name = NULL;
 		void *start;
 		error = verify_header(&e, e.pos == e.start, ns);
 		if (error)
@@ -1432,6 +1439,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 
 		ent->new = profile;
 		ent->ns_name = ns_name;
+		ns_name = NULL;
 		list_add_tail(&ent->list, lh);
 	}
 	udata->abi = e.version & K_ABI_MASK;
@@ -1452,6 +1460,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 	return 0;
 
 fail_profile:
+	kfree(ns_name);
 	aa_put_profile(profile);
 
 fail:
-- 
2.17.1


