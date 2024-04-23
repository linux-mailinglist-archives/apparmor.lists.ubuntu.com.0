Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7418AEB11
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 17:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzI4v-0005Zx-Ly; Tue, 23 Apr 2024 15:29:05 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1rzB0V-0005JZ-G7
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 07:56:03 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-1-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1205;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=D/3OJwMoANYNDnHN43YEhKh/XOzsWgZJBxcvKVpFvHo=;
 b=1RhNomBbqj6XFaD6ZYOxEHBLV6bfBHp2WGUjkt4XBn/Ez17CpMDHBnau1hMCabUBp0fIJIUhv
 lq3ewsWLz9gCbCEhY4DcLZnRRhb9Y2u6rar0aoKgOs7QrHrAJv1mc4Z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Tue, 23 Apr 2024 15:29:04 +0000
Subject: [apparmor] [PATCH v3 01/11] stackleak: don't modify ctl_table
	argument
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
Cc: Dave Chinner <david@fromorbit.com>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev,
 apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

In a future commit the proc_handlers will change to
"const struct ctl_table".
As a preparation for that adapt the logic to work with a temporary
variable, similar to how it is done in other parts of the kernel.

Fixes: 964c9dff0091 ("stackleak: Allow runtime disabling of kernel stack erasing")
Acked-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/stackleak.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/stackleak.c b/kernel/stackleak.c
index d099f3affcf1..558b9d6d28d3 100644
--- a/kernel/stackleak.c
+++ b/kernel/stackleak.c
@@ -27,10 +27,11 @@ static int stack_erasing_sysctl(struct ctl_table *table, int write,
 	int ret = 0;
 	int state = !static_branch_unlikely(&stack_erasing_bypass);
 	int prev_state = state;
+	struct ctl_table tmp = *table;
 
-	table->data = &state;
-	table->maxlen = sizeof(int);
-	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	tmp.data = &state;
+	tmp.maxlen = sizeof(int);
+	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
 	state = !!state;
 	if (ret || !write || state == prev_state)
 		return ret;

-- 
2.44.0


