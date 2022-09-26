Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CB5EA4A1
	for <lists+apparmor@lfdr.de>; Mon, 26 Sep 2022 13:48:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ocmbM-0003Sa-Lx; Mon, 26 Sep 2022 11:48:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1ocmbL-0003ST-Gh
 for apparmor@lists.ubuntu.com; Mon, 26 Sep 2022 11:48:43 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MbgvN3XlrzHqHS;
 Mon, 26 Sep 2022 19:46:24 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 19:48:39 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Mon, 26 Sep 2022 19:48:38 +0800
Message-ID: <20220926114838.1699096-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Subject: [apparmor] [PATCH] apparmor: fix obsoleted comments for
	aa_getprocattr() and audit_resource()
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

Update the comments for aa_getprocattr() and audit_resource(), the
args of them have beed changed since commit 76a1d263aba3 ("apparmor:
switch getprocattr to using label_print fns()").

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/procattr.c | 11 +++++------
 security/apparmor/resource.c |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/procattr.c b/security/apparmor/procattr.c
index 86ad26ef72ed..197d41f9c32b 100644
--- a/security/apparmor/procattr.c
+++ b/security/apparmor/procattr.c
@@ -17,14 +17,13 @@
 
 
 /**
- * aa_getprocattr - Return the profile information for @profile
- * @profile: the profile to print profile info about  (NOT NULL)
- * @string: Returns - string containing the profile info (NOT NULL)
+ * aa_getprocattr - Return the label information for @label
+ * @label: the label to print label info about  (NOT NULL)
+ * @string: Returns - string containing the label info (NOT NULL)
  *
- * Requires: profile != NULL
+ * Requires: label != NULL && string != NULL
  *
- * Creates a string containing the namespace_name://profile_name for
- * @profile.
+ * Creates a string containing the label information for @label.
  *
  * Returns: size of string placed in @string else error code on failure
  */
diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
index 1ae4874251a9..4c1869bb31ec 100644
--- a/security/apparmor/resource.c
+++ b/security/apparmor/resource.c
@@ -45,6 +45,8 @@ static void audit_cb(struct audit_buffer *ab, void *va)
  * @profile: profile being enforced  (NOT NULL)
  * @resource: rlimit being auditing
  * @value: value being set
+ * @peer: aa_albel of the task being set
+ * @info: info being auditing
  * @error: error value
  *
  * Returns: 0 or sa->error else other error code on failure
-- 
2.25.1


