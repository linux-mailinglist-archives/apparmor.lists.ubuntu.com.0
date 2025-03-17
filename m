Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78BA64682
	for <lists+apparmor@lfdr.de>; Mon, 17 Mar 2025 10:04:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tu6OF-00011l-LK; Mon, 17 Mar 2025 09:04:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1tu6OD-00011d-UH
 for apparmor@lists.ubuntu.com; Mon, 17 Mar 2025 09:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DD1BA488C5;
 Mon, 17 Mar 2025 08:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C619C4CEE3;
 Mon, 17 Mar 2025 08:56:58 +0000 (UTC)
Date: Mon, 17 Mar 2025 09:56:54 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20250317-luftdicht-mehrweg-aab410542864@brauner>
References: <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <7bdcc2c5d8022d2f1a7ec23c0351f7816d4464c8.camel@HansenPartnership.com>
 <20250315-allemal-fahrbahn-9afc7bc0008d@brauner>
 <bad92b18f389256d26a886b2b0706d04c8c6c336.camel@HansenPartnership.com>
 <20250316-vergibt-hausrat-b23d525a1d24@brauner>
 <b2086c64d47463a019ac9fc9e5d7ee7f70becc8d.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2086c64d47463a019ac9fc9e5d7ee7f70becc8d.camel@HansenPartnership.com>
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

On Sun, Mar 16, 2025 at 10:26:12AM -0400, James Bottomley wrote:
> On Sun, 2025-03-16 at 07:46 +0100, Christian Brauner wrote:
> > On Sat, Mar 15, 2025 at 02:41:43PM -0400, James Bottomley wrote:
> [...]
> > > However, there's another problem: the mntput after kernel_file_open
> > > may synchronously call cleanup_mnt() (and thus deactivate_super())
> > > if the open fails because it's marked MNT_INTERNAL, which is caused
> > > by SB_KERNMOUNT.  I fixed this just by not passing the SB_KERNMOUNT
> > > flag, which feels a bit hacky.
> > 
> > It actually isn't. We know that vfs_kern_mount() will always
> > resurface the single superblock that's exposed to userspace because
> > we've just taken a reference to it earlier in efivarfs_pm_notify().
> > So that SB_KERNMOUNT flag is ignored because no new superblock is
> > allocated. It would only matter if we'd end up allocating a new
> > superblock which we never do.
> 
> I agree with the above: fc->sb_flags never propagates to the existing
> superblock.  However, nothing propagates the superblock flags back to
> fc->sb_flags either.  The check in vfs_create_mount() is on fc-
> >sb_flags.  Since the code is a bit hard to follow I added a printk on
> the path.mnt flags and sure enough it comes back with MNT_INTERNAL when
> SB_KERNMOUNT is set.
> 
> > And if we did it would be a bug because the superblock we allocate
> > could be reused at any time if a userspace task mounts efivarfs
> > before efivarfs_pm_notify() has destroyed it (or the respective
> > workqueue). But that superblock would then have SB_KERNMOUNT for
> > something that's not supposed to be one.
> 
> True, but the flags don't propagate to the superblock, so no bug.

SB_KERNMOUNT does propagate to the superblock if it is newly allocated
via sget_fc(): alloc_super(fc->fs_type, fc->sb_flags, user_ns);

But you misunderstood. "If we did it" means "If efivarfs_pm_notify()
somehow were to allocate a new superblock (which it doesn't) then having
SB_KERNMOUNT raised on the newly allocated superblock would be bug
because the superblock could be reused by userspace mounting efivars.

So removing it is the correct thing in either case. It's just confusing
to anyone maintaining that code thinking that it'd be possible for a
superblock to resurface with SB_KERNMOUNT.

> 
> > And whether or not that helper mount has MNT_INTERNAL is immaterial
> > to what you're doing here afaict.
> 
> I think the problem is the call chain mntput() -> mntput_no_expire()
> which directly calls cleanup_mnt() -> deactivate_super() if that flag
> is set.  Though I don't see that kernel_file_open() could ever fail
> except for some catastrophic reason like out of memory, so perhaps it
> isn't worth quibbling about.

Not what I'm saying. Not having MNT_INTERNAL is paramount to not
deadlocking but by not having it you're not losing anything.

> 
> > So not passing the SB_KERNMOUNT flag is the right thing (see devtmpfs
> > as well). You could slap a comment in here explaining that we never
> > allocate a new superblock so it's clear to people not familiar with
> > this particular code.
> 
> OK, so you agree that the code as written looks correct? Even if we
> don't necessarily quite agree on why.

We agree but you just misunderstood. :)

