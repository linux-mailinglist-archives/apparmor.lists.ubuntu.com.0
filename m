Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A1A21BB6
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5t9-0004eH-9S; Wed, 29 Jan 2025 11:05:43 +0000
Received: from mgamail.intel.com ([192.198.163.9])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jani.nikula@intel.com>)
 id 1tcQX9-0002Ib-Nw
 for apparmor@lists.ubuntu.com; Mon, 27 Jan 2025 14:56:16 +0000
X-CSE-ConnectionGUID: 1VzI6D/UT5y3Ah4nZiK30A==
X-CSE-MsgGUID: N8NKjsM6RVSy8Gi4f3ez/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49104691"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49104691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 06:56:13 -0800
X-CSE-ConnectionGUID: Z9Coz29cQ6uqfPwc/L4sHg==
X-CSE-MsgGUID: XE2pskZGQO2Q6A9y4rThjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113598177"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.14])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 06:56:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Joel Granados <joel.granados@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
In-Reply-To: <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
Date: Mon, 27 Jan 2025 16:55:58 +0200
Message-ID: <87jzag9ugx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=192.198.163.9; envelope-from=jani.nikula@intel.com;
 helo=mgamail.intel.com
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
 Thomas =?utf-8?Q?Wei=C3=9F?= =?utf-8?Q?schuh?= <linux@weissschuh.net>,
 linux-mm@kvack.org, keyrings@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 linux-raid@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 openipmi-developer@lists.sourceforge.net, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Song Liu <song@kernel.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 27 Jan 2025, Joel Granados <joel.granados@kernel.org> wrote:
> On Wed, Jan 22, 2025 at 01:41:35PM +0100, Ard Biesheuvel wrote:
>> On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
>> >
>> > On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
>> > > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
>> > >
>> > > Hi Joel,
>> > >
>> > > > Add the const qualifier to all the ctl_tables in the tree except for
>> > > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
>> > > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
>> > > > drivers/inifiniband dirs). These are special cases as they use a
>> > > > registration function with a non-const qualified ctl_table argument or
>> > > > modify the arrays before passing them on to the registration function.
>> > > >
>> > > > Constifying ctl_table structs will prevent the modification of
>> > > > proc_handler function pointers as the arrays would reside in .rodata.
>> > > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
>> > > > constify the ctl_table argument of proc_handlers") constified all the
>> > > > proc_handlers.
>> > >
>> > > I could identify at least these occurences in s390 code as well:
>> > Hey Alexander
>> >
>> > Thx for bringing these to my attention. I had completely missed them as
>> > the spatch only deals with ctl_tables outside functions.
>> >
>> > Short answer:
>> > These should not be included in the current patch because they are a
>> > different pattern from how sysctl tables are usually used. So I will not
>> > include them.
>> >
>> > With that said, I think it might be interesting to look closer at them
>> > as they seem to be complicating the proc_handler (I have to look at them
>> > closer).
>> >
>> > I see that they are defining a ctl_table struct within the functions and
>> > just using the data (from the incoming ctl_table) to forward things down
>> > to proc_do{u,}intvec_* functions. This is very odd and I have only seen
>> > it done in order to change the incoming ctl_table (which is not what is
>> > being done here).
>> >
>> > I will take a closer look after the merge window and circle back with
>> > more info. Might take me a while as I'm not very familiar with s390
>> > code; any additional information on why those are being used inside the
>> > functions would be helpfull.
>> >
>> 
>> Using const data on the stack is not as useful, because the stack is
>> always mapped writable.
>> 
>> Global data structures marked 'const' will be moved into an ELF
>> section that is typically mapped read-only in its entirely, and so the
>> data cannot be modified by writing to it directly. No such protection
>> is possible for the stack, and so the constness there is only enforced
>> at compile time.
> I completely agree with you. No reason to use const within those
> functions. But why define those ctl_tables in function to begin with.
> Can't you just use the ones that are defined outside the functions?

You could have static const within functions too. You get the rodata
protection and function local scope, best of both worlds?

BR,
Jani.


-- 
Jani Nikula, Intel

