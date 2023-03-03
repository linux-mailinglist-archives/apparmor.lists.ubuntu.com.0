Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB36A8EB5
	for <lists+apparmor@lfdr.de>; Fri,  3 Mar 2023 02:28:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXuDy-00050N-IT; Fri, 03 Mar 2023 01:28:42 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1pXuDv-000504-4S
 for apparmor@lists.ubuntu.com; Fri, 03 Mar 2023 01:28:39 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vcyz2mq_1677806914; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vcyz2mq_1677806914) by smtp.aliyun-inc.com;
 Fri, 03 Mar 2023 09:28:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Fri,  3 Mar 2023 09:28:33 +0800
Message-Id: <20230303012833.57690-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] AppArmor: Fix some kernel-doc comments
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
Cc: paul@paul-moore.com, Abaci Robot <abaci@linux.alibaba.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Make the description of @table to @strs in function unpack_trans_table()
to silence the warnings:

security/apparmor/policy_unpack.c:456: warning: Function parameter or member 'strs' not described in 'unpack_trans_table'
security/apparmor/policy_unpack.c:456: warning: Excess function parameter 'table' description in 'unpack_trans_table'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4332
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index cf2ceec40b28..c3f44f1deb07 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -448,7 +448,7 @@ static struct aa_dfa *unpack_dfa(struct aa_ext *e, int flags)
 /**
  * unpack_trans_table - unpack a profile transition table
  * @e: serialized data extent information  (NOT NULL)
- * @table: str table to unpack to (NOT NULL)
+ * @strs: str table to unpack to (NOT NULL)
  *
  * Returns: true if table successfully unpacked or not present
  */
-- 
2.20.1.7.g153144c


