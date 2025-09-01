Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC8B417EF
	for <lists+apparmor@lfdr.de>; Wed,  3 Sep 2025 10:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1utiVx-0006Bz-9f; Wed, 03 Sep 2025 08:06:45 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <arnd@arndb.de>) id 1ut4Rz-0006PA-ID
 for apparmor@lists.ubuntu.com; Mon, 01 Sep 2025 13:20:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id A6FC21300863;
 Mon,  1 Sep 2025 09:19:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Mon, 01 Sep 2025 09:19:57 -0400
X-ME-Sender: <xms:d521aOf13Zr5ThFIjcbvwdTTV2pPmE198UZ83DSiYsB0vWHFjqexWQ>
 <xme:d521aINZWaZx6d4hdtzCY3ReTpNDHMXU4y76p-zL9tbADaAIKToEoWjoFLEFK0nJN
 uZjL5twG3OOu4Cx9a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvvdeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
 hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhope
 gurghlihgrsheslhhisggtrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhgu
 vghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrghhuih
 htthhotheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehl
 ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigi
 druggv
X-ME-Proxy: <xmx:d521aFWUjfBNEEbfvfRsOXSgs_xr9RfZnAPjyB2Gss4aiPQVe79b8A>
 <xmx:d521aOB9sbKqEptN3OSwQ4xRQk_xYmG1ZydhuFGxz43PvXYNa2Ks1g>
 <xmx:d521aHACv2QrtY793xhqmmRyjqkD5ZVdMHOozOYGDyCY3vyLPOZbWQ>
 <xmx:d521aMbQNOQ3kj5F7xBftwDq3uTM_HtOBAYus1Iszp-XmI0rzGHioA>
 <xmx:fJ21aLW9J1hdKeVm-quvjTtf5v_yEVzzCp7GK-rbIpJMpKdzZjrbFv0P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 76793700065; Mon,  1 Sep 2025 09:19:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AngmsHLdt4H3
Date: Mon, 01 Sep 2025 15:19:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Benjamin Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>,
 "Valentin Schneider" <vschneid@redhat.com>, "Kees Cook" <kees@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 guoren <guoren@kernel.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 "Tejun Heo" <tj@kernel.org>, "Johannes Weiner" <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 "Paul Moore" <paul@paul-moore.com>, "Serge Hallyn" <sergeh@kernel.org>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "John Johansen" <john.johansen@canonical.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Kentaro Takeda" <takedakn@nttdata.co.jp>,
 "Tetsuo Handa" <penguin-kernel@i-love.sakura.ne.jp>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Brian Cain" <bcain@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>
Message-Id: <13f8ca46-92f0-47bb-a046-165402122a44@app.fastmail.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-1-53fcf5577d57@siemens-energy.com>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-1-53fcf5577d57@siemens-energy.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.137; envelope-from=arnd@arndb.de;
 helo=flow-b2-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 03 Sep 2025 08:06:38 +0000
Subject: Re: [apparmor] [PATCH v2 1/4] copy_sighand: Handle architectures
 where sizeof(unsigned long) < sizeof(u64)
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
Cc: linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 selinux@vger.kernel.org, linux-um@lists.infradead.org,
 apparmor@lists.ubuntu.com, linux-block@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Sep 1, 2025, at 15:09, Simon Schuster via B4 Relay wrote:

> This commit fixes the bug by always passing clone_flags to copy_sighand
> via their declared u64 type, invariant of architecture-dependent integer
> sizes.
>
> Fixes: b612e5df4587 ("clone3: add CLONE_CLEAR_SIGHAND")
> Cc: stable@vger.kernel.org # linux-5.5+
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

