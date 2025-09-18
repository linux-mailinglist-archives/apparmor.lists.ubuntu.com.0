Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E445B8CED6
	for <lists+apparmor@lfdr.de>; Sat, 20 Sep 2025 20:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v02Md-0000uE-2s; Sat, 20 Sep 2025 18:31:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <pjw@kernel.org>) id 1uzH1w-0002l1-Cx
 for apparmor@lists.ubuntu.com; Thu, 18 Sep 2025 15:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3015643217;
 Thu, 18 Sep 2025 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77DBC4CEE7;
 Thu, 18 Sep 2025 15:51:10 +0000 (UTC)
Date: Thu, 18 Sep 2025 09:51:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Simon Schuster <schuster.simon@siemens-energy.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
Message-ID: <ffb22e54-6b7d-5b88-4217-e67870051c6e@kernel.org>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=172.234.252.31; envelope-from=pjw@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Sat, 20 Sep 2025 18:31:13 +0000
Subject: Re: [apparmor] [PATCH v2 3/4] arch: copy_thread: pass clone_flags
	as u64
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
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Serge Hallyn <sergeh@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@redhat.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Oleg Nesterov <oleg@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 WANG Xuerui <kernel@xen0n.name>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 =?ISO-8859-15?Q?Michal_Koutn=FD?= <mkoutny@suse.com>,
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
 linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 1 Sep 2025, Simon Schuster via B4 Relay wrote:

> From: Simon Schuster <schuster.simon@siemens-energy.com>
> 
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
> 
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
> 
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>

Acked-by: Paul Walmsley <pjw@kernel.org> # for RISC-V

Thanks!


- Paul

