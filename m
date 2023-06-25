Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23F73CDBB
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKN-0002Kw-1c; Sun, 25 Jun 2023 01:14:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEKD-0002EO-2n
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:57 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QpXwx2ZxFztQVt;
 Sun, 25 Jun 2023 09:11:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:53 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:49 +0800
Message-ID: <20230625011349.1457810-12-cuigaosheng1@huawei.com>
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
Subject: [apparmor] [PATCH -next 11/11] apparmor: Fix kernel-doc warnings in
	apparmor/policy.c
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

security/apparmor/policy.c:294: warning: Function parameter or
member 'proxy' not described in 'aa_alloc_profile'
security/apparmor/policy.c:785: warning: Function parameter or
member 'label' not described in 'aa_policy_view_capable'
security/apparmor/policy.c:785: warning: Function parameter or
member 'ns' not described in 'aa_policy_view_capable'
security/apparmor/policy.c:847: warning: Function parameter or
member 'ns' not described in 'aa_may_manage_policy'
security/apparmor/policy.c:964: warning: Function parameter or
member 'hname' not described in '__lookup_replace'
security/apparmor/policy.c:964: warning: Function parameter or
member 'info' not described in '__lookup_replace'
security/apparmor/policy.c:964: warning: Function parameter or
member 'noreplace' not described in '__lookup_replace'
security/apparmor/policy.c:964: warning: Function parameter or
member 'ns' not described in '__lookup_replace'
security/apparmor/policy.c:964: warning: Function parameter or
member 'p' not described in '__lookup_replace'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/policy.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 715fe1b66d12..4817c1b30105 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -285,6 +285,7 @@ void aa_free_profile(struct aa_profile *profile)
 /**
  * aa_alloc_profile - allocate, initialize and return a new profile
  * @hname: name of the profile  (NOT NULL)
+ * @proxy: proxy to use OR null if to allocate a new one
  * @gfp: allocation type
  *
  * Returns: refcount profile or NULL on failure
@@ -774,8 +775,9 @@ static int policy_ns_capable(struct aa_label *label,
 
 /**
  * aa_policy_view_capable - check if viewing policy in at @ns is allowed
- * label: label that is trying to view policy in ns
- * ns: namespace being viewed by @label (may be NULL if @label's ns)
+ * @label: label that is trying to view policy in ns
+ * @ns: namespace being viewed by @label (may be NULL if @label's ns)
+ *
  * Returns: true if viewing policy is allowed
  *
  * If @ns is NULL then the namespace being viewed is assumed to be the
@@ -839,6 +841,7 @@ bool aa_current_policy_admin_capable(struct aa_ns *ns)
 /**
  * aa_may_manage_policy - can the current task manage policy
  * @label: label to check if it can manage policy
+ * @ns: namespace being managed by @label (may be NULL if @label's ns)
  * @mask: contains the policy manipulation operation being done
  *
  * Returns: 0 if the task is allowed to manipulate policy else error
@@ -950,11 +953,11 @@ static void __replace_profile(struct aa_profile *old, struct aa_profile *new)
 
 /**
  * __lookup_replace - lookup replacement information for a profile
- * @ns - namespace the lookup occurs in
- * @hname - name of profile to lookup
- * @noreplace - true if not replacing an existing profile
- * @p - Returns: profile to be replaced
- * @info - Returns: info string on why lookup failed
+ * @ns: namespace the lookup occurs in
+ * @hname: name of profile to lookup
+ * @noreplace: true if not replacing an existing profile
+ * @p: Returns - profile to be replaced
+ * @info: Returns - info string on why lookup failed
  *
  * Returns: profile to replace (no ref) on success else ptr error
  */
-- 
2.25.1


