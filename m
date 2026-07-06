Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0to/AQ5BTGqCiQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:06 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 91441716631
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgtCK-0006PN-NW; Mon, 06 Jul 2026 23:58:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wgtCF-0006MT-IZ
 for apparmor@lists.ubuntu.com; Mon, 06 Jul 2026 23:57:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C854C414D1;
 Mon,  6 Jul 2026 23:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E001F000E9;
 Mon,  6 Jul 2026 23:51:34 +0000 (UTC)
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Mon,  6 Jul 2026 16:50:51 -0700
Message-ID: <20260706235053.4104951-7-song@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706235053.4104951-1-song@kernel.org>
References: <20260706235053.4104951-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: [apparmor] [PATCH v6 6/8] tomoyo: Convert from sb_mount to granular
	mount hooks
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
From: Song Liu via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Song Liu <song@kernel.org>
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i-love.sakura.ne.jp:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[song@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91441716631

Replace tomoyo_sb_mount() with granular mount hooks. Each hook
reconstructs the MS_* flags expected by tomoyo_mount_permission()
using the original flags parameter where available.

Key changes:
- mount_bind: passes the pre-resolved source path to
  tomoyo_mount_acl() via a new dev_path parameter, instead of
  re-resolving dev_name via kern_path(). This eliminates a TOCTOU
  vulnerability.
- mount_new, mount_remount, mount_reconfigure: use the original
  mount(2) flags for policy matching.
- mount_move: passes pre-resolved paths for both source and
  destination; the new top_path argument is unused.
- mount_change_type: passes raw ms_flags directly.

Also removes the unused data_page parameter from
tomoyo_mount_permission().

Code generated with the assistance of Claude, reviewed by human.

Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Song Liu <song@kernel.org>
---
 security/tomoyo/common.h |   2 +-
 security/tomoyo/mount.c  |  31 +++++++----
 security/tomoyo/tomoyo.c | 111 +++++++++++++++++++++++++++++++++++----
 3 files changed, 123 insertions(+), 21 deletions(-)

diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
index d098cf8aae61..9241034cfede 100644
--- a/security/tomoyo/common.h
+++ b/security/tomoyo/common.h
@@ -1013,7 +1013,7 @@ int tomoyo_mkdev_perm(const u8 operation, const struct path *path,
 		      const unsigned int mode, unsigned int dev);
 int tomoyo_mount_permission(const char *dev_name, const struct path *path,
 			    const char *type, unsigned long flags,
-			    void *data_page);
+			    const struct path *dev_path);
 int tomoyo_open_control(const u8 type, struct file *file);
 int tomoyo_path2_perm(const u8 operation, const struct path *path1,
 		      const struct path *path2);
diff --git a/security/tomoyo/mount.c b/security/tomoyo/mount.c
index 322dfd188ada..82ffe7d02814 100644
--- a/security/tomoyo/mount.c
+++ b/security/tomoyo/mount.c
@@ -70,6 +70,7 @@ static bool tomoyo_check_mount_acl(struct tomoyo_request_info *r,
  * @dir:      Pointer to "struct path".
  * @type:     Name of filesystem type.
  * @flags:    Mount options.
+ * @dev_path: Pre-resolved device/source path. Maybe NULL.
  *
  * Returns 0 on success, negative value otherwise.
  *
@@ -78,11 +79,11 @@ static bool tomoyo_check_mount_acl(struct tomoyo_request_info *r,
 static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 			    const char *dev_name,
 			    const struct path *dir, const char *type,
-			    unsigned long flags)
+			    unsigned long flags,
+			    const struct path *dev_path)
 	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_obj_info obj = { };
-	struct path path;
 	struct file_system_type *fstype = NULL;
 	const char *requested_type = NULL;
 	const char *requested_dir_name = NULL;
