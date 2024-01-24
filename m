Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACF83B446
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 22:50:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSl8o-0000T0-Bf; Wed, 24 Jan 2024 21:50:38 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rSl8j-0000Sn-0i
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 21:50:33 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1d731314e67so22268275ad.1
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 13:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706133031; x=1706737831;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aKbTsnLJkm2iKuMS9jJ6ekbfLtHs2opAYqk/RqQaX2k=;
 b=F8YfzaJ3OD9suGD0OTbyNZx9sdvrFYpVW48G0nwxxFyFiUeRbtyQR3ZUiajmQFvBNk
 n+UnviBeXxPTKbz17/AN20ntj6NwbyX4RKV4BlwAYmPoW1QyKOeute41ZXSorKYHYLdH
 7RhL7mUVFGszMMWG75Z6oxW2l9WEAD3AR6vnDA5R9WpG8zXNxElwyClHyijWMd8UPwCV
 2+hZVr9OPKZLnASlMqeB8brA/FuvwTV1W3GqlJaqWw1Oz4QsJM40X0KCGdffQE3bisE3
 ZxL6CcQwSP7KhqjZ2xdsDuvREfBCgoPRt/0Rkz6ceS4eXWuJOIuJqxXMZgQLUhDP8PZy
 7aig==
X-Gm-Message-State: AOJu0Yx1C2yBixhq4BVLfhy8Xq0VC2KA32F5vWD2FruK6sclnvu11dIP
 EDHWepOSQMpA7CxTPeWExuJ9cITW0npbn1nIDR6DhT0RwCvdEZeBOSGXsyrCNA==
X-Google-Smtp-Source: AGHT+IETCk9PNhDkJerT9hVfN75xLknukOIbsiWCq7ni0ocP8Kl19XxlMkq1LihioaB/wGqFl79jjw==
X-Received: by 2002:a17:902:ce83:b0:1d4:bba1:bc61 with SMTP id
 f3-20020a170902ce8300b001d4bba1bc61mr22180plg.119.1706133031248; 
 Wed, 24 Jan 2024 13:50:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 jl16-20020a170903135000b001d75cf0e039sm4692075plb.18.2024.01.24.13.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 13:50:30 -0800 (PST)
Date: Wed, 24 Jan 2024 13:50:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Message-ID: <202401241348.1A2860EB58@keescook>
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
 <CAG48ez1tcxtEwWgxSUqLDcYbrkY=UM3hz22A0BTvTYq4BGpM8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez1tcxtEwWgxSUqLDcYbrkY=UM3hz22A0BTvTYq4BGpM8A@mail.gmail.com>
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
Cc: Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Kevin Locke <kevin@kevinlocke.name>,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 10:40:49PM +0100, Jann Horn wrote:
> On Wed, Jan 24, 2024 at 10:32 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Jan 24, 2024 at 12:47:34PM -0800, Linus Torvalds wrote:
> > > On Wed, 24 Jan 2024 at 12:15, Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > Hmpf, and frustratingly Ubuntu (and Debian) still builds with
> > > > CONFIG_USELIB, even though it was reported[2] to them almost 4 years ago.
> >
> > For completeness, Fedora hasn't had CONFIG_USELIB for a while now.
> >
> > > Well, we could just remove the __FMODE_EXEC from uselib.
> > >
> > > It's kind of wrong anyway.
> >
> > Yeah.
> >
> > > So I think just removing __FMODE_EXEC would just do the
> > > RightThing(tm), and changes nothing for any sane situation.
> >
> > Agreed about these:
> >
> > - fs/fcntl.c is just doing a bitfield sanity check.
> >
> > - nfs_open_permission_mask(), as you say, is only checking for
> >   unreadable case.
> >
> > - fsnotify would also see uselib() as a read, but afaict,
> >   that's what it would see for an mmap(), so this should
> >   be functionally safe.
> >
> > This one, though, I need some more time to examine:
> >
> > - AppArmor, TOMOYO, and LandLock will see uselib() as an
> >   open-for-read, so that might still be a problem? As you
> >   say, it's more of a mmap() call, but that would mean
> >   adding something a call like security_mmap_file() into
> >   uselib()...
> >
> > The issue isn't an insane "support uselib() under AppArmor" case, but
> > rather "Can uselib() be used to bypass exec/mmap checks?"
> >
> > This totally untested patch might give appropriate coverage:
> >
> > diff --git a/fs/exec.c b/fs/exec.c
> > index d179abb78a1c..0c9265312c8d 100644
> > --- a/fs/exec.c
> > +++ b/fs/exec.c
> > @@ -143,6 +143,10 @@ SYSCALL_DEFINE1(uselib, const char __user *, library)
> >         if (IS_ERR(file))
> >                 goto out;
> >
> > +       error = security_mmap_file(file, PROT_READ | PROT_EXEC, MAP_FIXED | MAP_SHARED);
> > +       if (error)
> > +               goto exit;
> 
> Call path from here is:
> 
> sys_uselib -> load_elf_library -> elf_load -> elf_map -> vm_mmap ->
> vm_mmap_pgoff
> 
> Call path for normal mmap is:
> 
> sys_mmap_pgoff -> ksys_mmap_pgoff -> vm_mmap_pgoff
> 
> So I think the call paths converge before any real security checks
> happen, and the check you're suggesting should be superfluous. (There
> is some weird audit call in ksys_mmap_pgoff() but that's just to
> record the FD number, so I guess that doesn't matter.)

Yeah, I was just noticing this. I was over thinking. :) It does look
like all that is needed is to remove __FMODE_EXEC.

-- 
Kees Cook

