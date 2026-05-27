Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPl9NN3qFmruvgcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 27 May 2026 15:00:13 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0815E4880
	for <lists+apparmor@lfdr.de>; Wed, 27 May 2026 15:00:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSDLv-0000w2-VJ; Wed, 27 May 2026 12:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1wSDLu-0000vt-CC
 for apparmor@lists.ubuntu.com; Wed, 27 May 2026 12:27:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 906B9600BB;
 Wed, 27 May 2026 12:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76691F000E9;
 Wed, 27 May 2026 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779884228;
 bh=27eUkOPplgujxD4Wm3AOdfFuGwJ2ngxUt70Ukl38SJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gRhRA60+ah5zMUYBT6Xqe467Jv9mn0ZQv2Se3QG2+n00/H1mN2xuzyBAkJGvTml6J
 3pbyXst4Mm75iGSJO0idMd6zLNTS3KOks0NSNKBZ7Ulclf52TWT4vSVx6D9q0xL8pa
 DC8iM2lB1D7tABLpyMM3XAawqjF2qf9zJecCOzEE4I+hLZYcoFSUcakGWDGYD7FL+U
 1Ne+jobnthqmrxuMO7UkwFz9OfLxaeK+WlcaPJyxEZ4YFYO5gQjIPaO1aw8gOuRc3O
 JPoGauubx2XnbNCmgY6VImoZrxDMKQf9I1BRwKY2bZayCD6LK+X+uUZaFE+PfhslZI
 Cf1fNAeM6lNbA==
Date: Wed, 27 May 2026 14:17:01 +0200
From: Christian Brauner <brauner@kernel.org>
To: Song Liu <song@kernel.org>
Message-ID: <20260527-landen-bahnfahren-eckpfeiler-c1e1e9cb73aa@brauner>
References: <20260515200158.4081915-1-song@kernel.org>
 <20260515200158.4081915-2-song@kernel.org>
 <177944135249.2871055.11361892114499566606.b4-review@b4>
 <CAPhsuW4BVSQ6oqyk=kExuZUkB9PWRRqUf_EJ=x3mNmtkT4oH4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4BVSQ6oqyk=kExuZUkB9PWRRqUf_EJ=x3mNmtkT4oH4g@mail.gmail.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v4 1/7] lsm: Add granular mount hooks to
 replace security_sb_mount
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
Cc: herton@canonical.com, kernel-team@meta.com, jack@suse.cz,
 paul@paul-moore.com, selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [7.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:kernel-team@meta.com,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,meta.com,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.980];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 8F0815E4880
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Fri, May 22, 2026 at 05:09:38PM -0700, Song Liu wrote:
> On Fri, May 22, 2026 at 2:16 AM Christian Brauner <brauner@kernel.org> wrote:
> >
> > On Fri, 15 May 2026 13:01:52 -0700, Song Liu <song@kernel.org> wrote:
> > > [...]
> > >
> > > Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > > Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
> > > Signed-off-by: Song Liu <song@kernel.org>
> > > Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> 
> ^^^^^ I assume you didn't mean to add this SoB yet.

No, the my SoB hook was run during b4 review apparently...

> > Please cleanly separate the preparatory work for introducing the new
> > hooks from any changes to fs/namespace.c
> >
> > Once you have all of the new machinery in place, switch fs/namespace.c
> > over to the new hooks.
> 
> Could you please be more specific on how to arrange these changes?
> Currently, we have
> 
> 1/7 adds new hooks:
>   lsm: Add granular mount hooks to replace security_sb_mount
> 2/7 through 6/7 migrate LSMs from old hooks to new hooks:
>   apparmor: Remove redundant MS_MGC_MSK stripping in apparmor_sb_mount
>   apparmor: Convert from sb_mount to granular mount hooks
>   selinux: Convert from sb_mount to granular mount hooks
>   landlock: Convert from sb_mount to granular mount hooks
>   tomoyo: Convert from sb_mount to granular mount hooks
> 7/7 removes old hooks:
>   lsm: Remove security_sb_mount and security_move_mount
> 
> Some ideas to change this:

My thought had been:

