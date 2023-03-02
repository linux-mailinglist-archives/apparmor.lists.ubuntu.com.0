Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D216A8BEE
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003tv-9w; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYD-0005QK-Ko
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+Hoy53VeqZDOL/t9ch2P6jt/ahEQQ6UBHYjZPmP5kVI=; b=Pc795+UC8GmLBrVgybdkFp55Y8
 315+vdPN8i3iM63aUS7f+Bs9nYk0siO1Smy4WXyTKX4WnXYTW317Ls+MdoHwjPtaJBBNrmkKmrRIZ
 KHYF0wDjJ9lM0uHA+Yoa5IWrsNzTN0F5G24GFM0fnpK94APmt7QI6hLGYvl6S5RM9LQx7qtZzAJ1a
 wo+xnJLrUNLJLtoY4EOjzj1p9mOCpV+GCulivVw8EcDbsAKVp7urur1hSh0wTy0UyyHkfajf7F0Yc
 u6Y+2ntmlAtdyf/PeyB09Rnt5PWHWHN3RIoFE1e6NjYSeBtRijn7YFOFzIRKFO2ougvtK7txbQ6y2
 piHryISw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxL-Ca; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:22 -0800
Message-Id: <20230302202826.776286-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 07/11] seccomp: simplify sysctls with
	register_sysctl_init()
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

register_sysctl_paths() is only needed if you have childs (directories)
with entries. Just use register_sysctl_init() as it also does the
kmemleak check for you.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 kernel/seccomp.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index cebf26445f9e..d3e584065c7f 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -2368,12 +2368,6 @@ static int seccomp_actions_logged_handler(struct ctl_table *ro_table, int write,
 	return ret;
 }
 
-static struct ctl_path seccomp_sysctl_path[] = {
-	{ .procname = "kernel", },
-	{ .procname = "seccomp", },
-	{ }
-};
-
 static struct ctl_table seccomp_sysctl_table[] = {
 	{
 		.procname	= "actions_avail",
@@ -2392,14 +2386,7 @@ static struct ctl_table seccomp_sysctl_table[] = {
 
 static int __init seccomp_sysctl_init(void)
 {
-	struct ctl_table_header *hdr;
-
-	hdr = register_sysctl_paths(seccomp_sysctl_path, seccomp_sysctl_table);
-	if (!hdr)
-		pr_warn("sysctl registration failed\n");
-	else
-		kmemleak_not_leak(hdr);
-
+	register_sysctl_init("kernel/seccomp", seccomp_sysctl_table);
 	return 0;
 }
 
-- 
2.39.1


