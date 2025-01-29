Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C486CA21BB9
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5tB-0004fL-Fy; Wed, 29 Jan 2025 11:05:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <joel.granados@kernel.org>)
 id 1td3lA-0006gq-01
 for apparmor@lists.ubuntu.com; Wed, 29 Jan 2025 08:49:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 631165C027D;
 Wed, 29 Jan 2025 08:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA1C4CED3;
 Wed, 29 Jan 2025 08:49:17 +0000 (UTC)
Date: Wed, 29 Jan 2025 09:49:13 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <umk5gfo7iq7krppvqsal57hlzds26bdqd3g7kccjzuudjikdws@k2oknd6zx6g7>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org>
 <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
 <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=joel.granados@kernel.org; helo=dfw.source.kernel.org
X-Mailman-Approved-At: Wed, 29 Jan 2025 11:05:41 +0000
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 codalist@coda.cs.cmu.edu, Alexander Gordeev <agordeev@linux.ibm.com>,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-serial@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-trace-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 linux-raid@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 openipmi-developer@lists.sourceforge.net, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Song Liu <song@kernel.org>, kexec@lists.infradead.org,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jan 28, 2025 at 10:43:10AM -0500, Paul Moore wrote:
> On Tue, Jan 28, 2025 at 6:22 AM Joel Granados <joel.granados@kernel.org> wrote:
> > On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> > > On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > > > You could have static const within functions too. You get the rodata
> > > > protection and function local scope, best of both worlds?
> > >
> > > timer_active is on the stack, so it can't be static const.
> > >
> > > Does this really need to be cc'd to such a wide distribution list?
> > That is a very good question. I removed 160 people from the original
> > e-mail and left the ones that where previously involved with this patch
> > and left all the lists for good measure. But it seems I can reduce it
> > even more.
> >
> > How about this: For these treewide efforts I just leave the people that
> > are/were involved in the series and add two lists: linux-kernel and
> > linux-hardening.
> >
> > Unless someone screams, I'll try this out on my next treewide.
> 
> I'm not screaming about it :) but anything that touches the LSM,
I'll consider it as a scream :) So I'll keep my previous approach of
leaving only personal mails that are involved, but leaving all the lists
that b4 suggests.

> SELinux, or audit code (or matches the regex in MAINTAINERS) I would
> prefer to see on the associated mailing list.

General comment sent to the void:
It is tricky to know exactly who wants to be informed of all this and
who thinks its useless. I think that if we want more focus it should
come from automated tools like b4. Maybe some string in MAINTAINERS
stating that the list should not be used in cases of tree-wide commits?

Best

-- 

Joel Granados

