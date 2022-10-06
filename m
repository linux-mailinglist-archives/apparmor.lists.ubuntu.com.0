Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4C5F722B
	for <lists+apparmor@lfdr.de>; Fri,  7 Oct 2022 02:07:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogatb-0001bU-QS; Fri, 07 Oct 2022 00:07:19 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jannh@google.com>) id 1ogSv0-0002Dl-Tw
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 15:36:15 +0000
Received: by mail-il1-f181.google.com with SMTP id 8so1184272ilj.4
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kBsN+WV474YxARCF7+nqmiK1jJMhN3dpQirfp2PoxlI=;
 b=JjMbJ/6iXZaadLFSJQk/HRtX7HrZ/RZDwb2mntZuqfcRGukztaLnaRtozSNqvZ38A4
 YIoQ/S3pghhDMLpw8KTrVksZJi+qZfmtmFFtL6r+hlek1RDiFjHhO28+25YkHLvlCc/G
 2ton1aYig3VnJwiK390amDUqhjkwHT2v8cCIJriuz9pU8Vq1hyKD89eS6KbebFUKLB7f
 StxxrRJteAZtp0mitV1ByWgBDUKx7ejR8uKWfR+ZopLjyxWlWBgzgq30TO7uWMlo0TOX
 Ot9J/qTOjnGajAnOuylFkpSg9k4OtDzH80hAqWJVInjfgYhV53xWDOLUG2oWhzMmJmJ7
 oo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kBsN+WV474YxARCF7+nqmiK1jJMhN3dpQirfp2PoxlI=;
 b=Zcqxq6bcmz3s/XdPl4ucCND4WfAXec+6176mQqGyqivvk+HnjWMwJvCW6KLpHWr0Qf
 Ky2nrBUDDYVWc4HCtYkuih7Z2ZYZE5jG0MMQB/ZoBEhvlyRpilWa9T1ZiwaVInvTVUDc
 ys2ZqJD6HwaY5v34ZuWwQwbWSk/rpTWMYdZuion8lBX6CIf5Qo/PeC0b/SFXVzi9inAH
 wYmzMkPCE7EAYIZ56TV3wACMDMIqBptVLg4THpDOpmumNltBnSuXmeRn021v4vtrHpW6
 bePbZs71G2EJe34QGynZHVg2W/CxgPICya2LwKTxIyTMvKCn3cGVsPJJ69rK04S9kJZt
 ucUA==
X-Gm-Message-State: ACrzQf3OCIVQTYfRA3sENXD3UzKH1LJeCp0SZvRiXicYC+gmlLKI36+a
 DQBvFv55p8N4Zmz2knEKLVJ5py64Pkh/uaFLoXYUIw==
X-Google-Smtp-Source: AMsMyM4b3/P730KDfkxwcyTWlRlnjgpSRQAwOlc/NfsO6cxtR79rz7+RL4b861zTtxfuwZkTO8fgQgVJ7C0o9SGCGVA=
X-Received: by 2002:a05:6e02:1989:b0:2f6:45ca:410d with SMTP id
 g9-20020a056e02198900b002f645ca410dmr99039ilf.187.1665070573386; Thu, 06 Oct
 2022 08:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
In-Reply-To: <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 6 Oct 2022 17:35:37 +0200
Message-ID: <CAG48ez2h29CschY7GPiyg7eZT9B4UnBeKtS6AksyD8iDqs25Bg@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 07 Oct 2022 00:07:18 +0000
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
 Fenghua Yu <fenghua.yu@intel.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
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

On Thu, Oct 6, 2022 at 5:25 PM Kees Cook <keescook@chromium.org> wrote:
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

Random idea that I haven't thought about a lot:

One approach might be to not do it by counting, but instead have a
flag on the fs_struct that we set when someone does a clone() with
CLONE_FS but without CLONE_THREAD? Then we'd end up with the following
possible states for fs_struct:

 - single-process, normal
 - single-process, pending execve past check_unsafe_exec() (prevent
concurrent CLONE_FS)
 - shared between processes

The slight difference from the old semantics would be that once you've
used CLONE_FS without CLONE_THREAD, you can never do setuid execve()
from your current process again (without calling unshare()), even if
the child disappears in the meantime. I think that might be an
acceptably small UAPI break.

