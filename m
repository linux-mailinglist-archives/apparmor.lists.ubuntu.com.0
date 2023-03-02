Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734D6A8BE9
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWS-0003tB-QZ; Thu, 02 Mar 2023 22:35:36 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYB-0005P2-49
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=G2dvxuEO3y0hAzFqFB/q2zGbeQi/W5a2UeiLF5jk9G8=; b=dz5ZgYi0lmfMYDtwxeNMmARonM
 bGKbYQrkx2v9+PjH3cal0POP2lH7QGVLsumOWP5m4oUHoTA4tIZoVq7nwf0xv3F6KIvgMiPJMu7+X
 0o4Ko9mOYbBvD5AZjAIbXFyfIT0A4CrDKfVULMACnA2mIezbuYKLOyERcRHU1l583qQiZKfSePJCa
 2LZXJSBJ64TQkJvCq0UqFAQE0p8uE6dgsv9fOAtyT8N4BZwVtUmdFZ6E1TuDrwoCDowsHQs5L35h7
 hXz+2zE/s6nLemRtxxIDFJFMoyFobXifCqs8HoANisI/dBldTE+xmMW0dpM22OOEdTizcKnhRDGdg
 8G5txOUA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxP-Gb; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:24 -0800
Message-Id: <20230302202826.776286-10-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 09/11] fs-verity: simplify sysctls with
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

register_sysctl_paths() is only needed if your child (directories) have
entries but this does not so just use register_sysctl() so to do away
with the path specification.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/verity/signature.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index e7d3ca919a1e..b8c51ad40d3a 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -88,12 +88,6 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 #ifdef CONFIG_SYSCTL
 static struct ctl_table_header *fsverity_sysctl_header;
 
-static const struct ctl_path fsverity_sysctl_path[] = {
-	{ .procname = "fs", },
-	{ .procname = "verity", },
-	{ }
-};
-
 static struct ctl_table fsverity_sysctl_table[] = {
 	{
 		.procname       = "require_signatures",
@@ -109,8 +103,7 @@ static struct ctl_table fsverity_sysctl_table[] = {
 
 static int __init fsverity_sysctl_init(void)
 {
-	fsverity_sysctl_header = register_sysctl_paths(fsverity_sysctl_path,
-						       fsverity_sysctl_table);
+	fsverity_sysctl_header = register_sysctl("fs/verity", fsverity_sysctl_table);
 	if (!fsverity_sysctl_header) {
 		pr_err("sysctl registration failed!\n");
 		return -ENOMEM;
-- 
2.39.1


