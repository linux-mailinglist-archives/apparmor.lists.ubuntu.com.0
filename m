Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B7B15954
	for <lists+apparmor@lfdr.de>; Wed, 30 Jul 2025 09:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uh0xZ-0003Wi-4I; Wed, 30 Jul 2025 07:10:45 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jiapeng.chong@linux.alibaba.com>)
 id 1ufF6z-0005Hn-De
 for apparmor@lists.ubuntu.com; Fri, 25 Jul 2025 09:53:10 +0000
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WjxlLh2_1753437173 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 25 Jul 2025 17:52:59 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Fri, 25 Jul 2025 17:52:52 +0800
Message-ID: <20250725095252.2087274-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=jiapeng.chong@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Mailman-Approved-At: Wed, 30 Jul 2025 07:10:43 +0000
Subject: [apparmor] [PATCH -next] apparmor: Remove the unused variable rules
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

Variable rules is not effectively used, so delete it.

security/apparmor/lsm.c:182:23: warning: variable ‘rules’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=22942
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 security/apparmor/lsm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 5b1b5ac831e8..182a0e55802e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -179,10 +179,8 @@ static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effec
 		struct label_it i;
 
 		label_for_each_confined(i, label, profile) {
-			struct aa_ruleset *rules;
 			kernel_cap_t allowed;
 
-			rules = profile->label.rules[0];
 			allowed = aa_profile_capget(profile);
 			*effective = cap_intersect(*effective, allowed);
 			*permitted = cap_intersect(*permitted, allowed);
-- 
2.43.5


