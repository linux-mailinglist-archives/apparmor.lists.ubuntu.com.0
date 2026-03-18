Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OuLIS74umlwdwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 20:08:30 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE22C1CD1
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 20:08:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2vz3-0001H9-IF; Wed, 18 Mar 2026 18:51:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w2vz1-0001GD-Fl
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 18:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63C1660133;
 Wed, 18 Mar 2026 18:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175DFC2BC9E;
 Wed, 18 Mar 2026 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773859488;
 bh=fo1x6gj4a7uyQi+5GRZOYmC+Y0/B2PERcm8yq3CCYb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ty+etV8DaRhGL8bPqIfQNMY2hfhMsBCHip8akYdYpnhybiOO9RSIxWTyBStNytYUP
 t5UsxRXIsHYadNeHMu7YOHZa76fSjgZtmDUDxz9rL9FqVr75xsmD5mYu1ijRrPN61i
 zabjKAFmLDjlDkDWVtwu8WW04Wq5AjfO4yhP1SfsYiGuL91OB3/g6CyzJNzQgYITS7
 xG41aW+FpS1BCXkPnInKUA9le9YrWeFmt2jKluUGPPECfb4vQ9FEk1RukH8Sp2oX98
 1r4Dahq1kQpqX5vqNnZMLpkOLGX1b1OlzRxTgV+WLy663yIB9drZh2s0K//SxVaFJy
 A1xI63U0C9UVA==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Wed, 18 Mar 2026 11:44:00 -0700
Message-ID: <20260318184400.3502908-8-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318184400.3502908-1-song@kernel.org>
References: <20260318184400.3502908-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH 7/7] lsm: Remove security_sb_mount and
	security_move_mount
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
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_SPAM(0.00)[0.070];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 51AE22C1CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that all LSMs have been converted to granular mount hooks,
remove the old hooks:

- security_sb_mount(): removed from lsm_hook_defs.h, security.h,
  security.c, and its call in path_mount().
