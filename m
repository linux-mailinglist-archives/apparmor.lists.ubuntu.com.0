Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DAA18D68
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpJ-000416-Ug; Wed, 22 Jan 2025 08:11:05 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jiapeng.chong@linux.alibaba.com>)
 id 1ta4GV-0001Ji-IQ
 for apparmor@lists.ubuntu.com; Tue, 21 Jan 2025 02:45:21 +0000
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WO3joNO_1737427486 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 21 Jan 2025 10:45:14 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Tue, 21 Jan 2025 10:44:43 +0800
Message-Id: <20250121024444.88981-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=jiapeng.chong@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:04 +0000
Subject: [apparmor] [PATCH -next 2/2] apparmor: Modify mismatched function
	name
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

No functional modification involved.

security/apparmor/lib.c:93: warning: expecting prototype for aa_mask_to_str(). Prototype was for val_mask_to_str() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=13606
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index dd5dcbe5daf7..325f26f39a63 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -82,7 +82,7 @@ int aa_parse_debug_params(const char *str)
 }
 
 /**
- * aa_mask_to_str - convert a perm mask to its short string
+ * val_mask_to_str - convert a perm mask to its short string
  * @str: character buffer to store string in (at least 10 characters)
  * @str_size: size of the @str buffer
  * @chrs: NUL-terminated character buffer of permission characters
-- 
2.32.0.3.g01195cf9f


