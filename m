Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F55F8498
	for <lists+apparmor@lfdr.de>; Sat,  8 Oct 2022 11:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oh69m-0005OC-SN; Sat, 08 Oct 2022 09:30:06 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jiapeng.chong@linux.alibaba.com>) id 1oh3Q8-0007qp-Oh
 for apparmor@lists.ubuntu.com; Sat, 08 Oct 2022 06:34:49 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VRZfq31_1665210882; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VRZfq31_1665210882) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 14:34:45 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Sat,  8 Oct 2022 14:34:11 +0800
Message-Id: <20221008063411.14829-3-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
References: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Oct 2022 09:30:05 +0000
Subject: [apparmor] [PATCH 3/3] AppArmor: Fix kernel-doc
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

security/apparmor/ipc.c:53: warning: expecting prototype for audit_cb(). Prototype was for audit_signal_cb() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2337
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
index 1d4099385bdf..5acde746775f 100644
--- a/security/apparmor/ipc.c
+++ b/security/apparmor/ipc.c
@@ -45,7 +45,7 @@ static const char *audit_signal_mask(u32 mask)
 }
 
 /**
- * audit_cb - call back for signal specific audit fields
+ * audit_signal_cb() - call back for signal specific audit fields
  * @ab: audit_buffer  (NOT NULL)
  * @va: audit struct to audit values of  (NOT NULL)
  */
-- 
2.20.1.7.g153144c


