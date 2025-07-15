Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA7B067C7
	for <lists+apparmor@lfdr.de>; Tue, 15 Jul 2025 22:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ubmJc-0001yL-Rs; Tue, 15 Jul 2025 20:31:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ubczF-0004n0-Au
 for apparmor@lists.ubuntu.com; Tue, 15 Jul 2025 10:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3ED8B61140;
 Tue, 15 Jul 2025 10:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24204C4CEE3;
 Tue, 15 Jul 2025 10:18:02 +0000 (UTC)
Date: Tue, 15 Jul 2025 12:18:00 +0200
From: Christian Brauner <brauner@kernel.org>
To: Song Liu <songliubraving@meta.com>
Message-ID: <20250715-knattern-hochklassig-ddc27ddd4557@brauner>
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
 <20250710-roden-hosen-ba7f215706bb@brauner>
 <5EB3EFBC-69BA-49CC-B416-D4A7398A2B47@meta.com>
 <20250711-pfirsich-worum-c408f9a14b13@brauner>
 <4EE690E2-4276-41E6-9D8C-FBF7E90B9EB3@meta.com>
 <20250714-ansonsten-shrimps-b4df1566f016@brauner>
 <3ACFCAB1-9FEC-4D4E-BFB0-9F37A21AA204@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ACFCAB1-9FEC-4D4E-BFB0-9F37A21AA204@meta.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Tue, 15 Jul 2025 20:31:51 +0000
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

On Mon, Jul 14, 2025 at 03:10:57PM +0000, Song Liu wrote:
> 
> 
> > On Jul 14, 2025, at 1:45 AM, Christian Brauner <brauner@kernel.org> wrote:
> > 
> > On Fri, Jul 11, 2025 at 04:22:52PM +0000, Song Liu wrote:
> >> 
> >> 
> >>> On Jul 11, 2025, at 2:36 AM, Christian Brauner <brauner@kernel.org> wrote:
> >> 
> >> [...]
> >> 
> >>>>> 
> >>>> To make sure I understand the comment. By “new mount api”, do you mean 
> >>>> the code path under do_new_mount()?
> >>> 
> >>> fsopen()
> >>> fsconfig()
> >>> fsmount()
> >>> open_tree()
> >>> open_tree_attr()
> >>> move_mount()
> >>> statmount()
> >>> listmount()
> >>> 
> >>> I think that's all.
> >> 
> >> Thanks for the clarification and pointer!
> >> 
> >>> 
> >>>> 
> >>>>> My recommendation is make a list of all the currently supported
> >>>>> security_*() hooks in the mount code (I certainly don't have them in my
> >>>>> head). Figure out what each of them allow to mediate effectively and how
> >>>>> the callchains are related.
> >>>>> 
> >>>>> Then make a proposal how to replace them with something that a) doesn't
> >>>>> cause regressions which is probably something that the LSMs care about
> >>>>> and b) that covers the new mount API sufficiently to be properly
> >>>>> mediated.
> >>>>> 
> >>>>> I'll happily review proposals. Fwiw, I'm pretty sure that this is
> >>>>> something that Mickael is interested in as well.
> >>>> 
> >>>> So we will consider a proper redesign of LSM hooks for mount syscalls, 
> >>>> but we do not want incremental improvements like this one. Do I get 
> >>>> the direction right?
> >>> 
> >>> If incremental is workable then I think so yes. But it would be great to
> >>> get a consistent picture of what people want/need.
> >> 
> >> In short term, we would like a way to get struct path of dev_name for  
> > 
> > You scared me for a second. By "dev_name" you mean the source path.
> 
> Right, we need to get struct path for the source path specified by 
> string “dev_name”.
> 
> > 
> >> bind mount. AFAICT, there are a few options:
> >> 
> >> 1. Introduce bpf_kern_path kfunc.
> >> 2. Add new hook(s), such as [1].
> >> 3. Something like this patch.
> >> 
> >> [1] https://lore.kernel.org/linux-security-module/20250110021008.2704246-1-enlightened@chromium.org/ 
> >> 
> >> Do you think we can ship one of them?
> > 
> > If you place a new security hook into __do_loopback() the only thing
> > that I'm not excited about is that we're holding the global namespace
> > semaphore at that point. And I want to have as little LSM hook calls
> > under the namespace semaphore as possible.
> 
> do_loopback() changed a bit since [1]. But if we put the new hook 
> in do_loopback() before lock_mount(), we don’t have the problem with
> the namespace semaphore, right? Also, this RFC doesn’t seem to have 
> this issue either. 

While the mount isn't locked another mount can still be mounted on top
of it. lock_mount() will detect this and lookup the topmost mount and
use that. IOW, the value of old_path->mnt may have changed after
lock_mount().

> > If you have 1000 containers each calling into
> > security_something_something_bind_mount() and then you do your "walk
> > upwards towards the root stuff" and that root is 100000 directories away
> > you've introduced a proper DOS or at least a severe new bottleneck into
> > the system. And because of mount namespace propagation that needs to be
> > serialized across all mount namespaces the namespace semaphore isn't
> > something we can just massage away.
> 
> AFAICT, a poorly designed LSM can easily DoS a system. Therefore, I 
> don’t think we need to overthink about a LSM helper causing DoS in 
> some special scenarios. The owner of the LSM, either built-in LSM or 
> BPF LSM, need to be aware of such risks and design the LSM rules 
> properly to avoid DoS risks. For example, if the path tree is really 
> deep, the LSM may decide to block the mount after walking a preset 
> number of steps. 

The scope of the lock matters _a lot_. If a poorly designed LSM happens
to take exorbitant amount of time under the inode_lock() it's annoying:
to anyone else wanting to grab the inode_lock() _for that single inode_.

If a poorly designed LSM does broken stuff under the namespace semaphore
any mount event on the whole system will block, effectively deadlocking
the system in an instant. For example, if anything even glances at
/proc/<pid>/mountinfo it's game over. It's already iffy that we allow
security_sb_statfs() under there but that's at least guaranteed to be
fast.

If you can make it work so that we don't have to place security_*()
under the namespace semaphore and you can figure out how to deal with a
potential overmount racing you then this would be ideal for everyone.

