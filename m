Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A819B0CDA7
	for <lists+apparmor@lfdr.de>; Tue, 22 Jul 2025 01:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1udzlN-0001IS-4F; Mon, 21 Jul 2025 23:17:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <nathan@kernel.org>) id 1udzlL-0001IB-Fo
 for apparmor@lists.ubuntu.com; Mon, 21 Jul 2025 23:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4021E5C635C;
 Mon, 21 Jul 2025 23:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE8CC4CEED;
 Mon, 21 Jul 2025 23:10:43 +0000 (UTC)
Date: Mon, 21 Jul 2025 16:10:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250721231041.GA1015606@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=139.178.84.217; envelope-from=nathan@kernel.org;
 helo=dfw.source.kernel.org
Subject: [apparmor] -Wformat-invalid-specifier after 88fec3526e84 in -next
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
Cc: linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi John,

After commit 88fec3526e84 ("apparmor: make sure unix socket labeling is
correctly updated.") in -next, I am seeing some warnings from clang when
building arm64 allmodconfig with LTO enabled. This can be more simply
reproduced on top of defconfig:

  $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 mrproper defconfig

  $ scripts/config \
      -d LTO_NONE \
      -e LTO_CLANG_THIN \
      -e SECURITY_APPARMOR \
      -e SECURITY_APPARMOR_DEBUG

  $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 olddefconfig security/apparmor/lsm.o
  security/apparmor/lsm.c:1206:2: warning: invalid conversion specifier '0' [-Wformat-invalid-specifier]
   1206 |         AA_BUG(rcu_access_pointer(new_ctx->label));
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  security/apparmor/include/lib.h:56:3: note: expanded from macro 'AA_BUG'
     56 |                 AA_BUG_FMT((X), "" args);                                   \
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~
  security/apparmor/include/lib.h:61:34: note: expanded from macro 'AA_BUG_FMT'
     61 |         WARN((X), "AppArmor WARN %s: (" #X "): " fmt, __func__, ##args)
        |                                         ^~
  <scratch space>:2:1144: note: expanded from here
      2 | "(({ typeof(*(new_ctx->label)) *__UNIQUE_ID_rcu1155 = (typeof(*(new_ctx->label)) *)({ do { __attribute__((__noreturn__)) extern void __compiletime_assert_1156(void) __attribute__((__error__(\"Unsupported access size for {READ,WRITE}_ONCE().\"))); ..."
  ...
  include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
    134 |                 __WARN_printf(TAINT_WARN, format);                      \
        |                                           ^~~~~~
  include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
    106 |                 __warn_printk(arg);                                     \
        |                               ^~~

Ultimately, rcu_access_pointer() expands to __READ_ONCE(), which arm64
specifically defines for CONFIG_LTO using some inline asm expressions,
see commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire
when CONFIG_LTO=y"). Within those asm literals are % characters for the
asm templates, which are ultimately interpreted as format specifiers
when they get expanded by the preprocessors, hence the warning.

There is nothing technically wrong here, although if this were to ever
trigger, it would probably look quite ugly in the kernel log because of
how long the string literal expansion of __READ_ONCE would be. It is
possible to shut this warning up in a similar manner to the existing GCC
pragma if necessary but I was unsure if that would be preferred off bat,
hence just the report at first.

Cheers,
Nathan

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 2e7c2c282f3a..9dfbc6dc8859 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -114,10 +114,10 @@
 #define __diag_str(s)		__diag_str1(s)
 #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
 
-#define __diag_clang_13(s)	__diag(s)
+#define __diag_clang_all(s)	__diag(s)
 
 #define __diag_ignore_all(option, comment) \
-	__diag_clang(13, ignore, option)
+	__diag_clang(all, ignore, option)
 
 /*
  * clang has horrible behavior with "g" or "rm" constraints for asm
diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/lib.h
index 444197075fd6..7f2c649dc7dd 100644
--- a/security/apparmor/include/lib.h
+++ b/security/apparmor/include/lib.h
@@ -53,7 +53,11 @@ do {									\
 #define AA_BUG(X, args...)						    \
 	do {								    \
 		_Pragma("GCC diagnostic ignored \"-Wformat-zero-length\""); \
+		__diag_push();						    \
+		__diag_ignore(clang, all, "-Wformat-invalid-specifier",	    \
+			      "May be called with asm that has %");	    \
 		AA_BUG_FMT((X), "" args);				    \
+		__diag_pop();						    \
 		_Pragma("GCC diagnostic warning \"-Wformat-zero-length\""); \
 	} while (0)
 #ifdef CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS

