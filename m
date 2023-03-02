Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 587446A8BFE
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:36:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWi-0004GN-VB; Thu, 02 Mar 2023 22:35:53 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXppE-0007n0-18
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MXqH7HxuGUp4vr/6baVHWsjCOA7cvGA5MJGn2lYMgHY=; b=Wn18YuHvszFD95jKeWngGibMfk
 m0dkZQ/T4wh0lgQnmNyqnPNU8wiR3wNNIOFAQ/uJApiYoYiCX6W4rfGp9dazoMtM2bwoM+0WBiCNC
 Zufdri5+sD3Q341upVXgIu1muzt5P4Jq3In7jEXridJQdLINYWC/lbJZRuwwbCAPQbiRw2Gifn7PV
 5l4S/BZ9ufO6qSJiEuCDouaynQw+hbOCQIXagyqfer/Tf0CgxPlq9N55pKEXLUt0GgP9bjK+YI+um
 6CZGflx9Hg4Q3sGl2wesUq57AAJ6djo3BjCYRDNYjrv49f8LE+JOOtmq1J70LFUnI4mMWXgd2vQ2k
 0Y7scWbg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXO-Df; Thu, 02 Mar 2023 20:46:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Date: Thu,  2 Mar 2023 12:46:07 -0800
Message-Id: <20230302204612.782387-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 2/7] ipmi: simplify sysctl registration
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
register_sysctl() can do the directory creation for you so just use
that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/char/ipmi/ipmi_poweroff.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 163ec9749e55..870659d91db2 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -659,20 +659,6 @@ static struct ctl_table ipmi_table[] = {
 	{ }
 };
 
-static struct ctl_table ipmi_dir_table[] = {
-	{ .procname	= "ipmi",
-	  .mode		= 0555,
-	  .child	= ipmi_table },
-	{ }
-};
-
-static struct ctl_table ipmi_root_table[] = {
-	{ .procname	= "dev",
-	  .mode		= 0555,
-	  .child	= ipmi_dir_table },
-	{ }
-};
-
 static struct ctl_table_header *ipmi_table_header;
 #endif /* CONFIG_PROC_FS */
 
@@ -689,7 +675,7 @@ static int __init ipmi_poweroff_init(void)
 		pr_info("Power cycle is enabled\n");
 
 #ifdef CONFIG_PROC_FS
-	ipmi_table_header = register_sysctl_table(ipmi_root_table);
+	ipmi_table_header = register_sysctl("dev/ipmi", ipmi_table);
 	if (!ipmi_table_header) {
 		pr_err("Unable to register powercycle sysctl\n");
 		rv = -ENOMEM;
-- 
2.39.1


