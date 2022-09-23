Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAED5E8F8B
	for <lists+apparmor@lfdr.de>; Sat, 24 Sep 2022 21:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ocB0M-0002Fw-AO; Sat, 24 Sep 2022 19:40:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1obes7-0002Ou-Qi
 for apparmor@lists.ubuntu.com; Fri, 23 Sep 2022 09:21:24 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYmkY2QnXzlXDr;
 Fri, 23 Sep 2022 17:17:09 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:21:18 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Fri, 23 Sep 2022 17:21:18 +0800
Message-ID: <20220923092118.515552-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 24 Sep 2022 19:40:01 +0000
Subject: [apparmor] [PATCH v2] apparmor: Simplify obtain the newest label on
	a cred
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

In aa_get_task_label(), aa_get_newest_cred_label(__task_cred(task))
can do the same things as aa_get_newest_label(__aa_task_raw_label(task)),
so we can replace it and remove __aa_task_raw_label() to simplify the code.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v2:
- Fix the commit message, change simply to simplify. Thanks!
 security/apparmor/include/cred.h | 13 -------------
 security/apparmor/task.c         |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index 0b9ae4804ef7..58fdc72af664 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -63,19 +63,6 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
 	return aa_get_newest_label(aa_cred_raw_label(cred));
 }
 
-/**
- * __aa_task_raw_label - retrieve another task's label
- * @task: task to query  (NOT NULL)
- *
- * Returns: @task's label without incrementing its ref count
- *
- * If @task != current needs to be called in RCU safe critical section
- */
-static inline struct aa_label *__aa_task_raw_label(struct task_struct *task)
-{
-	return aa_cred_raw_label(__task_cred(task));
-}
-
 /**
  * aa_current_raw_label - find the current tasks confining label
  *
diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index 503dc0877fb1..0a8f9fa7ca0a 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -31,7 +31,7 @@ struct aa_label *aa_get_task_label(struct task_struct *task)
 	struct aa_label *p;
 
 	rcu_read_lock();
-	p = aa_get_newest_label(__aa_task_raw_label(task));
+	p = aa_get_newest_cred_label(__task_cred(task));
 	rcu_read_unlock();
 
 	return p;
-- 
2.25.1


