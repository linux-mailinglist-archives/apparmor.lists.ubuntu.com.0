Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4315FEA4F
	for <lists+apparmor@lfdr.de>; Fri, 14 Oct 2022 10:18:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ojFtX-0002ov-R7; Fri, 14 Oct 2022 08:18:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <luto@kernel.org>) id 1ojBDS-00061X-UB
 for apparmor@lists.ubuntu.com; Fri, 14 Oct 2022 03:18:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D45E3619B9;
 Fri, 14 Oct 2022 03:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FDAC433D6;
 Fri, 14 Oct 2022 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665717509;
 bh=XdPGgMOKnebM+bZev/ZKP6wiusPUf6c3wma5ZTnpm0o=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=TCqLtjMUhY3E6hf1ob6xgOd/SwpJweBv3tU3uwDefMm4A/ahGMxIC1fYKYYfBlwsp
 c4OzGNUkyZI/EWcYPFYJKey7rW0cEUkZE+LOkpGV19buQ6rtAwI/hLX5iw1NyHEOWp
 FqFekRHYzRsrNlju7lbJW+OBW4KWCrNhryyrvGL4FXB9xq9XMqweABSa7E89pobMDj
 dhbr4pgnLECh4yJxmSvj30PN6CSkv/1SL630AvtuHSSPF+716FXaWyEJPJV5YfWvUX
 AcpoA4Go3xPK5zpt0aNt/TWRQOKwqnAINiTRleYiI5qW8pa8hRcvsqQddsl387N9qW
 FvzX+DBznhG0Q==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7304527C0054;
 Thu, 13 Oct 2022 23:18:27 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 23:18:27 -0400
X-ME-Sender: <xms:AdVIYzOOj40fYDS1rOvXIoESyi161w0DmwR247bhjuKHqLFeT9OiDA>
 <xme:AdVIY99529hlGQo-8KK9C30W0jlvvwwm75Z23pVzj3dmAFAsNJ7f6r-P3PWWqRCOA
 Phzta6qNL1zttkMjs8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekuddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgeejhfehkeejleffheetkefhtdduuedtieehheekgfekudeggfff
 udejuddufeeknecuffhomhgrihhnpegthhhrohhmihhumhdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguhidomhgvshhmthhp
 rghuthhhphgvrhhsohhnrghlihhthidqudduiedukeehieefvddqvdeifeduieeitdekqd
 hluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugidrlhhuthhordhush
X-ME-Proxy: <xmx:AdVIYySW5Tdj3xc9QCIj2mq3H0rlkZatHo_4MuZZWFFBYFhYq8rSyA>
 <xmx:AdVIY3uxuPeTfHWQd84oguwbXb3jq_lpHxPlgcluwo9B3Bp9AzVjRg>
 <xmx:AdVIY7fXv-y_hn4d5Su6ASkwBxzA9fYhaSJ9rz-aLpvt3ull2hzjEQ>
 <xmx:A9VIY5GVCHHHXumAGXj3B2GHtzhL21R2t0gobETwrTSxeyRxILj7NXJ9Hqc>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 878A331A03F7; Thu, 13 Oct 2022 23:18:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <2032f766-1704-486b-8f24-a670c0b3cb32@app.fastmail.com>
In-Reply-To: <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
Date: Thu, 13 Oct 2022 20:18:04 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Christian Brauner" <brauner@kernel.org>
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 14 Oct 2022 08:18:15 +0000
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
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
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



On Thu, Oct 6, 2022, at 7:13 AM, Jann Horn wrote:
> On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel.org> wrote:
>> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
>> > The check_unsafe_exec() counting of n_fs would not add up under a heavily
>> > threaded process trying to perform a suid exec, causing the suid portion
>> > to fail. This counting error appears to be unneeded, but to catch any
>> > possible conditions, explicitly unshare fs_struct on exec, if it ends up
>>
>> Isn't this a potential uapi break? Afaict, before this change a call to
>> clone{3}(CLONE_FS) followed by an exec in the child would have the
>> parent and child share fs information. So if the child e.g., changes the
>> working directory post exec it would also affect the parent. But after
>> this change here this would no longer be true. So a child changing a
>> workding directoro would not affect the parent anymore. IOW, an exec is
>> accompanied by an unshare(CLONE_FS). Might still be worth trying ofc but
>> it seems like a non-trivial uapi change but there might be few users
>> that do clone{3}(CLONE_FS) followed by an exec.
>
> I believe the following code in Chromium explicitly relies on this
> behavior, but I'm not sure whether this code is in active use anymore:
>
> https://source.chromium.org/chromium/chromium/src/+/main:sandbox/linux/suid/sandbox.c;l=101?q=CLONE_FS&sq=&ss=chromium

Wait, this is absolutely nucking futs.  On a very quick inspection, the sharable things like this are fs, files, sighand, and io.    files and sighand get unshared, which makes sense.  fs supposedly checks for extra refs and prevents gaining privilege.  io is... ignored!  At least it's not immediately obvious that io is a problem.

But seriously, this makes no sense at all.  It should not be possible to exec a program and then, without ptrace, change its cwd out from under it.  Do we really need to preserve this behavior?

--Andy

