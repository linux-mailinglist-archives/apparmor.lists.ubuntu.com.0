Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6F8AEB08
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 17:29:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzI4x-0005ay-NR; Tue, 23 Apr 2024 15:29:07 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1rzB0X-0005KW-D1
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 07:56:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-9-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1292;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=odMbVtXputh1B0wvO7gtV7cKLTLD5qqVWgyPwr4fby8=;
 b=HGS1kdZAsaJZKpg4r6Gy7F4xJbcNv2yq+KS0wT9dr5GDwl8/cNzV2zronax9Lbe4GmE5G3NOC
 F+TpiwFZuPaBZHHRsyNSIMTh2HPxXZ0cjduuz09UV7awWr9POrydgh8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Tue, 23 Apr 2024 15:29:04 +0000
Subject: [apparmor] [PATCH v3 09/11] ipvs: constify ctl_table arguments of
 utility functions
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
 net/netfilter/ipvs/ip_vs_ctl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index 143a341bbc0a..689ac521ea2d 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -1924,7 +1924,8 @@ proc_do_sync_ports(struct ctl_table *table, int write,
 	return rc;
 }
 
-static int ipvs_proc_est_cpumask_set(struct ctl_table *table, void *buffer)
+static int ipvs_proc_est_cpumask_set(const struct ctl_table *table,
+				     void *buffer)
 {
 	struct netns_ipvs *ipvs = table->extra2;
 	cpumask_var_t *valp = table->data;
@@ -1962,8 +1963,8 @@ static int ipvs_proc_est_cpumask_set(struct ctl_table *table, void *buffer)
 	return ret;
 }
 
-static int ipvs_proc_est_cpumask_get(struct ctl_table *table, void *buffer,
-				     size_t size)
+static int ipvs_proc_est_cpumask_get(const struct ctl_table *table,
+				     void *buffer, size_t size)
 {
 	struct netns_ipvs *ipvs = table->extra2;
 	cpumask_var_t *valp = table->data;

-- 
2.44.0


