Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E71A6373E
	for <lists+apparmor@lfdr.de>; Sun, 16 Mar 2025 20:29:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tttfU-0003zo-CX; Sun, 16 Mar 2025 19:29:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ardb@kernel.org>) id 1tttfS-0003zd-SI
 for apparmor@lists.ubuntu.com; Sun, 16 Mar 2025 19:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC42CA48C5C
 for <apparmor@lists.ubuntu.com>; Sun, 16 Mar 2025 19:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBDBC4CEEE
 for <apparmor@lists.ubuntu.com>; Sun, 16 Mar 2025 19:20:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30762598511so39175561fa.0
 for <apparmor@lists.ubuntu.com>; Sun, 16 Mar 2025 12:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7SBw9r7fJLXE3W1LUcR0XxdImi0bx55lbBrKWWDcTUmDJAbwAjeXSPNowTfJ8gYlOZ7VOgvMZw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy9W2IasQwY0jtVXn54i2zIR0HXsOxTUV0mR0A5onMQ9DSJVFbw
 CRvCbmze38UjQuj/RUI73tObGoTE9ZKsSQ1s7Ik6pXs4XhiNQNJ4gLFgjnQ8Tj84Cy3PTaK+6QA
 QgCGaGgdL1OuWnfvNyKnn9yTxpnU=
X-Google-Smtp-Source: AGHT+IGcfsGWidxv9sRAkkFQzKwjpDHZOVE300xVnp+qPdHtQRaXTm3nUv0t/PqqXA0WFmss8SFP1FVNTS2rHPoZVhY=
X-Received: by 2002:a05:6512:4029:b0:549:b0f3:43a2 with SMTP id
 2adb3069b0e04-549c392511amr3793918e87.40.1742152799381; Sun, 16 Mar 2025
 12:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
 <465d1d23-3b36-490e-b0dd-74889d17fa4c@tnxip.de>
 <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <7bdcc2c5d8022d2f1a7ec23c0351f7816d4464c8.camel@HansenPartnership.com>
 <20250315-allemal-fahrbahn-9afc7bc0008d@brauner>
 <bad92b18f389256d26a886b2b0706d04c8c6c336.camel@HansenPartnership.com>
 <20250316-vergibt-hausrat-b23d525a1d24@brauner>
 <b2086c64d47463a019ac9fc9e5d7ee7f70becc8d.camel@HansenPartnership.com>
In-Reply-To: <b2086c64d47463a019ac9fc9e5d7ee7f70becc8d.camel@HansenPartnership.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 16 Mar 2025 20:19:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEsO4qmnkX32Ht-V1uD18raf-9PpwpPhvwf7ebX_cHWFg@mail.gmail.com>
X-Gm-Features: AQ5f1JrQSfOpiTTW16QAGjedBBidhMNR_3UN8YFpWBBxFs47qYn47cz-oLlz-6I
Message-ID: <CAMj1kXEsO4qmnkX32Ht-V1uD18raf-9PpwpPhvwf7ebX_cHWFg@mail.gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=147.75.193.91; envelope-from=ardb@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] [RFC 1/1] fix NULL mnt [was Re: apparmor NULL
 pointer dereference on resume [efivarfs]]
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
Cc: Christian Brauner <brauner@kernel.org>, linux-efi@vger.kernel.org,
 apparmor <apparmor@lists.ubuntu.com>,
 =?UTF-8?Q?Malte_Schr=C3=B6der?= <malte.schroeder@tnxip.de>,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, "jk@ozlabs.org" <jk@ozlabs.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, 16 Mar 2025 at 15:26, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Sun, 2025-03-16 at 07:46 +0100, Christian Brauner wrote:
> > On Sat, Mar 15, 2025 at 02:41:43PM -0400, James Bottomley wrote:
> [...]
> > > However, there's another problem: the mntput after kernel_file_open
> > > may synchronously call cleanup_mnt() (and thus deactivate_super())
> > > if the open fails because it's marked MNT_INTERNAL, which is caused
> > > by SB_KERNMOUNT.  I fixed this just by not passing the SB_KERNMOUNT
> > > flag, which feels a bit hacky.
> >
> > It actually isn't. We know that vfs_kern_mount() will always
> > resurface the single superblock that's exposed to userspace because
> > we've just taken a reference to it earlier in efivarfs_pm_notify().
> > So that SB_KERNMOUNT flag is ignored because no new superblock is
> > allocated. It would only matter if we'd end up allocating a new
> > superblock which we never do.
>
> I agree with the above: fc->sb_flags never propagates to the existing
> superblock.  However, nothing propagates the superblock flags back to
> fc->sb_flags either.  The check in vfs_create_mount() is on fc-
> >sb_flags.  Since the code is a bit hard to follow I added a printk on
> the path.mnt flags and sure enough it comes back with MNT_INTERNAL when
> SB_KERNMOUNT is set.
>
> > And if we did it would be a bug because the superblock we allocate
> > could be reused at any time if a userspace task mounts efivarfs
> > before efivarfs_pm_notify() has destroyed it (or the respective
> > workqueue). But that superblock would then have SB_KERNMOUNT for
> > something that's not supposed to be one.
>
> True, but the flags don't propagate to the superblock, so no bug.
>
> > And whether or not that helper mount has MNT_INTERNAL is immaterial
> > to what you're doing here afaict.
>
> I think the problem is the call chain mntput() -> mntput_no_expire()
> which directly calls cleanup_mnt() -> deactivate_super() if that flag
> is set.  Though I don't see that kernel_file_open() could ever fail
> except for some catastrophic reason like out of memory, so perhaps it
> isn't worth quibbling about.
>
> > So not passing the SB_KERNMOUNT flag is the right thing (see devtmpfs
> > as well). You could slap a comment in here explaining that we never
> > allocate a new superblock so it's clear to people not familiar with
> > this particular code.
>
> OK, so you agree that the code as written looks correct? Even if we
> don't necessarily quite agree on why.
>

Thanks for making progress on this. It would be nice if we could fix
this before the v6.14 release, given that the code in question was
introduced this cycle.

And there's another suggestion from Al, to use inode_lock_nested() to
work around the lockdep warning. I can take care of that one, unless
you prefer to do it yourself?

