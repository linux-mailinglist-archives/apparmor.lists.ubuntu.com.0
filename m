Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A207D27D3
	for <lists+apparmor@lfdr.de>; Mon, 23 Oct 2023 03:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qujTr-0004Sf-8T; Mon, 23 Oct 2023 01:11:43 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <yang.lee@linux.alibaba.com>)
 id 1qujTi-0004Qf-PD
 for apparmor@lists.ubuntu.com; Mon, 23 Oct 2023 01:11:35 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vucq0a7_1698023486; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vucq0a7_1698023486) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 09:11:26 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Mon, 23 Oct 2023 09:11:23 +0800
Message-Id: <20231023011124.19034-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next 1/2] apparmor: Fix one kernel-doc comment
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

Fix one kernel-doc comment to silence the warnings:
security/apparmor/domain.c:46: warning: Function parameter or member 'to_cred' not described in 'may_change_ptraced_domain'
security/apparmor/domain.c:46: warning: Excess function parameter 'cred' description in 'may_change_ptraced_domain'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7036
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index ed4a13d44894..89fbeab4b33b 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -31,7 +31,7 @@
 
 /**
  * may_change_ptraced_domain - check if can change profile on ptraced task
- * @cred: cred of task changing domain
+ * @to_cred: cred of task changing domain
  * @to_label: profile to change to  (NOT NULL)
  * @info: message if there is an error
  *
-- 
2.20.1.7.g153144c


