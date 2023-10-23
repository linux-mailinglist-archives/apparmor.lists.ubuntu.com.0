Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409D7D27D2
	for <lists+apparmor@lfdr.de>; Mon, 23 Oct 2023 03:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qujTu-0004T0-E9; Mon, 23 Oct 2023 01:11:46 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <yang.lee@linux.alibaba.com>)
 id 1qujTi-0004Qg-NN
 for apparmor@lists.ubuntu.com; Mon, 23 Oct 2023 01:11:35 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R291e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vucq0b9_1698023488; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vucq0b9_1698023488) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 09:11:28 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Mon, 23 Oct 2023 09:11:24 +0800
Message-Id: <20231023011124.19034-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20231023011124.19034-1-yang.lee@linux.alibaba.com>
References: <20231023011124.19034-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next 2/2] apparmor: Fix some kernel-doc comments
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linux-security-module@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix some kernel-doc comments to silence the warnings:
security/apparmor/policy.c:117: warning: Function parameter or member 'kref' not described in 'aa_pdb_free_kref'
security/apparmor/policy.c:117: warning: Excess function parameter 'kr' description in 'aa_pdb_free_kref'
security/apparmor/policy.c:882: warning: Function parameter or member 'subj_cred' not described in 'aa_may_manage_policy'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7037
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/policy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index a441d96adcbf..ed4c9803c8fa 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -111,7 +111,7 @@ static void aa_free_pdb(struct aa_policydb *policy)
 
 /**
  * aa_pdb_free_kref - free aa_policydb by kref (called by aa_put_pdb)
- * @kr: kref callback for freeing of a dfa  (NOT NULL)
+ * @kref: kref callback for freeing of a dfa  (NOT NULL)
  */
 void aa_pdb_free_kref(struct kref *kref)
 {
@@ -870,7 +870,7 @@ bool aa_current_policy_admin_capable(struct aa_ns *ns)
 
 /**
  * aa_may_manage_policy - can the current task manage policy
- * @subj_cred; subjects cred
+ * @subj_cred: subjects cred
  * @label: label to check if it can manage policy
  * @ns: namespace being managed by @label (may be NULL if @label's ns)
  * @mask: contains the policy manipulation operation being done
-- 
2.20.1.7.g153144c


