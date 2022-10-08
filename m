Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F95F8499
	for <lists+apparmor@lfdr.de>; Sat,  8 Oct 2022 11:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oh69n-0005OJ-Uy; Sat, 08 Oct 2022 09:30:07 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jiapeng.chong@linux.alibaba.com>) id 1oh3Q3-0007qQ-QR
 for apparmor@lists.ubuntu.com; Sat, 08 Oct 2022 06:34:44 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VRZ.ife_1665210853; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VRZ.ife_1665210853) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 14:34:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Sat,  8 Oct 2022 14:34:09 +0800
Message-Id: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Oct 2022 09:30:05 +0000
Subject: [apparmor] [PATCH 1/3] AppArmor: Fix kernel-doc
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, paul@paul-moore.com,
 Abaci Robot <abaci@linux.alibaba.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

security/apparmor/audit.c:93: warning: expecting prototype for audit_base(). Prototype was for audit_pre() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2339
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
index 8dfdda98fbf1..5a7978aa4b19 100644
--- a/security/apparmor/audit.c
+++ b/security/apparmor/audit.c
@@ -83,7 +83,7 @@ static const char *const aa_class_names[] = {
  */
 
 /**
- * audit_base - core AppArmor function.
+ * audit_pre() - core AppArmor function.
  * @ab: audit buffer to fill (NOT NULL)
  * @ca: audit structure containing data to audit (NOT NULL)
  *
-- 
2.20.1.7.g153144c


