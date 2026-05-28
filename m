Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nl8Fge3GGqkmQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 23:43:35 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C65FA859
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 23:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSfWo-0005Uh-GF; Thu, 28 May 2026 18:32:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wSfWk-0005SV-FD
 for apparmor@lists.ubuntu.com; Thu, 28 May 2026 18:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A6C2660564;
 Thu, 28 May 2026 18:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444A81F00A3A;
 Thu, 28 May 2026 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779992824;
 bh=+hRJlrl7e1QIbtRZfpQ9G5PzzXMJjzBa7MKIONMnGy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=REl/TSE3dXLslmUmYMOrcoH4xnvumFe2m4CLKENCiBDf9qwUQm7E9YINqUgQF+Wlb
 SbKPQ8Fs47D8KPRUqcSN9c8Th+8wPLlmLd9oVzbbB481jUyM+6UMmPd5TaZM80THqe
 /VnSCPgL5EKLBI5zhpg6SGnZk63lNVhuSZb+BQsojB3ZFnrczmwBi5mu8xSFsQClKE
 Yu36RSjrT6c8sQGAt8BGQebZlX1pB4T3URLtdnXGyIzmywhxlejODku3+Nftkqax4g
 jHNpT/DsoCEJtkl8Z0+nmMR4F+/tHQNFR3YIr2PdfW4ZsXJdppTjHfAQs4gvd8x6sL
 qy438Qh7gdxWw==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Thu, 28 May 2026 11:26:07 -0700
Message-ID: <20260528182607.3150386-9-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260528182607.3150386-1-song@kernel.org>
References: <20260528182607.3150386-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v5 8/8] lsm: Remove security_sb_mount and
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
	GREYLIST(0.00)[pass,body];
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
	NEURAL_HAM(-0.00)[-0.416];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-]
X-Rspamd-Queue-Id: 1C9C65FA859
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that all LSMs have been converted to granular mount hooks and
fs/namespace.c calls the new hooks, remove the old hooks:

- security_sb_mount(): removed from lsm_hook_defs.h, security.h,
  security.c.
- security_move_mount(): removed from lsm_hook_defs.h, security.h,
  security.c, and bpf_lsm.c.

Code generated with the assistance of Claude, reviewed by human.

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
Signed-off-by: Song Liu <song@kernel.org>
---
 include/linux/lsm_hook_defs.h |  4 ----
 include/linux/security.h      | 16 ---------------
 kernel/bpf/bpf_lsm.c          |  2 --
 security/security.c           | 38 -----------------------------------
 4 files changed, 60 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 98f0fe382665..c870260bf402 100644
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
index b1b3da51a88d..f1dcfc569cf2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -373,8 +373,6 @@ int security_sb_remount(struct super_block *sb, void *mnt_opts);
 int security_sb_kern_mount(const struct super_block *sb);
 int security_sb_show_options(struct seq_file *m, struct super_block *sb);
 int security_sb_statfs(struct dentry *dentry);
-int security_sb_mount(const char *dev_name, const struct path *path,
-		      const char *type, unsigned long flags, void *data);
 int security_sb_umount(struct vfsmount *mnt, int flags);
 int security_sb_pivotroot(const struct path *old_path, const struct path *new_path);
 int security_sb_set_mnt_opts(struct super_block *sb,
@@ -385,7 +383,6 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
 				struct super_block *newsb,
 				unsigned long kern_flags,
 				unsigned long *set_kern_flags);
-int security_move_mount(const struct path *from_path, const struct path *to_path);
 int security_mount_bind(const struct path *from, const struct path *to,
 			bool recurse);
 int security_mount_new(struct fs_context *fc, const struct path *mp,
@@ -825,13 +822,6 @@ static inline int security_sb_statfs(struct dentry *dentry)
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
@@ -859,12 +849,6 @@ static inline int security_sb_clone_mnt_opts(const struct super_block *oldsb,
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
index aa228372cfb4..77371ca25d09 100644
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
@@ -382,7 +381,6 @@ BTF_ID(func, bpf_lsm_task_setscheduler)
 BTF_ID(func, bpf_lsm_userns_create)
 BTF_ID(func, bpf_lsm_bdev_alloc_security)
 BTF_ID(func, bpf_lsm_bdev_setintegrity)
-BTF_ID(func, bpf_lsm_move_mount)
 BTF_ID(func, bpf_lsm_mount_bind)
 BTF_ID(func, bpf_lsm_mount_new)
 BTF_ID(func, bpf_lsm_mount_remount)
diff --git a/security/security.c b/security/security.c
index b7ec0ec7af26..bc55ee588c59 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1065,29 +1065,6 @@ int security_sb_statfs(struct dentry *dentry)
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
@@ -1167,21 +1144,6 @@ int security_sb_clone_mnt_opts(const struct super_block *oldsb,
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
-- 
2.53.0-Meta


