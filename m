Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB28BCD438
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7D9E-0002IP-1I; Fri, 10 Oct 2025 13:27:04 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7D9A-0002HM-EF
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:27:00 +0000
Received: from sec2-plucky-amd64.. (176-136-128-80.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E53B542ABE; 
 Fri, 10 Oct 2025 13:26:59 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 10 Oct 2025 15:25:32 +0200
Message-ID: <20251010132610.12001-6-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010132610.12001-1-maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v6 5/5] Smack: add support for
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

Enable users to manage Smack policies through the new hooks
lsm_config_self_policy and lsm_config_system_policy.

lsm_config_self_policy allows adding Smack policies for the current cred.
For now it remains restricted to CAP_MAC_ADMIN.

lsm_config_system_policy allows adding globabl Smack policies. This is
restricted to CAP_MAC_ADMIN.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 security/smack/smack.h     |  8 +++++
 security/smack/smack_lsm.c | 73 ++++++++++++++++++++++++++++++++++++++
 security/smack/smackfs.c   |  2 +-
 3 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/security/smack/smack.h b/security/smack/smack.h
index bf6a6ed3946c..3e3d30dfdcf7 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -275,6 +275,14 @@ struct smk_audit_info {
 #endif
 };
 
+/*
+ * This function is in smackfs.c
+ */
+ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
+			     size_t count, loff_t *ppos,
+			     struct list_head *rule_list,
+			     struct mutex *rule_lock, int format);
+
 /*
  * These functions are in smack_access.c
  */
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 99833168604e..bf4bb2242768 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -5027,6 +5027,76 @@ static int smack_uring_cmd(struct io_uring_cmd *ioucmd)
 
 #endif /* CONFIG_IO_URING */
 
+/**
+ * smack_lsm_config_system_policy - Configure a system smack policy
+ * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
+ * @buf: User-supplied buffer in the form "<fmt><policy>"
+ *        <fmt> is the 1-byte format of <policy>
+ *        <policy> is the policy to load
+ * @size: size of @buf
+ * @flags: reserved for future use; must be zero
+ *
+ * Returns: number of written rules on success, negative value on error
+ */
+static int smack_lsm_config_system_policy(u32 op, void __user *buf, size_t size,
+					  u32 flags)
+{
+	loff_t pos = 0;
+	u8 fmt;
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+
+	if (size < 2)
+		return -EINVAL;
+
+	if (get_user(fmt, (uint8_t *)buf))
+		return -EFAULT;
+
+	return smk_write_rules_list(NULL, buf + 1, size - 1, &pos, NULL, NULL, fmt);
+}
+
+/**
+ * smack_lsm_config_self_policy - Configure a smack policy for the current cred
+ * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
+ * @buf: User-supplied buffer in the form "<fmt><policy>"
+ *        <fmt> is the 1-byte format of <policy>
+ *        <policy> is the policy to load
+ * @size: size of @buf
+ * @flags: reserved for future use; must be zero
+ *
+ * Returns: number of written rules on success, negative value on error
+ */
+static int smack_lsm_config_self_policy(u32 op, void __user *buf, size_t size,
+					u32 flags)
+{
+	loff_t pos = 0;
+	u8 fmt;
+	struct task_smack *tsp;
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+
+	if (size < 2)
+		return -EINVAL;
+
+	if (get_user(fmt, (uint8_t *)buf))
+		return -EFAULT;
+	/**
+	 * smk_write_rules_list could be used to gain privileges.
+	 * This function is thus restricted to CAP_MAC_ADMIN.
+	 * TODO: Ensure that the new rule does not give extra privileges
+	 * before dropping this CAP_MAC_ADMIN check.
+	 */
+	if (!capable(CAP_MAC_ADMIN))
+		return -EPERM;
+
+
+	tsp = smack_cred(current_cred());
+	return smk_write_rules_list(NULL, buf + 1, size - 1, &pos, &tsp->smk_rules,
+				    &tsp->smk_rules_lock, fmt);
+}
+
 struct lsm_blob_sizes smack_blob_sizes __ro_after_init = {
 	.lbs_cred = sizeof(struct task_smack),
 	.lbs_file = sizeof(struct smack_known *),
@@ -5203,6 +5273,9 @@ static struct security_hook_list smack_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(uring_sqpoll, smack_uring_sqpoll),
 	LSM_HOOK_INIT(uring_cmd, smack_uring_cmd),
 #endif
+	LSM_HOOK_INIT(lsm_config_self_policy, smack_lsm_config_self_policy),
+	LSM_HOOK_INIT(lsm_config_system_policy, smack_lsm_config_system_policy),
+
 };
 
 
diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 90a67e410808..ed1814588d56 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -441,7 +441,7 @@ static ssize_t smk_parse_long_rule(char *data, struct smack_parsed_rule *rule,
  *	"subject<whitespace>object<whitespace>
  *	 acc_enable<whitespace>acc_disable[<whitespace>...]"
  */
-static ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
+ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
 					size_t count, loff_t *ppos,
 					struct list_head *rule_list,
 					struct mutex *rule_lock, int format)
-- 
2.48.1


