Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5EEA0B0AF
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX6-0000Lp-L5; Mon, 13 Jan 2025 08:10:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <djwong@kernel.org>) id 1tVupA-0003pQ-K4
 for apparmor@lists.ubuntu.com; Thu, 09 Jan 2025 15:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D378CA420AB;
 Thu,  9 Jan 2025 15:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E5AC4CED2;
 Thu,  9 Jan 2025 15:51:55 +0000 (UTC)
Date: Thu, 9 Jan 2025 07:51:54 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
Message-ID: <20250109155154.GP1306365@frogsfrogsfrogs>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=djwong@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:42 +0000
Subject: Re: [apparmor] [PATCH] treewide: const qualify ctl_tables where
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
 Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as the arrays would reside in .rodata.
> This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> constify the ctl_table argument of proc_handlers") constified all the
> proc_handlers.

Sounds like a good idea,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org> # xfs

--D

