Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DCAC9D19
	for <lists+apparmor@lfdr.de>; Sun,  1 Jun 2025 00:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uLUL9-00047h-Bv; Sat, 31 May 2025 22:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <deller@kernel.org>) id 1uLNxM-0001vy-K0
 for apparmor@lists.ubuntu.com; Sat, 31 May 2025 15:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E349E629C3;
 Sat, 31 May 2025 15:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801B4C4CEEE;
 Sat, 31 May 2025 15:08:28 +0000 (UTC)
From: deller@kernel.org
To: linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 John Johansen <john.johansen@canonical.com>,
 linux-security-module@vger.kernel.org
Date: Sat, 31 May 2025 17:08:22 +0200
Message-ID: <20250531150822.135803-3-deller@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250531150822.135803-1-deller@kernel.org>
References: <20250531150822.135803-1-deller@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=deller@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Sat, 31 May 2025 22:06:06 +0000
Subject: [apparmor] [PATCH 2/2] apparmor: Fix unaligned memory accesses in
	KUnit test
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Helge Deller <deller@gmx.de>

The testcase triggers some unneccessary unaligned memory accesses on the
parisc architecture:
  Kernel: unaligned access to 0x12f28e27 in policy_unpack_test_init+0x180/0x374 (iir 0x0cdc1280)
  Kernel: unaligned access to 0x12f28e67 in policy_unpack_test_init+0x270/0x374 (iir 0x64dc00ce)

Use the existing helper functions put_unaligned_le32() and
put_unaligned_le16() to avoid such warnings on architectures which
prefer aligned memory accesses.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 security/apparmor/policy_unpack_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 5b2ba88ae9e2..cf18744dafe2 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -9,6 +9,8 @@
 #include "include/policy.h"
 #include "include/policy_unpack.h"
 
+#include <linux/unaligned.h>
+
 #define TEST_STRING_NAME "TEST_STRING"
 #define TEST_STRING_DATA "testing"
 #define TEST_STRING_BUF_OFFSET \
@@ -80,7 +82,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_U32_NAME) + 1;
 	strscpy(buf + 3, TEST_U32_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U32_NAME) + 1) = AA_U32;
-	*((__le32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = cpu_to_le32(TEST_U32_DATA);
+	put_unaligned_le32(TEST_U32_DATA, buf + 3 + strlen(TEST_U32_NAME) + 2);
 
 	buf = e->start + TEST_NAMED_U64_BUF_OFFSET;
 	*buf = AA_NAME;
@@ -103,7 +105,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_ARRAY_NAME) + 1;
 	strscpy(buf + 3, TEST_ARRAY_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_ARRAY_NAME) + 1) = AA_ARRAY;
-	*((__le16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = cpu_to_le16(TEST_ARRAY_SIZE);
+	put_unaligned_le16(TEST_ARRAY_SIZE, buf + 3 + strlen(TEST_ARRAY_NAME) + 2);
 
 	return e;
 }
-- 
2.47.0


