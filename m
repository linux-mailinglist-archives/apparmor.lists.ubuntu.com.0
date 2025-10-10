Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6BBCD431
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7D9D-0002IG-JE; Fri, 10 Oct 2025 13:27:03 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7D9A-0002HG-3w
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:27:00 +0000
Received: from sec2-plucky-amd64.. (176-136-128-80.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7B78142ABC; 
 Fri, 10 Oct 2025 13:26:59 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 10 Oct 2025 15:25:31 +0200
Message-ID: <20251010132610.12001-5-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010132610.12001-1-maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v6 4/5] SELinux: add support for
	lsm_config_system_policy
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

Enable users to manage SELinux policies through the new hook
lsm_config_system_policy. This feature is restricted to CAP_MAC_ADMIN.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 security/selinux/hooks.c            | 27 +++++++++++++++++++++++++++
 security/selinux/include/security.h |  7 +++++++
 security/selinux/selinuxfs.c        | 16 ++++++++++++----
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index e7a7dcab81db..3d14d4e47937 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7196,6 +7196,31 @@ static int selinux_uring_allowed(void)
 }
 #endif /* CONFIG_IO_URING */
 
+/**
+ * selinux_lsm_config_system_policy - Manage a LSM policy
+ * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
+ * @buf: User-supplied buffer
+ * @size: size of @buf
+ * @flags: reserved for future use; must be zero
+ *
+ * Returns: number of written rules on success, negative value on error
+ */
+static int selinux_lsm_config_system_policy(u32 op, void __user *buf,
+					    size_t size, u32 flags)
+{
+	loff_t pos = 0;
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+
+	if (!selinux_null.dentry || !selinux_null.dentry->d_sb ||
+	    !selinux_null.dentry->d_sb->s_fs_info)
+		return -ENODEV;
+
+	return __sel_write_load(selinux_null.dentry->d_sb->s_fs_info, buf, size,
+				&pos);
+}
+
 static const struct lsm_id selinux_lsmid = {
 	.name = "selinux",
 	.id = LSM_ID_SELINUX,
@@ -7499,6 +7524,8 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 #ifdef CONFIG_PERF_EVENTS
 	LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
 #endif
+	LSM_HOOK_INIT(lsm_config_system_policy, selinux_lsm_config_system_policy),
+
 };
 
 static __init int selinux_init(void)
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index e7827ed7be5f..7b779ea43cc3 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -389,7 +389,14 @@ struct selinux_kernel_status {
 extern void selinux_status_update_setenforce(bool enforcing);
 extern void selinux_status_update_policyload(u32 seqno);
 extern void selinux_complete_init(void);
+
+struct selinux_fs_info;
+
 extern struct path selinux_null;
+extern ssize_t __sel_write_load(struct selinux_fs_info *fsi,
+				const char __user *buf, size_t count,
+				loff_t *ppos);
+
 extern void selnl_notify_setenforce(int val);
 extern void selnl_notify_policyload(u32 seqno);
 extern int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm);
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 47480eb2189b..1f7e611d8300 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -567,11 +567,11 @@ static int sel_make_policy_nodes(struct selinux_fs_info *fsi,
 	return ret;
 }
 
-static ssize_t sel_write_load(struct file *file, const char __user *buf,
-			      size_t count, loff_t *ppos)
+ssize_t __sel_write_load(struct selinux_fs_info *fsi,
+			 const char __user *buf, size_t count,
+			 loff_t *ppos)
 
 {
-	struct selinux_fs_info *fsi;
 	struct selinux_load_state load_state;
 	ssize_t length;
 	void *data = NULL;
@@ -605,7 +605,6 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 		pr_warn_ratelimited("SELinux: failed to load policy\n");
 		goto out;
 	}
-	fsi = file_inode(file)->i_sb->s_fs_info;
 	length = sel_make_policy_nodes(fsi, load_state.policy);
 	if (length) {
 		pr_warn_ratelimited("SELinux: failed to initialize selinuxfs\n");
@@ -626,6 +625,15 @@ static ssize_t sel_write_load(struct file *file, const char __user *buf,
 	return length;
 }
 
+static ssize_t sel_write_load(struct file *file, const char __user *buf,
+			      size_t count, loff_t *ppos)
+{
+	struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
+
+	return __sel_write_load(fsi, buf, count, ppos);
+}
+
+
 static const struct file_operations sel_load_ops = {
 	.write		= sel_write_load,
 	.llseek		= generic_file_llseek,
-- 
2.48.1


