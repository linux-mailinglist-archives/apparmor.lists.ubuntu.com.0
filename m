Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F773CDB4
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKC-0002F1-Kd; Sun, 25 Jun 2023 01:13:56 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEKA-0002DT-Pn
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:55 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QpXzl59dlz1HBhK;
 Sun, 25 Jun 2023 09:13:39 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:51 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:41 +0800
Message-ID: <20230625011349.1457810-4-cuigaosheng1@huawei.com>
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
Subject: [apparmor] [PATCH -next 03/11] apparmor: Fix kernel-doc warnings in
	apparmor/domain.c
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

security/apparmor/domain.c:279: warning: Function parameter or
member 'perms' not described in 'change_profile_perms'
security/apparmor/domain.c:380: warning: Function parameter or
member 'bprm' not described in 'find_attach'
security/apparmor/domain.c:380: warning: Function parameter or
member 'head' not described in 'find_attach'
security/apparmor/domain.c:380: warning: Function parameter or
member 'info' not described in 'find_attach'
security/apparmor/domain.c:380: warning: Function parameter or
member 'name' not described in 'find_attach'
security/apparmor/domain.c:558: warning: Function parameter or
member 'info' not described in 'x_to_label'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/domain.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 68598557aef5..7f81502019da 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -265,6 +265,7 @@ static int label_match(struct aa_profile *profile, struct aa_label *label,
  * @stack: whether this is a stacking request
  * @request: requested perms
  * @start: state to start matching in
+ * @perms: Returns computed perms (NOT NULL)
  *
  *
  * Returns: permission set
@@ -359,11 +360,11 @@ static int aa_xattrs_match(const struct linux_binprm *bprm,
 
 /**
  * find_attach - do attachment search for unconfined processes
- * @bprm - binprm structure of transitioning task
+ * @bprm: binprm structure of transitioning task
  * @ns: the current namespace  (NOT NULL)
- * @head - profile list to walk  (NOT NULL)
- * @name - to match against  (NOT NULL)
- * @info - info message if there was an error (NOT NULL)
+ * @head: profile list to walk  (NOT NULL)
+ * @name: to match against  (NOT NULL)
+ * @info: info message if there was an error (NOT NULL)
  *
  * Do a linear search on the profiles in the list.  There is a matching
  * preference where an exact match is preferred over a name which uses
@@ -545,6 +546,7 @@ struct aa_label *x_table_lookup(struct aa_profile *profile, u32 xindex,
  * @name: name to lookup (NOT NULL)
  * @xindex: index into x transition table
  * @lookupname: returns: name used in lookup if one was specified (NOT NULL)
+ * @info: info message if there was an error (NOT NULL)
  *
  * find label for a transition index
  *
-- 
2.25.1


