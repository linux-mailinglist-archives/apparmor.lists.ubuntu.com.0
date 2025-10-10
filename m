Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E1BCD422
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7D9F-0002Ib-EY; Fri, 10 Oct 2025 13:27:05 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7D99-0002H0-Eg
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:26:59 +0000
Received: from sec2-plucky-amd64.. (176-136-128-80.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A486842AC7; 
 Fri, 10 Oct 2025 13:26:58 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 10 Oct 2025 15:25:29 +0200
Message-ID: <20251010132610.12001-3-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010132610.12001-1-maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v6 2/5] lsm: introduce
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
 jmorris@namei.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Define two new LSM hooks: security_lsm_config_self_policy and
security_lsm_config_system_policy and wire them into the corresponding
lsm_config_*_policy() syscalls so that LSMs can register a unified
interface for policy management. This initial, minimal implementation
only supports the LSM_POLICY_LOAD operation to limit changes.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 include/linux/lsm_hook_defs.h |  4 +++
 include/linux/security.h      | 20 ++++++++++++
 include/uapi/linux/lsm.h      |  8 +++++
 security/lsm_syscalls.c       | 13 ++++++--
 security/security.c           | 60 +++++++++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index bf3bbac4e02a..50b6e8aed787 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -464,3 +464,7 @@ LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
 LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
 LSM_HOOK(int, 0, bdev_setintegrity, struct block_device *bdev,
 	 enum lsm_integrity_type type, const void *value, size_t size)
+LSM_HOOK(int, -EINVAL, lsm_config_self_policy, u32 op, void __user *buf,
+	 size_t size, u32 flags)
+LSM_HOOK(int, -EINVAL, lsm_config_system_policy, u32 op,
+	 void __user *buf, size_t size, u32 flags)
diff --git a/include/linux/security.h b/include/linux/security.h
index cc9b54d95d22..54acaee4a994 100644
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
@@ -1603,6 +1608,21 @@ static inline int security_bdev_setintegrity(struct block_device *bdev,
 	return 0;
 }
 
+static inline int security_lsm_config_self_policy(u32 lsm_id, u32 op,
+						  void __user *buf,
+						  size_t size, u32 flags)
+{
+
+	return -EOPNOTSUPP;
+}
+
+static inline int security_lsm_config_system_policy(u32 lsm_id, u32 op,
+						    void __user *buf,
+						    size_t size, u32 flags)
+{
+
+	return -EOPNOTSUPP;
+}
 #endif	/* CONFIG_SECURITY */
 
 #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd5da..2b9432a30cdc 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -90,4 +90,12 @@ struct lsm_ctx {
  */
 #define LSM_FLAG_SINGLE	0x0001
 
+/*
+ * LSM_POLICY_XXX definitions identify the different operations
+ * to configure LSM policies
+ */
+
+#define LSM_POLICY_UNDEF	0
+#define LSM_POLICY_LOAD		100
+
 #endif /* _UAPI_LINUX_LSM_H */
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index b02a7623dea6..0796673b6f19 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -122,11 +122,20 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
 SYSCALL_DEFINE6(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
 		buf, u32 __user, size, u32, common_flags, u32, flags)
 {
-	return 0;
+	if (common_flags) // Reserved for future use
+		return -EINVAL;
+
+	return security_lsm_config_self_policy(lsm_id, op, buf, size, flags);
 }
 
 SYSCALL_DEFINE6(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
 		buf, u32 __user, size, u32, common_flags, u32, flags)
 {
-	return 0;
+	if (common_flags) // Reserved for future use
+		return -EINVAL;
+
+	if (!capable(CAP_MAC_ADMIN))
+		return -EPERM;
+
+	return security_lsm_config_system_policy(lsm_id, op, buf, size, flags);
 }
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..eeb61b27cd56 100644
--- a/security/security.c
+++ b/security/security.c
@@ -5883,6 +5883,66 @@ int security_bdev_setintegrity(struct block_device *bdev,
 }
 EXPORT_SYMBOL(security_bdev_setintegrity);
 
+/**
+ * security_lsm_config_self_policy() - Configure caller's LSM policies
+ * @lsm_id: id of the LSM to target
+ * @op: Operation to perform (one of the LSM_POLICY_XXX values)
+ * @buf: userspace pointer to policy data
+ * @size: size of @buf
+ * @flags: lsm policy configuration flags
+ *
+ * Configure the policies of a LSM for the current domain/user. This notably
+ * allows to update them even when the lsmfs is unavailable or restricted.
+ * Currently, only LSM_POLICY_LOAD is supported.
+ *
+ * Return: Returns 0 on success, error on failure.
+ */
+int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
+				 size_t size, u32 flags)
+{
+	int rc = LSM_RET_DEFAULT(lsm_config_self_policy);
+	struct lsm_static_call *scall;
+
+	lsm_for_each_hook(scall, lsm_config_self_policy) {
+		if ((scall->hl->lsmid->id) == lsm_id) {
+			rc = scall->hl->hook.lsm_config_self_policy(op, buf, size, flags);
+			break;
+		}
+	}
+
+	return rc;
+}
+
+/**
+ * security_lsm_config_system_policy() - Configure system LSM policies
+ * @lsm_id: id of the lsm to target
+ * @op: Operation to perform (one of the LSM_POLICY_XXX values)
+ * @buf: userspace pointer to policy data
+ * @size: size of @buf
+ * @flags: lsm policy configuration flags
+ *
+ * Configure the policies of a LSM for the whole system. This notably allows
+ * to update them even when the lsmfs is unavailable or restricted. Currently,
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
+	lsm_for_each_hook(scall, lsm_config_system_policy) {
+		if ((scall->hl->lsmid->id) == lsm_id) {
+			rc = scall->hl->hook.lsm_config_system_policy(op, buf, size, flags);
+			break;
+		}
+	}
+
+	return rc;
+}
+
 #ifdef CONFIG_PERF_EVENTS
 /**
  * security_perf_event_open() - Check if a perf event open is allowed
-- 
2.48.1


