Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808B73CDB6
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKI-0002Gg-Ds; Sun, 25 Jun 2023 01:14:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEKB-0002Dl-9k
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:55 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QpXz618rhzTl98;
 Sun, 25 Jun 2023 09:13:06 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:52 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:46 +0800
Message-ID: <20230625011349.1457810-9-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
References: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Subject: [apparmor] [PATCH -next 08/11] apparmor: Fix kernel-doc warnings in
	apparmor/resource.c
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

Fix kernel-doc warnings:

security/apparmor/resource.c:111: warning: Function parameter or
member 'label' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or
member 'new_rlim' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or
member 'resource' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or
member 'task' not described in 'aa_task_setrlimit'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/resource.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
index e85948164896..2bebc5d9e741 100644
--- a/security/apparmor/resource.c
+++ b/security/apparmor/resource.c
@@ -97,10 +97,10 @@ static int profile_setrlimit(struct aa_profile *profile, unsigned int resource,
 
 /**
  * aa_task_setrlimit - test permission to set an rlimit
- * @label - label confining the task  (NOT NULL)
- * @task - task the resource is being set on
- * @resource - the resource being set
- * @new_rlim - the new resource limit  (NOT NULL)
+ * @label: label confining the task  (NOT NULL)
+ * @task: task the resource is being set on
+ * @resource: the resource being set
+ * @new_rlim: the new resource limit  (NOT NULL)
  *
  * Control raising the processes hard limit.
  *
-- 
2.25.1


