Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 96061A62ABD
	for <lists+apparmor@lfdr.de>; Sat, 15 Mar 2025 11:12:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ttOUd-0000ea-Nu; Sat, 15 Mar 2025 10:11:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ttOUc-0000eR-4f
 for apparmor@lists.ubuntu.com; Sat, 15 Mar 2025 10:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBD9E5C4153;
 Sat, 15 Mar 2025 10:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E7CC4CEE5;
 Sat, 15 Mar 2025 10:04:29 +0000 (UTC)
Date: Sat, 15 Mar 2025 11:04:26 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20250315-allemal-fahrbahn-9afc7bc0008d@brauner>
References: <e54e6a2f-1178-4980-b771-4d9bafc2aa47@tnxip.de>
 <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
 <465d1d23-3b36-490e-b0dd-74889d17fa4c@tnxip.de>
 <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <7bdcc2c5d8022d2f1a7ec23c0351f7816d4464c8.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bdcc2c5d8022d2f1a7ec23c0351f7816d4464c8.camel@HansenPartnership.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=brauner@kernel.org;
 helo=dfw.source.kernel.org
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

On Fri, Mar 14, 2025 at 10:59:14AM -0400, James Bottomley wrote:
> On Tue, 2025-03-11 at 09:01 -0400, James Bottomley wrote:
> > On Tue, 2025-03-11 at 09:45 +0100, Christian Brauner wrote:
> [...]
> > > But since efivars does only ever have a single global superblock,
> > > one possibility is to an internal superblock that always exits and
> > > is resurfaced whenever userspace mounts efivarfs. That's
> > > essentially the devtmpfs model.
> > > 
> > > Then you can stash:
> > > 
> > > static struct vfsmount *efivarfs_mnt;
> > > 
> > > globally and use that in efivarfs_pm_notify() to fill in struct
> > > path.
> > 
> > I didn't see devtmpfs when looking for examples, since it's hiding
> > outside of the fs/ directory.  However, it does seem to be a bit
> > legacy nasty as an example to copy.  However, I get the basics: we'd
> > instantiate the mnt and superblock on init (stashing mnt in the sfi
> > so the notifier gets it).  Then we can do the variable population on
> > reconfigure, just in case an EFI system doesn't want to mount
> > efivarfs to save memory.
> > 
> > I can code that up if I can get an answer to the uid/gid parameter
> > question above.
> 
> I coded up the naive implementation and it definitely works, but it
> suffers from the problem that everything that pins in the module init
> routine (like configfs) does in that once inserted the module can never
> be removed.  Plus, for efivarfs, we would allocate all resources on
> module insertion not on first mount.  The final problem we'd have is
> that the uid/gid parameters for variable creation would be taken from
> the kernel internal mount, so if they got specified on a user mount,
> they'd be ignored (because the variable inodes are already created).
> 
> To answer some of your other questions:
> 
> > (1) Is it guaranteed that efivarfs_pm_notify() is only called once a
> >     superblock exists?
> 
> Yes, as you realized.
> 
> > (2) Is it guaranteed that efivarfs_pm_notify() is only called when
> >     and while a mount for the superblock exists?
> 
> No, but the behaviour is correct because the notifier needs to update
> the variable list and we create the variable list in
> efivarfs_fill_super.  Now you can argue this is suboptimal because if
> userspace didn't ever mount, we'd simply destroy it all again on last
> put of the superblock so it's wasted effort, but its function is
> correct.
> 
> > Another question is whether the superblock can be freed while
> > efivarfs_pm_notify() is running? I think that can't happen because
> > blocking_notifier_chain_unregister(&efivar_ops_nh, &sfi->nb) will
> > block in efivarfs_kill_sb() until all outstanding calls to
> > efivarfs_pm_notify() are finished?
> 
> That's right: a blocking notifier is called under the notifier list
> rwsem.  It's taken read for calls but write for register/unregister, so
> efivarfs_kill_sb would block in the unregister until the call chain was
> executed.
> 
> Taking into account the module removal issue, the simplest way I found
> to fix the issue was to call vfs_kern_mount() from the notifier to get

Yeah, Al had already mentioned that. I initially had the same idea but
since I didn't know enough about the notifier block stuff I wasn't sure
whether there's some odd deadlock that could be caused by this.

