Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D88AF697
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 20:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzKvq-0002pE-8l; Tue, 23 Apr 2024 18:31:54 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mcgrof@infradead.org>)
 id 1rzKvn-0002ox-4J
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 18:31:51 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2
 (Red Hat Linux)) id 1rzKvd-000000018V6-22Td;
 Tue, 23 Apr 2024 18:31:41 +0000
Date: Tue, 23 Apr 2024 11:31:41 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Message-ID: <Zif-jf8Takojtq7x@bombadil.infradead.org>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
Received-SPF: none client-ip=198.137.202.133;
 envelope-from=mcgrof@infradead.org; helo=bombadil.infradead.org
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, linux-sctp@vger.kernel.org,
 lvs-devel@vger.kernel.org, coreteam@netfilter.org,
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

On Tue, Apr 23, 2024 at 09:54:35AM +0200, Thomas Weiﬂschuh wrote:
> * Patch 1 is a bugfix for the stack_erasing sysctl handler
> * Patches 2-10 change various helper functions throughout the kernel to
>   be able to handle 'const ctl_table'.
> * Patch 11 changes the signatures of all proc handlers through the tree.
>   Some other signatures are also adapted, for details see the commit
>   message.
> 
> Only patch 1 changes any code at all.
> 
> The series was compile-tested on top of next-20230423 for
> i386, x86_64, arm, arm64, riscv, loongarch, s390 and m68k.
> 
> The series was split from my larger series sysctl-const series [0].
> It only focusses on the proc_handlers but is an important step to be
> able to move all static definitions of ctl_table into .rodata.
> 
> [0] https://lore.kernel.org/lkml/20231204-const-sysctl-v2-0-7a5060b11447@weissschuh.net/
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Cover letters don't need SOBS we only use them for patches.

But anyway:

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

