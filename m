Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFBmOxWg/mliuAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 09 May 2026 04:46:45 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E444FDB5D
	for <lists+apparmor@lfdr.de>; Sat, 09 May 2026 04:46:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wLWzZ-00028X-N9; Sat, 09 May 2026 02:00:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wLWzX-00022G-CB
 for apparmor@lists.ubuntu.com; Sat, 09 May 2026 02:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4859161146;
 Sat,  9 May 2026 01:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859B7C2BCB0;
 Sat,  9 May 2026 01:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778291552;
 bh=lslOiUDCeEkLYiSj1bv4O3gajdz7E4cmIkMTTAAebjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E6e6q92h8QIPIrA5qcku90WnGPk9sKkfFCz+KRXZ2f8r6BoBPcnmOEtp2F5zehv25
 ak/Upe5okIHNdgK9iuXo/v6l3gneiwl4uufrx0aKs2LkiMDmtW0JiXqCKhftnX/fke
 GxLAlLHg41nWhwsKxT1i5iPLJVfSyPPnh9/cpfsKyNWKRYKEDg17MvuvvmZJ6uKIBX
 gRpcRap304mGssYkejA04jvJuhyHDCgShdexAoSzDW6R2JRsbDE69ZqIStVfNIo9Dl
 shF4CpedxkzltftujL2GV6xas2+TKtthTL7hkVn2VdlAUkMW0sHfnzHn1PTEnswOTL
 AUGqhVSHkSriA==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Fri,  8 May 2026 18:52:02 -0700
Message-ID: <20260509015208.3853132-2-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260509015208.3853132-1-song@kernel.org>
References: <20260509015208.3853132-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v3 1/7] lsm: Add granular mount hooks to replace
	security_sb_mount
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
X-Rspamd-Queue-Id: A0E444FDB5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.299];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-]
X-Rspamd-Action: no action

Add six new LSM hooks for mount operations:

- mount_bind(from, to, recurse): bind mount with pre-resolved
  struct path for source and destination.
- mount_new(fc, mp, mnt_flags, flags, data): new mount, called after
  mount options are parsed. The flags and data parameters carry the
  original mount(2) flags and data for LSMs that need them (AppArmor,
  Tomoyo).
- mount_remount(fc, mp, mnt_flags, flags, data): filesystem remount,
  called after mount options are parsed into the fs_context.
- mount_reconfigure(mp, mnt_flags, flags): mount flag reconfiguration
  (MS_REMOUNT|MS_BIND path).
- mount_move(from, to): move mount with pre-resolved paths.
- mount_change_type(mp, ms_flags): propagation type changes.

These replace the monolithic security_sb_mount() which conflates
multiple distinct operations into a single hook, and suffers from
TOCTOU issues where LSMs re-resolve string-based dev_name via
kern_path().

The mount_move hook is added alongside the existing move_mount hook.
During the transition, LSMs register for both hooks. The move_mount
hook will be removed once all LSMs have been converted.

Some LSMs, such as apparmor and tomoyo, audit the original input passed
in the mount syscall. To keep the same behavior, argument data and flags
are passed in do_* functions. These can be removed if these LSMs no
longer need these information.

All new hooks are registered as sleepable BPF LSM hooks.

Code generated with the assistance of Claude, reviewed by human.

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
Signed-off-by: Song Liu <song@kernel.org>
---
 fs/namespace.c                |  39 +++++++++++--
 include/linux/lsm_hook_defs.h |  12 ++++
 include/linux/security.h      |  50 +++++++++++++++++
 kernel/bpf/bpf_lsm.c          |   7 +++
 security/security.c           | 101 ++++++++++++++++++++++++++++++++++
 5 files changed, 203 insertions(+), 6 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index fe919abd2f01..04e3bd7f6336 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2888,6 +2888,10 @@ static int do_change_type(const struct path *path, int ms_flags)
 	if (!type)
 		return -EINVAL;
 
+	err = security_mount_change_type(path, ms_flags);
+	if (err)
+		return err;
+
 	guard(namespace_excl)();
 
 	err = may_change_propagation(mnt);
