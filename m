Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 784416A8BF9
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWb-00042Z-Ql; Thu, 02 Mar 2023 22:35:45 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYE-0005QR-18
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WXKrajJbqkbUb299wVP+wMZwzux4ve5i7i48jqTzVOM=; b=3AqsqJI8lCaM8wKT1MeU5adKVx
 yZUVeEU7kgWNaQDeh/xzFucDN4Eo2WI0oQhEQtYjLrZzlxLm/K6EgYpusTJvObavKIQq5OQ7/aGV6
 P2qhNLsnCTtYcoT2Gq6mV8hgc9pqnjQJyJPPBTxPS6+CxINAW06uYQhM/r+B2a+rTf1gZC3ORUVpl
 SFWiS9VweZ2Oedn5boZUmx5k9N3jEUYi+qIyoewiOXydRoabiTbtzYKZ6ihTguLW4MLFxkxmc2Cnx
 42fqvnsTQpDvHVmGcTxt7SbWhhrBrKOXofmIibo3iaW6acX0VORs7MqgDieHMi6lTGwAMqQNMKExv
 jE531YOQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxH-71; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:20 -0800
Message-Id: <20230302202826.776286-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 05/11] loadpin: simplify sysctls use with
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

register_sysctl_paths() is not required, we can just use
register_sysctl() with the required path specified.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 security/loadpin/loadpin.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index d73a281adf86..c971464b4ad5 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -52,12 +52,6 @@ static bool deny_reading_verity_digests;
 #endif
 
 #ifdef CONFIG_SYSCTL
-static struct ctl_path loadpin_sysctl_path[] = {
-	{ .procname = "kernel", },
-	{ .procname = "loadpin", },
-	{ }
-};
-
 static struct ctl_table loadpin_sysctl_table[] = {
 	{
 		.procname       = "enforce",
@@ -262,7 +256,7 @@ static int __init loadpin_init(void)
 		enforce ? "" : "not ");
 	parse_exclude();
 #ifdef CONFIG_SYSCTL
-	if (!register_sysctl_paths(loadpin_sysctl_path, loadpin_sysctl_table))
+	if (!register_sysctl("kernel/loadpin", loadpin_sysctl_table))
 		pr_notice("sysctl registration failed!\n");
 #endif
 	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
-- 
2.39.1


