Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 42107A5EEB5
	for <lists+apparmor@lfdr.de>; Thu, 13 Mar 2025 10:00:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tseQ6-0004bt-T8; Thu, 13 Mar 2025 09:00:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1tseQ4-0004av-FR
 for apparmor@lists.ubuntu.com; Thu, 13 Mar 2025 09:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9ADAE5C1053;
 Thu, 13 Mar 2025 08:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB19C4CEEB;
 Thu, 13 Mar 2025 08:50:36 +0000 (UTC)
Date: Thu, 13 Mar 2025 09:50:31 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, Ryan Lee <ryan.lee@canonical.com>
Message-ID: <20250313-dompteur-dachten-bb695fcbebf1@brauner>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
 <20250312212148.274205-2-ryan.lee@canonical.com>
 <20250312213714.GT2023217@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312213714.GT2023217@ZenIV>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=brauner@kernel.org;
 helo=dfw.source.kernel.org
Subject: Re: [apparmor] [RFC PATCH 1/6] fs: invoke LSM file_open hook in
 do_dentry_open for O_PATH fds as well
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
Cc: Jan Kara <jack@suse.cz>, Paul Moore <paul@paul-moore.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 linux-security-module@vger.kernel.org,
 =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
 linux-fsdevel@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Mar 12, 2025 at 09:37:14PM +0000, Al Viro wrote:
> On Wed, Mar 12, 2025 at 02:21:41PM -0700, Ryan Lee wrote:
> > Currently, opening O_PATH file descriptors completely bypasses the LSM
> > infrastructure. Invoking the LSM file_open hook for O_PATH fds will
> > be necessary for e.g. mediating the fsmount() syscall.

LSM mediation for the mount api should be done by adding appropriate
hooks to the new mount api.

> > 
> > Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> > ---
> >  fs/open.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/open.c b/fs/open.c
> > index 30bfcddd505d..0f8542bf6cd4 100644
> > --- a/fs/open.c
> > +++ b/fs/open.c
> > @@ -921,8 +921,13 @@ static int do_dentry_open(struct file *f,
> >  	if (unlikely(f->f_flags & O_PATH)) {
> >  		f->f_mode = FMODE_PATH | FMODE_OPENED;
> >  		file_set_fsnotify_mode(f, FMODE_NONOTIFY);
> >  		f->f_op = &empty_fops;
> > -		return 0;
> > +		/*
> > +		 * do_o_path in fs/namei.c unconditionally invokes path_put
> > +		 * after this function returns, so don't path_put the path
> > +		 * upon LSM rejection of O_PATH opening
> > +		 */
> > +		return security_file_open(f);
> 
> Unconditional path_put() in do_o_path() has nothing to do with that -
> what gets dropped there is the reference acquired there; the reference
> acquired (and not dropped) here is the one that went into ->f_path.
> Since you are leaving FMODE_OPENED set, you will have __fput() drop
> that reference.
> 
> Basically, you are simulating behaviour on the O_DIRECT open of
> something that does not support O_DIRECT - return an error, with
> ->f_path and FMODE_OPENED left in place.
> 
> Said that, what I do not understand is the point of that exercise -
> why does LSM need to veto anything for those and why is security_file_open()

I really think this is misguided. This should be done via proper hooks
into apis that use O_PATH file descriptors for specific purposes but not
for the generic open() path.

> the right place for such checks?

It isn't.

> 
> The second part is particularly interesting...

