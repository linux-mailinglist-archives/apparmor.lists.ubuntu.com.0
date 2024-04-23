Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021B8AEB0F
	for <lists+apparmor@lfdr.de>; Tue, 23 Apr 2024 17:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rzI52-0005cr-98; Tue, 23 Apr 2024 15:29:12 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linux@weissschuh.net>)
 id 1rzB0X-0005KU-At
 for apparmor@lists.ubuntu.com; Tue, 23 Apr 2024 07:56:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-10-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=4555;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ydR7obNBKRDnMbLpYk0O5xU1+ChzUePuE2B1VMOxcXg=;
 b=ILR4Nd0n0ptnfip2BSMBBu8wiCN5WTML70FZKdOlvCmeFL1Tz1zsPatlYuvHdEeskE5uykhWp
 ovqoAP1o0dGDhLLLePYQ0dpqqOG2g0I2Y7dJoidleRvVpkT/QbYbHhD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Received-SPF: pass client-ip=159.69.126.157; envelope-from=linux@weissschuh.net;
 helo=todd.t-8ch.de
X-Mailman-Approved-At: Tue, 23 Apr 2024 15:29:04 +0000
Subject: [apparmor] [PATCH v3 10/11] sysctl: constify ctl_table arguments of
 utility function
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
helper.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysctl.h |  2 +-
 kernel/sysctl.c        | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 09db2f2e6488..54fbec062772 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -237,7 +237,7 @@ extern struct ctl_table_header *register_sysctl_mount_point(const char *path);
 
 void do_sysctl_args(void);
 bool sysctl_is_alias(char *param);
-int do_proc_douintvec(struct ctl_table *table, int write,
+int do_proc_douintvec(const struct ctl_table *table, int write,
 		      void *buffer, size_t *lenp, loff_t *ppos,
 		      int (*conv)(unsigned long *lvalp,
 				  unsigned int *valp,
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index e0b917328cf9..62dd27752960 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -205,7 +205,7 @@ static int _proc_do_string(char *data, int maxlen, int write,
 	return 0;
 }
 
-static void warn_sysctl_write(struct ctl_table *table)
+static void warn_sysctl_write(const struct ctl_table *table)
 {
 	pr_warn_once("%s wrote to %s when file position was not 0!\n"
 		"This will not be supported in the future. To silence this\n"
@@ -223,7 +223,7 @@ static void warn_sysctl_write(struct ctl_table *table)
  * handlers can ignore the return value.
  */
 static bool proc_first_pos_non_zero_ignore(loff_t *ppos,
-					   struct ctl_table *table)
+					   const struct ctl_table *table)
 {
 	if (!*ppos)
 		return false;
@@ -468,7 +468,7 @@ static int do_proc_douintvec_conv(unsigned long *lvalp,
 
 static const char proc_wspace_sep[] = { ' ', '\t', '\n' };
 
-static int __do_proc_dointvec(void *tbl_data, struct ctl_table *table,
+static int __do_proc_dointvec(void *tbl_data, const struct ctl_table *table,
 		  int write, void *buffer,
 		  size_t *lenp, loff_t *ppos,
 		  int (*conv)(bool *negp, unsigned long *lvalp, int *valp,
@@ -541,7 +541,7 @@ static int __do_proc_dointvec(void *tbl_data, struct ctl_table *table,
 	return err;
 }
 
-static int do_proc_dointvec(struct ctl_table *table, int write,
+static int do_proc_dointvec(const struct ctl_table *table, int write,
 		  void *buffer, size_t *lenp, loff_t *ppos,
 		  int (*conv)(bool *negp, unsigned long *lvalp, int *valp,
 			      int write, void *data),
@@ -552,7 +552,7 @@ static int do_proc_dointvec(struct ctl_table *table, int write,
 }
 
 static int do_proc_douintvec_w(unsigned int *tbl_data,
-			       struct ctl_table *table,
+			       const struct ctl_table *table,
 			       void *buffer,
 			       size_t *lenp, loff_t *ppos,
 			       int (*conv)(unsigned long *lvalp,
@@ -639,7 +639,7 @@ static int do_proc_douintvec_r(unsigned int *tbl_data, void *buffer,
 	return err;
 }
 
-static int __do_proc_douintvec(void *tbl_data, struct ctl_table *table,
+static int __do_proc_douintvec(void *tbl_data, const struct ctl_table *table,
 			       int write, void *buffer,
 			       size_t *lenp, loff_t *ppos,
 			       int (*conv)(unsigned long *lvalp,
@@ -675,7 +675,7 @@ static int __do_proc_douintvec(void *tbl_data, struct ctl_table *table,
 	return do_proc_douintvec_r(i, buffer, lenp, ppos, conv, data);
 }
 
-int do_proc_douintvec(struct ctl_table *table, int write,
+int do_proc_douintvec(const struct ctl_table *table, int write,
 		      void *buffer, size_t *lenp, loff_t *ppos,
 		      int (*conv)(unsigned long *lvalp,
 				  unsigned int *valp,
@@ -1023,8 +1023,9 @@ static int sysrq_sysctl_handler(struct ctl_table *table, int write,
 }
 #endif
 
-static int __do_proc_doulongvec_minmax(void *data, struct ctl_table *table,
-		int write, void *buffer, size_t *lenp, loff_t *ppos,
+static int __do_proc_doulongvec_minmax(void *data,
+		const struct ctl_table *table, int write,
+		void *buffer, size_t *lenp, loff_t *ppos,
 		unsigned long convmul, unsigned long convdiv)
 {
 	unsigned long *i, *min, *max;
@@ -1096,7 +1097,7 @@ static int __do_proc_doulongvec_minmax(void *data, struct ctl_table *table,
 	return err;
 }
 
-static int do_proc_doulongvec_minmax(struct ctl_table *table, int write,
+static int do_proc_doulongvec_minmax(const struct ctl_table *table, int write,
 		void *buffer, size_t *lenp, loff_t *ppos, unsigned long convmul,
 		unsigned long convdiv)
 {

-- 
2.44.0


