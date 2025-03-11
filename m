Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622EA5CAD7
	for <lists+apparmor@lfdr.de>; Tue, 11 Mar 2025 17:29:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ts2TP-0002qt-PV; Tue, 11 Mar 2025 16:28:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ts2TO-0002ql-Gf
 for apparmor@lists.ubuntu.com; Tue, 11 Mar 2025 16:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A5A7A45673;
 Tue, 11 Mar 2025 16:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF74C4CEE9;
 Tue, 11 Mar 2025 16:19:03 +0000 (UTC)
Date: Tue, 11 Mar 2025 17:19:01 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20250311-gelage-abgraben-b5de5b6ba126@brauner>
References: <e54e6a2f-1178-4980-b771-4d9bafc2aa47@tnxip.de>
 <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
 <465d1d23-3b36-490e-b0dd-74889d17fa4c@tnxip.de>
 <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <20250311-trunk-farben-fe36bebe233a@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-trunk-farben-fe36bebe233a@brauner>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=brauner@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] apparmor NULL pointer dereference on resume
	[efivarfs]
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

On Tue, Mar 11, 2025 at 04:55:16PM +0100, Christian Brauner wrote:
> On Tue, Mar 11, 2025 at 09:01:36AM -0400, James Bottomley wrote:
> > On Tue, 2025-03-11 at 09:45 +0100, Christian Brauner wrote:
> > > On Tue, Mar 11, 2025 at 08:16:34AM +0100, Ard Biesheuvel wrote:
> > > > (cc Al Viro)
> > > > 
> > > > On Mon, 10 Mar 2025 at 22:49, James Bottomley
> > > > <James.Bottomley@hansenpartnership.com> wrote:
> > [...]
> > > > > The problem comes down to the superblock functions not being able
> > > > > to get the struct vfsmount for the superblock (because it isn't
> > > > > even allocated until after they've all been called).  The
> > > > > assumption I was operating under was that provided I added
> > > > > O_NOATIME to prevent the parent directory being updated, passing
> > > > > in a NULL mnt for the purposes of iterating the directory dentry
> > > > > was safe.  What apparmour is trying to do is look up the idmap
> > > > > for the mount point to do one of its checks.
> > > > > 
> > > > > There are two ways of fixing this that I can think of.  One would
> > > > > be exporting a function that lets me dig the vfsmount out of
> > > > > s_mounts and use that (it's well hidden in the internals of
> > > > > fs/mount.h, so I suspect this might not be very acceptable) or to
> > > > > get mnt_idmap to return
> > > 
> > > Nope, please don't.
> > > 
> > > > > &nop_mnt_idmap if the passed in mnt is NULL.  I'd lean towards
> > > > > the latter, but I'm cc'ing fsdevel to see what others think.
> > > 
> > > A struct path with mount NULL and dentry != NULL is guaranteed to bit
> > > us in the ass in other places. That's the bug.
> > > 
> > > > > 
> > > > 
> > > > 
> > > > Al spotted the same issue based on a syzbot report [0]
> > > > 
> > > > [0] https://lore.kernel.org/all/20250310235831.GL2023217@ZenIV/
> > > 
> > > efivars as written only has a single global superblock and it doesn't
> > > support idmapped mounts and I don't see why it ever would.
> > 
> > So that's not quite true: efivarfs currently supports uid and gid
> > mapping as mount options, which certainly looks like they were designed
> > to allow a second mount in a user directory.  I've no idea what the
> > actual use case for this is, but if I go for a single superblock, any
> > reconfigure with new uid/gid would become globally effective (change
> > every current mount) because they're stored in the superblock
> > information.
> > 
> > So what is the use case for this uid/gid parameter?  If no-one can
> > remember and no-one actually uses it, perhaps the whole config path can
> > be simplified by getting rid of the options?  Even if there is a use
> > case, if it's single mount only then we can still go with a global
> > superblock.
> 
> So efivarfs uses get_tree_single(). That means that only a single
> superblock of the filesystem type efivarfs can ever exist on the system.
> 
> If efivars is mounted multiple times it will be the exact same
> superblock that's used. IOW, mounting efivars multiple times is akin to
> a bind-mount. It would be a bit ugly but it could be done by making sure
> that any uid/gid changes are reflected. But see below.
> 
> > 
> > > But since efivars does only ever have a single global superblock, one
> > > possibility is to an internal superblock that always exits and is
> > > resurfaced whenever userspace mounts efivarfs. That's essentially the
> > > devtmpfs model.
> > > 
> > > Then you can stash:
> > > 
> > > static struct vfsmount *efivarfs_mnt;
> > > 
> > > globally and use that in efivarfs_pm_notify() to fill in struct path.
> > 
> > I didn't see devtmpfs when looking for examples, since it's hiding
> > outside of the fs/ directory.  However, it does seem to be a bit legacy
> > nasty as an example to copy.  However, I get the basics: we'd
> > instantiate the mnt and superblock on init (stashing mnt in the sfi so
> > the notifier gets it).  Then we can do the variable population on
> > reconfigure, just in case an EFI system doesn't want to mount efivarfs
> > to save memory.
> > 
> > I can code that up if I can get an answer to the uid/gid parameter
> > question above.
> 
> I have some questions. efivarfs registers efivarfs_pm_notify even before
> a superblock exists in efivarfs_init_fs_context(). That's called during
> fd_context = fsopen("efivarfs") before a superblock even exists:
> 
> (1) Is it guaranteed that efivarfs_pm_notify() is only called once a
>     superblock exists?
> 
> (2) Is it guaranteed that efivarfs_pm_notify() is only called when and
>     while a mount for the superblock exists?
> 
> If the question to either one of those is "no" then the global
> vfsmount hack will not help.
> 
> >From reading efivarfs_pm_notify() it looks like the answer to (1) is
> "yes" because you're dereferencing sfi->sb->s_root in
> efivarfs_pm_notify().
> 
> But I'm not at all certain that (2) isn't a "no" and that
> efivarfs_pm_notify() can be called before a mount exists. IOW, once
> fsconfig(FSCONFIG_CMD_CREATE) is called the notifier seems ready and
> registered but userspace isn't forced to call fsmount(fd_fs) at all.
> 
> They could just not to do it for whatever reason but the notifier should
> already be able to run.
> 
> Another question is whether the superblock can be freed while
> efivarfs_pm_notify() is running? I think that can't happen because
> blocking_notifier_chain_unregister(&efivar_ops_nh, &sfi->nb) will block
> in efivarfs_kill_sb() until all outstanding calls to
> efivarfs_pm_notify() are finished?
> 
> If (2) isn't guranteed then efivarfs_pm_notify() needs to be rewritten
> without relying on files because there's no guarantee that a mount
> exists at all.

Btw, sorry but I'm going to be able to (guarantee) to respond Wed - Fri
because I'm on kid-watch-duty.

