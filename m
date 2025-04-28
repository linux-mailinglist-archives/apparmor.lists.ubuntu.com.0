Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F1A9F934
	for <lists+apparmor@lfdr.de>; Mon, 28 Apr 2025 21:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1u9Tru-0004Ei-4l; Mon, 28 Apr 2025 19:10:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1u9Trt-0004EI-2H
 for apparmor@lists.ubuntu.com; Mon, 28 Apr 2025 19:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4B3C5C6225;
 Mon, 28 Apr 2025 19:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E886C4CEE4;
 Mon, 28 Apr 2025 19:04:57 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: John Johansen <john.johansen@canonical.com>,
	apparmor@lists.ubuntu.com
Date: Mon, 28 Apr 2025 12:04:30 -0700
Message-ID: <20250428190430.850240-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ebiggers@kernel.org;
 helo=dfw.source.kernel.org
Subject: [apparmor] [PATCH] apparmor: use SHA-256 library API instead of
	crypto_shash API
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
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Eric Biggers <ebiggers@google.com>

This user of SHA-256 does not support any other algorithm, so the
crypto_shash abstraction provides no value.  Just use the SHA-256
library API instead, which is much simpler and easier to use.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This patch is targeting the apparmor tree for 6.16.

 security/apparmor/Kconfig  |  3 +-
 security/apparmor/crypto.c | 85 ++++++--------------------------------
 2 files changed, 13 insertions(+), 75 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index 64cc3044a42ce..1e3bd44643dac 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -57,12 +57,11 @@ config SECURITY_APPARMOR_INTROSPECT_POLICY
 	  cpu is paramount.
 
 config SECURITY_APPARMOR_HASH
 	bool "Enable introspection of sha256 hashes for loaded profiles"
 	depends on SECURITY_APPARMOR_INTROSPECT_POLICY
-	select CRYPTO
-	select CRYPTO_SHA256
+	select CRYPTO_LIB_SHA256
 	default y
 	help
 	  This option selects whether introspection of loaded policy
 	  hashes is available to userspace via the apparmor
 	  filesystem. This option provides a light weight means of
diff --git a/security/apparmor/crypto.c b/security/apparmor/crypto.c
index aad486b2fca65..40e17e153f1e5 100644
--- a/security/apparmor/crypto.c
+++ b/security/apparmor/crypto.c
@@ -9,115 +9,54 @@
  * Fns to provide a checksum of policy that has been loaded this can be
  * compared to userspace policy compiles to check loaded policy is what
  * it should be.
  */
 
-#include <crypto/hash.h>
+#include <crypto/sha2.h>
 
 #include "include/apparmor.h"
 #include "include/crypto.h"
 
-static unsigned int apparmor_hash_size;
-
-static struct crypto_shash *apparmor_tfm;
-
 unsigned int aa_hash_size(void)
 {
-	return apparmor_hash_size;
+	return SHA256_DIGEST_SIZE;
 }
 
 char *aa_calc_hash(void *data, size_t len)
 {
-	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
 	char *hash;
-	int error;
-
-	if (!apparmor_tfm)
-		return NULL;
 
-	hash = kzalloc(apparmor_hash_size, GFP_KERNEL);
+	hash = kzalloc(SHA256_DIGEST_SIZE, GFP_KERNEL);
 	if (!hash)
 		return ERR_PTR(-ENOMEM);
 
-	desc->tfm = apparmor_tfm;
-
-	error = crypto_shash_init(desc);
-	if (error)
-		goto fail;
-	error = crypto_shash_update(desc, (u8 *) data, len);
-	if (error)
-		goto fail;
-	error = crypto_shash_final(desc, hash);
-	if (error)
-		goto fail;
-
+	sha256(data, len, hash);
 	return hash;
-
-fail:
-	kfree(hash);
-
-	return ERR_PTR(error);
 }
 
 int aa_calc_profile_hash(struct aa_profile *profile, u32 version, void *start,
 			 size_t len)
 {
-	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
-	int error;
+	struct sha256_state state;
 	__le32 le32_version = cpu_to_le32(version);
 
 	if (!aa_g_hash_policy)
 		return 0;
 
-	if (!apparmor_tfm)
-		return 0;
-
-	profile->hash = kzalloc(apparmor_hash_size, GFP_KERNEL);
+	profile->hash = kzalloc(SHA256_DIGEST_SIZE, GFP_KERNEL);
 	if (!profile->hash)
 		return -ENOMEM;
 
-	desc->tfm = apparmor_tfm;
-
-	error = crypto_shash_init(desc);
-	if (error)
-		goto fail;
-	error = crypto_shash_update(desc, (u8 *) &le32_version, 4);
-	if (error)
-		goto fail;
-	error = crypto_shash_update(desc, (u8 *) start, len);
-	if (error)
-		goto fail;
-	error = crypto_shash_final(desc, profile->hash);
-	if (error)
-		goto fail;
-
+	sha256_init(&state);
+	sha256_update(&state, (u8 *)&le32_version, 4);
+	sha256_update(&state, (u8 *)start, len);
+	sha256_final(&state, profile->hash);
 	return 0;
-
-fail:
-	kfree(profile->hash);
-	profile->hash = NULL;
-
-	return error;
 }
 
 static int __init init_profile_hash(void)
 {
-	struct crypto_shash *tfm;
-
-	if (!apparmor_initialized)
-		return 0;
-
-	tfm = crypto_alloc_shash("sha256", 0, 0);
-	if (IS_ERR(tfm)) {
-		int error = PTR_ERR(tfm);
-		AA_ERROR("failed to setup profile sha256 hashing: %d\n", error);
-		return error;
-	}
-	apparmor_tfm = tfm;
-	apparmor_hash_size = crypto_shash_digestsize(apparmor_tfm);
-
-	aa_info_message("AppArmor sha256 policy hashing enabled");
-
+	if (apparmor_initialized)
+		aa_info_message("AppArmor sha256 policy hashing enabled");
 	return 0;
 }
-
 late_initcall(init_profile_hash);

base-commit: 33035b665157558254b3c21c3f049fd728e72368
-- 
2.49.0


