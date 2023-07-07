Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040D74AC81
	for <lists+apparmor@lfdr.de>; Fri,  7 Jul 2023 10:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHgVI-0001Ii-5Y; Fri, 07 Jul 2023 08:07:48 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1qHgVE-0001IX-Ux
 for apparmor@lists.ubuntu.com; Fri, 07 Jul 2023 08:07:45 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vmnlo8x_1688717258; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vmnlo8x_1688717258) by smtp.aliyun-inc.com;
 Fri, 07 Jul 2023 16:07:39 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Fri,  7 Jul 2023 16:07:37 +0800
Message-Id: <20230707080737.49899-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] apparmor: Fix some kernel-doc comments
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Use colons to separate parameter names from their specific meanings.
silencethe warnings:

security/apparmor/resource.c:111: warning: Function parameter or member 'label' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or member 'task' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or member 'resource' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:111: warning: Function parameter or member 'new_rlim' not described in 'aa_task_setrlimit'

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
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
2.20.1.7.g153144c


