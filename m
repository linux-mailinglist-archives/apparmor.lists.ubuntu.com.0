Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eekYAdRBTGqriQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 02:01:24 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABE716660
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 02:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgtFU-0006xN-4J; Tue, 07 Jul 2026 00:01:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wgtFS-0006wy-9n
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 00:01:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B0D2560120;
 Mon,  6 Jul 2026 23:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF451F00A3A;
 Mon,  6 Jul 2026 23:51:40 +0000 (UTC)
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Mon,  6 Jul 2026 16:50:52 -0700
Message-ID: <20260706235053.4104951-8-song@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706235053.4104951-1-song@kernel.org>
References: <20260706235053.4104951-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v6 7/8] vfs: Replace
	security_sb_mount/security_move_mount with granular hooks
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
X-Rspamd-Queue-Id: 94ABE716660

Replace the monolithic security_sb_mount() call in path_mount() and
the security_move_mount() call on the mount-move paths with the new
granular mount hooks:

- do_loopback(): call security_mount_bind()
- do_new_mount(): call security_mount_new()
- do_remount(): call security_mount_remount()
- do_reconfigure_mnt(): call security_mount_reconfigure()
- do_change_type(): call security_mount_change_type()
- do_move_mount(): call security_mount_move()
- do_set_group(): call security_mount_move()

The new hooks are called at the individual operation level with
appropriate context (resolved paths, fs_context), rather than at
the top of path_mount() with raw string arguments.

security_mount_bind() and security_mount_move() are called under the
namespace semaphore, after the mountpoint has been resolved and pinned
by LOCK_MOUNT(). This ensures the LSM inspects the mount that will
actually be used, instead of a mountpoint that could be overmounted
between the check and the operation. Placing the move hook in
do_move_mount() and do_set_group() also unifies the old mount(2)
MS_MOVE path (do_move_mount_old()) and the move_mount(2) path
(vfs_move_mount()) on a single call site.

For MOVE_MOUNT_BENEATH, security_mount_move() additionally receives the
mount that ends up on top, so an LSM can tell a plain move (target ==
top) apart from a mount-beneath operation.

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 fs/namespace.c | 77 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 3d5cd5bf3b05..bc9401a2efac 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2893,6 +2893,10 @@ static int do_change_type(const struct path *path, int ms_flags)
 	if (!type)
 		return -EINVAL;
 
+	err = security_mount_change_type(path, ms_flags);
+	if (err)
+		return err;
+
 	guard(namespace_excl)();
 
 	err = may_change_propagation(mnt);
