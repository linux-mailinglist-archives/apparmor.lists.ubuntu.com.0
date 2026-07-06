Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9X2tKA5BTGqEiQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:06 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3E716640
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgtCJ-0006O9-FV; Mon, 06 Jul 2026 23:57:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wgtCF-0006MR-F4
 for apparmor@lists.ubuntu.com; Mon, 06 Jul 2026 23:57:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A13C40B2D;
 Mon,  6 Jul 2026 23:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BBD1F000E9;
 Mon,  6 Jul 2026 23:51:17 +0000 (UTC)
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Mon,  6 Jul 2026 16:50:48 -0700
Message-ID: <20260706235053.4104951-4-song@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706235053.4104951-1-song@kernel.org>
References: <20260706235053.4104951-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: [apparmor] [PATCH v6 3/8] apparmor: Convert from sb_mount to
	granular mount hooks
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
X-Rspamd-Queue-Id: 8FB3E716640

Replace AppArmor's monolithic apparmor_sb_mount() with granular
mount hooks.

Key changes:
- mount_bind: uses the pre-resolved struct path from VFS instead of
  re-resolving dev_name via kern_path(), eliminating a TOCTOU
  vulnerability. aa_bind_mount() now takes a struct path instead of
  a string for the source.
- mount_new, mount_remount: receive the original mount(2) flags and
  data parameters for policy matching via match_mnt_flags() and
  AA_MNT_CONT_MATCH data matching.
- mount_reconfigure: handles MS_REMOUNT|MS_BIND (mount attribute
  reconfiguration) which was previously handled as a remount.
- mount_move: wired to apparmor_move_mount(); its signature gains the
  new top_path argument (currently unused, reserved for
  MOVE_MOUNT_BENEATH policy).
- mount_change_type: propagation type changes.

aa_move_mount_old() is removed since move mounts now go through
security_mount_move() with pre-resolved struct path pointers for
both the old mount(2) and new move_mount(2) APIs.

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 security/apparmor/include/mount.h |   5 +-
 security/apparmor/lsm.c           | 103 +++++++++++++++++++++++-------
 security/apparmor/mount.c         |  37 ++---------
 3 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/security/apparmor/include/mount.h b/security/apparmor/include/mount.h
index 46834f828179..088e2f938cc1 100644
--- a/security/apparmor/include/mount.h
+++ b/security/apparmor/include/mount.h
@@ -31,16 +31,13 @@ int aa_remount(const struct cred *subj_cred,
 
 int aa_bind_mount(const struct cred *subj_cred,
 		  struct aa_label *label, const struct path *path,
-		  const char *old_name, unsigned long flags);
+		  const struct path *old_path, bool recurse);
 
 
 int aa_mount_change_type(const struct cred *subj_cred,
 			 struct aa_label *label, const struct path *path,
 			 unsigned long flags);
 
-int aa_move_mount_old(const struct cred *subj_cred,
-		      struct aa_label *label, const struct path *path,
-		      const char *old_name);
 int aa_move_mount(const struct cred *subj_cred,
 		  struct aa_label *label, const struct path *from_path,
 		  const struct path *to_path);
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 71f30dd43f97..d9d5822e4022 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/mount.h>
+#include <linux/fs_context.h>
 #include <linux/namei.h>
 #include <linux/ptrace.h>
 #include <linux/ctype.h>
@@ -698,41 +699,91 @@ static int apparmor_uring_sqpoll(void)
 }
 #endif /* CONFIG_IO_URING */
 
