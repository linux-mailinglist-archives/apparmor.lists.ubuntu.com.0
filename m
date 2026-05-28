Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pxLCKgTHGGpjnQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 00:51:48 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E055FB1B4
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 00:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSfWl-0005Th-1H; Thu, 28 May 2026 18:32:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wSfWk-0005SR-F2
 for apparmor@lists.ubuntu.com; Thu, 28 May 2026 18:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B0C860213;
 Thu, 28 May 2026 18:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3831C1F00A3A;
 Thu, 28 May 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779992806;
 bh=J+lUD/Cu8P5uUsV/I5uuKs/FO/AKYlu80PBfktiMjOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VYzseYlgzPFwNRV8fWg+owe51s8xSydjjndJSJ4HSoWaMwynlaW9oYflj+b1F47D8
 iT7uj8D2+JYVCDazAP/MvsSRJpvsXOsm/vKbcLOqrwjhTikVU/Q4/c0/QmCb4NSzDT
 F+tX+Sbpv7ON91TfUWBipyxLIj1SdI1mj4RMQKYcG/JQXfgvjbkNUgx8SH5WE3N/Vm
 areNoFF/sZ6RdQXmaHC4T9SkA43vFfJGjYqkSU9IDC5hPGg29AX4k2zUMlW0+9upyw
 m1eHwQ4BpWeee9DTURH/AhRL5Eljlzm1t11bX/gRcXBr90xmQIYqzqmfDM0eIt8XX4
 ETVhQ9e5WSqBA==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Thu, 28 May 2026 11:26:04 -0700
Message-ID: <20260528182607.3150386-6-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260528182607.3150386-1-song@kernel.org>
References: <20260528182607.3150386-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v5 5/8] landlock: Convert from sb_mount to
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
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.377];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 55E055FB1B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace hook_sb_mount() with granular mount hooks. Landlock denies
all mount operations for sandboxed processes regardless of flags,
so all new hooks share a common hook_mount_deny() helper. The
mount_move hook reuses hook_move_mount().

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 security/landlock/fs.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index c1ecfe239032..7377f22a165e 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -1416,9 +1416,7 @@ static void log_fs_change_topology_dentry(
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
@@ -1432,6 +1430,35 @@ static int hook_sb_mount(const char *const dev_name,
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
 			   const struct path *const to_path)
 {
@@ -1950,8 +1977,12 @@ static struct security_hook_list landlock_hooks[] __ro_after_init = {
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


