Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20CBCD428
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7D9F-0002J2-Pb; Fri, 10 Oct 2025 13:27:05 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7D98-0002Gs-VB
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:26:59 +0000
Received: from sec2-plucky-amd64.. (176-136-128-80.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1641342AC4; 
 Fri, 10 Oct 2025 13:26:58 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 10 Oct 2025 15:25:28 +0200
Message-ID: <20251010132610.12001-2-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251010132610.12001-1-maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v6 1/5] Wire up lsm_config_self_policy and
	lsm_config_system_policy syscalls
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@I-love.SAKURA.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Add support for the new lsm_config_self_policy and
lsm_config_system_policy syscalls, providing a unified API for loading
and modifying LSM policies, for the current user and for the entire
system, respectively without requiring the LSM’s pseudo-filesystems.

Benefits:
  - Works even if the LSM pseudo-filesystem isn’t mounted or available
    (e.g. in containers)
  - Offers a logical and unified interface rather than multiple
    heterogeneous pseudo-filesystems
  - Avoids the overhead of other kernel interfaces for better efficiency

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 arch/alpha/kernel/syscalls/syscall.tbl            |  2 ++
 arch/arm/tools/syscall.tbl                        |  2 ++
 arch/m68k/kernel/syscalls/syscall.tbl             |  2 ++
 arch/microblaze/kernel/syscalls/syscall.tbl       |  2 ++
 arch/mips/kernel/syscalls/syscall_n32.tbl         |  2 ++
 arch/mips/kernel/syscalls/syscall_n64.tbl         |  2 ++
 arch/mips/kernel/syscalls/syscall_o32.tbl         |  2 ++
 arch/parisc/kernel/syscalls/syscall.tbl           |  2 ++
 arch/powerpc/kernel/syscalls/syscall.tbl          |  2 ++
 arch/s390/kernel/syscalls/syscall.tbl             |  2 ++
 arch/sh/kernel/syscalls/syscall.tbl               |  2 ++
 arch/sparc/kernel/syscalls/syscall.tbl            |  2 ++
 arch/x86/entry/syscalls/syscall_32.tbl            |  2 ++
 arch/x86/entry/syscalls/syscall_64.tbl            |  2 ++
 arch/xtensa/kernel/syscalls/syscall.tbl           |  2 ++
 include/linux/syscalls.h                          |  5 +++++
 include/uapi/asm-generic/unistd.h                 |  6 +++++-
 kernel/sys_ni.c                                   |  2 ++
 security/lsm_syscalls.c                           | 12 ++++++++++++
 tools/include/uapi/asm-generic/unistd.h           |  6 +++++-
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl |  2 ++
 21 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 2dd6340de6b4..4fc75352220d 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -507,3 +507,5 @@
 575	common	listxattrat			sys_listxattrat
 576	common	removexattrat			sys_removexattrat
 577	common	open_tree_attr			sys_open_tree_attr
+578	common	lsm_config_self_policy		sys_lsm_config_self_policy
+579	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index 27c1d5ebcd91..326483cb94a4 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -482,3 +482,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 9fe47112c586..d37364df1cd7 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -467,3 +467,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index 7b6e97828e55..9d58ebfcf967 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -473,3 +473,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index aa70e371bb54..8627b5f56280 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -406,3 +406,5 @@
 465	n32	listxattrat			sys_listxattrat
 466	n32	removexattrat			sys_removexattrat
 467	n32	open_tree_attr			sys_open_tree_attr
+468	n32	lsm_config_self_policy		sys_lsm_config_self_policy
+469	n32	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 1e8c44c7b614..813207b61f58 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -382,3 +382,5 @@
 465	n64	listxattrat			sys_listxattrat
 466	n64	removexattrat			sys_removexattrat
 467	n64	open_tree_attr			sys_open_tree_attr
+468	n64	lsm_config_self_policy		sys_lsm_config_self_policy
+469	n64	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 114a5a1a6230..9cd0946b4370 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -455,3 +455,5 @@
 465	o32	listxattrat			sys_listxattrat
 466	o32	removexattrat			sys_removexattrat
 467	o32	open_tree_attr			sys_open_tree_attr
+468	o32	lsm_config_self_policy		sys_lsm_config_self_policy
+469	o32	lsm_config_system_policy		sys_lsm_config_system_policy
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 94df3cb957e9..9db01dd55793 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -466,3 +466,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 9a084bdb8926..97714acb39ab 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -558,3 +558,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index a4569b96ef06..d2b0f14fb516 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -470,3 +470,5 @@
 465  common	listxattrat		sys_listxattrat			sys_listxattrat
 466  common	removexattrat		sys_removexattrat		sys_removexattrat
 467  common	open_tree_attr		sys_open_tree_attr		sys_open_tree_attr
