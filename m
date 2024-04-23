Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 002498AEB10
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 17:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzI4x-0005aW-BN; Tue, 23 Apr 2024 15:29:07 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1rzB0W-0005K0-DH
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 07:56:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-3-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1138;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rorPfneHsH4rUwSDhKhni5qatzGJBaNeOV3jbM8lXHw=;
 b=uf+pHLZXXpo1yHHJ2Z13M1e5OT7jsu5lvkviloIZv10UAQiz7g1qEzlA2Tlm9z/kgvmk0wE7S
 t+OfiZGT2B0DcKcd55qz3Jc+6I9uA8iEvRoTSo4pFJmvocUaelGw1Ie
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Tue, 23 Apr 2024 15:29:04 +0000
Subject: [apparmor] [PATCH v3 03/11] hugetlb: constify ctl_table arguments
 of utility functions
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

In a future commit the proc_handlers themselves will change to
"const struct ctl_table". As a preparation for that adapt the internal
helpers.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3b7d5ddc32ad..8d12ce63a439 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4911,7 +4911,7 @@ static unsigned int allowed_mems_nr(struct hstate *h)
 }
 
 #ifdef CONFIG_SYSCTL
-static int proc_hugetlb_doulongvec_minmax(struct ctl_table *table, int write,
+static int proc_hugetlb_doulongvec_minmax(const struct ctl_table *table, int write,
 					  void *buffer, size_t *length,
 					  loff_t *ppos, unsigned long *out)
 {
@@ -4928,7 +4928,7 @@ static int proc_hugetlb_doulongvec_minmax(struct ctl_table *table, int write,
 }
 
 static int hugetlb_sysctl_handler_common(bool obey_mempolicy,
-			 struct ctl_table *table, int write,
+			 const struct ctl_table *table, int write,
 			 void *buffer, size_t *length, loff_t *ppos)
 {
 	struct hstate *h = &default_hstate;

-- 
2.44.0


