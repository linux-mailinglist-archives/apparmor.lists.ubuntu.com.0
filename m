Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E63726A8BFA
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:36:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWd-00045j-7d; Thu, 02 Mar 2023 22:35:47 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYE-0005Qh-Ds
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Bays9fkBFms7vhPJoOG9l9IJ7nM/VsUcupIDAJVjf80=; b=Bz1QvwzCl7hRI0wtSOphGbHAjd
 moIi7Iqb1DdJU55W/01ooclWjla3NRkjZN8KVAJTjDnBHx56pp6jV+k/vQDQHDlEEGrYiKd97L8hf
 ciLumPQjTGpY60IvmgF2Vhq4jHu1hyB1Sd5I5mYi26CzS2nijc5XMgeu7qQ/aDRk8PAiyFPygV9uX
 6zDAhjyOF+7Gd7zpEiaaYWe+ZssvpcYMJmYAdwPvLSFQdFZ7I+qjgHnnpJ25RXsLmk0te+Fc+WTrC
 nB/zhVB0QfdOUAmrW8bGzZmKaXOthdUTNfbaGIEJS/3ZbCBqtLS1H2j1MJd2kdm1R54lAjRnPe8YS
 fmBJaTKA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXS-003FxN-Eb; Thu, 02 Mar 2023 20:28:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:23 -0800
Message-Id: <20230302202826.776286-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302202826.776286-1-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 08/11] kernel: pid_namespace: simplify sysctls
	with register_sysctl()
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

register_sysctl_paths() is only required if your child (directories)
have entries and pid_namespace does not. So use register_sysctl_init()
instead where we don't care about the return value and use
register_sysctl() where we do.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 kernel/pid_namespace.c | 3 +--
 kernel/pid_sysctl.h    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 46e0d5a3f91f..b43eee07b00c 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -314,7 +314,6 @@ static struct ctl_table pid_ns_ctl_table[] = {
 	},
 	{ }
 };
-static struct ctl_path kern_path[] = { { .procname = "kernel", }, { } };
 #endif	/* CONFIG_CHECKPOINT_RESTORE */
 
 int reboot_pid_ns(struct pid_namespace *pid_ns, int cmd)
@@ -473,7 +472,7 @@ static __init int pid_namespaces_init(void)
 	pid_ns_cachep = KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACCOUNT);
 
 #ifdef CONFIG_CHECKPOINT_RESTORE
-	register_sysctl_paths(kern_path, pid_ns_ctl_table);
+	register_sysctl_init("kernel", pid_ns_ctl_table);
 #endif
 
 	register_pid_ns_sysctl_table_vm();
diff --git a/kernel/pid_sysctl.h b/kernel/pid_sysctl.h
index e22d072e1e24..d67a4d45bb42 100644
--- a/kernel/pid_sysctl.h
+++ b/kernel/pid_sysctl.h
@@ -46,10 +46,9 @@ static struct ctl_table pid_ns_ctl_table_vm[] = {
 	},
 	{ }
 };
-static struct ctl_path vm_path[] = { { .procname = "vm", }, { } };
 static inline void register_pid_ns_sysctl_table_vm(void)
 {
-	register_sysctl_paths(vm_path, pid_ns_ctl_table_vm);
+	register_sysctl("vm", pid_ns_ctl_table_vm);
 }
 #else
 static inline void initialize_memfd_noexec_scope(struct pid_namespace *ns) {}
-- 
2.39.1


