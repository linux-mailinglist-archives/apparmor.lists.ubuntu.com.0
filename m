Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF6AEE62C
	for <lists+apparmor@lfdr.de>; Mon, 30 Jun 2025 19:57:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uWIkf-00018f-W7; Mon, 30 Jun 2025 17:57:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1uWIke-00018X-6W
 for apparmor@lists.ubuntu.com; Mon, 30 Jun 2025 17:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 51988A53598;
 Mon, 30 Jun 2025 17:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0854C4CEE3;
 Mon, 30 Jun 2025 17:49:49 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Date: Mon, 30 Jun 2025 10:48:05 -0700
Message-ID: <20250630174805.59010-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91; envelope-from=ebiggers@kernel.org;
 helo=nyc.source.kernel.org
Subject: [apparmor] [PATCH v2] apparmor: use SHA-256 library API instead of
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
Cc: Eric Biggers <ebiggers@kernel.org>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This user of SHA-256 does not support any other algorithm, so the
crypto_shash abstraction provides no value.  Just use the SHA-256
library API instead, which is much simpler and easier to use.

Acked-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This is the slightly revised version of
https://lore.kernel.org/r/20250428190430.850240-1-ebiggers@kernel.org/
that I'm planning to apply to libcrypto-next for 6.17 to avoid a silent
conflict with the sha256_state => sha256_ctx rename, as per the
discussion in that thread.

You can also get this patch and its dependencies from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git apparmor-sha256-lib-v2

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
index aad486b2fca65..227d47c149074 100644
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
+	struct sha256_ctx sctx;
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
+	sha256_init(&sctx);
+	sha256_update(&sctx, (u8 *)&le32_version, 4);
+	sha256_update(&sctx, (u8 *)start, len);
+	sha256_final(&sctx, profile->hash);
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

base-commit: 1f7eb3c393ab9e56b5746f5fd31796a73bdd4d48
-- 
2.50.0