* Add the new hooks to security/.
* add the individual lsm implementations.
* Now replace the old hooks with the new hooks in fs/namespace.c
* Delete the old hooks in security/

IOW, why the migration step? It is a full replacement anyway.

> 
> Idea #1:
> Do you mean to split 1/7 and 7/7 into two patches each: one
> for changes in fs/namespace.c, the other for everything else?
> IOW, the set of 9 patches will look like:
> 
> 1/9 adds new hooks in security/ core code
> 2/9 adds calls to new hooks to fs/namespace.c
> 3/9 through 7/9 migrate LSMs from old hooks to new hooks
> 8/9 removes calls to old hooks from s/namespace.c
> 9/9 removes old hooks from security/ core code
> 
> Idea #2:
> Or do you mean all the changes to fs/namespace.c have to
> stay in one commit? I am not sure how we can make the
> whole patchset clean with this approach. We will probably
> need 2+ commits for each of the 4 LSMs we update. IOW,
> the set will look like:
> 
> Add new hooks in security core code
> Add new hooks in selinux
> Add new hooks in apparmor
> Add new hooks in landlock
> Add new hooks in tamoyo
> Replace old hooks with new hooks in fs/namespace.c
> Remove old hooks from selinux
> Remove old hooks from apparmor
> Remove old hooks from landlock
> Remove old hooks from tamoyo
> Remove old hooks in security core code
> 
> This will require at least 11 patches, and it is not
> really clean.
> 
> Idea #3:
> Did I miss any other solutions?
> 
> > This will make it way easier to review and easier to distribute the
> 
> This sentence appears to be incomplete. Do you mean to distribute
> different patches in the patchset to different trees and merge them
> separately?
> 
> I actually think the patchset is clean as-is.
> 
> The overall change in fs/namespace.c is really minimal:
>     fs/namespace.c                    |  41 +++++++---
> 
> We can clearly see what it changed in fs/namespace.c with
> "git diff HEAD~7 -- fs/" (attached below).
> 
> Therefore, I don't see a way to make the whole patchset more
> clean. If I missed anything, please let me know.
> 
> Thanks,
> Song
> 
> 
> $ git diff HEAD~7 -- fs/
> diff --git c/fs/namespace.c w/fs/namespace.c
> index fe919abd2f01..43f22c5e2bf4 100644
> --- c/fs/namespace.c
> +++ w/fs/namespace.c
> @@ -2888,6 +2888,10 @@ static int do_change_type(const struct path
> *path, int ms_flags)
>         if (!type)
>                 return -EINVAL;
> 
> +       err = security_mount_change_type(path, ms_flags);
> +       if (err)
> +               return err;
> +
>         guard(namespace_excl)();
> 
>         err = may_change_propagation(mnt);
> @@ -3006,6 +3010,10 @@ static int do_loopback(const struct path *path,
> const char *old_name,
>         if (err)
>                 return err;
> 
> +       err = security_mount_bind(&old_path, path, recurse);
> +       if (err)
> +               return err;
> +
>         if (mnt_ns_loop(old_path.dentry))
>                 return -EINVAL;
> 
> @@ -3328,7 +3336,8 @@ static void mnt_warn_timestamp_expiry(const
> struct path *mountpoint,
>   * superblock it refers to.  This is triggered by specifying MS_REMOUNT|MS_BIND
>   * to mount(2).
>   */
> -static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags)
> +static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_flags,
> +                             unsigned long flags)
>  {
>         struct super_block *sb = path->mnt->mnt_sb;
>         struct mount *mnt = real_mount(path->mnt);
> @@ -3343,6 +3352,10 @@ static int do_reconfigure_mnt(const struct path
> *path, unsigned int mnt_flags)
>         if (!can_change_locked_flags(mnt, mnt_flags))
>                 return -EPERM;
> 
> +       ret = security_mount_reconfigure(path, mnt_flags, flags);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * We're only checking whether the superblock is read-only not
>          * changing it, so only take down_read(&sb->s_umount).
> @@ -3366,7 +3379,7 @@ static int do_reconfigure_mnt(const struct path
> *path, unsigned int mnt_flags)
>   * on it - tough luck.
>   */
>  static int do_remount(const struct path *path, int sb_flags,
> -                     int mnt_flags, void *data)
> +                     int mnt_flags, void *data, unsigned long flags)
>  {
>         int err;
>         struct super_block *sb = path->mnt->mnt_sb;
> @@ -3393,6 +3406,9 @@ static int do_remount(const struct path *path,
> int sb_flags,
>         fc->oldapi = true;
> 
>         err = parse_monolithic_mount_data(fc, data);
> +       if (!err)
> +               err = security_mount_remount(fc, path, mnt_flags, flags,
> +                                           data);
>         if (!err) {
>                 down_write(&sb->s_umount);
>                 err = -EPERM;
> @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path
> *path, const char *old_name)
>         if (err)
>                 return err;
> 
> +       err = security_mount_move(&old_path, path);
> +       if (err)
> +               return err;
> +
>         return do_move_mount(&old_path, path, 0);
>  }
> 
> @@ -3786,7 +3806,7 @@ static int do_new_mount_fc(struct fs_context
> *fc, const struct path *mountpoint,
>   */
>  static int do_new_mount(const struct path *path, const char *fstype,
>                         int sb_flags, int mnt_flags,
> -                       const char *name, void *data)
> +                       const char *name, void *data, unsigned long flags)
>  {
>         struct file_system_type *type;
>         struct fs_context *fc;
> @@ -3830,6 +3850,9 @@ static int do_new_mount(const struct path *path,
> const char *fstype,
>                 err = parse_monolithic_mount_data(fc, data);
>         if (!err && !mount_capable(fc))
>                 err = -EPERM;
> +
> +       if (!err)
> +               err = security_mount_new(fc, path, mnt_flags, flags, data);
>         if (!err)
>                 err = do_new_mount_fc(fc, path, mnt_flags);
> 
> @@ -4080,7 +4103,6 @@ int path_mount(const char *dev_name, const
> struct path *path,
>                 const char *type_page, unsigned long flags, void *data_page)
>  {
>         unsigned int mnt_flags = 0, sb_flags;
> -       int ret;
> 
>         /* Discard magic */
>         if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
> @@ -4093,9 +4115,6 @@ int path_mount(const char *dev_name, const
> struct path *path,
>         if (flags & MS_NOUSER)
>                 return -EINVAL;
> 
> -       ret = security_sb_mount(dev_name, path, type_page, flags, data_page);
> -       if (ret)
> -               return ret;
>         if (!may_mount())
>                 return -EPERM;
>         if (flags & SB_MANDLOCK)
> @@ -4141,9 +4160,9 @@ int path_mount(const char *dev_name, const
> struct path *path,
>                             SB_I_VERSION);
> 
>         if ((flags & (MS_REMOUNT | MS_BIND)) == (MS_REMOUNT | MS_BIND))
> -               return do_reconfigure_mnt(path, mnt_flags);
> +               return do_reconfigure_mnt(path, mnt_flags, flags);
>         if (flags & MS_REMOUNT)
> -               return do_remount(path, sb_flags, mnt_flags, data_page);
> +               return do_remount(path, sb_flags, mnt_flags, data_page, flags);
>         if (flags & MS_BIND)
>                 return do_loopback(path, dev_name, flags & MS_REC);
>         if (flags & (MS_SHARED | MS_PRIVATE | MS_SLAVE | MS_UNBINDABLE))
> @@ -4152,7 +4171,7 @@ int path_mount(const char *dev_name, const
> struct path *path,
>                 return do_move_mount_old(path, dev_name);
> 
>         return do_new_mount(path, type_page, sb_flags, mnt_flags, dev_name,
> -                           data_page);
> +                           data_page, flags);
>  }
> 
>  int do_mount(const char *dev_name, const char __user *dir_name,
> @@ -4545,7 +4564,7 @@ static inline int vfs_move_mount(const struct
> path *from_path,
>  {
>         int ret;
> 
> -       ret = security_move_mount(from_path, to_path);
> +       ret = security_mount_move(from_path, to_path);
>         if (ret)
>                 return ret;

