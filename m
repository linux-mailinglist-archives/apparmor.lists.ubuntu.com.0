Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 304DF5FEAB0
	for <lists+apparmor@lfdr.de>; Fri, 14 Oct 2022 10:43:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ojGHc-0005PM-Ds; Fri, 14 Oct 2022 08:43:08 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1ojGHa-0005PE-4f
 for apparmor@lists.ubuntu.com; Fri, 14 Oct 2022 08:43:06 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VS755BC_1665736981; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VS755BC_1665736981) by smtp.aliyun-inc.com;
 Fri, 14 Oct 2022 16:43:02 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Fri, 14 Oct 2022 16:42:55 +0800
Message-Id: <20221014084255.26103-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] apparmor: Fix spelling of function name in
	comment block
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

'resouce' -> 'resource'

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2396
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
index ed543f4edfd9..d7dbacc9a369 100644
--- a/security/apparmor/resource.c
+++ b/security/apparmor/resource.c
@@ -66,7 +66,7 @@ static int audit_resource(struct aa_profile *profile, unsigned int resource,
 }
 
 /**
- * aa_map_resouce - map compiled policy resource to internal #
+ * aa_map_resource - map compiled policy resource to internal #
  * @resource: flattened policy resource number
  *
  * Returns: resource # for the current architecture.
-- 
2.20.1.7.g153144c


