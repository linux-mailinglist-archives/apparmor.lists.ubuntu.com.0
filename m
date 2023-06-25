Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B173CDB5
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKN-0002LT-Aa; Sun, 25 Jun 2023 01:14:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEKC-0002E0-46
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:56 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QpXz65myvzTl0T;
 Sun, 25 Jun 2023 09:13:06 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:53 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:48 +0800
Message-ID: <20230625011349.1457810-11-cuigaosheng1@huawei.com>
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
Subject: [apparmor] [PATCH -next 10/11] apparmor: Fix kernel-doc warnings in
	apparmor/policy_compat.c
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

security/apparmor/policy_compat.c:151: warning: Function parameter
or member 'size' not described in 'compute_fperms'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/policy_compat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/apparmor/policy_compat.c b/security/apparmor/policy_compat.c
index 0cb02da8a319..18e4ddccf623 100644
--- a/security/apparmor/policy_compat.c
+++ b/security/apparmor/policy_compat.c
@@ -143,6 +143,7 @@ static struct aa_perms compute_fperms_other(struct aa_dfa *dfa,
  * compute_fperms - convert dfa compressed perms to internal perms and store
  *		    them so they can be retrieved later.
  * @dfa: a dfa using fperms to remap to internal permissions
+ * @size: the permission table size
  *
  * Returns: remapped perm table
  */
-- 
2.25.1


