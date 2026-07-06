Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ojISIA5BTGqDiQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:06 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90F71663B
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 01:58:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgtCI-0006NQ-B6; Mon, 06 Jul 2026 23:57:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wgtCF-0006MV-Hh
 for apparmor@lists.ubuntu.com; Mon, 06 Jul 2026 23:57:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0976A402F4;
 Mon,  6 Jul 2026 23:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21811F000E9;
 Mon,  6 Jul 2026 23:51:28 +0000 (UTC)
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Mon,  6 Jul 2026 16:50:50 -0700
Message-ID: <20260706235053.4104951-6-song@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706235053.4104951-1-song@kernel.org>
References: <20260706235053.4104951-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: [apparmor] [PATCH v6 5/8] landlock: Convert from sb_mount to
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
X-Rspamd-Queue-Id: 6A90F71663B

Replace hook_sb_mount() with granular mount hooks. Landlock denies
all mount operations for sandboxed processes regardless of flags,
so all new hooks share a common hook_mount_deny() helper. The
mount_move hook reuses hook_move_mount() (its new top_path argument
is unused).

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 security/landlock/fs.c | 44 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index f7e5e4ef9eac..0c56a3aa45ea 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -1427,9 +1427,7 @@ static void log_fs_change_topology_dentry(
  * inherit these new constraints.  Anyway, for backward compatibility reasons,
  * a dedicated user space option would be required (e.g. as a ruleset flag).
  */
-static int hook_sb_mount(const char *const dev_name,
-			 const struct path *const path, const char *const type,
-			 const unsigned long flags, void *const data)
+static int hook_mount_deny(const struct path *const path)
 {
 	size_t handle_layer;
 	const struct landlock_cred_security *const subject =
@@ -1443,8 +1441,38 @@ static int hook_sb_mount(const char *const dev_name,
 	return -EPERM;
 }
 
+static int hook_mount_bind(const struct path *const from,
+			   const struct path *const to, bool recurse)
+{
+	return hook_mount_deny(to);
+}
+
+static int hook_mount_new(struct fs_context *fc, const struct path *const mp,
+			  int mnt_flags, unsigned long flags, void *data)
+{
+	return hook_mount_deny(mp);
+}
+
+static int hook_mount_remount(struct fs_context *fc, const struct path *mp,
+			      int mnt_flags, unsigned long flags, void *data)
+{
+	return hook_mount_deny(mp);
+}
+
+static int hook_mount_reconfigure(const struct path *const mp,
+				  unsigned int mnt_flags, unsigned long flags)
+{
+	return hook_mount_deny(mp);
+}
+
+static int hook_mount_change_type(const struct path *const mp, int ms_flags)
+{
+	return hook_mount_deny(mp);
+}
+
 static int hook_move_mount(const struct path *const from_path,
-			   const struct path *const to_path)
+			   const struct path *const to_path,
+			   const struct path *const top_path)
 {
 	size_t handle_layer;
 	const struct landlock_cred_security *const subject =
@@ -1981,8 +2009,12 @@ static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_free_security_rcu, hook_inode_free_security_rcu),
 
 	LSM_HOOK_INIT(sb_delete, hook_sb_delete),
-	LSM_HOOK_INIT(sb_mount, hook_sb_mount),
-	LSM_HOOK_INIT(move_mount, hook_move_mount),
+	LSM_HOOK_INIT(mount_bind, hook_mount_bind),
+	LSM_HOOK_INIT(mount_new, hook_mount_new),
+	LSM_HOOK_INIT(mount_remount, hook_mount_remount),
+	LSM_HOOK_INIT(mount_reconfigure, hook_mount_reconfigure),
+	LSM_HOOK_INIT(mount_change_type, hook_mount_change_type),
+	LSM_HOOK_INIT(mount_move, hook_move_mount),
 	LSM_HOOK_INIT(sb_umount, hook_sb_umount),
 	LSM_HOOK_INIT(sb_remount, hook_sb_remount),
 	LSM_HOOK_INIT(sb_pivotroot, hook_sb_pivotroot),
-- 
2.53.0-Meta


