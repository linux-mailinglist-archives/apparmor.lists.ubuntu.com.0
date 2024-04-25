Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 937CD8B4818
	for <lists+apparmor@lfdr.de>; Sat, 27 Apr 2024 22:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s0ozM-0002HF-Bk; Sat, 27 Apr 2024 20:49:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kuba@kernel.org>) id 1rzpXK-0003OS-3t
 for apparmor@lists.ubuntu.com; Thu, 25 Apr 2024 03:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABCB261D28;
 Thu, 25 Apr 2024 03:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C57C113CD;
 Thu, 25 Apr 2024 03:12:35 +0000 (UTC)
Date: Wed, 24 Apr 2024 20:12:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Message-ID: <20240424201234.3cc2b509@kernel.org>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kuba@kernel.org;
 helo=dfw.source.kernel.org
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
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

On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Wei=C3=9Fschuh wrote:
> The series was split from my larger series sysctl-const series [0].
> It only focusses on the proc_handlers but is an important step to be
> able to move all static definitions of ctl_table into .rodata.

Split this per subsystem, please.

