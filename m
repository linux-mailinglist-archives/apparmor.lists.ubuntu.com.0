Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF33761C26
	for <lists+apparmor@lfdr.de>; Tue, 25 Jul 2023 16:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qOJIJ-0000OZ-UY; Tue, 25 Jul 2023 14:45:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huawei.com>) id 1qOInd-0003Gt-NE
 for apparmor@lists.ubuntu.com; Tue, 25 Jul 2023 14:14:06 +0000
Received: from dggpeml100024.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R9JqL1f8mzLnwZ;
 Tue, 25 Jul 2023 22:11:26 +0800 (CST)
Received: from hulk-vt.huawei.com (10.67.174.26) by
 dggpeml100024.china.huawei.com (7.185.36.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 22:14:00 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <mike.salvatore@canonical.com>
Date: Tue, 25 Jul 2023 14:12:39 +0000
Message-ID: <20230725141239.233372-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.26]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100024.china.huawei.com (7.185.36.115)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 Jul 2023 14:45:45 +0000
Subject: [apparmor] [PATCH -next] apparmor: cleanup unused declarations in
	policy.h
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

The implementions of these declarations do not exist, remove them all.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/include/policy.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index 545f791cabda..6e5ec9c37b48 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -227,10 +227,6 @@ extern enum profile_mode aa_g_profile_mode;
 #define profiles_ns(P) ((P)->ns)
 #define name_is_shared(A, B) ((A)->hname && (A)->hname == (B)->hname)
 
-void aa_add_profile(struct aa_policy *common, struct aa_profile *profile);
-
-
-void aa_free_proxy_kref(struct kref *kref);
 struct aa_ruleset *aa_alloc_ruleset(gfp_t gfp);
 struct aa_profile *aa_alloc_profile(const char *name, struct aa_proxy *proxy,
 				    gfp_t gfp);
@@ -239,14 +235,12 @@ struct aa_profile *aa_alloc_null(struct aa_profile *parent, const char *name,
 struct aa_profile *aa_new_learning_profile(struct aa_profile *parent, bool hat,
 					   const char *base, gfp_t gfp);
 void aa_free_profile(struct aa_profile *profile);
-void aa_free_profile_kref(struct kref *kref);
 struct aa_profile *aa_find_child(struct aa_profile *parent, const char *name);
 struct aa_profile *aa_lookupn_profile(struct aa_ns *ns, const char *hname,
 				      size_t n);
 struct aa_profile *aa_lookup_profile(struct aa_ns *ns, const char *name);
 struct aa_profile *aa_fqlookupn_profile(struct aa_label *base,
 					const char *fqname, size_t n);
-struct aa_profile *aa_match_profile(struct aa_ns *ns, const char *name);
 
 ssize_t aa_replace_profiles(struct aa_ns *view, struct aa_label *label,
 			    u32 mask, struct aa_loaddata *udata);
-- 
2.34.1