@@ -3003,6 +3007,7 @@ static int do_loopback(const struct path *path, const char *old_name,
 {
 	struct path old_path __free(path_put) = {};
 	struct mount *mnt = NULL;
+	struct path dest;
 	int err;
 
 	if (!old_name || !*old_name)
@@ -3021,6 +3026,17 @@ static int do_loopback(const struct path *path, const char *old_name,
 	if (!check_mnt(mp.parent))
 		return -EINVAL;
 
+	/*
+	 * Check permission against the mountpoint that was actually pinned
+	 * under the namespace semaphore, rather than the caller-supplied
+	 * @path which may have been overmounted before the lock was taken.
+	 */
+	dest.mnt = &mp.parent->mnt;
+	dest.dentry = mp.mp->m_dentry;
+	err = security_mount_bind(&old_path, &dest, recurse);
+	if (err)
+		return err;
+
 	mnt = __do_loopback(&old_path, recurse, CL_COPY_MNT_NS_FILE);
 	if (IS_ERR(mnt))
 		return PTR_ERR(mnt);
@@ -3335,7 +3351,8 @@ static void mnt_warn_timestamp_expiry(const struct path *mountpoint,
  * superblock it refers to.  This is triggered by specifying MS_REMOUNT|MS_BIND
  * to mount(2).
  */
-static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
+static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags,
+			      unsigned long flags)
 {
 	struct super_block *sb = path->mnt->mnt_sb;
 	struct mount *mnt = real_mount(path->mnt);
@@ -3350,6 +3367,10 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
 	if (!can_change_locked_flags(mnt, mnt_flags))
 		return -EPERM;
 
+	ret = security_mount_reconfigure(path, mnt_flags, flags);
+	if (ret)
+		return ret;
+
 	/*
 	 * We're only checking whether the superblock is read-only not
 	 * changing it, so only take down_read(&sb->s_umount).
@@ -3373,7 +3394,7 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
  * on it - tough luck.
  */
 static int do_remount(const struct path *path, int sb_flags,
-		      int mnt_flags, void *data)
+		      int mnt_flags, void *data, unsigned long flags)
 {
 	int err;
 	struct super_block *sb = path->mnt->mnt_sb;
@@ -3400,6 +3421,9 @@ static int do_remount(const struct path *path, int sb_flags,
 	fc->oldapi = true;
 
 	err = parse_monolithic_mount_data(fc, data);
+	if (!err)
+		err = security_mount_remount(fc, path, mnt_flags, flags,
+					    data);
 	if (!err) {
 		down_write(&sb->s_umount);
 		err = -EPERM;
@@ -3438,6 +3462,16 @@ static int do_set_group(const struct path *from_path, const struct path *to_path
 
 	guard(namespace_excl)();
 
+	/*
+	 * Setting a sharing group does not overmount anything, so the
+	 * source, target and top mount all refer to @to_path.  The check
+	 * runs under the namespace semaphore for the same reason as the
+	 * move case.
+	 */
+	err = security_mount_move(from_path, to_path, to_path);
+	if (err)
+		return err;
+
 	err = may_change_propagation(from);
 	if (err)
 		return err;
@@ -3634,6 +3668,7 @@ static int do_move_mount(const struct path *old_path,
 			 enum mnt_tree_flags_t flags)
 {
 	struct mount *old = real_mount(old_path->mnt);
+	struct path target, top;
 	int err;
 	bool beneath = flags & MNT_TREE_BENEATH;
 
@@ -3647,6 +3682,17 @@ static int do_move_mount(const struct path *old_path,
 	if (IS_ERR(mp.parent))
 		return PTR_ERR(mp.parent);
 
+	/*
+	 * The destination that was actually pinned under the namespace
+	 * semaphore.  For a plain move the source is attached on top of
+	 * @target, so @target is also the mount that ends up on top; for
+	 * MOVE_MOUNT_BENEATH the source is inserted below the existing top
+	 * mount, which is reported separately below.
+	 */
+	target.mnt = &mp.parent->mnt;
+	target.dentry = mp.mp->m_dentry;
+	top = target;
+
 	if (check_mnt(old)) {
 		/* if the source is in our namespace... */
 		/* ... it should be detachable from parent */
@@ -3687,8 +3733,14 @@ static int do_move_mount(const struct path *old_path,
 		err = can_move_mount_beneath(old, over, &mp);
 		if (err)
 			return err;
+		top.mnt = &over->mnt;
+		top.dentry = over->mnt.mnt_root;
 	}
 
+	err = security_mount_move(old_path, &target, &top);
+	if (err)
+		return err;
+
 	/*
 	 * Don't move a mount tree containing unbindable mounts to a destination
 	 * mount which is shared.
@@ -3793,7 +3845,7 @@ static int do_new_mount_fc(struct fs_context *fc, const struct path *mountpoint,
  */
 static int do_new_mount(const struct path *path, const char *fstype,
 			int sb_flags, int mnt_flags,
-			const char *name, void *data)
+			const char *name, void *data, unsigned long flags)
 {
 	struct file_system_type *type;
 	struct fs_context *fc;
@@ -3837,6 +3889,9 @@ static int do_new_mount(const struct path *path, const char *fstype,
 		err = parse_monolithic_mount_data(fc, data);
 	if (!err && !mount_capable(fc))
 		err = -EPERM;
+
+	if (!err)
+		err = security_mount_new(fc, path, mnt_flags, flags, data);
 	if (!err)
 		err = do_new_mount_fc(fc, path, mnt_flags);
 
@@ -4087,7 +4142,6 @@ int path_mount(const char *dev_name, const struct path *path,
 		const char *type_page, unsigned long flags, void *data_page)
 {
 	unsigned int mnt_flags = 0, sb_flags;
-	int ret;
 
 	/* Discard magic */
 	if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
@@ -4100,9 +4154,6 @@ int path_mount(const char *dev_name, const struct path *path,
 	if (flags & MS_NOUSER)
 		return -EINVAL;
 
-	ret = security_sb_mount(dev_name, path, type_page, flags, data_page);
-	if (ret)
-		return ret;
 	if (!may_mount())
 		return -EPERM;
 	if (flags & SB_MANDLOCK)
@@ -4148,9 +4199,9 @@ int path_mount(const char *dev_name, const struct path *path,
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
@@ -4159,7 +4210,7 @@ int path_mount(const char *dev_name, const struct path *path,
 		return do_move_mount_old(path, dev_name);
 
 	return do_new_mount(path, type_page, sb_flags, mnt_flags, dev_name,
-			    data_page);
+			    data_page, flags);
 }
 
 int do_mount(const char *dev_name, const char __user *dir_name,
@@ -4554,12 +4605,6 @@ static inline int vfs_move_mount(const struct path *from_path,
 				 const struct path *to_path,
 				 enum mnt_tree_flags_t mflags)
 {
-	int ret;
-
-	ret = security_move_mount(from_path, to_path);
-	if (ret)
-		return ret;
-
 	if (mflags & MNT_TREE_PROPAGATION)
 		return do_set_group(from_path, to_path);
 
-- 
2.53.0-Meta


