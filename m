Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C5AAC810
	for <lists+apparmor@lfdr.de>; Tue,  6 May 2025 16:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCJN5-0006sO-Ml; Tue, 06 May 2025 14:34:11 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uCJN3-0006kB-2S
 for apparmor@lists.ubuntu.com; Tue, 06 May 2025 14:34:09 +0000
Received: from sec2-plucky-amd64..
 (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 39E8B3FA5D; 
 Tue,  6 May 2025 14:33:53 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Tue,  6 May 2025 16:32:30 +0200
Message-ID: <20250506143254.718647-4-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506143254.718647-1-maxime.belair@canonical.com>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 3/3] AppArmor: add support for lsm_manage_policy
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

Enable users to manage AppArmor policies through the new hook
lsm_manage_policy. Currently, policies can be added but not replaced
using this new mechanism, ensuring that this interface can only further
confine the system.

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 security/apparmor/apparmorfs.c         | 19 +++++++++++++++++++
 security/apparmor/include/apparmorfs.h |  3 +++
 security/apparmor/lsm.c                | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 6039afae4bfc..9abb17e8fdd0 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -439,6 +439,25 @@ static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
 	return error;
 }
 
+/**
+ * aa_profile_load_current_ns - load a profile into the current namespace
+ * @buf buffer containing the user-provided policy
+ * @size size of @buf
+ * @ppos position pointer in the file
+ *
+ * Returns: 0 on success, negative value on error
+ */
+ssize_t aa_profile_load_current_ns(const void __user *buf, size_t size,
+				   loff_t *ppos)
+{
+	struct aa_ns *ns = aa_get_current_ns();
+	int error = policy_update(AA_MAY_LOAD_POLICY, buf, size, ppos, ns);
+
+	aa_put_ns(ns);
+
+	return error >= 0 ? 0 : error;
+}
+
 /* .load file hook fn to load policy */
 static ssize_t profile_load(struct file *f, const char __user *buf, size_t size,
 			    loff_t *pos)
diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index 1e94904f68d9..ba2384e3fb93 100644
--- a/security/apparmor/include/apparmorfs.h
+++ b/security/apparmor/include/apparmorfs.h
@@ -112,6 +112,9 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent);
 void __aafs_ns_rmdir(struct aa_ns *ns);
 int __aafs_ns_mkdir(struct aa_ns *ns, struct dentry *parent, const char *name,
 		     struct dentry *dent);
+ssize_t aa_profile_load_current_ns(const void __user *buf, size_t size,
+				   loff_t *ppos);
+
 
 struct aa_loaddata;
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b6c2f157f83..21f3c4db0e4e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1275,6 +1275,20 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
 	return aa_sock_perm(OP_SHUTDOWN, AA_MAY_SHUTDOWN, sock);
 }
 
+static int apparmor_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
+				      size_t size, u32 flags)
+{
+	loff_t pos = 0; // Partial writing is not currently supported
+
+	if (lsm_id != LSM_ID_APPARMOR)
+		return 0;
+
+	if (op != LSM_POLICY_LOAD || flags)
+		return -EOPNOTSUPP;
+
+	return aa_profile_load_current_ns(buf, size, &pos);
+}
+
 #ifdef CONFIG_NETWORK_SECMARK
 /**
  * apparmor_socket_sock_rcv_skb - check perms before associating skb to sk
@@ -1483,6 +1497,8 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(socket_getsockopt, apparmor_socket_getsockopt),
 	LSM_HOOK_INIT(socket_setsockopt, apparmor_socket_setsockopt),
 	LSM_HOOK_INIT(socket_shutdown, apparmor_socket_shutdown),
+
+	LSM_HOOK_INIT(lsm_manage_policy, apparmor_lsm_manage_policy),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(socket_sock_rcv_skb, apparmor_socket_sock_rcv_skb),
 #endif
-- 
2.48.1


