Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D8AE0C91
	for <lists+apparmor@lfdr.de>; Thu, 19 Jun 2025 20:17:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSJp0-0002eB-Sk; Thu, 19 Jun 2025 18:17:10 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uSJoy-0002bm-42
 for apparmor@lists.ubuntu.com; Thu, 19 Jun 2025 18:17:08 +0000
Received: from sec2-plucky-amd64..
 (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7C0CB4018E; 
 Thu, 19 Jun 2025 18:17:07 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Thu, 19 Jun 2025 20:15:32 +0200
Message-ID: <20250619181600.478038-3-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250619181600.478038-1-maxime.belair@canonical.com>
References: <20250619181600.478038-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 2/3] lsm: introduce
	security_lsm_config_*_policy hooks
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@I-love.SAKURA.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Define two new LSM hooks: security_lsm_config_self_policy and
security_lsm_config_system_policy and wire them into the corresponding
lsm_config_*_policy() syscalls so that LSMs can register a unified
interface for policy management. This initial, minimal implementation
only supports the LSM_POLICY_LOAD operation to limit changes.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 include/linux/lsm_hook_defs.h |  4 ++
 include/linux/security.h      | 16 ++++++++
 include/uapi/linux/lsm.h      |  8 ++++
 security/Kconfig              | 22 +++++++++++
 security/lsm_syscalls.c       | 17 ++++++++-
 security/security.c           | 69 +++++++++++++++++++++++++++++++++++
 6 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index bf3bbac4e02a..fca490444643 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -464,3 +464,7 @@ LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
 LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
 LSM_HOOK(int, 0, bdev_setintegrity, struct block_device *bdev,
 	 enum lsm_integrity_type type, const void *value, size_t size)
+LSM_HOOK(int, -EINVAL, lsm_config_self_policy, u32 lsm_id, u32 op,
+	 void __user *buf, size_t size, u32 flags)
+LSM_HOOK(int, -EINVAL, lsm_config_system_policy, u32 lsm_id, u32 op,
+	 void __user *buf, size_t size, u32 flags)
diff --git a/include/linux/security.h b/include/linux/security.h
index cc9b54d95d22..c2158f2656fd 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -581,6 +581,11 @@ void security_bdev_free(struct block_device *bdev);
 int security_bdev_setintegrity(struct block_device *bdev,
 			       enum lsm_integrity_type type, const void *value,
 			       size_t size);
+int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
+				    size_t size, u32 flags);
+int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
+				      size_t size, u32 flags);
+
 #else /* CONFIG_SECURITY */
 
 /**
@@ -1603,6 +1608,17 @@ static inline int security_bdev_setintegrity(struct block_device *bdev,
 	return 0;
 }
 
+static int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
+					   size_t size, u32 flags)
+
+	return -EOPNOTSUPP;
+}
+
+static int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
+					     size_t size, u32 flags)
+
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_SECURITY */
 
 #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd5da..844279f819ce 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -90,4 +90,12 @@ struct lsm_ctx {
  */
 #define LSM_FLAG_SINGLE	0x0001
 
+/*
+ * LSM_POLICY_XXX definitions identify the different operations
+ * configure lsm policies
+ */
+
+#define LSM_POLICY_UNDEF	0
+#define LSM_POLICY_LOAD		100
+
 #endif /* _UAPI_LINUX_LSM_H */
diff --git a/security/Kconfig b/security/Kconfig
index 4816fc74f81e..958be7b49a9e 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -220,6 +220,28 @@ config STATIC_USERMODEHELPER_PATH
 	  If you wish for all usermode helper programs to be disabled,
 	  specify an empty string here (i.e. "").
 
