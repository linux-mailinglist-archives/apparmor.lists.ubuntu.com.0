Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A02B0089A
	for <lists+apparmor@lfdr.de>; Thu, 10 Jul 2025 18:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZu7y-0006j8-Oo; Thu, 10 Jul 2025 16:28:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1uZppE-00009R-UV
 for apparmor@lists.ubuntu.com; Thu, 10 Jul 2025 11:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AFE0AA54A1E;
 Thu, 10 Jul 2025 11:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78A4C4CEE3;
 Thu, 10 Jul 2025 11:46:44 +0000 (UTC)
Date: Thu, 10 Jul 2025 13:46:42 +0200
From: Christian Brauner <brauner@kernel.org>
To: Song Liu <songliubraving@meta.com>
Message-ID: <20250710-roden-hosen-ba7f215706bb@brauner>
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=brauner@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Thu, 10 Jul 2025 16:28:05 +0000
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

On Wed, Jul 09, 2025 at 05:06:36PM +0000, Song Liu wrote:
> Hi Al and Paul, 
> 
> Thanks for your comments!
> 
> > On Jul 9, 2025, at 8:19 AM, Paul Moore <paul@paul-moore.com> wrote:
> > 
> > On Wed, Jul 9, 2025 at 6:24 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >> On Tue, Jul 08, 2025 at 04:05:04PM -0700, Song Liu wrote:
> >>> security_sb_mount handles multiple types of mounts: new mount, bind
> >>> mount, etc. When parameter dev_name is a path, it need to be parsed
> >>> with kern_path.
> > 
> > ...
> > 
> >> security_sb_mount() is and had always been a mind-boggling trash of an API.
> >> 
> >> It makes no sense in terms of operations being requested.  And any questions
> >> regarding its semantics had been consistently met with blanket "piss off,
> >> LSM gets to do whatever it wants to do, you are not to question the sanity
> >> and you are not to request any kind of rules - give us the fucking syscall
> >> arguments and let us at it".
> > 
> > I'm not going to comment on past remarks made by other devs, but I do
> > want to make it clear that I am interested in making sure we have LSM
> > hooks which satisfy both the needs of the existing in-tree LSMs while
> > also presenting a sane API to the kernel subsystems in which they are
> > placed.  I'm happy to revisit any of our existing LSM hooks to
> > restructure them to better fit these goals; simply send some patches
> > and let's discuss them.
> > 
> >> Come up with a saner API.  We are done accomodating that idiocy.  The only
> >> changes you get to make in fs/namespace.c are "here's our better-defined
> >> hooks, please call <this hook> when you do <that>".
> 
> Right now, we have security_sb_mount and security_move_mount, for 
> syscall “mount” and “move_mount” respectively. This is confusing 
> because we can also do move mount with syscall “mount”. How about 
> we create 5 different security hooks:
> 
> security_bind_mount
> security_new_mount
> security_reconfigure_mount
> security_remount
> security_change_type_mount
> 
> and remove security_sb_mount. After this, we will have 6 hooks for
> each type of mount (the 5 above plus security_move_mount).

I've multiple times pointed out that the current mount security hooks
aren't working and basically everything in the new mount api is
unsupervised from an LSM perspective.

My recommendation is make a list of all the currently supported
security_*() hooks in the mount code (I certainly don't have them in my
head). Figure out what each of them allow to mediate effectively and how
the callchains are related.

Then make a proposal how to replace them with something that a) doesn't
cause regressions which is probably something that the LSMs care about
and b) that covers the new mount API sufficiently to be properly
mediated.

I'll happily review proposals. Fwiw, I'm pretty sure that this is
something that Mickael is interested in as well.

