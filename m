Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B217BCD43D
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7D9C-0002I5-6z; Fri, 10 Oct 2025 13:27:02 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7D99-0002H7-NW
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:26:59 +0000
Received: from sec2-plucky-amd64.. (176-136-128-80.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1A5BC42ABB; 
 Fri, 10 Oct 2025 13:26:59 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 10 Oct 2025 15:25:30 +0200
Message-ID: <20251010132610.12001-4-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010132610.12001-1-maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v6 3/5] AppArmor: add support for
	lsm_config_self_policy and lsm_config_system_policy
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

Enable users to manage AppArmor policies through the new hooks
lsm_config_self_policy and lsm_config_system_policy.

lsm_config_self_policy allows stacking existing policies in the kernel.
This ensures that it can only further restrict the caller and can never
be used to gain new privileges.

lsm_config_system_policy allows loading or replacing AppArmor policies in
any AppArmor namespace and is restricted to CAP_MAC_ADMIN.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 security/apparmor/apparmorfs.c         | 31 ++++++++++
 security/apparmor/include/apparmor.h   |  4 ++
 security/apparmor/include/apparmorfs.h |  3 +
 security/apparmor/lsm.c                | 84 ++++++++++++++++++++++++++
 4 files changed, 122 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 6039afae4bfc..6df43299b045 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -439,6 +439,37 @@ static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
 	return error;
 }
 
+/**
+ * aa_profile_load_ns_name - load a profile into the current namespace identified by name
+ * @name: The name of the namesapce to load the policy in. "" for root_ns
+ * @name_size: size of @name. 0 For root ns
+ * @buf: buffer containing the user-provided policy
+ * @size: size of @buf
+ * @ppos: position pointer in the file
+ *
+ * Returns: 0 on success, negative value on error
+ */
+ssize_t aa_profile_load_ns_name(char *name, size_t name_size, const void __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct aa_ns *ns;
+
+	if (name_size == 0)
+		ns = aa_get_ns(root_ns);
+	else
+		ns = aa_lookupn_ns(root_ns, name, name_size);
+
+	if (!ns)
+		return -EINVAL;
+
+	int error = policy_update(AA_MAY_LOAD_POLICY | AA_MAY_REPLACE_POLICY,
+				  buf, size, ppos, ns);
+
+	aa_put_ns(ns);
+
+	return error >= 0 ? 0 : error;
+}
+
 /* .load file hook fn to load policy */
 static ssize_t profile_load(struct file *f, const char __user *buf, size_t size,
 			    loff_t *pos)
diff --git a/security/apparmor/include/apparmor.h b/security/apparmor/include/apparmor.h
index f83934913b0f..1d9a2881a8b9 100644
--- a/security/apparmor/include/apparmor.h
+++ b/security/apparmor/include/apparmor.h
@@ -62,5 +62,9 @@ extern unsigned int aa_g_path_max;
 #define AA_DEFAULT_CLEVEL 0
 #endif /* CONFIG_SECURITY_APPARMOR_EXPORT_BINARY */
 
+/* Syscall-related buffer size limits */
+
+#define AA_PROFILE_NAME_MAX_SIZE (1 << 9)
+#define AA_PROFILE_MAX_SIZE (1 << 28)
 
 #endif /* __APPARMOR_H */
diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index 1e94904f68d9..fd415afb7659 100644
--- a/security/apparmor/include/apparmorfs.h
+++ b/security/apparmor/include/apparmorfs.h
@@ -112,6 +112,9 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent);
 void __aafs_ns_rmdir(struct aa_ns *ns);
 int __aafs_ns_mkdir(struct aa_ns *ns, struct dentry *parent, const char *name,
 		     struct dentry *dent);
+ssize_t aa_profile_load_ns_name(char *name, size_t name_len, const void __user *buf,
+				size_t size, loff_t *ppos);
+
 
 struct aa_loaddata;
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b6c2f157f83..0c127f9dae19 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1275,6 +1275,86 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
 	return aa_sock_perm(OP_SHUTDOWN, AA_MAY_SHUTDOWN, sock);
 }
 
+/**
+ * apparmor_lsm_config_self_policy - Stack a profile
+ * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
+ * @buf: buffer containing the user-provided name of the profile to stack
+ * @size: size of @buf
+ * @flags: reserved for future use; must be zero
+ *
+ * Returns: 0 on success, negative value on error
+ */
+static int apparmor_lsm_config_self_policy(u32 op, void __user *buf,
+					   size_t size, u32 flags)
+{
+	char *name;
+	long name_size;
+	int ret;
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+	if (size == 0)
+		return -EINVAL;
+	if (size > AA_PROFILE_NAME_MAX_SIZE)
+		return -E2BIG;
+
+	name = kmalloc(size, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	name_size = strncpy_from_user(name, buf, size);
+	if (name_size <= 0) {
+		kfree(name);
+		return name_size;
+	} else if (name_size == size) {
+		kfree(name);
+		return -E2BIG;
+	}
+
+	ret = aa_change_profile(name, AA_CHANGE_STACK);
+
+	kfree(name);
+
+	return ret;
+}
+
+/**
+ * apparmor_lsm_config_system_policy - Load or replace a system policy
+ * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
+ * @buf: user-supplied buffer in the form "<ns>\0<policy>"
+ *        <ns> is the namespace to load the policy into (empty string for root)
+ *        <policy> is the policy to load
+ * @size: size of @buf
+ * @flags: reserved for future uses; must be zero
+ *
+ * Returns: 0 on success, negative value on error
+ */
+static int apparmor_lsm_config_system_policy(u32 op, void __user *buf,
+					     size_t size, u32 flags)
+{
+	loff_t pos = 0; // Partial writing is not currently supported
+	char ns_name[AA_PROFILE_NAME_MAX_SIZE];
+	size_t ns_size;
+	size_t max_ns_size = min(size, AA_PROFILE_NAME_MAX_SIZE);
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+	if (size < 2)
+		return -EINVAL;
+	if (size > AA_PROFILE_MAX_SIZE)
+		return -E2BIG;
+
+	ns_size = strncpy_from_user(ns_name, buf, max_ns_size);
+	if (ns_size < 0)
+		return ns_size;
+	if (ns_size == max_ns_size)
+		return -E2BIG;
+
+	return aa_profile_load_ns_name(ns_name, ns_size, buf + ns_size + 1,
+				       size - ns_size - 1, &pos);
+}
+
+
 #ifdef CONFIG_NETWORK_SECMARK
 /**
  * apparmor_socket_sock_rcv_skb - check perms before associating skb to sk
@@ -1483,6 +1563,10 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(socket_getsockopt, apparmor_socket_getsockopt),
 	LSM_HOOK_INIT(socket_setsockopt, apparmor_socket_setsockopt),
 	LSM_HOOK_INIT(socket_shutdown, apparmor_socket_shutdown),
+
+	LSM_HOOK_INIT(lsm_config_self_policy, apparmor_lsm_config_self_policy),
+	LSM_HOOK_INIT(lsm_config_system_policy,
+		      apparmor_lsm_config_system_policy),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(socket_sock_rcv_skb, apparmor_socket_sock_rcv_skb),
 #endif
-- 
2.48.1


