Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YmrAHNRBTGqsiQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 02:01:24 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA7716665
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 02:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgtFW-0006xd-CN; Tue, 07 Jul 2026 00:01:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wgtFS-0006wz-9d
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 00:01:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1AA6A60103;
 Mon,  6 Jul 2026 23:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA01F000E9;
 Mon,  6 Jul 2026 23:51:05 +0000 (UTC)
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Mon,  6 Jul 2026 16:50:46 -0700
Message-ID: <20260706235053.4104951-2-song@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706235053.4104951-1-song@kernel.org>
References: <20260706235053.4104951-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v6 1/8] lsm: Add granular mount hooks
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
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
X-Rspamd-Queue-Id: 5CDA7716665

Add the new granular mount hook declarations and implementations
to the LSM framework:

  mount_bind        - bind mount (pre-resolved source path)
  mount_new         - new filesystem mount (with fs_context)
  mount_remount     - filesystem remount (with fs_context)
  mount_reconfigure - mount flag reconfiguration (MS_REMOUNT|MS_BIND)
  mount_move        - move mount (pre-resolved source, target and top
                      paths; target == top unless MOVE_MOUNT_BENEATH)
  mount_change_type - propagation type changes

These hooks are added alongside the existing security_sb_mount() and
security_move_mount() hooks, which remain in place until all LSMs
are converted.

Code generated with the assistance of Claude, reviewed by human.

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
Signed-off-by: Song Liu <song@kernel.org>
---
 include/linux/lsm_hook_defs.h |  12 ++++
 include/linux/security.h      |  52 +++++++++++++++++
 kernel/bpf/bpf_lsm.c          |   7 +++
 security/security.c           | 107 ++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 65c9609ec207..06c904cb478e 100644
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
+	 const struct path *to_path, const struct path *top_path)
+LSM_HOOK(int, 0, mount_change_type, const struct path *mp, int ms_flags)
 LSM_HOOK(int, -EOPNOTSUPP, dentry_init_security, struct dentry *dentry,
 	 int mode, const struct qstr *name, const char **xattr_name,
 	 struct lsm_context *cp)
diff --git a/include/linux/security.h b/include/linux/security.h
index 153e9043058f..5e207e38c004 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -386,6 +386,18 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
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
+			const struct path *to_path,
+			const struct path *top_path);
+int security_mount_change_type(const struct path *mp, int ms_flags);
 int security_dentry_init_security(struct dentry *dentry, int mode,
 				  const struct qstr *name,
 				  const char **xattr_name,
@@ -854,6 +866,46 @@ static inline int security_move_mount(const struct path *from_path,
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
+				      const struct path *to_path,
+				      const struct path *top_path)
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
index 1433809bb166..4b1ee9c67d6f 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -385,6 +385,13 @@ BTF_ID(func, bpf_lsm_task_setscheduler)
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
index 71aea8fdf014..1ede060db3ca 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1182,6 +1182,113 @@ int security_move_mount(const struct path *from_path,
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
+ * @top_path: mount that ends up on top at the destination
+ *
+ * Check permission before a mount is moved.  Called with the destination
+ * pinned under the namespace semaphore, so @to_path reflects the mount
+ * point that will actually be used.  For a plain move @top_path equals
+ * @to_path; for a MOVE_MOUNT_BENEATH move the source is inserted below
+ * @top_path, allowing a policy over the (source, target, top) triple.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_mount_move(const struct path *from_path,
+			const struct path *to_path,
+			const struct path *top_path)
+{
+	return call_int_hook(mount_move, from_path, to_path, top_path);
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


