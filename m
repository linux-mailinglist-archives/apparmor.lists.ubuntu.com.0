Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAD5F849A
	for <lists+apparmor@lfdr.de>; Sat,  8 Oct 2022 11:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oh69m-0005O5-QT; Sat, 08 Oct 2022 09:30:06 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jiapeng.chong@linux.alibaba.com>) id 1oh3Q6-0007qR-B3
 for apparmor@lists.ubuntu.com; Sat, 08 Oct 2022 06:34:46 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VRZR3Dr_1665210879; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VRZR3Dr_1665210879) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 14:34:42 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Sat,  8 Oct 2022 14:34:10 +0800
Message-Id: <20221008063411.14829-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
References: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Oct 2022 09:30:05 +0000
Subject: [apparmor] [PATCH 2/3] LSM: Fix kernel-doc
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

security/apparmor/lsm.c:753: warning: expecting prototype for apparmor_bprm_committed_cred(). Prototype was for apparmor_bprm_committed_creds() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2338
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index cc83cbf2ce20..c56afd1307c1 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -746,7 +746,7 @@ static void apparmor_bprm_committing_creds(struct linux_binprm *bprm)
 }
 
 /**
- * apparmor_bprm_committed_cred - do cleanup after new creds committed
+ * apparmor_bprm_committed_creds() - do cleanup after new creds committed
  * @bprm: binprm for the exec  (NOT NULL)
  */
 static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
-- 
2.20.1.7.g153144c


