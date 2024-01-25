Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C439683EB20
	for <lists+apparmor@lfdr.de>; Sat, 27 Jan 2024 05:56:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rTakG-0000FZ-Kb; Sat, 27 Jan 2024 04:56:44 +0000
Received: from smtp-bc0a.mail.infomaniak.ch ([45.157.188.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1rT2kn-0008El-At
 for apparmor@lists.ubuntu.com; Thu, 25 Jan 2024 16:39:01 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4TLRNh6dy5zMqbBv;
 Thu, 25 Jan 2024 17:39:00 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4TLRNd3PKVz3f; Thu, 25 Jan 2024 17:38:57 +0100 (CET)
Date: Thu, 25 Jan 2024 17:38:53 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20240125.bais0ieKahz7@digikod.net>
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202401241310.0A158998@keescook>
X-Infomaniak-Routing: alpha
X-Mailman-Approved-At: Sat, 27 Jan 2024 04:56:42 +0000
Subject: Re: [apparmor] [PATCH] exec: Check __FMODE_EXEC instead of
 in_execve for LSMs
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
Cc: Jan Kara <jack@suse.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 Kevin Locke <kevin@kevinlocke.name>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jann Horn <jannh@google.com>, apparmor@lists.ubuntu.com,
 Josh Triplett <josh@joshtriplett.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 01:32:02PM -0800, Kees Cook wrote:
> On Wed, Jan 24, 2024 at 12:47:34PM -0800, Linus Torvalds wrote:
> > On Wed, 24 Jan 2024 at 12:15, Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Hmpf, and frustratingly Ubuntu (and Debian) still builds with
> > > CONFIG_USELIB, even though it was reported[2] to them almost 4 years ago.
> 
> For completeness, Fedora hasn't had CONFIG_USELIB for a while now.
> 
> > Well, we could just remove the __FMODE_EXEC from uselib.
> > 
> > It's kind of wrong anyway.
> 
> Yeah.
> 
> > So I think just removing __FMODE_EXEC would just do the
> > RightThing(tm), and changes nothing for any sane situation.
> 
> Agreed about these:
> 
> - fs/fcntl.c is just doing a bitfield sanity check.
> 
> - nfs_open_permission_mask(), as you say, is only checking for
>   unreadable case.
> 
> - fsnotify would also see uselib() as a read, but afaict,
>   that's what it would see for an mmap(), so this should
>   be functionally safe.
> 
> This one, though, I need some more time to examine:
> 
> - AppArmor, TOMOYO, and LandLock will see uselib() as an
>   open-for-read, so that might still be a problem? As you
>   say, it's more of a mmap() call, but that would mean
>   adding something a call like security_mmap_file() into
>   uselib()...

If user space can emulate uselib() without opening a file with
__FMODE_EXEC, then there is no security reason to keep __FMODE_EXEC for
uselib().

Removing __FMODE_EXEC from uselib() looks OK for Landlock.  We use
__FMODE_EXEC to infer if a file is being open for execution i.e., by
execve(2).

If __FMODE_EXEC is removed from uselib(), I think it should also be
backported to all stable kernels for consistency though.


> 
> The issue isn't an insane "support uselib() under AppArmor" case, but
> rather "Can uselib() be used to bypass exec/mmap checks?"
> 
> This totally untested patch might give appropriate coverage:
> 
> diff --git a/fs/exec.c b/fs/exec.c
> index d179abb78a1c..0c9265312c8d 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -143,6 +143,10 @@ SYSCALL_DEFINE1(uselib, const char __user *, library)
>  	if (IS_ERR(file))
>  		goto out;
>  
> +	error = security_mmap_file(file, PROT_READ | PROT_EXEC, MAP_FIXED | MAP_SHARED);
> +	if (error)
> +		goto exit;
> +
>  	/*
>  	 * may_open() has already checked for this, so it should be
>  	 * impossible to trip now. But we need to be extra cautious
> 
> > Of course, as you say, not having CONFIG_USELIB enabled at all is the
> > _truly_ sane thing, but the only thing that used the FMODE_EXEC bit
> > were landlock and some special-case nfs stuff.
> 
> Do we want to attempt deprecation again? This was suggested last time:
> https://lore.kernel.org/lkml/20200518130251.zih2s32q2rxhxg6f@wittgenstein/
> 
> -Kees
> 
> -- 
> Kees Cook
> 

