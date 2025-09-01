Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 27827B417E7
	for <lists+apparmor@lfdr.de>; Wed,  3 Sep 2025 10:06:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1utiVx-0006Cd-UC; Wed, 03 Sep 2025 08:06:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ut4sz-0001vh-Ij
 for apparmor@lists.ubuntu.com; Mon, 01 Sep 2025 13:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63DB2601D6;
 Mon,  1 Sep 2025 13:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C596BC4CEF0;
 Mon,  1 Sep 2025 13:40:28 +0000 (UTC)
Date: Mon, 1 Sep 2025 15:40:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: schuster.simon@siemens-energy.com
Message-ID: <20250901-lammfell-kaninchen-c160a69e6b36@brauner>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Wed, 03 Sep 2025 08:06:38 +0000
Subject: Re: [apparmor] [PATCH v2 0/4] nios2: Add architecture support for
	clone3
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-um@lists.infradead.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Serge Hallyn <sergeh@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@redhat.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Oleg Nesterov <oleg@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 WANG Xuerui <kernel@xen0n.name>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, cgroups@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Horman <horms@kernel.org>, Andreas Larsson <andreas@gaisler.com>,
 Kees Cook <kees@kernel.org>, Rich Felker <dalias@libc.org>,
 Will Deacon <will@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-openrisc@vger.kernel.org, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-alpha@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>, Ian Rogers <irogers@google.com>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Brian Cain <bcain@kernel.org>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 Michal Simek <monstr@monstr.eu>, Alexandre Ghiti <alex@ghiti.fr>,
 netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 stable@vger.kernel.org, linux-security-module@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Sep 01, 2025 at 03:09:49PM +0200, Simon Schuster via B4 Relay wrote:
> This series adds support for the clone3 system call to the nios2
> architecture. This addresses the build-time warning "warning: clone3()

I did not expect that to happen or matter but fine.

> entry point is missing, please fix" introduced in 505d66d1abfb9
> ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro"). The implementation passes
> the relevant clone3 tests of kselftest when applied on top of
> next-20250815:
> 
> 	./run_kselftest.sh
> 	TAP version 13
> 	1..4
> 	# selftests: clone3: clone3
> 	ok 1 selftests: clone3: clone3
> 	# selftests: clone3: clone3_clear_sighand
> 	ok 2 selftests: clone3: clone3_clear_sighand
> 	# selftests: clone3: clone3_set_tid
> 	ok 3 selftests: clone3: clone3_set_tid
> 	# selftests: clone3: clone3_cap_checkpoint_restore
> 	ok 4 selftests: clone3: clone3_cap_checkpoint_restore
> 
> The series also includes a small patch to kernel/fork.c that ensures
> that clone_flags are passed correctly on architectures where unsigned
> long is insufficient to store the u64 clone_flags. It is marked as a fix
> for stable backporting.
> 
> As requested, in v2, this series now further tries to correct this type
> error throughout the whole code base. Thus, it now touches a larger
> number of subsystems and all architectures.

I've reworked copy_thread()/copy_thread_tls() a few years ago but I
don't remember why I didn't switch to a u64 for them. Probably because
only CLONE_VM and CLONE_SETTLS mattered. Thanks for doing that.

