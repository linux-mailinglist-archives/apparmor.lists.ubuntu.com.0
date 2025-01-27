Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DAAA21BB8
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5tA-0004f3-NS; Wed, 29 Jan 2025 11:05:44 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <willy@infradead.org>)
 id 1tcRGR-00073C-JU
 for apparmor@lists.ubuntu.com; Mon, 27 Jan 2025 15:43:03 +0000
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tcRG3-00000009b8r-2Zcd; Mon, 27 Jan 2025 15:42:39 +0000
Date: Mon, 27 Jan 2025 15:42:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <Z5epb86xkHQ3BLhp@casper.infradead.org>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzag9ugx.fsf@intel.com>
Received-SPF: none client-ip=90.155.50.34; envelope-from=willy@infradead.org;
 helo=casper.infradead.org
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
 linux-security-module@vger.kernel.org,
 Joel Granados <joel.granados@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 linux-raid@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 openipmi-developer@lists.sourceforge.net, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Song Liu <song@kernel.org>, kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> You could have static const within functions too. You get the rodata
> protection and function local scope, best of both worlds?

timer_active is on the stack, so it can't be static const.

Does this really need to be cc'd to such a wide distribution list?

