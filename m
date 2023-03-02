Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3F6A8BF7
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003to-7c; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYD-0005Q6-Cg
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HudEwxK4LxjEbcX61XhJokDY+tUfMk0/fd7PxDNcDCE=; b=P8dofZ6rdK4Re2PjCV19YaCRW9
 Dtf2EhtYU92txmayFoU3Ntggo+CVRTt7tPZP04nR23G2ZKUznaTDWlmNm+N41EYbpYsreJ6QWU0dd
 H7Q3JpaAzLWd2+gc9QduwlwxocaYhfEDjw/KmpIBV81LTBRG2HAVG1/44e3rJA2jJ672uR8Zh/XEF
 YOZH7e0ncbWHwEpumBjLvR5QW75JM9mdyfXylHusHgm4l+vc+I92tDx0ZElDm0lnK4iTBUUqafdwC
 EMPEhMOEe7SnM5PHQ0jzTvOvbzt7nG9/3wWlWfupXUvp4CrqR7zPfYC6VoRJBhADapyST8phjyXMD
 yOozgATg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxR-Ia; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:25 -0800
Message-Id: <20230302202826.776286-11-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 10/11] csky: simplify alignment sysctl
	registration
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

Using register_sysctl_paths() is only required if we are using
leafs with entries but all we are doing is creates leafs with
just one leaf and then entries and register_sysctl_init() works
well with that already.

The 555 permission is already retained by the new_dir() proc
sysctl directory creator.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/csky/abiv1/alignment.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/csky/abiv1/alignment.c b/arch/csky/abiv1/alignment.c
index 2df115d0e210..b60259daed1b 100644
--- a/arch/csky/abiv1/alignment.c
+++ b/arch/csky/abiv1/alignment.c
@@ -332,22 +332,9 @@ static struct ctl_table alignment_tbl[5] = {
 	{}
 };
 
-static struct ctl_table sysctl_table[2] = {
-	{
-	 .procname = "csky_alignment",
-	 .mode = 0555,
-	 .child = alignment_tbl},
-	{}
-};
-
-static struct ctl_path sysctl_path[2] = {
-	{.procname = "csky"},
-	{}
-};
-
 static int __init csky_alignment_init(void)
 {
-	register_sysctl_paths(sysctl_path, sysctl_table);
+	register_sysctl_init("csky/csky_alignment", alignment_tbl);
 	return 0;
 }
 
-- 
2.39.1


