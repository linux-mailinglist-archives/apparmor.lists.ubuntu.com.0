Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BC8B481B
	for <lists+apparmor@lfdr.de>; Sat, 27 Apr 2024 22:49:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s0ozM-0002Hb-Ke; Sat, 27 Apr 2024 20:49:40 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1s05nx-00020R-Rm
 for apparmor@lists.ubuntu.com; Thu, 25 Apr 2024 20:34:53 +0000
Date: Thu, 25 Apr 2024 22:34:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joel Granados <j.granados@samsung.com>
Message-ID: <d11f875e-4fb5-46dd-a412-84818208c575@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <CGME20240425031241eucas1p1fb0790e0d03ccbe4fca2b5f6da83d6db@eucas1p1.samsung.com>
 <20240424201234.3cc2b509@kernel.org>
 <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
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
 Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org,
 lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev,
 apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Joel,

On 2024-04-25 13:04:12+0000, Joel Granados wrote:
> On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > > The series was split from my larger series sysctl-const series [0].
> > > It only focusses on the proc_handlers but is an important step to be
> > > able to move all static definitions of ctl_table into .rodata.
> > 
> > Split this per subsystem, please.
> It is tricky to do that because it changes the first argument (ctl*) to
> const in the proc_handler function type defined in sysclt.h:
> "
> -typedef int proc_handler(struct ctl_table *ctl, int write, void *buffer,
> +typedef int proc_handler(const struct ctl_table *ctl, int write, void *buffer,
>                 size_t *lenp, loff_t *ppos);
> "
> This means that all the proc_handlers need to change at the same time.
> 
> However, there is an alternative way to do this that allows chunking. We
> first define the proc_handler as a void pointer (casting it where it is
> being used) [1]. Then we could do the constification by subsystem (like
> Jakub proposes). Finally we can "revert the void pointer change so we
> don't have one size fit all pointer as our proc_handler [2].
> 
> Here are some comments about the alternative:
> 1. We would need to make the first argument const in all the derived
>    proc_handlers [3] 
> 2. There would be no undefined behavior for two reasons:
>    2.1. There is no case where we change the first argument. We know
>         this because there are no compile errors after we make it const.
>    2.2. We would always go from non-const to const. This is the case
>         because all the stuff that is unchanged in non-const.
> 3. If the idea sticks, it should go into mainline as one patchset. I
>    would not like to have a void* proc_handler in a kernel release.
> 4. I think this is a "win/win" solution were the constification goes
>    through and it is divided in such a way that it is reviewable.
> 
> I would really like to hear what ppl think about this "heretic"
> alternative. @Thomas, @Luis, @Kees @Jakub?

Thanks for that alternative, I'm not a big fan though.

Besides the wonky syntax, Control Flow Integrity should trap on
this construct. Functions are called through different pointers than
their actual types which is exactly what CFI is meant to prevent.

Maybe people find it easier to review when using
"--word-diff" and/or "-U0" with git diff/show.
There is really nothing going an besides adding a few "const"s.

But if the consensus prefers this solution, I'll be happy to adopt it.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/commit/?h=jag/constfy_treewide_alternative&id=4a383503b1ea650d4e12c1f5838974e879f5aa6f
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/commit/?h=jag/constfy_treewide_alternative&id=a3be65973d27ec2933b9e81e1bec60be3a9b460d
> [3] proc_dostring, proc_dobool, proc_dointvec....


Thomas

