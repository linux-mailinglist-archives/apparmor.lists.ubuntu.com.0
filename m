Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D4838AAC80E
	for <lists+apparmor@lfdr.de>; Tue,  6 May 2025 16:34:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCJMw-0006lH-9F; Tue, 06 May 2025 14:34:02 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uCJMu-0006il-Kx
 for apparmor@lists.ubuntu.com; Tue, 06 May 2025 14:34:00 +0000
Received: from sec2-plucky-amd64..
 (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 33E1B3FA54; 
 Tue,  6 May 2025 14:33:52 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Tue,  6 May 2025 16:32:29 +0200
Message-ID: <20250506143254.718647-3-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506143254.718647-1-maxime.belair@canonical.com>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/3] lsm: introduce security_lsm_manage_policy
	hook
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@I-love.SAKURA.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Define a new LSM hook security_lsm_manage_policy and wire it into the
lsm_manage_policy() syscall so that LSMs can register a unified interface
for policy management. This initial, minimal implementation only supports
the LSM_POLICY_LOAD operation to limit changes.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 include/linux/lsm_hook_defs.h |  2 ++
 include/linux/security.h      |  7 +++++++
 include/uapi/linux/lsm.h      |  8 ++++++++
 security/lsm_syscalls.c       |  7 ++++++-
 security/security.c           | 21 +++++++++++++++++++++
 5 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index bf3bbac4e02a..04b6e34d5111 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -464,3 +464,5 @@ LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
 LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
 LSM_HOOK(int, 0, bdev_setintegrity, struct block_device *bdev,
 	 enum lsm_integrity_type type, const void *value, size_t size)
+LSM_HOOK(int, 0, lsm_manage_policy, u32 lsm_id, u32 op, void __user *buf,
+	 size_t size, u32 flags)
diff --git a/include/linux/security.h b/include/linux/security.h
index cc9b54d95d22..dab547ee691c 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -581,6 +581,8 @@ void security_bdev_free(struct block_device *bdev);
 int security_bdev_setintegrity(struct block_device *bdev,
 			       enum lsm_integrity_type type, const void *value,
 			       size_t size);
+int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
+			       size_t size, u32 flags);
 #else /* CONFIG_SECURITY */
 
 /**
@@ -1602,6 +1604,11 @@ static inline int security_bdev_setintegrity(struct block_device *bdev,
 {
 	return 0;
 }
+static int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
+				      size_t size, u32 flags)
+
+	return -EOPNOTSUPP;
+}
 
 #endif	/* CONFIG_SECURITY */
 
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd5da..7335f9723114 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -90,4 +90,12 @@ struct lsm_ctx {
  */
 #define LSM_FLAG_SINGLE	0x0001
 
+/*
+ * LSM_POLICY_XXX definition identifies operation to manage lsm
+ * policies
+ */
+
+#define LSM_POLICY_UNDEF	0
+#define LSM_POLICY_LOAD		100
+
 #endif /* _UAPI_LINUX_LSM_H */
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index dcaad8818679..b39e6635a7d5 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
 SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void __user *, buf, u32
 		__user *, size, u32, flags)
 {
-	return 0;
+	size_t usize;
+
+	if (get_user(usize, size))
+		return -EFAULT;
+
+	return security_lsm_manage_policy(lsm_id, op, buf, usize, flags);
 }
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..256104e338b1 100644
--- a/security/security.c
+++ b/security/security.c
@@ -5883,6 +5883,27 @@ int security_bdev_setintegrity(struct block_device *bdev,
 }
 EXPORT_SYMBOL(security_bdev_setintegrity);
 
+/**
+ * security_lsm_manage_policy() - Manage the policies of LSMs
+ * @lsm_id: id of the lsm to target
+ * @op: Operation to perform (one of the LSM_POLICY_XXX values)
+ * @buf:  userspace pointer to policy data
+ * @size: size of @buf
+ * @flags: lsm policy management flags
+ *
+ * Manage the policies of a LSM. This notably allows to update them even when
+ * the lsmfs is unavailable is restricted. Currently, only LSM_POLICY_LOAD is
+ * supported.
+ *
+ * Return: Returns 0 on success, error on failure.
+ */
+int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
+			       size_t size, u32 flags)
+{
+	return call_int_hook(lsm_manage_policy, lsm_id, op, buf, size, flags);
+}
+EXPORT_SYMBOL(security_lsm_manage_policy);
+
 #ifdef CONFIG_PERF_EVENTS
 /**
  * security_perf_event_open() - Check if a perf event open is allowed
-- 
2.48.1


