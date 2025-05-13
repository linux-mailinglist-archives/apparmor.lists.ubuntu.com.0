Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A2AB5C00
	for <lists+apparmor@lfdr.de>; Tue, 13 May 2025 20:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uEtxu-0003DV-Kt; Tue, 13 May 2025 18:02:54 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1uEpKf-000086-VP
 for apparmor@lists.ubuntu.com; Tue, 13 May 2025 13:06:06 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so60229895e9.3
 for <apparmor@lists.ubuntu.com>; Tue, 13 May 2025 06:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747141565; x=1747746365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRH4yaq02O4BeoAY/f143mbK8AEXX3uy5ZGAgLBp4KM=;
 b=QIeTtGM6X6gAhZdrYyDd7RMzglUhZ0tr6Doq3MSmUbWSGSQCJbDPlMgJmoWkxAztw6
 g3iTeiDUVZMDxN13cd1Q5l8mdpztjjalvA0UhgV1IdarENgcPGDte4NJgvIGA9RvHyIu
 9uBbUf5936ksLkx8U2kCctcOhoq9bNTndWKuvzFeIykhWqAFpxv70rhlrmjyVJ2dKLaM
 e7fF01nU5xcSHr/fc0UFVy3TlwO0JMw4Y69ZpCGKVBCWSYknDryDy9kh4IA3PA0pEzmr
 jTi3cj+ywWEjQZWgo1Bl9CRWh5JK4dDP+8nh2gUKp5fAIDuSZ4w2wY0U0peitO5uetH0
 PXRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhusFU9BpWyz0wykQHY5a58MqTAbhe1MJDtrlVdJ3bWTqvJ0WZWQr+PM+6WIC8dxFdeQOsqEmADg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzNjZEueE+P/TlXnnoy8MRukEgDuZTQ8qHrnBUjurzbiWQlTZrx
 LF5SerFwZn17OTpoRw0nz4t/QmnqI/CzaSjjHPr2zZBr2avDN/qT
X-Gm-Gg: ASbGncsiCe/3BNcDHoYrWtQNJ7IFzsCfynLQ1q10Mc0r1R5+Wb7TpxISyhpAl6qBk13
 9XGH/3Fi+cvkskqUsxr7Lo3M/Cr5C2fWa8iKj2ywod2U2x2yjUM427NZOsDPFKjDlIZ+Qi1RGqb
 wsNn3sialdmpVAhOheqzbpVvAxKzBFIcsTqF39XD9ozlAtgnXQB1kSDhfifh8BzHaXtEYFiktoc
 0gYC6DCPZ7p+w9I/TyV6nu4Y+SF/v63D8p8ZVphihOLNq+jIJPnvrAs0FmUJhDVKrTKbuniHTSJ
 filh82NWQr5TEPBdUH09YwSfGUOwLTmQO/F5QYFGy1cLi1PDI4+lGenpyKyyMsOA
X-Google-Smtp-Source: AGHT+IEHBhhE7TvsAD/FnNo4BJJ0fgMjXWx6eOMY8JlawqVvxffhuMX7kttizQAJ+g7X01ahmWKKUQ==
X-Received: by 2002:a05:600c:3587:b0:43c:fdbe:43be with SMTP id
 5b1f17b1804b1-442d6dd216fmr140842115e9.27.1747141561377; 
 Tue, 13 May 2025 06:06:01 -0700 (PDT)
Received: from f (cst-prg-88-99.cust.vodafone.cz. [46.135.88.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f3c2sm209934765e9.15.2025.05.13.06.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 06:06:00 -0700 (PDT)
Date: Tue, 13 May 2025 15:05:45 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
Received-SPF: pass client-ip=209.85.128.52; envelope-from=mjguzik@gmail.com;
 helo=mail-wm1-f52.google.com
X-Mailman-Approved-At: Tue, 13 May 2025 18:02:53 +0000
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
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Oct 06, 2022 at 08:25:01AM -0700, Kees Cook wrote:
> On October 6, 2022 7:13:37 AM PDT, Jann Horn <jannh@google.com> wrote:
> >On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel.org> wrote:
> >> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
> >> > The check_unsafe_exec() counting of n_fs would not add up under a heavily
> >> > threaded process trying to perform a suid exec, causing the suid portion
> >> > to fail. This counting error appears to be unneeded, but to catch any
> >> > possible conditions, explicitly unshare fs_struct on exec, if it ends up
> >>
> >> Isn't this a potential uapi break? Afaict, before this change a call to
> >> clone{3}(CLONE_FS) followed by an exec in the child would have the
> >> parent and child share fs information. So if the child e.g., changes the
> >> working directory post exec it would also affect the parent. But after
> >> this change here this would no longer be true. So a child changing a
> >> workding directoro would not affect the parent anymore. IOW, an exec is
> >> accompanied by an unshare(CLONE_FS). Might still be worth trying ofc but
> >> it seems like a non-trivial uapi change but there might be few users
> >> that do clone{3}(CLONE_FS) followed by an exec.
> >
> >I believe the following code in Chromium explicitly relies on this
> >behavior, but I'm not sure whether this code is in active use anymore:
> >
> >https://source.chromium.org/chromium/chromium/src/+/main:sandbox/linux/suid/sandbox.c;l=101?q=CLONE_FS&sq=&ss=chromium
> 
> Oh yes. I think I had tried to forget this existed. Ugh. Okay, so back to the drawing board, I guess. The counting will need to be fixed...
> 
> It's possible we can move the counting after dethread -- it seems the early count was just to avoid setting flags after the point of no return, but it's not an error condition...
> 

I landed here from git blame.

I was looking at sanitizing shared fs vs suid handling, but the entire
ordeal is so convoluted I'm confident the best way forward is to whack
the problem to begin with.

Per the above link, the notion of a shared fs struct across different
processes is depended on so merely unsharing is a no-go.

However, the shared state is only a problem for suid/sgid.

Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct is
shared. This will have to be checked for after the execing proc becomes
single-threaded ofc.

While technically speaking this does introduce a change in behavior,
there is precedent for doing it and seeing if anyone yells.

With this in place there is no point maintainig ->in_exec or checking
the flag.

There is the known example of depending on shared fs_struct across exec.
Hopefully there is no example of depending on execing a suid/sgid binary
in such a setting -- it would be quite a weird setup given that for
security reasons the perms must not be changed.

The upshot of this method is that any breakage will be immediately
visible in the form of a failed exec.

Another route would be to do the mandatory unshare but only for
suid/sgid, except that would have a hidden failure (if you will).

Comments?

