Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB88AEB0B
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 17:29:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzI4v-0005a4-RQ; Tue, 23 Apr 2024 15:29:05 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1rzB0X-0005KQ-7F
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 07:56:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-7-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1733;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Zi29e0eOxt3096ac9S5+YPXUBVokEDqe9aNQ4UAlgts=;
 b=Uw0D0YcV60peceqZ8qkDg47x1/65ErxkGJOFBWaWNhF23zLkktHPe16IBGyrNywDi8Y64Gmfl
 c6GjQOH3NApB35AQteIr4jMklYZuzfOAKo/zEOjtr7qwLtB/qod7qRv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Tue, 23 Apr 2024 15:29:04 +0000
Subject: [apparmor] [PATCH v3 07/11] ipv6/addrconf: constify ctl_table
 arguments of utility functions
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
 net/ipv6/addrconf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 9aa0900abfa1..96ab349e8ba4 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -863,7 +863,7 @@ static void addrconf_forward_change(struct net *net, __s32 newf)
 	}
 }
 
-static int addrconf_fixup_forwarding(struct ctl_table *table, int *p, int newf)
+static int addrconf_fixup_forwarding(const struct ctl_table *table, int *p, int newf)
 {
 	struct net *net;
 	int old;
@@ -931,7 +931,7 @@ static void addrconf_linkdown_change(struct net *net, __s32 newf)
 	}
 }
 
-static int addrconf_fixup_linkdown(struct ctl_table *table, int *p, int newf)
+static int addrconf_fixup_linkdown(const struct ctl_table *table, int *p, int newf)
 {
 	struct net *net;
 	int old;
@@ -6378,7 +6378,7 @@ static void addrconf_disable_change(struct net *net, __s32 newf)
 	}
 }
 
-static int addrconf_disable_ipv6(struct ctl_table *table, int *p, int newf)
+static int addrconf_disable_ipv6(const struct ctl_table *table, int *p, int newf)
 {
 	struct net *net = (struct net *)table->extra2;
 	int old;
@@ -6669,7 +6669,7 @@ void addrconf_disable_policy_idev(struct inet6_dev *idev, int val)
 }
 
 static
-int addrconf_disable_policy(struct ctl_table *ctl, int *valp, int val)
+int addrconf_disable_policy(const struct ctl_table *ctl, int *valp, int val)
 {
 	struct net *net = (struct net *)ctl->extra2;
 	struct inet6_dev *idev;

-- 
2.44.0