-static int apparmor_sb_mount(const char *dev_name, const struct path *path,
-			     const char *type, unsigned long flags, void *data)
+static int apparmor_mount_bind(const struct path *from, const struct path *to,
+			       bool recurse)
 {
 	struct aa_label *label;
 	int error = 0;
 	bool needput;
 
-	flags &= ~AA_MS_IGNORE_MASK;
+	label = __begin_current_label_crit_section(&needput);
+	if (!unconfined(label))
+		error = aa_bind_mount(current_cred(), label, to, from,
+				      recurse);
+	__end_current_label_crit_section(label, needput);
 
+	return error;
+}
+
+static int apparmor_mount_new(struct fs_context *fc, const struct path *mp,
+			      int mnt_flags, unsigned long flags, void *data)
+{
+	struct aa_label *label;
+	int error = 0;
+	bool needput;
+
+	/* flags and data are from the original mount(2) call */
 	label = __begin_current_label_crit_section(&needput);
-	if (!unconfined(label)) {
-		if (flags & MS_REMOUNT)
-			error = aa_remount(current_cred(), label, path, flags,
-					   data);
-		else if (flags & MS_BIND)
-			error = aa_bind_mount(current_cred(), label, path,
-					      dev_name, flags);
-		else if (flags & (MS_SHARED | MS_PRIVATE | MS_SLAVE |
-				  MS_UNBINDABLE))
-			error = aa_mount_change_type(current_cred(), label,
-						     path, flags);
-		else if (flags & MS_MOVE)
-			error = aa_move_mount_old(current_cred(), label, path,
-						  dev_name);
-		else
-			error = aa_new_mount(current_cred(), label, dev_name,
-					     path, type, flags, data);
-	}
+	if (!unconfined(label))
+		error = aa_new_mount(current_cred(), label, fc->source,
+				     mp, fc->fs_type->name, flags, data);
+	__end_current_label_crit_section(label, needput);
+
+	return error;
+}
+
+static int apparmor_mount_remount(struct fs_context *fc, const struct path *mp,
+				  int mnt_flags, unsigned long flags,
+				  void *data)
+{
+	struct aa_label *label;
+	int error = 0;
+	bool needput;
+
+	/* flags and data are from the original mount(2) call */
+	label = __begin_current_label_crit_section(&needput);
+	if (!unconfined(label))
+		error = aa_remount(current_cred(), label, mp, flags, data);
+	__end_current_label_crit_section(label, needput);
+
+	return error;
+}
+
+static int apparmor_mount_reconfigure(const struct path *mp,
+				      unsigned int mnt_flags,
+				      unsigned long flags)
+{
+	struct aa_label *label;
+	int error = 0;
+	bool needput;
+
+	/* flags are from the original mount(2) call */
+	label = __begin_current_label_crit_section(&needput);
+	if (!unconfined(label))
+		error = aa_remount(current_cred(), label, mp, flags, NULL);
+	__end_current_label_crit_section(label, needput);
+
+	return error;
+}
+
+static int apparmor_mount_change_type(const struct path *mp, int ms_flags)
+{
+	struct aa_label *label;
+	int error = 0;
+	bool needput;
+
+	label = __begin_current_label_crit_section(&needput);
+	if (!unconfined(label))
+		error = aa_mount_change_type(current_cred(), label, mp,
+					     ms_flags);
 	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
 
 static int apparmor_move_mount(const struct path *from_path,
-			       const struct path *to_path)
+			       const struct path *to_path,
+			       const struct path *top_path)
 {
 	struct aa_label *label;
 	int error = 0;
@@ -1669,8 +1720,12 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capget, apparmor_capget),
 	LSM_HOOK_INIT(capable, apparmor_capable),
 
-	LSM_HOOK_INIT(move_mount, apparmor_move_mount),
-	LSM_HOOK_INIT(sb_mount, apparmor_sb_mount),
+	LSM_HOOK_INIT(mount_bind, apparmor_mount_bind),
+	LSM_HOOK_INIT(mount_new, apparmor_mount_new),
+	LSM_HOOK_INIT(mount_remount, apparmor_mount_remount),
+	LSM_HOOK_INIT(mount_reconfigure, apparmor_mount_reconfigure),
+	LSM_HOOK_INIT(mount_move, apparmor_move_mount),
+	LSM_HOOK_INIT(mount_change_type, apparmor_mount_change_type),
 	LSM_HOOK_INIT(sb_umount, apparmor_sb_umount),
 	LSM_HOOK_INIT(sb_pivotroot, apparmor_sb_pivotroot),
 
diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 2f5d918832c1..1ea0d680437c 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -418,25 +418,17 @@ int aa_remount(const struct cred *subj_cred,
 }
 
 int aa_bind_mount(const struct cred *subj_cred,
-		  struct aa_label *label, const struct path *path,
-		  const char *dev_name, unsigned long flags)
+		       struct aa_label *label, const struct path *path,
+		       const struct path *old_path, bool recurse)
 {
 	struct aa_profile *profile;
 	char *buffer = NULL, *old_buffer = NULL;
-	struct path old_path;
+	unsigned long flags = MS_BIND | (recurse ? MS_REC : 0);
 	int error;
 
 	AA_BUG(!label);
 	AA_BUG(!path);
-
-	if (!dev_name || !*dev_name)
-		return -EINVAL;
-
-	flags &= MS_REC | MS_BIND;
-
-	error = kern_path(dev_name, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT, &old_path);
-	if (error)
-		return error;
+	AA_BUG(!old_path);
 
 	buffer = aa_get_buffer(false);
 	old_buffer = aa_get_buffer(false);
@@ -445,12 +437,11 @@ int aa_bind_mount(const struct cred *subj_cred,
 		goto out;
 
 	error = fn_for_each_confined(label, profile,
-			match_mnt(subj_cred, profile, path, buffer, &old_path,
+			match_mnt(subj_cred, profile, path, buffer, old_path,
 				  old_buffer, NULL, flags, NULL, false));
 out:
 	aa_put_buffer(buffer);
 	aa_put_buffer(old_buffer);
-	path_put(&old_path);
 
 	return error;
 }
@@ -514,24 +505,6 @@ int aa_move_mount(const struct cred *subj_cred,
 	return error;
 }
 
-int aa_move_mount_old(const struct cred *subj_cred, struct aa_label *label,
-		      const struct path *path, const char *orig_name)
-{
-	struct path old_path;
-	int error;
-
-	if (!orig_name || !*orig_name)
-		return -EINVAL;
-	error = kern_path(orig_name, LOOKUP_FOLLOW, &old_path);
-	if (error)
-		return error;
-
-	error = aa_move_mount(subj_cred, label, &old_path, path);
-	path_put(&old_path);
-
-	return error;
-}
-
 int aa_new_mount(const struct cred *subj_cred, struct aa_label *label,
 		 const char *dev_name, const struct path *path,
 		 const char *type, unsigned long flags, void *data)
-- 
2.53.0-Meta


