Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E9777B82
	for <lists+apparmor@lfdr.de>; Thu, 10 Aug 2023 17:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qU7BG-0000Op-P4; Thu, 10 Aug 2023 15:02:30 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huaweicloud.com>) id 1qU4VQ-0006uj-LB
 for apparmor@lists.ubuntu.com; Thu, 10 Aug 2023 12:11:09 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RM5P16XbNz4f4Fn8
 for <apparmor@lists.ubuntu.com>; Thu, 10 Aug 2023 20:11:01 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.26])
 by APP4 (Coremail) with SMTP id gCh0CgA3x6nV09RkLBWGAQ--.14819S4;
 Thu, 10 Aug 2023 20:11:03 +0800 (CST)
From: Xiu Jianfeng <xiujianfeng@huaweicloud.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Thu, 10 Aug 2023 20:10:56 +0000
Message-Id: <20230810201056.429575-1-xiujianfeng@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgA3x6nV09RkLBWGAQ--.14819S4
X-Coremail-Antispam: 1UD129KBjvJXoWxur47AFW5GF48XF47Zw1kXwb_yoW5CF15pa
 nayasxJF4xKF1Fvw1DXr17C34a9r4rKr1ay398W3WSyFsIgw1kCFWFkr10934Fyry8Aryx
 XFsF9Fs5A3ZrXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
 8lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_
 Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gc
 CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
 r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
 Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0VnQUUUUUU==
X-CM-SenderInfo: x0lxyxpdqiv03j6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Aug 2023 15:02:29 +0000
Subject: [apparmor] [PATCH -next] apparmor: remove unused functions in
	policy_ns.c/.h
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

From: Xiu Jianfeng <xiujianfeng@huawei.com>

These functions are not used now, remove them.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/include/policy_ns.h | 14 ----------
 security/apparmor/policy_ns.c         | 37 ---------------------------
 2 files changed, 51 deletions(-)

diff --git a/security/apparmor/include/policy_ns.h b/security/apparmor/include/policy_ns.h
index 33d665516fc1..d646070fd966 100644
--- a/security/apparmor/include/policy_ns.h
+++ b/security/apparmor/include/policy_ns.h
@@ -86,10 +86,7 @@ const char *aa_ns_name(struct aa_ns *parent, struct aa_ns *child, bool subns);
 void aa_free_ns(struct aa_ns *ns);
 int aa_alloc_root_ns(void);
 void aa_free_root_ns(void);
-void aa_free_ns_kref(struct kref *kref);
 
-struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name);
-struct aa_ns *aa_findn_ns(struct aa_ns *root, const char *name, size_t n);
 struct aa_ns *__aa_lookupn_ns(struct aa_ns *view, const char *hname, size_t n);
 struct aa_ns *aa_lookupn_ns(struct aa_ns *view, const char *name, size_t n);
 struct aa_ns *__aa_find_or_create_ns(struct aa_ns *parent, const char *name,
@@ -151,15 +148,4 @@ static inline struct aa_ns *__aa_find_ns(struct list_head *head,
 	return __aa_findn_ns(head, name, strlen(name));
 }
 
-static inline struct aa_ns *__aa_lookup_ns(struct aa_ns *base,
-					   const char *hname)
-{
-	return __aa_lookupn_ns(base, hname, strlen(hname));
-}
-
-static inline struct aa_ns *aa_lookup_ns(struct aa_ns *view, const char *name)
-{
-	return aa_lookupn_ns(view, name, strlen(name));
-}
-
 #endif /* AA_NAMESPACE_H */
diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
index fd5b7afbcb48..1f02cfe1d974 100644
--- a/security/apparmor/policy_ns.c
+++ b/security/apparmor/policy_ns.c
@@ -159,43 +159,6 @@ void aa_free_ns(struct aa_ns *ns)
 	kfree_sensitive(ns);
 }
 
-/**
- * aa_findn_ns  -  look up a profile namespace on the namespace list
- * @root: namespace to search in  (NOT NULL)
- * @name: name of namespace to find  (NOT NULL)
- * @n: length of @name
- *
- * Returns: a refcounted namespace on the list, or NULL if no namespace
- *          called @name exists.
- *
- * refcount released by caller
- */
-struct aa_ns *aa_findn_ns(struct aa_ns *root, const char *name, size_t n)
-{
-	struct aa_ns *ns = NULL;
-
-	rcu_read_lock();
-	ns = aa_get_ns(__aa_findn_ns(&root->sub_ns, name, n));
-	rcu_read_unlock();
-
-	return ns;
-}
-
-/**
- * aa_find_ns  -  look up a profile namespace on the namespace list
- * @root: namespace to search in  (NOT NULL)
- * @name: name of namespace to find  (NOT NULL)
- *
- * Returns: a refcounted namespace on the list, or NULL if no namespace
- *          called @name exists.
- *
- * refcount released by caller
- */
-struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name)
-{
-	return aa_findn_ns(root, name, strlen(name));
-}
-
 /**
  * __aa_lookupn_ns - lookup the namespace matching @hname
  * @view: namespace to search in  (NOT NULL)
-- 
2.34.1


