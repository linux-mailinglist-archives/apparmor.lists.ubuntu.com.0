Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702C6A8BED
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003tg-57; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYD-0005Px-1d
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=H2cUIW21WZq17g9O2oNgRsa778WFbjBOimotIrmyA/E=; b=nNmP8ACa3bYQFO+va5O1HA9FsY
 7uEoxbwqkYk/qt113tW2SYA9YMG3a2AHu8L7Iv3iQ0EMlgc7BBKKyksmjuEvEnZO0sSPh+srw21Ed
 92vGNiItW9t2AeJ5aH7Je//Kla0sYsQd6yw57DZXv4g5YLEqNM5fx8BqApdQ2WOzt1ETsFacehG28
 1v5ozP5b85IjoFEOhl2RVeEKNDt9QH7O2q/lI+HC3DfepUovBBCkaCjB4ahImpZOYcj2qeiGF+SSR
 bKm0l0YVBiFRo1VjmJYCVnVBvM6yvLikEV5zJHWv1DMHYb3GMsppkfKWHIApcwT0D+DZwuAqLb0xi
 hYGi9dkg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxJ-9n; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:21 -0800
Message-Id: <20230302202826.776286-7-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 06/11] yama: simplfy sysctls with
	register_sysctl()
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

register_sysctl_paths() is only need if you have directories with
entries, simplify this by using register_sysctl().

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 security/yama/yama_lsm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index 06e226166aab..90dd012b0db5 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -447,12 +447,6 @@ static int yama_dointvec_minmax(struct ctl_table *table, int write,
 
 static int max_scope = YAMA_SCOPE_NO_ATTACH;
 
-static struct ctl_path yama_sysctl_path[] = {
-	{ .procname = "kernel", },
-	{ .procname = "yama", },
-	{ }
-};
-
 static struct ctl_table yama_sysctl_table[] = {
 	{
 		.procname       = "ptrace_scope",
@@ -467,7 +461,7 @@ static struct ctl_table yama_sysctl_table[] = {
 };
 static void __init yama_init_sysctl(void)
 {
-	if (!register_sysctl_paths(yama_sysctl_path, yama_sysctl_table))
+	if (!register_sysctl("kernel/yama", yama_sysctl_table))
 		panic("Yama: sysctl registration failed.\n");
 }
 #else
-- 
2.39.1