- security_move_mount(): removed and replaced by security_mount_move()
  in do_move_mount(). All LSMs now use mount_move exclusively.

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 fs/namespace.c                |  6 +-----
 include/linux/lsm_hook_defs.h |  4 ----
 include/linux/security.h      | 16 ---------------
 kernel/bpf/bpf_lsm.c          |  2 --
 security/apparmor/lsm.c       |  1 -
 security/landlock/fs.c        |  1 -
 security/security.c           | 38 -----------------------------------
 security/selinux/hooks.c      |  2 --
 8 files changed, 1 insertion(+), 69 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index de33070e514a..ba5baccdde67 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -4108,7 +4108,6 @@ int path_mount(const char *dev_name, const struct path *path,
 		const char *type_page, unsigned long flags, void *data_page)
 {
 	unsigned int mnt_flags = 0, sb_flags;
-	int ret;
 
 	/* Discard magic */
 	if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
@@ -4121,9 +4120,6 @@ int path_mount(const char *dev_name, const struct path *path,
 	if (flags & MS_NOUSER)
 		return -EINVAL;
 
-	ret = security_sb_mount(dev_name, path, type_page, flags, data_page);
-	if (ret)
-		return ret;
 	if (!may_mount())
 		return -EPERM;
 	if (flags & SB_MANDLOCK)
@@ -4538,7 +4534,7 @@ static inline int vfs_move_mount(const struct path *from_path,
 {
 	int ret;
 
-	ret = security_move_mount(from_path, to_path);
+	ret = security_mount_move(from_path, to_path);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 6bb67059fb43..95537574c40b 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -69,8 +69,6 @@ LSM_HOOK(int, 0, sb_remount, struct super_block *sb, void *mnt_opts)
 LSM_HOOK(int, 0, sb_kern_mount, const struct super_block *sb)
 LSM_HOOK(int, 0, sb_show_options, struct seq_file *m, struct super_block *sb)
 LSM_HOOK(int, 0, sb_statfs, struct dentry *dentry)
-LSM_HOOK(int, 0, sb_mount, const char *dev_name, const struct path *path,
-	 const char *type, unsigned long flags, void *data)
 LSM_HOOK(int, 0, sb_umount, struct vfsmount *mnt, int flags)
 LSM_HOOK(int, 0, sb_pivotroot, const struct path *old_path,
 	 const struct path *new_path)
@@ -79,8 +77,6 @@ LSM_HOOK(int, 0, sb_set_mnt_opts, struct super_block *sb, void *mnt_opts,
 LSM_HOOK(int, 0, sb_clone_mnt_opts, const struct super_block *oldsb,
 	 struct super_block *newsb, unsigned long kern_flags,
 	 unsigned long *set_kern_flags)
-LSM_HOOK(int, 0, move_mount, const struct path *from_path,
-	 const struct path *to_path)
 LSM_HOOK(int, 0, mount_bind, const struct path *from, const struct path *to,
 	 bool recurse)
 LSM_HOOK(int, 0, mount_new, struct fs_context *fc, const struct path *mp,
diff --git a/include/linux/security.h b/include/linux/security.h
index 6e31de9b3d68..3610a49304c6 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -372,8 +372,6 @@ int security_sb_remount(struct super_block *sb, void *mnt_opts);
 int security_sb_kern_mount(const struct super_block *sb);
 int security_sb_show_options(struct seq_file *m, struct super_block *sb);
 int security_sb_statfs(struct dentry *dentry);
-int security_sb_mount(const char *dev_name, const struct path *path,
-		      const char *type, unsigned long flags, void *data);
 int security_sb_umount(struct vfsmount *mnt, int flags);
 int security_sb_pivotroot(const struct path *old_path, const struct path *new_path);
 int security_sb_set_mnt_opts(struct super_block *sb,
@@ -384,7 +382,6 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 				struct super_block *newsb,
 				unsigned long kern_flags,
 				unsigned long *set_kern_flags);
-int security_move_mount(const struct path *from_path, const struct path *to_path);
 int security_mount_bind(const struct path *from, const struct path *to,
 			bool recurse);
 int security_mount_new(struct fs_context *fc, const struct path *mp,
@@ -818,13 +815,6 @@ static inline int security_sb_statfs(struct dentry *dentry)
 	return 0;
 }
 
-static inline int security_sb_mount(const char *dev_name, const struct path *path,
-				    const char *type, unsigned long flags,
-				    void *data)
-{
-	return 0;
-}
-
 static inline int security_sb_umount(struct vfsmount *mnt, int flags)
 {
 	return 0;
@@ -852,12 +842,6 @@ static inline int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 	return 0;
 }
 
-static inline int security_move_mount(const struct path *from_path,
-				      const struct path *to_path)
-{
-	return 0;
-}
-
 static inline int security_mount_bind(const struct path *from,
 				      const struct path *to, bool recurse)
 {
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index 65235d70ee23..3e61c54f9b48 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -350,7 +350,6 @@ BTF_ID(func, bpf_lsm_release_secctx)
 BTF_ID(func, bpf_lsm_sb_alloc_security)
 BTF_ID(func, bpf_lsm_sb_eat_lsm_opts)
 BTF_ID(func, bpf_lsm_sb_kern_mount)
-BTF_ID(func, bpf_lsm_sb_mount)
 BTF_ID(func, bpf_lsm_sb_remount)
 BTF_ID(func, bpf_lsm_sb_set_mnt_opts)
 BTF_ID(func, bpf_lsm_sb_show_options)
@@ -383,7 +382,6 @@ BTF_ID(func, bpf_lsm_task_prctl)
 BTF_ID(func, bpf_lsm_task_setscheduler)
 BTF_ID(func, bpf_lsm_task_to_inode)
 BTF_ID(func, bpf_lsm_userns_create)
-BTF_ID(func, bpf_lsm_move_mount)
 BTF_ID(func, bpf_lsm_mount_bind)
 BTF_ID(func, bpf_lsm_mount_new)
 BTF_ID(func, bpf_lsm_mount_remount)
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 7fe774535992..13a8049b1b59 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1713,7 +1713,6 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capget, apparmor_capget),
 	LSM_HOOK_INIT(capable, apparmor_capable),
 
-	LSM_HOOK_INIT(move_mount, apparmor_move_mount),
 	LSM_HOOK_INIT(mount_bind, apparmor_mount_bind),
 	LSM_HOOK_INIT(mount_new, apparmor_mount_new),
 	LSM_HOOK_INIT(mount_remount, apparmor_mount_remount),
diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index 6e810550efcb..5f723a70baa4 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -1857,7 +1857,6 @@ static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(mount_reconfigure, hook_mount_reconfigure),
 	LSM_HOOK_INIT(mount_change_type, hook_mount_change_type),
 	LSM_HOOK_INIT(mount_move, hook_move_mount),
-	LSM_HOOK_INIT(move_mount, hook_move_mount),
 	LSM_HOOK_INIT(sb_umount, hook_sb_umount),
 	LSM_HOOK_INIT(sb_remount, hook_sb_remount),
 	LSM_HOOK_INIT(sb_pivotroot, hook_sb_pivotroot),
diff --git a/security/security.c b/security/security.c
index 356ef228d5de..af95868af34d 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1039,29 +1039,6 @@ int security_sb_statfs(struct dentry *dentry)
 	return call_int_hook(sb_statfs, dentry);
 }
 
-/**
- * security_sb_mount() - Check permission for mounting a filesystem
- * @dev_name: filesystem backing device
- * @path: mount point
- * @type: filesystem type
- * @flags: mount flags
- * @data: filesystem specific data
- *
- * Check permission before an object specified by @dev_name is mounted on the
- * mount point named by @nd.  For an ordinary mount, @dev_name identifies a
- * device if the file system type requires a device.  For a remount
- * (@flags & MS_REMOUNT), @dev_name is irrelevant.  For a loopback/bind mount
- * (@flags & MS_BIND), @dev_name identifies the	pathname of the object being
- * mounted.
- *
- * Return: Returns 0 if permission is granted.
- */
-int security_sb_mount(const char *dev_name, const struct path *path,
-		      const char *type, unsigned long flags, void *data)
-{
-	return call_int_hook(sb_mount, dev_name, path, type, flags, data);
-}
-
 /**
  * security_sb_umount() - Check permission for unmounting a filesystem
  * @mnt: mounted filesystem
@@ -1141,21 +1118,6 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 }
 EXPORT_SYMBOL(security_sb_clone_mnt_opts);
 
-/**
- * security_move_mount() - Check permissions for moving a mount
- * @from_path: source mount point
- * @to_path: destination mount point
- *
- * Check permission before a mount is moved.
- *
- * Return: Returns 0 if permission is granted.
- */
-int security_move_mount(const struct path *from_path,
-			const struct path *to_path)
-{
-	return call_int_hook(move_mount, from_path, to_path);
-}
-
 /**
  * security_mount_bind() - Check permissions for a bind mount
  * @from: source path
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 415b5541ab9e..446e9e242134 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7477,8 +7477,6 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(sb_set_mnt_opts, selinux_set_mnt_opts),
 	LSM_HOOK_INIT(sb_clone_mnt_opts, selinux_sb_clone_mnt_opts),
 
-	LSM_HOOK_INIT(move_mount, selinux_move_mount),
-
 	LSM_HOOK_INIT(dentry_init_security, selinux_dentry_init_security),
 	LSM_HOOK_INIT(dentry_create_files_as, selinux_dentry_create_files_as),
 
-- 
2.52.0


