Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED07D2B5C
	for <lists+apparmor@lfdr.de>; Mon, 23 Oct 2023 09:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qupOz-00053s-5j; Mon, 23 Oct 2023 07:31:05 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <dimitri.ledkov@canonical.com>)
 id 1queJU-0003aH-W9
 for apparmor@lists.ubuntu.com; Sun, 22 Oct 2023 19:40:41 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1287B3F69E
 for <apparmor@lists.ubuntu.com>; Sun, 22 Oct 2023 19:40:40 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32d9a31dc55so1014886f8f.3
 for <apparmor@lists.ubuntu.com>; Sun, 22 Oct 2023 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698003634; x=1698608434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47jpj8y9wBd7Zg0OmQJRAjuqRq+DYCKjX3d9uClSbpk=;
 b=YXu2G9OVyL5G74ZN52WqVrrIJEnjJygzeDpTyFDyPIWCwXulbW+WEAzwK6rdK0mgsB
 V5EBUGzMipukfOpO1Ame54nx4Gh/a9oEvo6z0lP2nrBeA1QdngCcdFRGf8rZzuetg7Rd
 PUS0AgL4YuPwLVtle/08fdfxQeln3QrifXab2gNAthef9CFJjlRfiOP4puaCgl/2NscW
 mZDq63MdQL0JN0R30qBM2X9igO2bNxghB6OsjkEJIp+orJT30qbquG8k7N73HE4rH83O
 alGWYkTcmWz9uMSkx/fa66KoH43kWat9bEH9n4mCt9TmzvQNAmk/haZetEQ8msPBgfGG
 OF0g==
X-Gm-Message-State: AOJu0YzTH4E+rIP3ID2vZWdsh+wsykxHLuDF70vGEhouTRCFaP0zffoW
 bUxwVeyL5GsdoM+VtDdZTK2r1lU/fSvgbhCIzcdFxAbNnqjCaSPhHo92TRdyTLXn//syWntRi04
 TVEQnQuzphf3nMaS74qobtfcKQ1mTV/aGfXxRhQ==
X-Received: by 2002:adf:ef8b:0:b0:32d:96a7:9551 with SMTP id
 d11-20020adfef8b000000b0032d96a79551mr4967359wro.36.1698003634505; 
 Sun, 22 Oct 2023 12:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpLdRBIeVWYwo3xURbI5pzw5n3xFTx5Mo5MIsfkN8aLsxEaxi5atFcCBTp7YwPa6dq+CuLMg==
X-Received: by 2002:adf:ef8b:0:b0:32d:96a7:9551 with SMTP id
 d11-20020adfef8b000000b0032d96a79551mr4967354wro.36.1698003634173; 
 Sun, 22 Oct 2023 12:40:34 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adff792000000b0030647449730sm6208438wrp.74.2023.10.22.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 12:40:33 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Sun, 22 Oct 2023 20:40:26 +0100
Message-Id: <20231022194026.313584-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Oct 2023 07:30:18 +0000
Subject: [apparmor] [PATCH] apparmor: switch SECURITY_APPARMOR_HASH from
	sha1 to sha256
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

sha1 is insecure and has colisions, thus it is not useful for even
lightweight policy hash checks. Switch to sha256, which on modern
hardware is fast enough.

Separately as per NIST Policy on Hash Functions, sha1 usage must be
withdrawn by 2030. This config option currently is one of many that
holds up sha1 usage.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 security/apparmor/Kconfig      | 12 ++++++------
 security/apparmor/apparmorfs.c | 16 ++++++++--------
 security/apparmor/crypto.c     |  6 +++---
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index e0d1dd0a19..64cc3044a4 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -57,10 +57,10 @@ config SECURITY_APPARMOR_INTROSPECT_POLICY
 	  cpu is paramount.
 
 config SECURITY_APPARMOR_HASH
-	bool "Enable introspection of sha1 hashes for loaded profiles"
+	bool "Enable introspection of sha256 hashes for loaded profiles"
 	depends on SECURITY_APPARMOR_INTROSPECT_POLICY
 	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_SHA256
 	default y
 	help
 	  This option selects whether introspection of loaded policy
@@ -74,10 +74,10 @@ config SECURITY_APPARMOR_HASH_DEFAULT
        depends on SECURITY_APPARMOR_HASH
        default y
        help
