Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 945BDA18D6B
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpL-00041D-2e; Wed, 22 Jan 2025 08:11:07 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jiapeng.chong@linux.alibaba.com>)
 id 1ta4Gf-0001LT-0L
 for apparmor@lists.ubuntu.com; Tue, 21 Jan 2025 02:45:29 +0000
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WO3ld2s_1737427514 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 21 Jan 2025 10:45:25 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Tue, 21 Jan 2025 10:44:44 +0800
Message-Id: <20250121024444.88981-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20250121024444.88981-1-jiapeng.chong@linux.alibaba.com>
References: <20250121024444.88981-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=jiapeng.chong@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:04 +0000
Subject: [apparmor] [PATCH -next 1/2] apparmor: Modify mismatched function
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

security/apparmor/file.c:184: warning: expecting prototype for aa_lookup_fperms(). Prototype was for aa_lookup_condperms() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=13605
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 85f89814af1e..f113eedbc208 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -169,7 +169,7 @@ static int path_name(const char *op, const struct cred *subj_cred,
 
 struct aa_perms default_perms = {};
 /**
- * aa_lookup_fperms - convert dfa compressed perms to internal perms
+ * aa_lookup_condperms - convert dfa compressed perms to internal perms
  * @subj_uid: uid to use for subject owner test
  * @rules: the aa_policydb to lookup perms for  (NOT NULL)
  * @state: state in dfa
-- 
2.32.0.3.g01195cf9f