> a struct vfsmount before opening the path.  We ensure it's gone by
> calling mntput immediately after open, but, by that time, the open file
> is pinning the vfsmnt if the open was successful.
> 
> If this looks OK to everyone I'll code it up as a fix which can be cc'd
> to stable.
> 
> Regards,
> 
> James
> 
> ---
> 
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 6eae8cf655c1..e2e6575b5abf 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -474,12 +474,14 @@ static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
>  	return err;
>  }
>  
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
> @@ -501,9 +503,17 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
>  
>  	pr_info("efivarfs: resyncing variable state\n");
>  
> -	/* O_NOATIME is required to prevent oops on NULL mnt */
> +	path.dentry = sfi->sb->s_root;
> +	path.mnt = vfs_kern_mount(&efivarfs_type, SB_KERNMOUNT,
> +				  efivarfs_type.name, NULL);
> +	if (IS_ERR(path.mnt)) {
> +		pr_err("efivarfs: internal mount failed\n");
> +		return PTR_ERR(path.mnt);
> +	}

I see some issues with this. A umount by another task could already hit:

sb->kill_sb == efivarfs_kill_super()

which means the superblock is already marked as dying.

By calling vfs_kern_mount() unconditionally you end up calling
vfs_get_tree() and then get_tree_single() again. That would mean
efivarfs_pm_notify() now waits for the old superblock to be dead.

But the old superblock waits in efivarfs_kill_sb() for
efivarfs_pm_notify() to finish before actually killing the old
superblock.

So this would deadlock.

So you need to make sure that the superbock a) isn't dead and b) doesn't
go away behind your back:

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 6eae8cf655c1..6a4f95c27697 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -474,6 +474,8 @@ static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
        return err;
 }

+static struct file_system_type efivarfs_type;
+
 static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
                              void *ptr)
 {
@@ -499,6 +501,31 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
        if (rescan_done)
                return NOTIFY_DONE;

+       /*
+        * Ensure that efivarfs is still alive and cannot go away behind
+        * our back.
+        */
+       if (!atomic_inc_not_zero(&sfi->sb->s_active))
+               return NOTIFY_DONE;
+
+       path.mnt = vfs_kern_mount(&efivarfs_type, SB_KERNMOUNT,
+                                 efivarfs_type.name, NULL);

Since efivars uses a single global superblock and we know that sfi->sb
is still alive (After all we've just pinned it above.) vfs_kern_mount()
will reuse the same superblock.

There's two cases to consider:

(1) vfs_kern_mount() was successful. In this case path->mnt will hold an
    active superblock reference that will be released asynchronously via
    __fput(). That is safe and correct.

(2) vfs_kern_mount() fails. That's an issue because you need to call
    deactivate_super() which will have a similar deadlock problem.

    If efivarfs_pm_notify() now holds the last reference to the
    superblock then deactivate_super() super will put that last
    reference and call efivarfs_kill_super() which in turn will wait for
    efivarfs_pm_notify() to finish. => deadlock

So in the error case you need to offload the call to deactivate_super()
to a workqueue.

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 6eae8cf655c1..288c1dd8622b 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -474,6 +474,8 @@ static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
        return err;
 }

+static struct file_system_type efivarfs_type;
+
 static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
                              void *ptr)
 {
@@ -499,6 +501,39 @@ static int efivarfs_pm_notify(struct notifier_block *nb, unsigned long action,
        if (rescan_done)
                return NOTIFY_DONE;

+       /*
+        * Ensure that efivarfs is still alive and cannot go away behind
+        * our back.
+        */
+       if (!atomic_inc_not_zero(&sfi->sb->s_active))
+               return NOTIFY_DONE;
+
+       path.mnt = vfs_kern_mount(&efivarfs_type, SB_KERNMOUNT,
+                                 efivarfs_type.name, NULL);
+       /*
+        * Since efivars uses a single global superblock and we know
+        * that sfi->sb is still alive (After all we've just pinned it
+        * above.) vfs_kern_mount() will reuse the same superblock.
+        *
+        * If vfs_kern_mount() was successful path->mnt will hold an
+        * active superblock reference that will be released
+        * asynchronously via __fput().
+        *
+        * If vfs_kern_mount() fails we might be the ones to hold the
+        * last reference now so we need to call deactivate_super(). But
+        * we need to ensure that this is done asynchronously so
+        * efivarfs_kill_super() doesn't deadlock by waiting on
+        * efivarfs_pm_notify() to finish.
+        */
+       if (IS_ERR(path.mnt)) {
+
+               /* TODO: offload to workqueue so that we don't deadlock. */
+               deactivate_super(sfi->sb);
+               pr_err("efivarfs: internal mount failed\n");
+               return PTR_ERR(path.mnt);
+       }
+       atomic_dec(&sfi->sb->s_active);
+
        pr_info("efivarfs: resyncing variable state\n");

        /* O_NOATIME is required to prevent oops on NULL mnt */

