Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 684EA6A8BFB
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:36:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWe-00049M-LC; Thu, 02 Mar 2023 22:35:48 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYF-0005Rd-9H
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Twn8MQ1Gcyzszq3QMuH8qlsxJH8SeLsz2Z/0dFs1T4k=; b=OcKK2q+bPChjV8lLm8hD8AxY/r
 0ZovvoOZyeZWiN66xALTlkMSscbzMU03wN2Numi+F46tX1ap0g9sJmBv8Vf2/tFtlHSaGnf8vY1Iq
 OWJZu6BWsKEm0gwUWsNQtpbPMSinmD3Sd4Wf+VCgJqs72vkHGe5kr0edfkTfwCjcFQxx4yTjYSN5L
 4T2Zq+MUsJ1tcSPlT3LJEBjnctee8Tn0g+giVPsQH2/KO3gYJSaf12NznKHR3fgF0pJh4TNcCwyts
 0ggEuqJC5rprNeKbjssHjNnzh4wdI8cykjd8bxvzx6Yx+oxPQ/yvC+38szw8Mk7St5joqEuNvKKXI
 3NnI8Vdw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxD-1R; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:18 -0800
Message-Id: <20230302202826.776286-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 03/11] sysctl: clarify register_sysctl_init()
	base directory order
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

Relatively new docs which I added which hinted the base directories needed
to be created before is wrong, remove that incorrect comment. This has been
hinted before by Eric twice already [0] [1], I had just not verified that
until now. Now that I've verified that updates the docs to relax the context
described.

[0] https://lkml.kernel.org/r/875ys0azt8.fsf@email.froward.int.ebiederm.org
[1] https://lkml.kernel.org/r/87ftbiud6s.fsf@x220.int.ebiederm.org
Suggested-by: Eric W. Biederman <ebiederm@xmission.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/proc/proc_sysctl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 6b9b2694d430..15d5e02f1ec0 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1440,10 +1440,7 @@ EXPORT_SYMBOL(register_sysctl);
  * register_sysctl() failing on init are extremely low, and so for both reasons
  * this function does not return any error as it is used by initialization code.
  *
- * Context: Can only be called after your respective sysctl base path has been
- * registered. So for instance, most base directories are registered early on
- * init before init levels are processed through proc_sys_init() and
- * sysctl_init_bases().
+ * Context: if your base directory does not exist it will be created for you.
  */
 void __init __register_sysctl_init(const char *path, struct ctl_table *table,
 				 const char *table_name)
-- 
2.39.1


