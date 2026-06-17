Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 73GPAfbXMmpi6AUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 17 Jun 2026 19:23:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83A69BA7D
	for <lists+apparmor@lfdr.de>; Wed, 17 Jun 2026 19:23:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wZqqa-0003Wu-6I; Wed, 17 Jun 2026 14:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1wZqqY-0003Wb-Ig
 for apparmor@lists.ubuntu.com; Wed, 17 Jun 2026 14:02:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 931F96001D;
 Wed, 17 Jun 2026 13:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E311F000E9;
 Wed, 17 Jun 2026 13:53:51 +0000 (UTC)
Date: Wed, 17 Jun 2026 15:53:48 +0200
To: Song Liu <song@kernel.org>
Message-ID: <20260617-laufbahn-eifrig-charmant-a48f357a0c52@brauner>
References: <20260528182607.3150386-1-song@kernel.org>
 <20260528182607.3150386-8-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528182607.3150386-8-song@kernel.org>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v5 7/8] vfs: Replace
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
From: Christian Brauner via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: herton@canonical.com, kernel-team@meta.com, jack@suse.cz,
 paul@paul-moore.com, selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:kernel-team@meta.com,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,meta.com,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B83A69BA7D

On Thu, May 28, 2026 at 11:26:06AM -0700, Song Liu wrote:
> Replace the monolithic security_sb_mount() call in path_mount() and
> security_move_mount() in vfs_move_mount() with the new granular mount
> hooks:
> 
> - do_loopback(): call security_mount_bind()
> - do_new_mount(): call security_mount_new()
> - do_remount(): call security_mount_remount()
> - do_reconfigure_mnt(): call security_mount_reconfigure()
> - do_move_mount_old(): call security_mount_move()
> - do_change_type(): call security_mount_change_type()
> - vfs_move_mount(): replace security_move_mount() with
>   security_mount_move()
> 
> The new hooks are called at the individual operation level with
> appropriate context (resolved paths, fs_context), rather than at
> the top of path_mount() with raw string arguments.
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  fs/namespace.c | 41 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index fe919abd2f01..43f22c5e2bf4 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -2888,6 +2888,10 @@ static int do_change_type(const struct path *path, int ms_flags)
>  	if (!type)
>  		return -EINVAL;
>  
> +	err = security_mount_change_type(path, ms_flags);
> +	if (err)
> +		return err;
> +
>  	guard(namespace_excl)();
>  
>  	err = may_change_propagation(mnt);
> @@ -3006,6 +3010,10 @@ static int do_loopback(const struct path *path, const char *old_name,
>  	if (err)
>  		return err;
>  
> +	err = security_mount_bind(&old_path, path, recurse);
> +	if (err)
> +		return err;

This again is racy as it is called outside of the namespace semaphore:

        err = security_mount_bind(&old_path, path, recurse);
        if (err)
                return err;

        if (mnt_ns_loop(old_path.dentry))
                return -EINVAL;

        LOCK_MOUNT(mp, path);
        if (IS_ERR(mp.parent))
                return PTR_ERR(mp.parent);

After LOCK_MOUNT @path might point to a completely different mount then
the one you performed your security checks on.

> +
>  	if (mnt_ns_loop(old_path.dentry))
>  		return -EINVAL;
>  
> @@ -3328,7 +3336,8 @@ static void mnt_warn_timestamp_expiry(const struct path *mountpoint,
>   * superblock it refers to.  This is triggered by specifying MS_REMOUNT|MS_BIND
>   * to mount(2).
>   */
> -static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
> +static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags,
> +			      unsigned long flags)
>  {
>  	struct super_block *sb = path->mnt->mnt_sb;
>  	struct mount *mnt = real_mount(path->mnt);
> @@ -3343,6 +3352,10 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
>  	if (!can_change_locked_flags(mnt, mnt_flags))
>  		return -EPERM;
>  
> +	ret = security_mount_reconfigure(path, mnt_flags, flags);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * We're only checking whether the superblock is read-only not
>  	 * changing it, so only take down_read(&sb->s_umount).
> @@ -3366,7 +3379,7 @@ static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
>   * on it - tough luck.
>   */
>  static int do_remount(const struct path *path, int sb_flags,
> -		      int mnt_flags, void *data)
> +		      int mnt_flags, void *data, unsigned long flags)
>  {
>  	int err;
>  	struct super_block *sb = path->mnt->mnt_sb;
> @@ -3393,6 +3406,9 @@ static int do_remount(const struct path *path, int sb_flags,
>  	fc->oldapi = true;
>  
>  	err = parse_monolithic_mount_data(fc, data);
> +	if (!err)
> +		err = security_mount_remount(fc, path, mnt_flags, flags,
> +					    data);
>  	if (!err) {
>  		down_write(&sb->s_umount);
>  		err = -EPERM;
> @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path *path, const char *old_name)
>  	if (err)
>  		return err;
>  
> +	err = security_mount_move(&old_path, path);
> +	if (err)
> +		return err;

Placement of this hook suffers from the same issue as the bind mount
hook. Here it's worse because the security layer isn't even informed
about MOVE_MOUNT_BENEATH which completely alters the mount relationship.

