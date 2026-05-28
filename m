Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJtyKgKRGGrWlAgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 21:01:22 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375F5F6CDD
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 21:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSfXZ-0005tM-Bt; Thu, 28 May 2026 18:33:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wSfXW-0005qF-Cu
 for apparmor@lists.ubuntu.com; Thu, 28 May 2026 18:33:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 00ACE443FF;
 Thu, 28 May 2026 18:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76381F00A3A;
 Thu, 28 May 2026 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779992780;
 bh=tlITvrNrt9mPMz5y1YxWS7nD76jeYKkuEyxy2GcNM1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lc+Udl7A/ck3AJja5j71Fz8QLtdpZKAMs29dzgfSfaM19OsV/63pPyMWSzOZfeZff
 vaU5r1ZGmMY8t7vFP0cpie03IYIcKagQl+Wq2cAC1iZigOl9kgeeqrMog0d0YjM/2g
 KJZofjFqPOm+AfjcnD/DkZosyH/R7c/tZQ3q6P1jvfX7tIZpMzN5aXeSK5deT0iOoA
 Kgixx4fuUP9D/gt7sGgjT9BO1YNhyUGlbqYtejpsAV/nvJt8nJXmfm4OIbelCYMXvN
 DpOwNnIDnXHSHXM2wtRa1xOkOcw9cxvZgI8sUW3b3nB6MYPaapQOxWeqKjGK3c4zLD
 +KiL7jikgriag==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Thu, 28 May 2026 11:26:00 -0700
Message-ID: <20260528182607.3150386-2-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260528182607.3150386-1-song@kernel.org>
References: <20260528182607.3150386-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: [apparmor] [PATCH v5 1/8] lsm: Add granular mount hooks
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
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
	NEURAL_HAM(-0.00)[-0.428];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-]
X-Rspamd-Queue-Id: 1375F5F6CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the new granular mount hook declarations and implementations
to the LSM framework:

  mount_bind        - bind mount (pre-resolved source path)
  mount_new         - new filesystem mount (with fs_context)
  mount_remount     - filesystem remount (with fs_context)
  mount_reconfigure - mount flag reconfiguration (MS_REMOUNT|MS_BIND)
  mount_move        - move mount (pre-resolved paths)
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
 include/linux/security.h      |  50 +++++++++++++++++
 kernel/bpf/bpf_lsm.c          |   7 +++
 security/security.c           | 101 ++++++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)

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