+config LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE
+	int "Maximum buffer size for lsm_manage_policy"
+	range 16384 1073741824
+	depends on SECURITY
+	default 4194304
+	help
+	  The maximum size of the buffer argument of lsm_config_self_policy.
+
+	  The default value of 4194304 (4MiB) is reasonable and should be large
+	  enough to fit policies in for most cases.
+
+config LSM_CONFIG_SYSTEM_POLICY_MAX_BUFFER_SIZE
+	int "Maximum buffer size for lsm_manage_policy"
+	range 16384 1073741824
+	depends on SECURITY
+	default 4194304
+	help
+	  The maximum size of the buffer argument of lsm_config_system_policy.
+
+	  The default value of 4194304 (4MiB) is reasonable and should be large
+	  enough to fit policies in for most cases
+
 source "security/selinux/Kconfig"
 source "security/smack/Kconfig"
 source "security/tomoyo/Kconfig"
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index a3cb6dab8102..dd016ba6976c 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -122,11 +122,24 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
 SYSCALL_DEFINE5(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
 		buf, u32 __user *, size, u32, flags)
 {
-	return 0;
+	size_t usize;
+
+	if (get_user(usize, size))
+		return -EFAULT;
+
+	return security_lsm_config_self_policy(lsm_id, op, buf, usize, flags);
 }
 
 SYSCALL_DEFINE5(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
 		buf, u32 __user *, size, u32, flags)
 {
-	return 0;
+	size_t usize;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (get_user(usize, size))
+		return -EFAULT;
+
+	return security_lsm_config_system_policy(lsm_id, op, buf, usize, flags);
 }
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..8efea2b6e967 100644
--- a/security/security.c
+++ b/security/security.c
@@ -5883,6 +5883,75 @@ int security_bdev_setintegrity(struct block_device *bdev,
 }
 EXPORT_SYMBOL(security_bdev_setintegrity);
 
+/**
+ * security_lsm_config_self_policy() - Manage caller's LSM policies
+ * @lsm_id: id of the LSM to target
+ * @op: Operation to perform (one of the LSM_POLICY_XXX values)
+ * @buf: userspace pointer to policy data
+ * @size: size of @buf
+ * @flags: lsm policy management flags
+ *
+ * Manage the policies of a LSM for the current domain/user. This notably allows
+ * to update them even when the lsmfs is unavailable is restricted. Currently,
+ * only LSM_POLICY_LOAD is supported.
+ *
+ * Return: Returns 0 on success, error on failure.
+ */
+int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
+				 size_t size, u32 flags)
+{
+	int rc = LSM_RET_DEFAULT(lsm_config_self_policy);
+	struct lsm_static_call *scall;
+
+	if (size > (CONFIG_LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE))
+		return -E2BIG;
+
+	lsm_for_each_hook(scall, lsm_config_self_policy) {
+		if ((scall->hl->lsmid->id) == lsm_id) {
+			rc = scall->hl->hook.lsm_config_self_policy(lsm_id, op, buf, size, flags);
+			break;
+		}
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL(security_lsm_config_self_policy);
+
+/**
+ * security_lsm_config_system_policy() - Manage system LSM policies
+ * @lsm_id: id of the lsm to target
+ * @op: Operation to perform (one of the LSM_POLICY_XXX values)
+ * @buf: userspace pointer to policy data
+ * @size: size of @buf
+ * @flags: lsm policy management flags
+ *
+ * Manage the policies of a LSM for the whole system. This notably allows
+ * to update them even when the lsmfs is unavailable is restricted. Currently,
+ * only LSM_POLICY_LOAD is supported.
+ *
+ * Return: Returns 0 on success, error on failure.
+ */
+int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
+				   size_t size, u32 flags)
+{
+	int rc = LSM_RET_DEFAULT(lsm_config_system_policy);
+	struct lsm_static_call *scall;
+
+	if (size > (CONFIG_LSM_CONFIG_SYSTEM_POLICY_MAX_BUFFER_SIZE))
+		return -E2BIG;
+
+	lsm_for_each_hook(scall, lsm_config_system_policy) {
+		if ((scall->hl->lsmid->id) == lsm_id) {
+			rc = scall->hl->hook.lsm_config_system_policy(lsm_id, op, buf, size, flags);
+			break;
+		}
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL(security_lsm_config_system_policy);
+
+
 #ifdef CONFIG_PERF_EVENTS
 /**
  * security_perf_event_open() - Check if a perf event open is allowed
-- 
2.48.1


