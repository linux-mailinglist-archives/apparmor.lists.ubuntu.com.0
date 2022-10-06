Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE75F699C
	for <lists+apparmor@lfdr.de>; Thu,  6 Oct 2022 16:32:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogRuq-0006D7-3L; Thu, 06 Oct 2022 14:32:00 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jannh@google.com>) id 1ogRdf-0000yh-7k
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 14:14:15 +0000
Received: by mail-io1-f47.google.com with SMTP id n198so1366144iod.3
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uPoSw2DcS8I2PL1GAxLCIjBZkmIbahmymE7q5ESqNH4=;
 b=J9UmphxOwRlKuKwKJGEStMq2njru+PiIwGVLUfPBPq5L+NiQWR0X0ph0BMc2W5nbt8
 4fY0afnp5OGHoR48WDeXsZwHxoMN5k4f3cAvRzRwXhvGYbcMUIpKQGeu62j2J2SnGy+J
 Xj/w4pUH+FdGPKiKioCFBigar50r6VlCGptHXogYu0vEHZthEC9POAERgLfXsIlNUJAT
 4LL5lhcH/9QJf5wjtvXr093IFQ5FVgHnW9DKsbH5n9oFVp8IFEYJH/pVve/xHlsOIZTb
 JrrThpZZTRv6pIFAUlojtCkCpeK6hrRAxbyXE8fkyWQe0FnS13WwHzjaGBDQmYXcBSxS
 r/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uPoSw2DcS8I2PL1GAxLCIjBZkmIbahmymE7q5ESqNH4=;
 b=XHCY1R/BpCtAtXf6VnCufLp/WdeIJhjRWiO1AVBBgpL92pswoHae63EBuICbI3mzgk
 p5LVyxeJbcKDBB715bw++H7oE+q+MSHW2mVcE+4Hsm27ZIkIftXaOVmG/9bEAhcK7+/3
 Jr0e54PA/jtlWTs/qYI3lNYpvevFxGGTFoxjLMpkvRKhQgW4oTeKMFYYBVyBAlbZLHdH
 Ic0wenJNteZjld7PIbhkJjXIL3GrkriKceLQOGXbF27lT2r3FNjQpLI6GclGNmP45Lf5
 /fzZgPSX9eqJ/Ckp6FKwLM6Y032iAp2sPpAulolwC51ptT1gzg9SFOIYA+Zm5ENgD8jV
 AFtw==
X-Gm-Message-State: ACrzQf33QeXKi9U9z2sv7ABwV4NTYbjypHERcVa92Oq6iF9K9nH20j3G
 ClNUKdaobXlBw5ke0uI6EHg+mrPoPhAZukZIBAsqiQ==
X-Google-Smtp-Source: AMsMyM6kii+MO2rLiB+gLKVkRtdEKc2Fqc0GkifGVmj9R/yf+5vbD7WJTCsBBNNUYIzb2JEn4WLbsp9vBGxMSZlBt2Y=
X-Received: by 2002:a6b:5d07:0:b0:6bb:7253:a439 with SMTP id
 r7-20020a6b5d07000000b006bb7253a439mr37286iob.2.1665065653849; Thu, 06 Oct
 2022 07:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
In-Reply-To: <20221006090506.paqjf537cox7lqrq@wittgenstein>
From: Jann Horn <jannh@google.com>
Date: Thu, 6 Oct 2022 16:13:37 +0200
Message-ID: <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Oct 2022 14:31:58 +0000
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
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel.org> wrote:
> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
> > The check_unsafe_exec() counting of n_fs would not add up under a heavily
> > threaded process trying to perform a suid exec, causing the suid portion
> > to fail. This counting error appears to be unneeded, but to catch any
> > possible conditions, explicitly unshare fs_struct on exec, if it ends up
>
> Isn't this a potential uapi break? Afaict, before this change a call to
> clone{3}(CLONE_FS) followed by an exec in the child would have the
> parent and child share fs information. So if the child e.g., changes the
> working directory post exec it would also affect the parent. But after
> this change here this would no longer be true. So a child changing a
> workding directoro would not affect the parent anymore. IOW, an exec is
> accompanied by an unshare(CLONE_FS). Might still be worth trying ofc but
> it seems like a non-trivial uapi change but there might be few users
> that do clone{3}(CLONE_FS) followed by an exec.

I believe the following code in Chromium explicitly relies on this
behavior, but I'm not sure whether this code is in active use anymore:

https://source.chromium.org/chromium/chromium/src/+/main:sandbox/linux/suid/sandbox.c;l=101?q=CLONE_FS&sq=&ss=chromium

