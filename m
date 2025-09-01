Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F79B417F5
	for <lists+apparmor@lfdr.de>; Wed,  3 Sep 2025 10:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1utiVt-0006AF-1x; Wed, 03 Sep 2025 08:06:41 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1ut52A-0002xI-Kj
 for apparmor@lists.ubuntu.com; Mon, 01 Sep 2025 13:57:22 +0000
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-88432e91223so108389439f.3
 for <apparmor@lists.ubuntu.com>; Mon, 01 Sep 2025 06:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756735041; x=1757339841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmDip3pK7R1bCI3jhASK9yPIU2OeMFz+fVnQvMU5RZM=;
 b=X6C6/dP1/lEMFBoun1K1yYJT8YdPFsH23UOQ3zi4t9sQJLVl3em/9YtT5mY0ZG3GAn
 oSeNGPruSRTw0Cpl2zs6lqeoobPyA1fr0FU+Xkp9Fsla9DZKRX+8URanLk5kN2VPOvog
 GL+/Mp00XrzAu4KrZmHyXnSr4Thvlb8u2WsEWJN7BGpqHjEhhd0E7JZLDTsQOJ7ghj+C
 vI1rGLwsWhVhL7NkOokt+xRy5E3NPKemAiVRPhqj2WthFEnNyTnXcQbDULizuTvyFOGo
 0cLpoMnP/POs2TmLAey4OgVhsueHjxZzXalK8XnwEz8quUrdSgyrP90G1YuH1G4fVonk
 wBoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRDMD4epfoxs4KyAnrbV9QPsB9HJ9mY+pS7e57+vMcox3Hz2xqXsry8E97mJi+iZtqTgr/EpDXpw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz/gepPmY2hrCWsCSjFGGtnegXR9FYzLYt5KocP0zODsXov1zDz
 HheDo0g87j1kOHQAnCtM1XJ4PIaKbrGEnOc6NgGxMtPICy99zAR3+Elj2Lkje9zIWGA=
X-Gm-Gg: ASbGncs1fhjU+I4gcQre7FoEUr3nYLYwAuqFx8gVwa1vFvaf8qM5FQf+2Rhn0hJd265
 dss4gdykwE58csFW605/YaIrHK0RaO2rIim5ZhZM2NSJMVKVW/0yUae8wD7N2dac7MJPzUluqDc
 HuzUGFAa7TzvFRYME8VDonrt3VfW4lbNp7YoEd3zPRs1O2AApArDEMviATF+5VA1Q/53j9qknXb
 qATZuGs9kOtlMoUnNdv1echZoNtGskuJzOsmHjuL7Sw3BXUY/IoBe10LfLiRLh/RiBZO08QcyS5
 iJqMS4ADtHRhrpX0oqm31UZXLbJBtO3rYpTq2C6Kff8MijDWe/9lWF77lVO5nmCzchUXT03LoDm
 NJqaho7MEhWqM8N49vf5Tpc5zF8uVmaCZEwDwgLhfLabt9Ksvr4iVn3C6GTr3gMpwqn43+nU=
X-Google-Smtp-Source: AGHT+IERplwtVN17yZnlujU2FCXPzL4tbQLRpKiR8T/0IPj9zXm0u+BEIxkCUenNKZ7UyiMV2N2a4A==
X-Received: by 2002:a05:6e02:12ce:b0:3e5:4e4f:65df with SMTP id
 e9e14a558f8ab-3f400475c29mr153334635ab.9.1756735040862; 
 Mon, 01 Sep 2025 06:57:20 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50d8f361038sm2237561173.56.2025.09.01.06.57.20
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:57:20 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-88432e31bdbso374950339f.2
 for <apparmor@lists.ubuntu.com>; Mon, 01 Sep 2025 06:57:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaXe4pZknw7RlMTyWDpnGW7Ri0fRx15xZbS/uTaO0H8Od7/CRxMHOpKPFGl6D3VCmMMPZs/9qkIw==@lists.ubuntu.com
X-Received: by 2002:a05:6102:3053:b0:52a:c340:11db with SMTP id
 ada2fe7eead31-52b1bb24afcmr2206016137.27.1756734711158; Mon, 01 Sep 2025
 06:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 15:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
X-Gm-Features: Ac12FXxyJUafI_d6iF6chcUi31LuXt_e8cojxsF4wFcxCNHCg2s17r6RQqbjdms
Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
To: schuster.simon@siemens-energy.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.48;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-io1-f48.google.com
X-Mailman-Approved-At: Wed, 03 Sep 2025 08:06:39 +0000
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
 Mel Gorman <mgorman@suse.de>, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Oleg Nesterov <oleg@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 WANG Xuerui <kernel@xen0n.name>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
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

On Mon, 1 Sept 2025 at 15:10, Simon Schuster via B4 Relay
<devnull+schuster.simon.siemens-energy.com@kernel.org> wrote:
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

Fixes: c5febea0956fd387 ("fork: Pass struct kernel_clone_args into copy_thread")

>  arch/m68k/kernel/process.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

