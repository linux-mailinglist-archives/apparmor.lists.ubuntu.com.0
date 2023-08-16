Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C705877F1F3
	for <lists+apparmor@lfdr.de>; Thu, 17 Aug 2023 10:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qWYE1-0006cq-64; Thu, 17 Aug 2023 08:19:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yuehaibing@huawei.com>) id 1qWGHv-0003H9-64
 for apparmor@lists.ubuntu.com; Wed, 16 Aug 2023 13:10:15 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQpN55RmQzVjvT;
 Wed, 16 Aug 2023 21:08:05 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 21:10:11 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <yuehaibing@huawei.com>
Date: Wed, 16 Aug 2023 21:10:10 +0800
Message-ID: <20230816131010.39320-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Aug 2023 08:19:23 +0000
Subject: [apparmor] [PATCH -next] apparmor: Remove unused declarations
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

Commit f1bd904175e8 ("apparmor: add the base fns() for domain labels")
declared but never implemented aa_label_make_newest().
Commit 98849dff90e2 ("apparmor: rename namespace to ns to improve code line lengths")
declared but never implemented aa_free_ns_kref().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 security/apparmor/include/label.h     | 3 ---
 security/apparmor/include/policy_ns.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/security/apparmor/include/label.h b/security/apparmor/include/label.h
index 2a72e6b17d68..c952a0b07855 100644
--- a/security/apparmor/include/label.h
+++ b/security/apparmor/include/label.h
@@ -288,9 +288,6 @@ struct aa_profile *__aa_label_next_not_in_set(struct label_it *I,
 bool aa_label_remove(struct aa_label *label);
 struct aa_label *aa_label_insert(struct aa_labelset *ls, struct aa_label *l);
 bool aa_label_replace(struct aa_label *old, struct aa_label *new);
-bool aa_label_make_newest(struct aa_labelset *ls, struct aa_label *old,
-			  struct aa_label *new);
-
 struct aa_label *aa_label_find(struct aa_label *l);
 
 struct aa_profile *aa_label_next_in_merge(struct label_it *I,
diff --git a/security/apparmor/include/policy_ns.h b/security/apparmor/include/policy_ns.h
index 33d665516fc1..d52311e86d23 100644
--- a/security/apparmor/include/policy_ns.h
+++ b/security/apparmor/include/policy_ns.h
@@ -86,8 +86,6 @@ const char *aa_ns_name(struct aa_ns *parent, struct aa_ns *child, bool subns);
 void aa_free_ns(struct aa_ns *ns);
 int aa_alloc_root_ns(void);
 void aa_free_root_ns(void);
-void aa_free_ns_kref(struct kref *kref);
-
 struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name);
 struct aa_ns *aa_findn_ns(struct aa_ns *root, const char *name, size_t n);
 struct aa_ns *__aa_lookupn_ns(struct aa_ns *view, const char *hname, size_t n);
-- 
2.34.1


