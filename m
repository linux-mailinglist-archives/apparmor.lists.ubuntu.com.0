Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B300A19A26
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 22:09:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tahyv-0005TM-Vr; Wed, 22 Jan 2025 21:09:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ardb@kernel.org>) id 1taa3J-0008HT-RV
 for apparmor@lists.ubuntu.com; Wed, 22 Jan 2025 12:41:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A4395C5EA5
 for <apparmor@lists.ubuntu.com>; Wed, 22 Jan 2025 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5440FC4CEE3
 for <apparmor@lists.ubuntu.com>; Wed, 22 Jan 2025 12:41:48 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30227c56b11so69529951fa.3
 for <apparmor@lists.ubuntu.com>; Wed, 22 Jan 2025 04:41:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaRUvTIkqPS0/p6x9UClWaMvMHAPiGmY8D7mz6c/FPzhNuD06R9lIGVnrbezeT8DtCXS6OGUYsjQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz/fLTwA6O+j2jtPt0gdyVxLB61ND9xsSoIAqqHWz8XbRZsJmcn
 JMfXASrezafjAS9VRcBNz37Ok3QymDIPeA9QYhuTmRooZ5a8RCzldFvFkrsBzXer45R9c3Sez6y
 Th7M39WPDxO5BTx6Rvkg+OHMvAXA=
X-Google-Smtp-Source: AGHT+IFcRSReB7hah7mapcirnp1PWu31SswN3BbR4HjBYPEG79Tzl030J0TjqkE7fYQS4xaDIi2/KgOUqh2J3fswv1A=
X-Received: by 2002:a05:651c:2228:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-3072caa15c1mr71017091fa.19.1737549706586; Wed, 22 Jan 2025
 04:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
In-Reply-To: <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Jan 2025 13:41:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
X-Gm-Features: AbW1kvaDj3u8bGVj1m4rnYAkpiRSTpmPAB3bThAH-GyuG2Tmgw9okzkp1e58uCc
Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
To: Joel Granados <joel.granados@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Wed, 22 Jan 2025 21:09:47 +0000
Subject: Re: [apparmor] [PATCH v2] treewide: const qualify ctl_tables where
	applicable
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
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 Corey Minyard <cminyard@mvista.com>, Kees Cook <kees@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Song Liu <song@kernel.org>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
>
> On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
> > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
> >
> > Hi Joel,
> >
> > > Add the const qualifier to all the ctl_tables in the tree except for
> > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> > > drivers/inifiniband dirs). These are special cases as they use a
> > > registration function with a non-const qualified ctl_table argument or
> > > modify the arrays before passing them on to the registration function.
> > >
> > > Constifying ctl_table structs will prevent the modification of
> > > proc_handler function pointers as the arrays would reside in .rodata.
> > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> > > constify the ctl_table argument of proc_handlers") constified all the
> > > proc_handlers.
> >
> > I could identify at least these occurences in s390 code as well:
> Hey Alexander
>
> Thx for bringing these to my attention. I had completely missed them as
> the spatch only deals with ctl_tables outside functions.
>
> Short answer:
> These should not be included in the current patch because they are a
> different pattern from how sysctl tables are usually used. So I will not
> include them.
>
> With that said, I think it might be interesting to look closer at them
> as they seem to be complicating the proc_handler (I have to look at them
> closer).
>
> I see that they are defining a ctl_table struct within the functions and
> just using the data (from the incoming ctl_table) to forward things down
> to proc_do{u,}intvec_* functions. This is very odd and I have only seen
> it done in order to change the incoming ctl_table (which is not what is
> being done here).
>
> I will take a closer look after the merge window and circle back with
> more info. Might take me a while as I'm not very familiar with s390
> code; any additional information on why those are being used inside the
> functions would be helpfull.
>

Using const data on the stack is not as useful, because the stack is
always mapped writable.

Global data structures marked 'const' will be moved into an ELF
section that is typically mapped read-only in its entirely, and so the
data cannot be modified by writing to it directly. No such protection
is possible for the stack, and so the constness there is only enforced
at compile time.

