Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EF6A8BF3
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003uH-IF; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXppD-0007mw-68
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dtfyNVshuDQIj+dlbLKUh3FrBpHjPuB+OiDl4kHMg0w=; b=y+/KNE5d+TW3hH8L9Iql5pMuDY
 mtQ2q1980lq3pkwG/xQP1LmilCyPNzezGqF7q0DG5V7xsGEwDTYwL1JvJCDFTe/zRXH57HGHD5QW/
 O8UeGtO2rrvC7q1JiYXTkhaSl2XwOkiMf9u7Bw475hl1I50DYfKypH7bafzPo/5auQO5nAWWpyMzo
 gGUrJvFV6cuTyc3hE4lyn5hDmXOrOPtNk1IXXmXNQPVhLjpjwJ7GPmbWttNzvSv3PP/4O3nghH0oh
 Q9RypKa5XuLJaNXMpBIQPO6xY6fjA5jHIzzVMBlTxnFZ6w8BOSv37SOKMsJSXJC05q7iNhPjFZil9
 SHo+B+Mg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXY-T5; Thu, 02 Mar 2023 20:46:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Date: Thu,  2 Mar 2023 12:46:12 -0800
Message-Id: <20230302204612.782387-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 7/7] xen: simplify sysctl registration for balloon
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

register_sysctl_table() is a deprecated compatibility wrapper.
register_sysctl_init() can do the directory creation for you so just
use that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/xen/balloon.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 617a7f4f07a8..586a1673459e 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -97,24 +97,6 @@ static struct ctl_table balloon_table[] = {
 	{ }
 };
 
-static struct ctl_table balloon_root[] = {
-	{
-		.procname	= "balloon",
-		.mode		= 0555,
-		.child		= balloon_table,
-	},
-	{ }
-};
-
-static struct ctl_table xen_root[] = {
-	{
-		.procname	= "xen",
-		.mode		= 0555,
-		.child		= balloon_root,
-	},
-	{ }
-};
-
 #else
 #define xen_hotplug_unpopulated 0
 #endif
@@ -747,7 +729,7 @@ static int __init balloon_init(void)
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
 	set_online_page_callback(&xen_online_page);
 	register_memory_notifier(&xen_memory_nb);
-	register_sysctl_table(xen_root);
+	register_sysctl_init("xen/balloon", balloon_table);
 #endif
 
 	balloon_add_regions();
-- 
2.39.1


