Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50B7D27BB
	for <lists+apparmor@lfdr.de>; Mon, 23 Oct 2023 02:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qujED-0002VU-9c; Mon, 23 Oct 2023 00:55:33 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <yang.lee@linux.alibaba.com>)
 id 1qujE5-0002V6-LQ
 for apparmor@lists.ubuntu.com; Mon, 23 Oct 2023 00:55:26 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VuctJle_1698022518; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VuctJle_1698022518) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 08:55:19 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Mon, 23 Oct 2023 08:55:17 +0800
Message-Id: <20231023005517.115318-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linux-security-module@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix some kernel-doc comments to silence the warnings:
security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'
security/apparmor/capability.c:154: warning: Function parameter or member 'subj_cred' not described in 'aa_capable'
security/apparmor/capability.c:154: warning: Excess function parameter 'subj_cread' description in 'aa_capable'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7035
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/capability.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 0b7d2b1086c9..9934df16c843 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -51,7 +51,7 @@ static void audit_cb(struct audit_buffer *ab, void *va)
 
 /**
  * audit_caps - audit a capability
- * @as: audit data
+ * @ad: audit data
  * @profile: profile being tested for confinement (NOT NULL)
  * @cap: capability tested
  * @error: error code returned by test
@@ -140,7 +140,7 @@ static int profile_capable(struct aa_profile *profile, int cap,
 
 /**
  * aa_capable - test permission to use capability
- * @subj_cread: cred we are testing capability against
+ * @subj_cred: cred we are testing capability against
  * @label: label being tested for capability (NOT NULL)
  * @cap: capability to be tested
  * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
-- 
2.20.1.7.g153144c


