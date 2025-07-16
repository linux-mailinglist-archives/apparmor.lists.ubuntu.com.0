Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B9B0DF6C
	for <lists+apparmor@lfdr.de>; Tue, 22 Jul 2025 16:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ueEJv-0007r6-PB; Tue, 22 Jul 2025 14:50:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ubxfU-0006Rf-Mp
 for apparmor@lists.ubuntu.com; Wed, 16 Jul 2025 08:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF4A55C67BA;
 Wed, 16 Jul 2025 08:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC1AC4CEF0;
 Wed, 16 Jul 2025 08:31:56 +0000 (UTC)
Date: Wed, 16 Jul 2025 10:31:53 +0200
From: Christian Brauner <brauner@kernel.org>
To: Song Liu <songliubraving@meta.com>
Message-ID: <20250716-unsolidarisch-sagst-e70630ddf6b7@brauner>
References: <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
 <20250710-roden-hosen-ba7f215706bb@brauner>
 <5EB3EFBC-69BA-49CC-B416-D4A7398A2B47@meta.com>
 <20250711-pfirsich-worum-c408f9a14b13@brauner>
 <4EE690E2-4276-41E6-9D8C-FBF7E90B9EB3@meta.com>
 <20250714-ansonsten-shrimps-b4df1566f016@brauner>
 <3ACFCAB1-9FEC-4D4E-BFB0-9F37A21AA204@meta.com>
 <20250715-knattern-hochklassig-ddc27ddd4557@brauner>
 <B2872298-BC9C-4BFD-8C88-CED88E0B7E3A@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B2872298-BC9C-4BFD-8C88-CED88E0B7E3A@meta.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=brauner@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Tue, 22 Jul 2025 14:50:17 +0000
Subject: Re: [apparmor] [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
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
Cc: "mattbobrowski@google.com" <mattbobrowski@google.com>,
 "jack@suse.cz" <jack@suse.cz>,
 "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "tomoyo-users_en@lists.sourceforge.net"
 <tomoyo-users_en@lists.sourceforge.net>,
 "amir73il@gmail.com" <amir73il@gmail.com>, "ast@kernel.org" <ast@kernel.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 Paul Moore <paul@paul-moore.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "repnop@google.com" <repnop@google.com>,
 "john@apparmor.net" <john@apparmor.net>,
 "enlightened@chromium.org" <enlightened@chromium.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "mic@digikod.net" <mic@digikod.net>, "m@maowtm.org" <m@maowtm.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 "tomoyo-users_ja@lists.sourceforge.net"
 <tomoyo-users_ja@lists.sourceforge.net>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "gnoack@google.com" <gnoack@google.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jul 15, 2025 at 10:31:39PM +0000, Song Liu wrote:
> 
> > On Jul 15, 2025, at 3:18 AM, Christian Brauner <brauner@kernel.org> wrote:
> > On Mon, Jul 14, 2025 at 03:10:57PM +0000, Song Liu wrote:
> 
> 
> [...]
> 
> >>> If you place a new security hook into __do_loopback() the only thing
> >>> that I'm not excited about is that we're holding the global namespace
> >>> semaphore at that point. And I want to have as little LSM hook calls
> >>> under the namespace semaphore as possible.
> >> 
> >> do_loopback() changed a bit since [1]. But if we put the new hook 
> >> in do_loopback() before lock_mount(), we don’t have the problem with
> >> the namespace semaphore, right? Also, this RFC doesn’t seem to have 
> >> this issue either.
> > 
> > While the mount isn't locked another mount can still be mounted on top
> > of it. lock_mount() will detect this and lookup the topmost mount and
> > use that. IOW, the value of old_path->mnt may have changed after
> > lock_mount().
> 
> I am probably confused. Do you mean path->mnt (instead of old_path->mnt) 
> may have changed after lock_mount()? 

I mean the target path. I forgot that the code uses @old_path to mean
the source path not the target path. And you're interested in the source
path, not the target path.

> 
> > If you have 1000 containers each calling into
> >>> security_something_something_bind_mount() and then you do your "walk
> >>> upwards towards the root stuff" and that root is 100000 directories away
> >>> you've introduced a proper DOS or at least a severe new bottleneck into
> >>> the system. And because of mount namespace propagation that needs to be
> >>> serialized across all mount namespaces the namespace semaphore isn't
> >>> something we can just massage away.
> >> 
> >> AFAICT, a poorly designed LSM can easily DoS a system. Therefore, I 
> >> don’t think we need to overthink about a LSM helper causing DoS in 
> >> some special scenarios. The owner of the LSM, either built-in LSM or 
> >> BPF LSM, need to be aware of such risks and design the LSM rules 
> >> properly to avoid DoS risks. For example, if the path tree is really 
> >> deep, the LSM may decide to block the mount after walking a preset 
> >> number of steps.
> > 
> > The scope of the lock matters _a lot_. If a poorly designed LSM happens
> > to take exorbitant amount of time under the inode_lock() it's annoying:
> > to anyone else wanting to grab the inode_lock() _for that single inode_.
> > 
> > If a poorly designed LSM does broken stuff under the namespace semaphore
> > any mount event on the whole system will block, effectively deadlocking
> > the system in an instant. For example, if anything even glances at
> > /proc/<pid>/mountinfo it's game over. It's already iffy that we allow
> > security_sb_statfs() under there but that's at least guaranteed to be
> > fast.
> > 
> > If you can make it work so that we don't have to place security_*()
> > under the namespace semaphore and you can figure out how to deal with a
> > potential overmount racing you then this would be ideal for everyone.
> 
> I am trying to understand all the challenges here. 

As long as you're only interested in the source path's mount, you're
fine.

> 
> It appears to me that do_loopback() has the tricky issue:
> 
> static int do_loopback(struct path *path, ...)
> {
> 	...
> 	/* 
> 	 * path may still change, so not a good point to add
> 	 * security hook 
> 	 */
> 	mp = lock_mount(path);
> 	if (IS_ERR(mp)) {
> 		/* ... */
> 	}
> 	/* 
> 	 * namespace_sem is locked, so not a good point to add
> 	 * security hook
> 	 */
> 	...
> }
> 
> Basically, without major work with locking, there is no good 
> spot to insert a security hook into do_loopback(). Or, maybe 
> we can add a hook somewhere in lock_mount()? 

You can't really because the lookup_mnt() call in lock_mount() happens
under the namespace semaphore already and if it's the topmost mount it
won't be dropped again and you can't drop it again without risking
overmounts again.

But again, as long as you are interested in the source mount you should
be fine.