@@ -3006,6 +3010,10 @@ static int do_loopback(const struct path *path, const char *old_name,
 	if (err)
 		return err;
 
+	err = security_mount_bind(&old_path, path, recurse);
+	if (err)
+		return err;
+
 	if (mnt_ns_loop(old_path.dentry))
 		return -EINVAL;
 
@@ -3328,7 +3336,8 @@ static void mnt_warn_timestamp_expiry(const struct path *mountpoint,
  * superblock it refers to.  This is triggered by specifying MS_REMOUNT|MS_BIND
  * to mount(2).
  */
-static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
+static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags,
+			      unsigned long flags)
 {
 	struct super_block *sb = path->mnt->mnt_sb;
 	struct mount *mnt = real_mount(path->mnt);
@@ -3343,6 +3352,10 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
 	if (!can_change_locked_flags(mnt, mnt_flags))
 		return -EPERM;
 
+	ret = security_mount_reconfigure(path, mnt_flags, flags);
+	if (ret)
+		return ret;
+
 	/*
 	 * We're only checking whether the superblock is read-only not
 	 * changing it, so only take down_read(&sb->s_umount).
@@ -3366,7 +3379,7 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
  * on it - tough luck.
  */
 static int do_remount(const struct path *path, int sb_flags,
-		      int mnt_flags, void *data)
+		      int mnt_flags, void *data, unsigned long flags)
 {
 	int err;
 	struct super_block *sb = path->mnt->mnt_sb;
@@ -3393,6 +3406,9 @@ static int do_remount(const struct path *path, int sb_flags,
 	fc->oldapi = true;
 
 	err = parse_monolithic_mount_data(fc, data);
+	if (!err)
+		err = security_mount_remount(fc, path, mnt_flags, flags,
+					    data);
 	if (!err) {
 		down_write(&sb->s_umount);
 		err = -EPERM;
@@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path *path, const char *old_name)
 	if (err)
 		return err;
 
+	err = security_mount_move(&old_path, path);
+	if (err)
+		return err;
+
 	return do_move_mount(&old_path, path, 0);
 }
 
@@ -3786,7 +3806,7 @@ static int do_new_mount_fc(struct fs_context *fc, const struct path *mountpoint,
  */
 static int do_new_mount(const struct path *path, const char *fstype,
 			int sb_flags, int mnt_flags,
-			const char *name, void *data)
+			const char *name, void *data, unsigned long flags)
 {
 	struct file_system_type *type;
 	struct fs_context *fc;
@@ -3830,6 +3850,9 @@ static int do_new_mount(const struct path *path, const char *fstype,
 		err = parse_monolithic_mount_data(fc, data);
 	if (!err && !mount_capable(fc))
 		err = -EPERM;
+
+	if (!err)
+		err = security_mount_new(fc, path, mnt_flags, flags, data);
 	if (!err)
 		err = do_new_mount_fc(fc, path, mnt_flags);
 
@@ -4141,9 +4164,9 @@ int path_mount(const char *dev_name, const struct path *path,
 			    SB_I_VERSION);
 
 	if ((flags & (MS_REMOUNT | MS_BIND)) == (MS_REMOUNT | MS_BIND))
-		return do_reconfigure_mnt(path, mnt_flags);
+		return do_reconfigure_mnt(path, mnt_flags, flags);
 	if (flags & MS_REMOUNT)
-		return do_remount(path, sb_flags, mnt_flags, data_page);
+		return do_remount(path, sb_flags, mnt_flags, data_page, flags);
 	if (flags & MS_BIND)
 		return do_loopback(path, dev_name, flags & MS_REC);
 	if (flags & (MS_SHARED | MS_PRIVATE | MS_SLAVE | MS_UNBINDABLE))
@@ -4152,7 +4175,7 @@ int path_mount(const char *dev_name, const struct path *path,
 		return do_move_mount_old(path, dev_name);
 
 	return do_new_mount(path, type_page, sb_flags, mnt_flags, dev_name,
-			    data_page);
+			    data_page, flags);
 }
 
 int do_mount(const char *dev_name, const char __user *dir_name,
@@ -4549,6 +4572,10 @@ static inline int vfs_move_mount(const struct path *from_path,
 	if (ret)
 		return ret;
 
+	ret = security_mount_move(from_path, to_path);
+	if (ret)
+		return ret;
+
 	if (mflags & MNT_TREE_PROPAGATION)
 		return do_set_group(from_path, to_path);
 
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 2b8dfb35caed..98f0fe382665 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -81,6 +81,18 @@ LSM_HOOK(int, 0, sb_clone_mnt_opts, const struct super_block *oldsb,
 	 unsigned long *set_kern_flags)
 LSM_HOOK(int, 0, move_mount, const struct path *from_path,
 	 const struct path *to_path)
+LSM_HOOK(int, 0, mount_bind, const struct path *from, const struct path *to,
+	 bool recurse)
+LSM_HOOK(int, 0, mount_new, struct fs_context *fc, const struct path *mp,
+	 int mnt_flags, unsigned long flags, void *data)
+LSM_HOOK(int, 0, mount_remount, struct fs_context *fc,
+	 const struct path *mp, int mnt_flags, unsigned long flags,
+	 void *data)
+LSM_HOOK(int, 0, mount_reconfigure, const struct path *mp,
+	 unsigned int mnt_flags, unsigned long flags)
+LSM_HOOK(int, 0, mount_move, const struct path *from_path,
+	 const struct path *to_path)
+LSM_HOOK(int, 0, mount_change_type, const struct path *mp, int ms_flags)
 LSM_HOOK(int, -EOPNOTSUPP, dentry_init_security, struct dentry *dentry,
 	 int mode, const struct qstr *name, const char **xattr_name,
 	 struct lsm_context *cp)
diff --git a/include/linux/security.h b/include/linux/security.h
index 41d7367cf403..b1b3da51a88d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -386,6 +386,17 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 				unsigned long kern_flags,
 				unsigned long *set_kern_flags);
 int security_move_mount(const struct path *from_path, const struct path *to_path);
+int security_mount_bind(const struct path *from, const struct path *to,
+			bool recurse);
+int security_mount_new(struct fs_context *fc, const struct path *mp,
+		       int mnt_flags, unsigned long flags, void *data);
+int security_mount_remount(struct fs_context *fc, const struct path *mp,
+			   int mnt_flags, unsigned long flags, void *data);
+int security_mount_reconfigure(const struct path *mp, unsigned int mnt_flags,
+			       unsigned long flags);
+int security_mount_move(const struct path *from_path,
+			const struct path *to_path);
+int security_mount_change_type(const struct path *mp, int ms_flags);
 int security_dentry_init_security(struct dentry *dentry, int mode,
 				  const struct qstr *name,
 				  const char **xattr_name,
@@ -854,6 +865,45 @@ static inline int security_move_mount(const struct path *from_path,
 	return 0;
 }
 
+static inline int security_mount_bind(const struct path *from,
+				      const struct path *to, bool recurse)
+{
+	return 0;
+}
+
+static inline int security_mount_new(struct fs_context *fc,
+				     const struct path *mp, int mnt_flags,
+				     unsigned long flags, void *data)
+{
+	return 0;
+}
+
+static inline int security_mount_remount(struct fs_context *fc,
+					 const struct path *mp, int mnt_flags,
+					 unsigned long flags, void *data)
+{
+	return 0;
+}
+
+static inline int security_mount_reconfigure(const struct path *mp,
+					     unsigned int mnt_flags,
+					     unsigned long flags)
+{
+	return 0;
+}
+
+static inline int security_mount_move(const struct path *from_path,
+				      const struct path *to_path)
+{
+	return 0;
+}
+
+static inline int security_mount_change_type(const struct path *mp,
+					     int ms_flags)
+{
+	return 0;
+}
+
 static inline int security_path_notify(const struct path *path, u64 mask,
 				unsigned int obj_type)
 {
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index c5c925f00202..aa228372cfb4 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -382,6 +382,13 @@ BTF_ID(func, bpf_lsm_task_setscheduler)
 BTF_ID(func, bpf_lsm_userns_create)
 BTF_ID(func, bpf_lsm_bdev_alloc_security)
 BTF_ID(func, bpf_lsm_bdev_setintegrity)
+BTF_ID(func, bpf_lsm_move_mount)
+BTF_ID(func, bpf_lsm_mount_bind)
+BTF_ID(func, bpf_lsm_mount_new)
+BTF_ID(func, bpf_lsm_mount_remount)
+BTF_ID(func, bpf_lsm_mount_reconfigure)
+BTF_ID(func, bpf_lsm_mount_move)
+BTF_ID(func, bpf_lsm_mount_change_type)
 BTF_SET_END(sleepable_lsm_hooks)
 
 BTF_SET_START(untrusted_lsm_hooks)
diff --git a/security/security.c b/security/security.c
index 4e999f023651..b7ec0ec7af26 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1182,6 +1182,107 @@ int security_move_mount(const struct path *from_path,
 	return call_int_hook(move_mount, from_path, to_path);
 }
 
+/**
+ * security_mount_bind() - Check permissions for a bind mount
+ * @from: source path
+ * @to: destination mount point
+ * @recurse: whether this is a recursive bind mount
+ *
+ * Check permission before a bind mount is performed. Called with the
+ * source path already resolved, eliminating TOCTOU issues with
+ * string-based dev_name in security_sb_mount().
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_bind(const struct path *from, const struct path *to,
+			bool recurse)
+{
+	return call_int_hook(mount_bind, from, to, recurse);
+}
+
+/**
+ * security_mount_new() - Check permissions for a new mount
+ * @fc: filesystem context with parsed options
+ * @mp: mount point path
+ * @mnt_flags: mount flags (MNT_*)
+ * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
+ * @data: filesystem specific data (used by AppArmor)
+ *
+ * Check permission before a new filesystem is mounted. Called after
+ * mount options are parsed, providing access to the fs_context.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_new(struct fs_context *fc, const struct path *mp,
+		       int mnt_flags, unsigned long flags, void *data)
+{
+	return call_int_hook(mount_new, fc, mp, mnt_flags, flags, data);
+}
+
+/**
+ * security_mount_remount() - Check permissions for a remount
+ * @fc: filesystem context with parsed options
+ * @mp: mount point path
+ * @mnt_flags: mount flags (MNT_*)
+ * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
+ * @data: filesystem specific data (used by AppArmor)
+ *
+ * Check permission before a filesystem is remounted. Called after
+ * mount options are parsed, providing access to the fs_context.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_remount(struct fs_context *fc, const struct path *mp,
+			   int mnt_flags, unsigned long flags, void *data)
+{
+	return call_int_hook(mount_remount, fc, mp, mnt_flags, flags, data);
+}
+
+/**
+ * security_mount_reconfigure() - Check permissions for mount reconfiguration
+ * @mp: mount point path
+ * @mnt_flags: new mount flags (MNT_*)
+ * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
+ *
+ * Check permission before mount flags are reconfigured (MS_REMOUNT|MS_BIND).
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_reconfigure(const struct path *mp, unsigned int mnt_flags,
+			       unsigned long flags)
+{
+	return call_int_hook(mount_reconfigure, mp, mnt_flags, flags);
+}
+
+/**
+ * security_mount_move() - Check permissions for moving a mount
+ * @from_path: source mount path
+ * @to_path: destination mount point path
+ *
+ * Check permission before a mount is moved.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_move(const struct path *from_path,
+			const struct path *to_path)
+{
+	return call_int_hook(mount_move, from_path, to_path);
+}
+
+/**
+ * security_mount_change_type() - Check permissions for propagation changes
+ * @mp: mount point path
+ * @ms_flags: propagation flags (MS_SHARED, MS_PRIVATE, etc.)
+ *
+ * Check permission before mount propagation type is changed.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_change_type(const struct path *mp, int ms_flags)
+{
+	return call_int_hook(mount_change_type, mp, ms_flags);
+}
+
 /**
  * security_path_notify() - Check if setting a watch is allowed
  * @path: file path
-- 
2.53.0-Meta