@@ -134,13 +135,23 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 			need_dev = 1;
 	}
 	if (need_dev) {
-		/* Get mount point or device file. */
-		if (!dev_name || kern_path(dev_name, LOOKUP_FOLLOW, &path)) {
+		if (dev_path) {
+			/* Use pre-resolved path to avoid TOCTOU issues. */
+			obj.path1 = *dev_path;
+			path_get(&obj.path1);
+		} else if (!dev_name) {
 			error = -ENOENT;
 			goto out;
+		} else {
+			struct path path;
+
+			if (kern_path(dev_name, LOOKUP_FOLLOW, &path)) {
+				error = -ENOENT;
+				goto out;
+			}
+			obj.path1 = path;
 		}
-		obj.path1 = path;
-		requested_dev_name = tomoyo_realpath_from_path(&path);
+		requested_dev_name = tomoyo_realpath_from_path(&obj.path1);
 		if (!requested_dev_name) {
 			error = -ENOENT;
 			goto out;
@@ -173,7 +184,7 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 	if (fstype)
 		put_filesystem(fstype);
 	kfree(requested_type);
-	/* Drop refcount obtained by kern_path(). */
+	/* Drop refcount obtained by kern_path() or path_get(). */
 	if (obj.path1.dentry)
 		path_put(&obj.path1);
 	return error;
@@ -186,13 +197,13 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
  * @path:      Pointer to "struct path".
  * @type:      Name of filesystem type. Maybe NULL.
  * @flags:     Mount options.
- * @data_page: Optional data. Maybe NULL.
+ * @dev_path:  Pre-resolved device/source path. Maybe NULL.
  *
  * Returns 0 on success, negative value otherwise.
  */
 int tomoyo_mount_permission(const char *dev_name, const struct path *path,
 			    const char *type, unsigned long flags,
-			    void *data_page)
+			    const struct path *dev_path)
 {
 	struct tomoyo_request_info r;
 	int error;
@@ -236,7 +247,7 @@ int tomoyo_mount_permission(const char *dev_name, const struct path *path,
 	if (!type)
 		type = "<NULL>";
 	idx = tomoyo_read_lock();
-	error = tomoyo_mount_acl(&r, dev_name, path, type, flags);
+	error = tomoyo_mount_acl(&r, dev_name, path, type, flags, dev_path);
 	tomoyo_read_unlock(idx);
 	return error;
 }
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index c66e02ed8ee3..eec3df35e28e 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/lsm_hooks.h>
+#include <linux/fs_context.h>
+#include <uapi/linux/mount.h>
 #include <uapi/linux/lsm.h>
 #include "common.h"
 
@@ -399,20 +401,104 @@ static int tomoyo_path_chroot(const struct path *path)
 }
 
 /**
- * tomoyo_sb_mount - Target for security_sb_mount().
+ * tomoyo_mount_bind - Target for security_mount_bind().
  *
- * @dev_name: Name of device file. Maybe NULL.
- * @path:     Pointer to "struct path".
- * @type:     Name of filesystem type. Maybe NULL.
- * @flags:    Mount options.
- * @data:     Optional data. Maybe NULL.
+ * @from:    Pointer to "struct path".
+ * @to:      Pointer to "struct path".
+ * @recurse: Whether recursive bind mount or not.
  *
  * Returns 0 on success, negative value otherwise.
  */
-static int tomoyo_sb_mount(const char *dev_name, const struct path *path,
-			   const char *type, unsigned long flags, void *data)
+static int tomoyo_mount_bind(const struct path *from, const struct path *to,
+			     bool recurse)
 {
-	return tomoyo_mount_permission(dev_name, path, type, flags, data);
+	unsigned long flags = MS_BIND | (recurse ? MS_REC : 0);
+
+	return tomoyo_mount_permission(NULL, to, NULL, flags, from);
+}
+
+/**
+ * tomoyo_mount_new - Target for security_mount_new().
+ *
+ * @fc:        Pointer to "struct fs_context".
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ * @data:      Optional data. Maybe NULL.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_new(struct fs_context *fc, const struct path *mp,
+			    int mnt_flags, unsigned long flags, void *data)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(fc->source, mp, fc->fs_type->name,
+				       flags, NULL);
+}
+
+/**
+ * tomoyo_mount_remount - Target for security_mount_remount().
+ *
+ * @fc:        Pointer to "struct fs_context".
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ * @data:      Optional data. Maybe NULL.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_remount(struct fs_context *fc, const struct path *mp,
+				int mnt_flags, unsigned long flags, void *data)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
+}
+
+/**
+ * tomoyo_mount_reconfigure - Target for security_mount_reconfigure().
+ *
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_reconfigure(const struct path *mp,
+				    unsigned int mnt_flags,
+				    unsigned long flags)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
+}
+
+/**
+ * tomoyo_mount_change_type - Target for security_mount_change_type().
+ *
+ * @mp:       Pointer to "struct path".
+ * @ms_flags: Mount options.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_change_type(const struct path *mp, int ms_flags)
+{
+	return tomoyo_mount_permission(NULL, mp, NULL, ms_flags, NULL);
+}
+
+/**
+ * tomoyo_mount_move - Target for security_mount_move().
+ *
+ * @from_path: Pointer to "struct path".
+ * @to_path:   Pointer to "struct path".
+ * @top_path:  Pointer to "struct path" of the mount ending up on top.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_move(const struct path *from_path,
+			     const struct path *to_path,
+			     const struct path *top_path)
+{
+	return tomoyo_mount_permission(NULL, to_path, NULL, MS_MOVE,
+				       from_path);
 }
 
 /**
@@ -576,7 +662,12 @@ static struct security_hook_list tomoyo_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(path_chmod, tomoyo_path_chmod),
 	LSM_HOOK_INIT(path_chown, tomoyo_path_chown),
 	LSM_HOOK_INIT(path_chroot, tomoyo_path_chroot),
-	LSM_HOOK_INIT(sb_mount, tomoyo_sb_mount),
+	LSM_HOOK_INIT(mount_bind, tomoyo_mount_bind),
+	LSM_HOOK_INIT(mount_new, tomoyo_mount_new),
+	LSM_HOOK_INIT(mount_remount, tomoyo_mount_remount),
+	LSM_HOOK_INIT(mount_reconfigure, tomoyo_mount_reconfigure),
+	LSM_HOOK_INIT(mount_change_type, tomoyo_mount_change_type),
+	LSM_HOOK_INIT(mount_move, tomoyo_mount_move),
 	LSM_HOOK_INIT(sb_umount, tomoyo_sb_umount),
 	LSM_HOOK_INIT(sb_pivotroot, tomoyo_sb_pivotroot),
 	LSM_HOOK_INIT(socket_bind, tomoyo_socket_bind),
-- 
2.53.0-Meta


