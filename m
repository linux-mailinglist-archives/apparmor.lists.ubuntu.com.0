Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GJgJuYIA2pmzwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 13:03:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9851F01D
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 13:03:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMksy-0003FR-LD; Tue, 12 May 2026 11:02:48 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1wMksu-00038c-9B
 for apparmor@lists.ubuntu.com; Tue, 12 May 2026 11:02:47 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 64CB1pc5064961;
 Tue, 12 May 2026 20:01:51 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 64CB1oa0064953
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 12 May 2026 20:01:50 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <42a9075e-a4b4-4eb7-b96e-48e5c0cd2f3a@I-love.SAKURA.ne.jp>
Date: Tue, 12 May 2026 20:01:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20260509015208.3853132-1-song@kernel.org>
 <20260509015208.3853132-7-song@kernel.org>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260509015208.3853132-7-song@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH v3 6/7] tomoyo: Convert from sb_mount to
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
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, jmorris@namei.org, omosnace@redhat.com,
 viro@zeniv.linux.org.uk, gnoack@google.com, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 9EF9851F01D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i-love.sakura.ne.jp:email,I-love.SAKURA.ne.jp:mid]
X-Rspamd-Action: no action

On 2026/05/09 10:52, Song Liu wrote:
> Replace tomoyo_sb_mount() with granular mount hooks. Each hook
> reconstructs the MS_* flags expected by tomoyo_mount_permission()
> using the original flags parameter where available.

Please fold below diff into this patch. Then,

Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 security/tomoyo/tomoyo.c | 60 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index ac84e1f03d5e..c93d000acc95 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -400,6 +400,15 @@ static int tomoyo_path_chroot(const struct path *path)
 	return tomoyo_path_perm(TOMOYO_TYPE_CHROOT, path, NULL);
 }
 
+/**
+ * tomoyo_mount_bind - Target for security_mount_bind().
+ *
+ * @from:    Pointer to "struct path".
+ * @to:      Pointer to "struct path".
+ * @recurse: Whether recursive bind mount or not.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
 static int tomoyo_mount_bind(const struct path *from, const struct path *to,
 			     bool recurse)
 {
@@ -408,6 +417,17 @@ static int tomoyo_mount_bind(const struct path *from, const struct path *to,
 	return tomoyo_mount_permission(NULL, to, NULL, flags, from);
 }
 
+/**
+ * tomoyo_mount_new - Target for security_mount_new().
+ *
+ * @fc:        Pointer to "struct fs_context".
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ * @data:      Optional data. Maybe NULL.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
 static int tomoyo_mount_new(struct fs_context *fc, const struct path *mp,
 			    int mnt_flags, unsigned long flags, void *data)
 {
@@ -416,6 +436,17 @@ static int tomoyo_mount_new(struct fs_context *fc, const struct path *mp,
 				       flags, NULL);
 }
 
+/**
+ * tomoyo_mount_remount - Target for security_mount_remount().
+ *
+ * @fc:        Pointer to "struct fs_context".
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ * @data:      Optional data. Maybe NULL.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
 static int tomoyo_mount_remount(struct fs_context *fc, const struct path *mp,
 				int mnt_flags, unsigned long flags, void *data)
 {
@@ -423,6 +454,15 @@ static int tomoyo_mount_remount(struct fs_context *fc, const struct path *mp,
 	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
 }
 
+/**
+ * tomoyo_mount_reconfigure - Target for security_mount_reconfigure().
+ *
+ * @mp:        Pointer to "struct path".
+ * @mnt_flags: Mount options.
+ * @flags:     Original mount options.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
 static int tomoyo_mount_reconfigure(const struct path *mp,
 				    unsigned int mnt_flags,
 				    unsigned long flags)
@@ -431,12 +471,28 @@ static int tomoyo_mount_reconfigure(const struct path *mp,
 	return tomoyo_mount_permission(NULL, mp, NULL, flags, NULL);
 }
 
+/**
+ * tomoyo_mount_change_type - Target for security_mount_change_type().
+ *
+ * @mp:       Pointer to "struct path".
+ * @ms_flags: Mount options.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
 static int tomoyo_mount_change_type(const struct path *mp, int ms_flags)
 {
 	return tomoyo_mount_permission(NULL, mp, NULL, ms_flags, NULL);
 }
 
-static int tomoyo_move_mount(const struct path *from_path,
+/**
+ * tomoyo_mount_move - Target for security_mount_move().
+ *
+ * @from_path: Pointer to "struct path".
+ * @to_path:   Pointer to "struct path".
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_mount_move(const struct path *from_path,
 			     const struct path *to_path)
 {
 	return tomoyo_mount_permission(NULL, to_path, NULL, MS_MOVE,
@@ -609,7 +665,7 @@ static struct security_hook_list tomoyo_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(mount_remount, tomoyo_mount_remount),
 	LSM_HOOK_INIT(mount_reconfigure, tomoyo_mount_reconfigure),
 	LSM_HOOK_INIT(mount_change_type, tomoyo_mount_change_type),
-	LSM_HOOK_INIT(mount_move, tomoyo_move_mount),
+	LSM_HOOK_INIT(mount_move, tomoyo_mount_move),
 	LSM_HOOK_INIT(sb_umount, tomoyo_sb_umount),
 	LSM_HOOK_INIT(sb_pivotroot, tomoyo_sb_pivotroot),
 	LSM_HOOK_INIT(socket_bind, tomoyo_socket_bind),
-- 
2.47.3



