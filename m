Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9CAB84C5
	for <lists+apparmor@lfdr.de>; Thu, 15 May 2025 13:27:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uFWjh-0007PP-NY; Thu, 15 May 2025 11:26:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1uFENx-0000GG-KO
 for apparmor@lists.ubuntu.com; Wed, 14 May 2025 15:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A84635C55D9;
 Wed, 14 May 2025 15:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FEEC4CEE3;
 Wed, 14 May 2025 15:42:25 +0000 (UTC)
Date: Wed, 14 May 2025 08:42:22 -0700
From: Kees Cook <kees@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Message-ID: <202505140822.6AB755B6@keescook>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
 <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
 <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
 <CAG48ez0aP8LaGppy6Yon7xcFbQa1=CM-HXSZChvXYV2VJZ8y7g@mail.gmail.com>
 <871pss17hq.fsf@email.froward.int.ebiederm.org>
 <CAGudoHH-Jn5_4qnLV3qwzjTi2ZgfmfaO0qVSWW5gqdqkvchnDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHH-Jn5_4qnLV3qwzjTi2ZgfmfaO0qVSWW5gqdqkvchnDQ@mail.gmail.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kees@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Thu, 15 May 2025 11:26:48 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Jann Horn <jannh@google.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, oleg@redhat.com,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 14, 2025 at 02:03:31AM +0200, Mateusz Guzik wrote:
> On Wed, May 14, 2025 at 12:17 AM Eric W. Biederman
> <ebiederm@xmission.com> wrote:
> >
> > Jann Horn <jannh@google.com> writes:
> >
> > > On Tue, May 13, 2025 at 10:57 PM Kees Cook <kees@kernel.org> wrote:
> > >> On May 13, 2025 6:05:45 AM PDT, Mateusz Guzik <mjguzik@gmail.com> wrote:
> > >> >Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct is
> > >> >shared. This will have to be checked for after the execing proc becomes
> > >> >single-threaded ofc.
> > >>
> > >> Unfortunately the above Chrome helper is setuid and uses CLONE_FS.
> > >
> > > Chrome first launches a setuid helper, and then the setuid helper does
> > > CLONE_FS. Mateusz's proposal would not impact this usecase.
> > >
> > > Mateusz is proposing to block the case where a process first does
> > > CLONE_FS, and *then* one of the processes sharing the fs_struct does a
> > > setuid execve(). Linux already downgrades such an execve() to be
> > > non-setuid, which probably means anyone trying to do this will get
> > > hard-to-understand problems. Mateusz' proposal would just turn this
> > > hard-to-debug edgecase, which already doesn't really work, into a
> > > clean error; I think that is a nice improvement even just from the
> > > UAPI standpoint.
> > >
> > > If this change makes it possible to clean up the kernel code a bit, even better.
> >
> > What has brought this to everyone's attention just now?  This is
> > the second mention of this code path I have seen this week.
> >
> 
> There is a syzkaller report concerning ->in_exec handling, for example:
> https://lore.kernel.org/all/67dc67f0.050a0220.25ae54.001f.GAE@google.com/#t
>
> [...]
> > It looks like most of the lsm's also test bprm->unsafe.
> >
> > So I imagine someone could very carefully separate the non-ptrace case
> > from the ptrace case but *shrug*.
> >
> > Perhaps:
> >
> >         if ((is_setid || __cap_gained(permitted, new_old)) &&
> >             ((bprm->unsafe & ~LSM_UNSAFE_PTRACE) ||
> >              !ptracer_capable(current, new->user_ns))) {
> > +               if (!(bprm->unsafe & LSM_UNSAFE_PTRACE)) {
> > +                       return -EPERM;
> > +               }
> >                 /* downgrade; they get no more than they had, and maybe less */
> >                 if (!ns_capable(new->user_ns, CAP_SETUID) ||
> >                     (bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS)) {
> >                         new->euid = new->uid;
> >                         new->egid = new->gid;
> >                 }
> >                 new->cap_permitted = cap_intersect(new->cap_permitted,
> >                                                    old->cap_permitted);
> >          }
> >
> > If that is what you want that doesn't look to scary.  I don't think
> > it simplifies anything about fs->in_exec.  As fs->in_exec is set when
> > the processing calling exec is the only process that owns the fs_struct.
> > With fs->in_exec just being a flag that doesn't allow another thread
> > to call fork and start sharing the fs_struct during exec.
> >
> > *Shrug*
> >
> > I don't see why anyone would care.  It is just a very silly corner case.
> 
> Well I don't see how ptrace factors into any of this, apart from being
> a different case of ignoring suid/sgid.

I actually think we might want to expand the above bit of logic to use
an explicit tests of each LSM_UNSAFE case -- the merged
logic is very difficult to read currently. Totally untested expansion,
if I'm reading everything correctly:

	if (bprm->unsafe &&
	    (is_setid || __cap_gained(permitted, new_old))) {
		bool limit_caps = false;
		bool strip_eid = false;
		unsigned int unsafe = bprm->unsafe;
		/* Check each bit */

		if (unsafe & LSM_UNSAFE_PTRACE) {
			if (!ptracer_capable(current, new->user_ns))
				limit_caps = true;
			unsafe &= ~LSM_UNSAFE_PTRACE;
		}
		if (unsafe & LSM_UNSAFE_SHARE) {
			limit_caps = true;
			if (!ns_capable(new->user_ns, CAP_SETUID))
				strip_eid = true;
			unsafe &= ~LSM_UNSAFE_SHARE;
		}
		if (unsafe & LSM_UNSAFE_NO_NEW_PRIVS) {
			limit_caps = true;
			if (!ns_capable(new->user_ns, CAP_SETUID))
				strip_eid = true;
			unsafe &= ~LSM_UNSAFE_NO_NEW_PRIVS;
		}

		if (WARN(unsafe, "Unhandled LSM_UNSAFE flag: %u?!\n", unsafe))
			return -EINVAL;

		if (limit_caps) {
			new->cap_permitted = cap_intersect(new->cap_permitted,
							   old->cap_permitted);
		}
		if (strip_eid) {
			new->euid = new->uid;
			new->egid = new->gid;
		}
	}

> I can agree the suid/sgid situation vs CLONE_FS is a silly corner
> case, but one which needs to be handled for security reasons and which
> currently has weirdly convoluted code to do it.
> 
> The intent behind my proposal is very much to get the crapper out of
> the way in a future-proof and simple manner.
> 
> In check_unsafe_exec() you can find a nasty loop over threads in the
> group to find out if the fs struct is used by anyone outside of said
> group. Since fs struct users are not explicitly tracked and any of
> them can have different creds than the current thread, the kernel opts
> to ignore suid/sgid if there are extra users found (for security
> reasons). The loop depends on no new threads showing up as the list is
> being walked, to that end copy_fs() can transiently return an error if
> it spots ->in_exec.
> 
> The >in_exec field is used as a boolean/flag, but parallel execs using
> the same fs struct from different thread groups don't look serialized.
> This is supposed to be fine as in this case ->in_exec is not getting
> set to begin with, but it gets unconditionally unset on all execs.
> 
> And so on. It's all weird af.

100% :)


-- 
Kees Cook