> Therefore, another test was performed for ARCH=x86_64 (as a
> representative for 64-bit architectures). Here, the series builds cleanly
> without warnings on defconfig with CONFIG_SECURITY_APPARMOR=y and
> CONFIG_SECURITY_TOMOYO=y (to compile-check the LSM-related changes).
> The build further successfully passes testing/selftests/clone3 (with the
> patch from 20241105062948.1037011-1-zhouyuhang1010@163.com to prepare
> clone3_cap_checkpoint_restore for compatibility with the newer libcap
> version on my system).
> 
> Is there any option to further preflight check this patch series via
> lkp/KernelCI/etc. for a broader test across architectures, or is this
> degree of testing sufficient to eventually get the series merged?
> 
> N.B.: The series is not checkpatch clean right now:
>  - include/linux/cred.h, include/linux/mnt_namespace.h:
>    function definition arguments without identifier name
>  - include/trace/events/task.h:
>    space prohibited after that open parenthesis
> 
> I did not fix these warnings to keep my changes minimal and reviewable,
> as the issues persist throughout the files and they were not introduced
> by me; I only followed the existing code style and just replaced the
> types. If desired, I'd be happy to make the changes in a potential v3,
> though.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---
> Changes in v2:
> - Introduce "Fixes:" and "Cc: stable@vger.kernel.org" where necessary
> - Factor out "Fixes:" when adapting the datatype of clone_flags for
>   easier backports
> - Fix additional instances where `unsigned long` clone_flags is used
> - Reword commit message to make it clearer that any 32-bit arch is
>   affected by this bug
> - Link to v1: https://lore.kernel.org/r/20250821-nios2-implement-clone3-v1-0-1bb24017376a@siemens-energy.com
> 
> ---
> Simon Schuster (4):
>       copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
>       copy_process: pass clone_flags as u64 across calltree
>       arch: copy_thread: pass clone_flags as u64
>       nios2: implement architecture-specific portion of sys_clone3
> 
>  arch/alpha/kernel/process.c       |  2 +-
>  arch/arc/kernel/process.c         |  2 +-
>  arch/arm/kernel/process.c         |  2 +-
>  arch/arm64/kernel/process.c       |  2 +-
>  arch/csky/kernel/process.c        |  2 +-
>  arch/hexagon/kernel/process.c     |  2 +-
>  arch/loongarch/kernel/process.c   |  2 +-
>  arch/m68k/kernel/process.c        |  2 +-
>  arch/microblaze/kernel/process.c  |  2 +-
>  arch/mips/kernel/process.c        |  2 +-
>  arch/nios2/include/asm/syscalls.h |  1 +
>  arch/nios2/include/asm/unistd.h   |  2 --
>  arch/nios2/kernel/entry.S         |  6 ++++++
>  arch/nios2/kernel/process.c       |  2 +-
>  arch/nios2/kernel/syscall_table.c |  1 +
>  arch/openrisc/kernel/process.c    |  2 +-
>  arch/parisc/kernel/process.c      |  2 +-
>  arch/powerpc/kernel/process.c     |  2 +-
>  arch/riscv/kernel/process.c       |  2 +-
>  arch/s390/kernel/process.c        |  2 +-
>  arch/sh/kernel/process_32.c       |  2 +-
>  arch/sparc/kernel/process_32.c    |  2 +-
>  arch/sparc/kernel/process_64.c    |  2 +-
>  arch/um/kernel/process.c          |  2 +-
>  arch/x86/include/asm/fpu/sched.h  |  2 +-
>  arch/x86/include/asm/shstk.h      |  4 ++--
>  arch/x86/kernel/fpu/core.c        |  2 +-
>  arch/x86/kernel/process.c         |  2 +-
>  arch/x86/kernel/shstk.c           |  2 +-
>  arch/xtensa/kernel/process.c      |  2 +-
>  block/blk-ioc.c                   |  2 +-
>  fs/namespace.c                    |  2 +-
>  include/linux/cgroup.h            |  4 ++--
>  include/linux/cred.h              |  2 +-
>  include/linux/iocontext.h         |  6 +++---
>  include/linux/ipc_namespace.h     |  4 ++--
>  include/linux/lsm_hook_defs.h     |  2 +-
>  include/linux/mnt_namespace.h     |  2 +-
>  include/linux/nsproxy.h           |  2 +-
>  include/linux/pid_namespace.h     |  4 ++--
>  include/linux/rseq.h              |  4 ++--
>  include/linux/sched/task.h        |  2 +-
>  include/linux/security.h          |  4 ++--
>  include/linux/sem.h               |  4 ++--
>  include/linux/time_namespace.h    |  4 ++--
>  include/linux/uprobes.h           |  4 ++--
>  include/linux/user_events.h       |  4 ++--
>  include/linux/utsname.h           |  4 ++--
>  include/net/net_namespace.h       |  4 ++--
>  include/trace/events/task.h       |  6 +++---
>  ipc/namespace.c                   |  2 +-
>  ipc/sem.c                         |  2 +-
>  kernel/cgroup/namespace.c         |  2 +-
>  kernel/cred.c                     |  2 +-
>  kernel/events/uprobes.c           |  2 +-
>  kernel/fork.c                     | 10 +++++-----
>  kernel/nsproxy.c                  |  4 ++--
>  kernel/pid_namespace.c            |  2 +-
>  kernel/sched/core.c               |  4 ++--
>  kernel/sched/fair.c               |  2 +-
>  kernel/sched/sched.h              |  4 ++--
>  kernel/time/namespace.c           |  2 +-
>  kernel/utsname.c                  |  2 +-
>  net/core/net_namespace.c          |  2 +-
>  security/apparmor/lsm.c           |  2 +-
>  security/security.c               |  2 +-
>  security/selinux/hooks.c          |  2 +-
>  security/tomoyo/tomoyo.c          |  2 +-
>  68 files changed, 95 insertions(+), 89 deletions(-)
> ---
> base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
> change-id: 20250818-nios2-implement-clone3-7f252c20860b
> 
> Best regards,
> -- 
> Simon Schuster <schuster.simon@siemens-energy.com>
> 
> 