-         This option selects whether sha1 hashing of loaded policy
-	 is enabled by default. The generation of sha1 hashes for
-	 loaded policy provide system administrators a quick way
-	 to verify that policy in the kernel matches what is expected,
+	 This option selects whether sha256 hashing of loaded policy
+	 is enabled by default. The generation of sha256 hashes for
+	 loaded policy provide system administrators a quick way to
+	 verify that policy in the kernel matches what is expected,
 	 however it can slow down policy load on some devices. In
 	 these cases policy hashing can be disabled by default and
 	 enabled only if needed.
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index a608a6bd76..082581397d 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1474,7 +1474,7 @@ int __aa_fs_create_rawdata(struct aa_ns *ns, struct aa_loaddata *rawdata)
 	rawdata->dents[AAFS_LOADDATA_REVISION] = dent;
 
 	if (aa_g_hash_policy) {
-		dent = aafs_create_file("sha1", S_IFREG | 0444, dir,
+		dent = aafs_create_file("sha256", S_IFREG | 0444, dir,
 					      rawdata, &seq_rawdata_hash_fops);
 		if (IS_ERR(dent))
 			goto fail;
@@ -1644,11 +1644,11 @@ static const char *rawdata_get_link_base(struct dentry *dentry,
 	return target;
 }
 
-static const char *rawdata_get_link_sha1(struct dentry *dentry,
+static const char *rawdata_get_link_sha256(struct dentry *dentry,
 					 struct inode *inode,
 					 struct delayed_call *done)
 {
-	return rawdata_get_link_base(dentry, inode, done, "sha1");
+	return rawdata_get_link_base(dentry, inode, done, "sha256");
 }
 
 static const char *rawdata_get_link_abi(struct dentry *dentry,
@@ -1665,8 +1665,8 @@ static const char *rawdata_get_link_data(struct dentry *dentry,
 	return rawdata_get_link_base(dentry, inode, done, "raw_data");
 }
 
-static const struct inode_operations rawdata_link_sha1_iops = {
-	.get_link	= rawdata_get_link_sha1,
+static const struct inode_operations rawdata_link_sha256_iops = {
+	.get_link	= rawdata_get_link_sha256,
 };
 
 static const struct inode_operations rawdata_link_abi_iops = {
@@ -1739,7 +1739,7 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent)
 	profile->dents[AAFS_PROF_ATTACH] = dent;
 
 	if (profile->hash) {
-		dent = create_profile_file(dir, "sha1", profile,
+		dent = create_profile_file(dir, "sha256", profile,
 					   &seq_profile_hash_fops);
 		if (IS_ERR(dent))
 			goto fail;
@@ -1749,9 +1749,9 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent)
 #ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
 	if (profile->rawdata) {
 		if (aa_g_hash_policy) {
-			dent = aafs_create("raw_sha1", S_IFLNK | 0444, dir,
+			dent = aafs_create("raw_sha256", S_IFLNK | 0444, dir,
 					   profile->label.proxy, NULL, NULL,
-					   &rawdata_link_sha1_iops);
+					   &rawdata_link_sha256_iops);
 			if (IS_ERR(dent))
 				goto fail;
 			aa_get_proxy(profile->label.proxy);
diff --git a/security/apparmor/crypto.c b/security/apparmor/crypto.c
index 6724e2ff6d..aad486b2fc 100644
--- a/security/apparmor/crypto.c
+++ b/security/apparmor/crypto.c
@@ -106,16 +106,16 @@ static int __init init_profile_hash(void)
 	if (!apparmor_initialized)
 		return 0;
 
-	tfm = crypto_alloc_shash("sha1", 0, 0);
+	tfm = crypto_alloc_shash("sha256", 0, 0);
 	if (IS_ERR(tfm)) {
 		int error = PTR_ERR(tfm);
-		AA_ERROR("failed to setup profile sha1 hashing: %d\n", error);
+		AA_ERROR("failed to setup profile sha256 hashing: %d\n", error);
 		return error;
 	}
 	apparmor_tfm = tfm;
 	apparmor_hash_size = crypto_shash_digestsize(apparmor_tfm);
 
-	aa_info_message("AppArmor sha1 policy hashing enabled");
+	aa_info_message("AppArmor sha256 policy hashing enabled");
 
 	return 0;
 }
-- 
2.34.1


