Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D6525A5B
	for <lists+apparmor@lfdr.de>; Fri, 13 May 2022 05:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1npMH4-00033L-NM; Fri, 13 May 2022 03:47:30 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1np3e0-0004Hu-4F
 for apparmor@lists.ubuntu.com; Thu, 12 May 2022 07:53:56 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R331e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VCziySh_1652342031; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VCziySh_1652342031) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 May 2022 15:53:52 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Thu, 12 May 2022 15:53:50 +0800
Message-Id: <20220512075350.31163-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 May 2022 03:47:29 +0000
Subject: [apparmor] [PATCH -next] apparmor: Fix aa_str_perms() kernel-doc
	comment
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

Add the description of @start and remove @state in aa_str_perms()
kernel-doc comment to remove warnings found by running scripts/kernel-doc,
which is caused by using 'make W=1'.

security/apparmor/file.c:260: warning: Function parameter or member
'start' not described in 'aa_str_perms'
security/apparmor/file.c:260: warning: Excess function parameter 'state'
description in 'aa_str_perms'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index e1b7e93602e4..137c99bb5d4a 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -247,7 +247,7 @@ struct aa_perms aa_compute_fperms(struct aa_dfa *dfa, unsigned int state,
 /**
  * aa_str_perms - find permission that match @name
  * @dfa: to match against  (MAYBE NULL)
- * @state: state to start matching in
+ * @start: the state of the dfa to start matching in
  * @name: string to match against dfa  (NOT NULL)
  * @cond: conditions to consider for permission set computation  (NOT NULL)
  * @perms: Returns - the permissions found when matching @name
-- 
2.20.1.7.g153144c


