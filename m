Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F926A8BF6
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003uT-Ni; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXppD-0007my-Md
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TtTbUH5PQh3QevctuMber+EjZGKoMVpZ7Bm0T6SOQ6g=; b=houTJrT5MUluykuM7s1Uc148K3
 GhLI9ASwlgAnteOvFMS4cTsCdKtG82GtTT4Zcr9HncBDiN2PA/JjUo9peW7g1cx2BhR4//0t/yscv
 5IpFo0vcRylXz5s7cE4j0GUn5BKxF1V3uGlaVF0kLGgZuReSbCP/VPJVjuNYboAkpG/PiDxNyDUra
 cVS+I7dVkXOuXr7xnABfgxQLYK8/WfVd3pUiuNrtYXMwDKui183PRS9ebugKbOpGbY3Y5TBFq3kbQ
 ndzN/NkOUhn281UgUQr5UWaEuzp2/EgEHwN9hb5K87XzVbBxcVXtt+E3QheP8aaBbeZpR/TXb+Prl
 oswf6iaA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXQ-HE; Thu, 02 Mar 2023 20:46:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Date: Thu,  2 Mar 2023 12:46:08 -0800
Message-Id: <20230302204612.782387-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 3/7] hv: simplify sysctl registration
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
 drivers/hv/vmbus_drv.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index d24dd65b33d4..229353f1e9c2 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1460,15 +1460,6 @@ static struct ctl_table hv_ctl_table[] = {
 	{}
 };
 
-static struct ctl_table hv_root_table[] = {
-	{
-		.procname	= "kernel",
-		.mode		= 0555,
-		.child		= hv_ctl_table
-	},
-	{}
-};
-
 /*
  * vmbus_bus_init -Main vmbus driver initialization routine.
  *
@@ -1547,7 +1538,7 @@ static int vmbus_bus_init(void)
 		 * message recording won't be available in isolated
 		 * guests should the following registration fail.
 		 */
-		hv_ctl_table_hdr = register_sysctl_table(hv_root_table);
+		hv_ctl_table_hdr = register_sysctl("kernel", hv_ctl_table);
 		if (!hv_ctl_table_hdr)
 			pr_err("Hyper-V: sysctl table register error");
 
-- 
2.39.1


