Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2DA6345D
	for <lists+apparmor@lfdr.de>; Sun, 16 Mar 2025 07:54:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tthsp-00062S-W8; Sun, 16 Mar 2025 06:54:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1tthsp-00062E-1H
 for apparmor@lists.ubuntu.com; Sun, 16 Mar 2025 06:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3E49A489D4;
 Sun, 16 Mar 2025 06:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B665C4CEDD;
 Sun, 16 Mar 2025 06:46:34 +0000 (UTC)
Date: Sun, 16 Mar 2025 07:46:31 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20250316-vergibt-hausrat-b23d525a1d24@brauner>
References: <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
 <465d1d23-3b36-490e-b0dd-74889d17fa4c@tnxip.de>
 <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <7bdcc2c5d8022d2f1a7ec23c0351f7816d4464c8.camel@HansenPartnership.com>
 <20250315-allemal-fahrbahn-9afc7bc0008d@brauner>
 <bad92b18f389256d26a886b2b0706d04c8c6c336.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bad92b18f389256d26a886b2b0706d04c8c6c336.camel@HansenPartnership.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=brauner@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] [RFC 1/1] fix NULL mnt [was Re: apparmor NULL
 pointer dereference on resume [efivarfs]]
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
Cc: linux-efi@vger.kernel.org, apparmor <apparmor@lists.ubuntu.com>,
 Malte =?utf-8?B?U2NocsO2ZGVy?= <malte.schroeder@tnxip.de>,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 "jk@ozlabs.org" <jk@ozlabs.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat, Mar 15, 2025 at 02:41:43PM -0400, James Bottomley wrote:
> On Sat, 2025-03-15 at 11:04 +0100, Christian Brauner wrote:
> [...]
> > Since efivars uses a single global superblock and we know that sfi-
> > >sb is still alive (After all we've just pinned it above.)
> > vfs_kern_mount() will reuse the same superblock.
> > 
> > There's two cases to consider:
> > 
> > (1) vfs_kern_mount() was successful. In this case path->mnt will hold
> > an active superblock reference that will be released asynchronously
> > via __fput(). That is safe and correct.
> > 
> > (2) vfs_kern_mount() fails. That's an issue because you need to call
> > deactivate_super() which will have a similar deadlock problem.
> > If efivarfs_pm_notify() now holds the last reference to the
> > superblock then deactivate_super() super will put that last
> > reference and call efivarfs_kill_super() which in turn will wait for
> > efivarfs_pm_notify() to finish. => deadlock
> > 
> > So in the error case you need to offload the call to
> > deactivate_super() to a workqueue.
> 
> OK, got that (although it did make my head explode a bit ... this is
> certainly subtle stuff).  To do the delayed work for the
> deactivate_super(), I hijacked the superblock destroy_work structure
> which I think is safe because by the time the work structure is
> executed, we own it and so it can be reused for the actual destroy_work
> in deactivate_super().
> 
> However, there's another problem: the mntput after kernel_file_open may
> synchronously call cleanup_mnt() (and thus deactivate_super()) if the
> open fails because it's marked MNT_INTERNAL, which is caused by
> SB_KERNMOUNT.  I fixed this just by not passing the SB_KERNMOUNT flag,
> which feels a bit hacky.

It actually isn't. We know that vfs_kern_mount() will always resurface
the single superblock that's exposed to userspace because we've just
taken a reference to it earlier in efivarfs_pm_notify(). So that
SB_KERNMOUNT flag is ignored because no new superblock is allocated. It
would only matter if we'd end up allocating a new superblock which we
never do.

And if we did it would be a bug because the superblock we allocate could
be reused at any time if a userspace task mounts efivarfs before
efivarfs_pm_notify() has destroyed it (or the respective workqueue).
But that superblock would then have SB_KERNMOUNT for something that's
not supposed to be one.

And whether or not that helper mount has MNT_INTERNAL is immaterial to
what you're doing here afaict.

So not passing the SB_KERNMOUNT flag is the right thing (see devtmpfs as
well). You could slap a comment in here explaining that we never
allocate a new superblock so it's clear to people not familiar with this
particular code.

> 
> I've put together everything at the bottom, however, I can't test the
> error legs of this because trying to trigger and unmount and hybernate
> at exactly the right point is pretty much impossible.  The rest seems
> to work as advertised, although I would like a tested-by from the
> apparmour people because I do run apparmour in my debian test rig but
> don't see the problem.
> 
> Regards,
> 
> James
> 
> ---
> 
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 6eae8cf655c1..2d826e98066b 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -474,12 +474,25 @@ static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
>  	return err;
>  }
>  
> +static void efivarfs_deactivate_super_work(struct work_struct *work)
> +{
> +	struct super_block *s = container_of(work, struct super_block,
> +					     destroy_work);
> +	/*
> +	 * note: here s->destroy_work is free for reuse (which
> +	 * will happen in deactivate_super)
> +	 */
> +	deactivate_super(s);
> +}
> +
> +static struct file_system_type efivarfs_type;
> +
>  static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
>  			      void *ptr)
>  {
>  	struct efivarfs_fs_info *sfi = container_of(nb, struct efivarfs_fs_info,
>  						    pm_nb);
> -	struct path path = { .mnt = NULL, .dentry = sfi->sb->s_root, };
> +	struct path path;
>  	struct efivarfs_ctx ectx = {
>  		.ctx = {
>  			.actor	= efivarfs_actor,
> @@ -487,6 +500,7 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
>  		.sb = sfi->sb,
>  	};
>  	struct file *file;
> +	struct super_block *s = sfi->sb;
>  	static bool rescan_done = true;
>  
>  	if (action == PM_HIBERNATION_PREPARE) {
> @@ -499,11 +513,39 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
>  	if (rescan_done)
>  		return NOTIFY_DONE;
>  
> +	/* ensure single superblock is alive and pin it */
> +	if (!atomic_inc_not_zero(&s->s_active))
> +		return NOTIFY_DONE;
> +
>  	pr_info("efivarfs: resyncing variable state\n");
>  
> -	/* O_NOATIME is required to prevent oops on NULL mnt */
> +	path.dentry = sfi->sb->s_root;
> +
> +	/* do not add SB_KERNMOUNT which causes MNT_INTERNAL, see below */
> +	path.mnt = vfs_kern_mount(&efivarfs_type, 0,
> +				  efivarfs_type.name, NULL);
> +	if (IS_ERR(path.mnt)) {
> +		pr_err("efivarfs: internal mount failed\n");
> +		/*
> +		 * We may be the last pinner of the superblock but
> +		 * calling efivarfs_kill_sb from within the notifier
> +		 * here would deadlock trying to unregister it
> +		 */
> +		INIT_WORK(&s->destroy_work, efivarfs_deactivate_super_work);
> +		schedule_work(&s->destroy_work);
> +		return PTR_ERR(path.mnt);
> +	}
> +
> +	/* path.mnt now has pin on superblock, so this must be above one */
> +	atomic_dec(&s->s_active);
> +
>  	file = kernel_file_open(&path, O_RDONLY | O_DIRECTORY | O_NOATIME,
>  				current_cred());
> +	/*
> +	 * safe even if last put because no MNT_INTERNAL means this
> +	 * will do delayed deactivate_super and not deadlock
> +	 */
> +	mntput(path.mnt);
>  	if (IS_ERR(file))
>  		return NOTIFY_DONE;
>  
> 
> 

