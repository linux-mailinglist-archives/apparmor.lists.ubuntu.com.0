Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B183B409
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 22:35:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSku8-0007Kk-Kk; Wed, 24 Jan 2024 21:35:28 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rSku5-0007KZ-Fi
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 21:35:25 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d74045c463so28784785ad.3
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 13:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706132124; x=1706736924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R02kkjm9zZZALeIAu8OyIiBbwYldvv1po8aujCvgxCc=;
 b=XLIpXssulcxHm2FzL5cuN41DdznoQkogOygNqM1VpnfLHt/dy+U2Ot8Ms7LzSwMn5O
 SrCHXiYPJ2fspjY/FqSwRN1i/mjymCHMrBRW+ycEKRVS/bO+JJ7x4pcv5LCYoKErPdTI
 tMy6Jor90SSlZyex1mXuJc2ERXuoxW8TN1AJKnw1Tx58UxQXrKePTzIiu5UNk1TU8/id
 Pm0QqYJxMV27dtYA8sYRxXVrCoHjsrSvAOuwBNFHXe8eXXT0oXk1SB1kCcHJYLFdl1Fh
 U4j+m+gOhzDC01L4zTye2fhQaJH5CHezn18N8ZaSkK5NAD/wJoBUFynHFiLXI1MnG6OJ
 J3Dw==
X-Gm-Message-State: AOJu0YzYb54I5qzD7d6hXSTEjZNBgj6g4VUdR31NFkip5W7YFzU9NvaW
 2sf9NIKGh2aDz4OKjTKTjSs69nH/pThN7dAKpz9Y22tPIOeV4QnluxQ6wJCi6A==
X-Google-Smtp-Source: AGHT+IHcICz0Mfn9SvjnkuBQXJnezLd9Usm4kNxOTm+k+tyC0AhF5zlKsrJeWSD40yUZv9HJJFvwgg==
X-Received: by 2002:a17:902:ee0c:b0:1d5:b82a:939 with SMTP id
 z12-20020a170902ee0c00b001d5b82a0939mr16459plb.125.1706132124053; 
 Wed, 24 Jan 2024 13:35:24 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 mj11-20020a1709032b8b00b001d73a2acc2bsm6701572plb.142.2024.01.24.13.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 13:35:23 -0800 (PST)
Date: Wed, 24 Jan 2024 13:35:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <202401241334.670AFDD@keescook>
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401241310.0A158998@keescook>
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
 Paul Moore <paul@paul-moore.com>, Jann Horn <jannh@google.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Kevin Locke <kevin@kevinlocke.name>,
 "Serge E. Hallyn" <serge@hallyn.com>
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

Actually, this should probably match was load_shlib() uses:

                        PROT_READ | PROT_WRITE | PROT_EXEC,
                        MAP_FIXED_NOREPLACE | MAP_PRIVATE,

-- 
Kees Cook

