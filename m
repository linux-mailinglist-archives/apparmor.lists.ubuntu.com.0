Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE56A8BFD
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:36:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWg-0004C3-3I; Thu, 02 Mar 2023 22:35:50 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXppE-0007mz-0G
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=71lfCsPo7yFKiIAEzb7+CVhOSJuKqCJLiCYyMEP1nX8=; b=p6Yel5Hfld+1FW2EBNV5366POq
 vJPcZmFCSoBMiHWsnzV+jFaz/uDjYDZKCSMVih6k7yTXZeK0esG+XoqGZm9PRwj7XoUWz1rJk2q/E
 W+/FxaL2XVpQFgwiqiS/BLSFmuYGCiJ2RytjR/MyXk6RSB5u/Gb6pD9cbTP3FOuh/IUlWNVZg9nlC
 ae1SW5g3A+R91mMBWyCJsTKqh3vMrYlSFc91+9y4TqjqjC2hXi5zZKAl59br57tm1NS/Si0Gk8WIN
 4LHLL8b5jmRCk45aZvhVhNvYHw+agvS23gBr87drZJxFTEPUWGT0jgdOq4ItcyYm6kfRP8hHNOmNG
 e/bvQgIQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXU-Mw; Thu, 02 Mar 2023 20:46:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Date: Thu,  2 Mar 2023 12:46:10 -0800
Message-Id: <20230302204612.782387-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 5/7] sgi-xp: simplify sysctl registration
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
Cc: j.granados@samsung.com, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Although this driver is a good use case for having a directory
that is not other directories and then subdirectories with more
entries, the usage of register_sysctl_table() can recurse and
increases complexity so to avoid that just split out the
registration to each directory with its own entries.

register_sysctl_table() is a deprecated compatibility wrapper.
register_sysctl() can do the directory creation for you so just use
that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/misc/sgi-xp/xpc_main.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index b2c3c22fc13c..6da509d692bb 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -93,7 +93,7 @@ int xpc_disengage_timelimit = XPC_DISENGAGE_DEFAULT_TIMELIMIT;
 static int xpc_disengage_min_timelimit;	/* = 0 */
 static int xpc_disengage_max_timelimit = 120;
 
-static struct ctl_table xpc_sys_xpc_hb_dir[] = {
+static struct ctl_table xpc_sys_xpc_hb[] = {
 	{
 	 .procname = "hb_interval",
 	 .data = &xpc_hb_interval,
@@ -112,11 +112,7 @@ static struct ctl_table xpc_sys_xpc_hb_dir[] = {
 	 .extra2 = &xpc_hb_check_max_interval},
 	{}
 };
-static struct ctl_table xpc_sys_xpc_dir[] = {
-	{
-	 .procname = "hb",
-	 .mode = 0555,
-	 .child = xpc_sys_xpc_hb_dir},
+static struct ctl_table xpc_sys_xpc[] = {
 	{
 	 .procname = "disengage_timelimit",
 	 .data = &xpc_disengage_timelimit,
@@ -127,14 +123,9 @@ static struct ctl_table xpc_sys_xpc_dir[] = {
 	 .extra2 = &xpc_disengage_max_timelimit},
 	{}
 };
-static struct ctl_table xpc_sys_dir[] = {
-	{
-	 .procname = "xpc",
-	 .mode = 0555,
-	 .child = xpc_sys_xpc_dir},
-	{}
-};
+
 static struct ctl_table_header *xpc_sysctl;
+static struct ctl_table_header *xpc_sysctl_hb;
 
 /* non-zero if any remote partition disengage was timed out */
 int xpc_disengage_timedout;
@@ -1041,6 +1032,8 @@ xpc_do_exit(enum xp_retval reason)
 
 	if (xpc_sysctl)
 		unregister_sysctl_table(xpc_sysctl);
+	if (xpc_sysctl_hb)
+		unregister_sysctl_table(xpc_sysctl_hb);
 
 	xpc_teardown_partitions();
 
@@ -1243,7 +1236,8 @@ xpc_init(void)
 		goto out_1;
 	}
 
-	xpc_sysctl = register_sysctl_table(xpc_sys_dir);
+	xpc_sysctl = register_sysctl("xpc", xpc_sys_xpc);
+	xpc_sysctl_hb = register_sysctl("xpc/hb", xpc_sys_xpc_hb);
 
 	/*
 	 * Fill the partition reserved page with the information needed by
@@ -1308,6 +1302,8 @@ xpc_init(void)
 	(void)unregister_die_notifier(&xpc_die_notifier);
 	(void)unregister_reboot_notifier(&xpc_reboot_notifier);
 out_2:
+	if (xpc_sysctl_hb)
+		unregister_sysctl_table(xpc_sysctl_hb);
 	if (xpc_sysctl)
 		unregister_sysctl_table(xpc_sysctl);
 
-- 
2.39.1


