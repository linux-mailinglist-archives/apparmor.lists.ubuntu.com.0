Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B568B481A
	for <lists+apparmor@lfdr.de>; Sat, 27 Apr 2024 22:49:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s0ozM-0002Hh-Ok; Sat, 27 Apr 2024 20:49:40 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1s0cfv-000254-Mk
 for apparmor@lists.ubuntu.com; Sat, 27 Apr 2024 07:40:47 +0000
Date: Sat, 27 Apr 2024 09:40:43 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jakub Kicinski <kuba@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>
Message-ID: <38a87a0f-02c7-4072-9342-8f6697ea1a17@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
 <9e657181-866a-4626-82d0-e0030051b003@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e657181-866a-4626-82d0-e0030051b003@t-8ch.de>
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Sat, 27 Apr 2024 20:49:39 +0000
Subject: Re: [apparmor] [PATCH v3 00/11] sysctl: treewide: constify
 ctl_table argument of sysctl handlers
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2024-04-25 09:10:27+0000, Thomas Weißschuh wrote:
> On 2024-04-24 20:12:34+0000, Jakub Kicinski wrote:
> > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > > The series was split from my larger series sysctl-const series [0].
> > > It only focusses on the proc_handlers but is an important step to be
> > > able to move all static definitions of ctl_table into .rodata.
> > 
> > Split this per subsystem, please.
> 
> Unfortunately this would introduce an enormous amount of code churn.
> 
> The function prototypes for each callback have to stay consistent.
> So a another callback member ("proc_handler_new") is needed and users
> would be migrated to it gradually.
> 
> But then *all* definitions of "struct ctl_table" throughout the tree need to
> be touched.
> In contrast, the proposed series only needs to change the handler
> implementations, not their usage sites.
> 
> There are many, many more usage sites than handler implementations.
> 
> Especially, as the majority of sysctl tables use the standard handlers
> (proc_dostring, proc_dobool, ...) and are not affected by the proposed
> aproach at all.
> 
> And then we would have introduced a new handler name "proc_handler_new"
> and maybe have to do the whole thing again to rename it back to
> the original and well-known "proc_handler".

This aproach could be optimized by only migrating the usages of the
custom handler implementations to "proc_handler_new".
After this we could move over the core handlers and "proc_handler" in
one small patch that does not need to touch the usages sites.

Afterwards all non-core usages would be migrated back from
"proc_handler_new" to "proc_handler" and the _new variant could be
dropped again.

It would still be more than twice the churn of my current patch.
And these patches would be more complex than the current
"just add a bunch of consts, nothing else".

Personally I still prefer the original aproach.


Thomas

