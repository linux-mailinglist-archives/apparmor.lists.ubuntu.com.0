Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHR7HYj7umlwdwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 20:22:48 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C502C1F7A
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 20:22:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2vz4-0001Hn-2K; Wed, 18 Mar 2026 18:51:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w2vz2-0001Gq-Qx
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 18:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B2FF60121;
 Wed, 18 Mar 2026 18:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DAC2BC9E;
 Wed, 18 Mar 2026 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773859482;
 bh=8wgexpQ+l6hsZh1Cp9+PA1dOETzb7+9N0+A6bgtIX2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TY2BQDIyjGx7VDBG5FT63R3jWs1IkHMGAm61M0bkN3Jegz9OyyK34Bu6OBA00OdtT
 O0/fNS2hM9hom1SxLxSeKInI1ODQ5rObqeIFt4S2QbdIvu0wjyJxawemp8rTTYPyrm
 zU+/IOHAx6npT78KKw0Fa/R/jf+fkkwJWOFJfvV9uXfdFC/nEqkiw9YgH3456nJ+Jg
 RhnCfRLA/DaQM8CUu3nLSPhQCy0A3hLCE+ayTDce6VQxcUGSNVPlT6S1T3/Q06OBjM
 6xiSc6Y39iNlcSKmyAB0mKk58LmRQVVynoWN8vWPAVPG/kVH3bHEYGqai9HleN4Vz7
 5m6A0UC8bT6uw==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Wed, 18 Mar 2026 11:43:59 -0700
Message-ID: <20260318184400.3502908-7-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318184400.3502908-1-song@kernel.org>
References: <20260318184400.3502908-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to granular
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_SPAM(0.00)[0.067];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 44C502C1F7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
  destination.
- mount_change_type: passes raw ms_flags directly.

Also removes the unused data_page parameter from
tomoyo_mount_permission().

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 security/tomoyo/common.h |  2 +-
 security/tomoyo/mount.c  | 31 +++++++++++++-------
 security/tomoyo/tomoyo.c | 63 ++++++++++++++++++++++++++++++----------
 3 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
index 4f1704c911ef..e40441844eab 100644
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
index c66e02ed8ee3..ac84e1f03d5e 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/lsm_hooks.h>
+#include <linux/fs_context.h>
+#include <uapi/linux/mount.h>
 #include <uapi/linux/lsm.h>
 #include "common.h"
 
@@ -398,21 +400,47 @@ static int tomoyo_path_chroot(const struct path *path)
 	return tomoyo_path_perm(TOMOYO_TYPE_CHROOT, path, NULL);
 }
 
-/**
- * tomoyo_sb_mount - Target for security_sb_mount().
- *
- * @dev_name: Name of device file. Maybe NULL.
- * @path:     Pointer to "struct path".
- * @type:     Name of filesystem type. Maybe NULL.
- * @flags:    Mount options.
- * @data:     Optional data. Maybe NULL.
- *
- * Returns 0 on success, negative value otherwise.
- */
-static int tomoyo_sb_mount(const char *dev_name, const struct path *path,
-			   const char *type, unsigned long flags, void *data)
+static int tomoyo_mount_bind(const struct path *from, const struct path *to,
+			     bool recurse)
+{
+	unsigned long flags = MS_BIND | (recurse ? MS_REC : 0);
+
+	return tomoyo_mount_permission(NULL, to, NULL, flags, from);
+}
+
+static int tomoyo_mount_new(struct fs_context *fc, const struct path *mp,
+			    int mnt_flags, unsigned long flags, void *data)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(fc->source, mp, fc->fs_type->name,
+				       flags, NULL);
+}
+
+static int tomoyo_mount_remount(struct fs_context *fc, const struct path *mp,
+				int mnt_flags, unsigned long flags, void *data)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
+}
+
+static int tomoyo_mount_reconfigure(const struct path *mp,
+				    unsigned int mnt_flags,
+				    unsigned long flags)
+{
+	/* Use original MS_* flags for policy matching */
+	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
+}
+
+static int tomoyo_mount_change_type(const struct path *mp, int ms_flags)
+{
+	return tomoyo_mount_permission(NULL, mp, NULL, ms_flags, NULL);
+}
+
+static int tomoyo_move_mount(const struct path *from_path,
+			     const struct path *to_path)
 {
-	return tomoyo_mount_permission(dev_name, path, type, flags, data);
+	return tomoyo_mount_permission(NULL, to_path, NULL, MS_MOVE,
+				       from_path);
 }
 
 /**
@@ -576,7 +604,12 @@ static struct security_hook_list tomoyo_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(path_chmod, tomoyo_path_chmod),
 	LSM_HOOK_INIT(path_chown, tomoyo_path_chown),
 	LSM_HOOK_INIT(path_chroot, tomoyo_path_chroot),
-	LSM_HOOK_INIT(sb_mount, tomoyo_sb_mount),
+	LSM_HOOK_INIT(mount_bind, tomoyo_mount_bind),
+	LSM_HOOK_INIT(mount_new, tomoyo_mount_new),
+	LSM_HOOK_INIT(mount_remount, tomoyo_mount_remount),
+	LSM_HOOK_INIT(mount_reconfigure, tomoyo_mount_reconfigure),
+	LSM_HOOK_INIT(mount_change_type, tomoyo_mount_change_type),
+	LSM_HOOK_INIT(mount_move, tomoyo_move_mount),
 	LSM_HOOK_INIT(sb_umount, tomoyo_sb_umount),
 	LSM_HOOK_INIT(sb_pivotroot, tomoyo_sb_pivotroot),
 	LSM_HOOK_INIT(socket_bind, tomoyo_socket_bind),
-- 
2.52.0