+468  common	lsm_config_self_policy	sys_lsm_config_self_policy		sys_lsm_config_self_policy
+469  common	lsm_config_system_policy	sys_lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 52a7652fcff6..210d7118ce16 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -471,3 +471,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 83e45eb6c095..494417d80680 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -513,3 +513,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index ac007ea00979..36c2c538e04f 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -473,3 +473,5 @@
 465	i386	listxattrat		sys_listxattrat
 466	i386	removexattrat		sys_removexattrat
 467	i386	open_tree_attr		sys_open_tree_attr
+468	i386	lsm_config_self_policy	sys_lsm_config_self_policy
+469	i386	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index cfb5ca41e30d..7eefbccfe531 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -391,6 +391,8 @@
 465	common	listxattrat		sys_listxattrat
 466	common	removexattrat		sys_removexattrat
 467	common	open_tree_attr		sys_open_tree_attr
+468	common	lsm_config_self_policy	sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index f657a77314f8..90d86a54a952 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -438,3 +438,5 @@
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
 467	common	open_tree_attr			sys_open_tree_attr
+468	common	lsm_config_self_policy		sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index e5603cc91963..43b53fbd44be 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -988,6 +988,11 @@ asmlinkage long sys_lsm_get_self_attr(unsigned int attr, struct lsm_ctx __user *
 asmlinkage long sys_lsm_set_self_attr(unsigned int attr, struct lsm_ctx __user *ctx,
 				      u32 size, u32 flags);
 asmlinkage long sys_lsm_list_modules(u64 __user *ids, u32 __user *size, u32 flags);
+asmlinkage long sys_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
+					   u32 __user size, u32 common_flags, u32 flags);
+asmlinkage long sys_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
+					     u32 __user size, u32 common_flags u32 flags);
+
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 2892a45023af..021d0689c929 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -851,9 +851,13 @@ __SYSCALL(__NR_listxattrat, sys_listxattrat)
 __SYSCALL(__NR_removexattrat, sys_removexattrat)
 #define __NR_open_tree_attr 467
 __SYSCALL(__NR_open_tree_attr, sys_open_tree_attr)
+#define __NR_lsm_config_self_policy 468
+__SYSCALL(__NR_lsm_config_self_policy, sys_lsm_config_self_policy)
+#define __NR_lsm_config_system_policy 469
+__SYSCALL(__NR_lsm_config_system_policy, sys_lsm_config_system_policy)
 
 #undef __NR_syscalls
-#define __NR_syscalls 468
+#define __NR_syscalls 470
 
 /*
  * 32 bit systems traditionally used different
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index c00a86931f8c..3ecebcd3fbe0 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -172,6 +172,8 @@ COND_SYSCALL_COMPAT(fadvise64_64);
 COND_SYSCALL(lsm_get_self_attr);
 COND_SYSCALL(lsm_set_self_attr);
 COND_SYSCALL(lsm_list_modules);
+COND_SYSCALL(lsm_config_self_policy);
+COND_SYSCALL(lsm_config_system_policy);
 
 /* CONFIG_MMU only */
 COND_SYSCALL(swapon);
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index 8440948a690c..b02a7623dea6 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -118,3 +118,15 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
 
 	return lsm_active_cnt;
 }
+
+SYSCALL_DEFINE6(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
+		buf, u32 __user, size, u32, common_flags, u32, flags)
+{
+	return 0;
+}
+
+SYSCALL_DEFINE6(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
+		buf, u32 __user, size, u32, common_flags, u32, flags)
+{
+	return 0;
+}
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 2892a45023af..021d0689c929 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -851,9 +851,13 @@ __SYSCALL(__NR_listxattrat, sys_listxattrat)
 __SYSCALL(__NR_removexattrat, sys_removexattrat)
 #define __NR_open_tree_attr 467
 __SYSCALL(__NR_open_tree_attr, sys_open_tree_attr)
+#define __NR_lsm_config_self_policy 468
+__SYSCALL(__NR_lsm_config_self_policy, sys_lsm_config_self_policy)
+#define __NR_lsm_config_system_policy 469
+__SYSCALL(__NR_lsm_config_system_policy, sys_lsm_config_system_policy)
 
 #undef __NR_syscalls
-#define __NR_syscalls 468
+#define __NR_syscalls 470
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index cfb5ca41e30d..7eefbccfe531 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -391,6 +391,8 @@
 465	common	listxattrat		sys_listxattrat
 466	common	removexattrat		sys_removexattrat
 467	common	open_tree_attr		sys_open_tree_attr
+468	common	lsm_config_self_policy	sys_lsm_config_self_policy
+469	common	lsm_config_system_policy	sys_lsm_config_system_policy
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
-- 
2.48.1


