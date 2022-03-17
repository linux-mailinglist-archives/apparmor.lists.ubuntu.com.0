Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C35AA4DC187
	for <lists+apparmor@lfdr.de>; Thu, 17 Mar 2022 09:41:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nUlgh-0001lL-92; Thu, 17 Mar 2022 08:40:51 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1nUeYE-0005vm-UY
 for apparmor@lists.ubuntu.com; Thu, 17 Mar 2022 01:03:39 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0V7OxGLH_1647479011; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V7OxGLH_1647479011) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 17 Mar 2022 09:03:32 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Thu, 17 Mar 2022 09:03:30 +0800
Message-Id: <20220317010330.82929-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 08:40:49 +0000
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Remove some warnings found by running scripts/kernel-doc,
which is caused by using 'make W=1'.

security/apparmor/domain.c:137: warning: Function parameter or member
'state' not described in 'label_compound_match'
security/apparmor/domain.c:137: warning: Excess function parameter
'start' description in 'label_compound_match'
security/apparmor/domain.c:1294: warning: Excess function parameter
'onexec' description in 'aa_change_profile'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/domain.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index a29e69d2c300..d71023f5c9c4 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -119,7 +119,7 @@ static inline unsigned int match_component(struct aa_profile *profile,
  * @profile: profile to find perms for
  * @label: label to check access permissions for
  * @stack: whether this is a stacking request
- * @start: state to start match in
+ * @state: state to start match in
  * @subns: whether to do permission checks on components in a subns
  * @request: permissions to request
  * @perms: perms struct to set
@@ -1279,7 +1279,6 @@ static int change_profile_perms_wrapper(const char *op, const char *name,
 /**
  * aa_change_profile - perform a one-way profile transition
  * @fqname: name of profile may include namespace (NOT NULL)
- * @onexec: whether this transition is to take place immediately or at exec
  * @flags: flags affecting change behavior
  *
  * Change to new profile @name.  Unlike with hats, there is no way
-- 
2.20.1.7.g153144c


