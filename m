Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1B60265C
	for <lists+apparmor@lfdr.de>; Tue, 18 Oct 2022 10:04:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1okha6-0003H3-Hf; Tue, 18 Oct 2022 08:04:10 +0000
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1okgiw-0007fY-1k
 for apparmor@lists.ubuntu.com; Tue, 18 Oct 2022 07:09:14 +0000
Received: by mail-pg1-f170.google.com with SMTP id s196so11257519pgs.3
 for <apparmor@lists.ubuntu.com>; Tue, 18 Oct 2022 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iNEQRnMbbhNWubilbw/rj/P2d1G+agBoZ60I2f1f5Do=;
 b=X0ET30LPAg/2hhVOVOYU6Pr04DSI3Jm0DBzg+Dbc9pRLpg/gYYFfB2lWuUXdMW8x5y
 QMYGSvgNIFT5mwvtFI3z4wND4aavbws+5TizLg4YPcPHYHMgDLbkU5BJJ0LRZp5SMd+j
 E36rxqZu5Rf3DdSbuERN5DitzBEx14I8ec4Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNEQRnMbbhNWubilbw/rj/P2d1G+agBoZ60I2f1f5Do=;
 b=yc7OWf5blygMHl5iWzuwR/bsg7vqveejDf+h2Y04fApdZfhsYVbXb1dJRn/YzOHcry
 aUWKaHA0N7+LoA2QnfxmMZ/1BuUokr4RMuFOn5pIfhYi1VGWqR1UqN0C5/ACEKtiIJw4
 SxETu16Y+PY6TzmNQl8rqnq0XPkB4EjpnGKpu6QnA/TKnYFr84l7Jba08Dc5mxqo42r2
 cXu2v9LpsDW3zaTjki9tJbnUxF1hQIgjpKE+OkAEpcXRftr0Ef9EnDUfdIoL6VLKkJNy
 jfpYWd4bWQgB2uOFHspUfD4VHOltYszeju06dXg3rUC9yD+rWYkCSQ6BTEIu56LOJlKQ
 gZ0g==
X-Gm-Message-State: ACrzQf2VGZTsD/mImmuYS8Y7f5sZoIGoKjmkwUgvut1xzKkFFF4whpKK
 c8q87EcFx6sRPQ/766Gqaflgzg==
X-Google-Smtp-Source: AMsMyM7O1F8/RnlgevXbqPsr/L7BpnVBiOy+1L4ZiF+iCfo11wW0RLSWGEv3YXYrEKpONV1OJxPM1Q==
X-Received: by 2002:a05:6a00:2495:b0:562:c459:e327 with SMTP id
 c21-20020a056a00249500b00562c459e327mr1763013pfv.47.1666076952183; 
 Tue, 18 Oct 2022 00:09:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a17090aa08200b0020b7de675a4sm7301841pjp.41.2022.10.18.00.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 00:09:11 -0700 (PDT)
Date: Tue, 18 Oct 2022 00:09:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Message-ID: <202210172359.EDF8021407@keescook>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <2032f766-1704-486b-8f24-a670c0b3cb32@app.fastmail.com>
 <CAG48ez3hM+-V39QpFaNfRJxVrQVBu2Dm-B-xFN2GEt9p81Vd2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3hM+-V39QpFaNfRJxVrQVBu2Dm-B-xFN2GEt9p81Vd2Q@mail.gmail.com>
X-Mailman-Approved-At: Tue, 18 Oct 2022 08:04:09 +0000
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
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

On Fri, Oct 14, 2022 at 05:35:26PM +0200, Jann Horn wrote:
> On Fri, Oct 14, 2022 at 5:18 AM Andy Lutomirski <luto@kernel.org> wrote:
> > On Thu, Oct 6, 2022, at 7:13 AM, Jann Horn wrote:
> > > On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel.org> wrote:
> > >> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
> > >> > The check_unsafe_exec() counting of n_fs would not add up under a heavily
> > >> > threaded process trying to perform a suid exec, causing the suid portion
> > >> > to fail. This counting error appears to be unneeded, but to catch any
> > >> > possible conditions, explicitly unshare fs_struct on exec, if it ends up
> > >>
> > >> Isn't this a potential uapi break? Afaict, before this change a call to
> > >> clone{3}(CLONE_FS) followed by an exec in the child would have the
> > >> parent and child share fs information. So if the child e.g., changes the
> > >> working directory post exec it would also affect the parent. But after
> > >> this change here this would no longer be true. So a child changing a
> > >> workding directoro would not affect the parent anymore. IOW, an exec is
> > >> accompanied by an unshare(CLONE_FS). Might still be worth trying ofc but
> > >> it seems like a non-trivial uapi change but there might be few users
> > >> that do clone{3}(CLONE_FS) followed by an exec.
> > >
> > > I believe the following code in Chromium explicitly relies on this
> > > behavior, but I'm not sure whether this code is in active use anymore:
> > >
> > > https://source.chromium.org/chromium/chromium/src/+/main:sandbox/linux/suid/sandbox.c;l=101?q=CLONE_FS&sq=&ss=chromium
> >
> > Wait, this is absolutely nucking futs.  On a very quick inspection, the sharable things like this are fs, files, sighand, and io.    files and sighand get unshared, which makes sense.  fs supposedly checks for extra refs and prevents gaining privilege.  io is... ignored!  At least it's not immediately obvious that io is a problem.
> >
> > But seriously, this makes no sense at all.  It should not be possible to exec a program and then, without ptrace, change its cwd out from under it.  Do we really need to preserve this behavior?
> 
> I agree that this is pretty wild.
> 
> The single user I'm aware of is Chrome, and as far as I know, they use
> it for establishing their sandbox on systems where unprivileged user
> namespaces are disabled - see
> <https://chromium.googlesource.com/chromium/src/+/main/docs/linux/suid_sandbox.md>.
> They also have seccomp-based sandboxing, but IIRC there are some small
> holes that mean it's still useful for them to be able to set up
> namespaces, like how sendmsg() on a unix domain socket can specify a
> file path as the destination address.
> 
> (By the way, I think maybe Chrome wouldn't need this wacky trick with
> the shared fs_struct if the "NO_NEW_PRIVS permits chroot()" thing had
> ever landed that you
> (https://lore.kernel.org/lkml/0e2f0f54e19bff53a3739ecfddb4ffa9a6dbde4d.1327858005.git.luto@amacapital.net/)
> and Mickaël Salaün proposed in the past... or alternatively, if there
> was a way to properly filter all the syscalls that Chrome has to
> permit for renderers.)
> 
> (But also, to be clear, I don't speak for Chrome, this is just my
> understanding of how their stuff works.)

Chrome seems to just want a totally empty filesystem view, yes?
Let's land the nnp+chroot change. :P Only 10 years late! Then we can
have Chrome use this and we can unshare fs on exec...

-- 
Kees Cook

