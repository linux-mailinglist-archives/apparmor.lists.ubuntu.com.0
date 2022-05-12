Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005D5253C2
	for <lists+apparmor@lfdr.de>; Thu, 12 May 2022 19:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1npCiu-0003gd-UR; Thu, 12 May 2022 17:35:36 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1npCis-0003bl-8z
 for apparmor@lists.ubuntu.com; Thu, 12 May 2022 17:35:34 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 12DF93F802
 for <apparmor@lists.ubuntu.com>; Thu, 12 May 2022 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1652376934;
 bh=F62PCHKKCZUx2eLwlV8rbk7l0Rb3E+AkNywcnyt8nRs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Sim5/x2eY75eIl2IwjzUVtvjFbn6uw1/F6fRfJPZWq7UjbDHvZm8Rr+Upx38C3WRy
 XiJHvjj9RiWucyBsREYXlWxHPsMtxHwtLEojW3MaEqhTxqjREB3TXc140CTph0RLzH
 QFRhC2rD+0AdyKX1Jd0XI+lcq1n7nLtrMaOPiY+AxHg9wufgj0kQ2OgUige5pFu9IX
 hUcfmIdGAGFJ/KHhF0ihVesPYvgGMwTRmqEHOgoyb7YSIKHcdjsuOdyzy5edOXFDSi
 aa3aTnWTKp8MtykDV/GHdWvdxJZ5GDN6T2399zhu6Oo6IvA6F7FHWZfY7SvyxPASOG
 qEM3mlrrX1sYg==
Received: by mail-qk1-f198.google.com with SMTP id
 m1-20020a05620a24c100b006a060e0e241so4607630qkn.17
 for <apparmor@lists.ubuntu.com>; Thu, 12 May 2022 10:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F62PCHKKCZUx2eLwlV8rbk7l0Rb3E+AkNywcnyt8nRs=;
 b=uFV+8lhXBMd6GiT+ZrXilST7wreJPQo/2VwAlfaVpLAiNnsa+LBkXT2KkL9vgzZa8Z
 IN79jxoxcKy9sTSxEFbNftxI8c6WQPxMDTxJTMGz3wipY8HsEIknBz4Bnm/MYXL9m8gk
 WkjhXdnUAOvQ9hH/I5Vkzt3yv4pSnygzGe5aqHUOIV+uX/ZZmyHg3XJtWlN9J2koDeWA
 zVjlZN7fA3B7FF4ZLd5MByLtnBQdwkqtbm29rASqbRKEZBeVXhdxMx3yWFymXb8cvaZO
 l8esBtKAWX6eu3o2HyH4Rzd1zpvjIuqpADy5DD0v2+8Jh+9MaA3Po7P71i2+mtwi3cgs
 UAEg==
X-Gm-Message-State: AOAM530uAur7KyPol06qLXgrtFf5A/8Ppe4yaXYKZYKAHAKgksxIpO+O
 MTg78H9wRyfmgl8KUVDcuYXHWGIGl8bvGIpuqlQWZSkyFNUP5Rg34+Y6yEEVGshPPq/0WM/0R1C
 l7PI7wpfAjT/4Vn2+/miMGYwMXFCJA25ItXRVqQ==
X-Received: by 2002:a05:622a:216:b0:2f3:eff8:f83 with SMTP id
 b22-20020a05622a021600b002f3eff80f83mr884224qtx.489.1652376932889; 
 Thu, 12 May 2022 10:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/VYaI9/9o1s+Gl+N1KELasrsO7anhZ7so43G9QsGwimcwr57l9BKdypXeZzcMDXsikWDcfQ==
X-Received: by 2002:a05:622a:216:b0:2f3:eff8:f83 with SMTP id
 b22-20020a05622a021600b002f3eff80f83mr884203qtx.489.1652376932540; 
 Thu, 12 May 2022 10:35:32 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a205700b0069fc13ce1ffsm45159qka.48.2022.05.12.10.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:35:32 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 12 May 2022 12:35:20 -0500
Message-Id: <20220512173520.855917-1-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: use zstd compression for profile data
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This changes the algorithm used by apparmor to compress profile data
from zlib to zstd, using the new zstd API introduced in 5.16.

Zstd provides a larger range of compression levels than zlib and
significantly better performance at the default level (for a relatively
small increase in compressed size).

At the default compression levels, zstd's execution time was 16% that
of zlib with a size of 111%. At maximum compression levels, zstd's
execution time was 187% that of zlib with a size of 88%. This gives
users options for either improving performance or decreasing memory
usage over zlib.

Performance testing was done in the kernel against the default set of
profiles loaded by a fresh install of Ubuntu jammy desktop.


Signed-off-by: Jon Tourville <jon.tourville@canonical.com>
---
 security/apparmor/Kconfig         |   4 +-
 security/apparmor/apparmorfs.c    |  63 ++++++++----------
 security/apparmor/lsm.c           |  10 +--
 security/apparmor/policy_unpack.c | 104 +++++++++++-------------------
 4 files changed, 70 insertions(+), 111 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index 348ed6cfa08a..522546d52c4d 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -6,8 +6,8 @@ config SECURITY_APPARMOR
 	select SECURITY_PATH
 	select SECURITYFS
 	select SECURITY_NETWORK
-	select ZLIB_INFLATE
-	select ZLIB_DEFLATE
+	select ZSTD_COMPRESS
+	select ZSTD_DECOMPRESS
 	default n
 	help
 	  This enables the AppArmor security module.
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 0797edb2fb3d..bb6cb1abf0d3 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -21,7 +21,7 @@
 #include <linux/fs.h>
 #include <linux/fs_context.h>
 #include <linux/poll.h>
-#include <linux/zlib.h>
+#include <linux/zstd.h>
 #include <uapi/linux/major.h>
 #include <uapi/linux/magic.h>
 
@@ -1292,46 +1292,35 @@ SEQ_RAWDATA_FOPS(revision);
 SEQ_RAWDATA_FOPS(hash);
 SEQ_RAWDATA_FOPS(compressed_size);
 
-static int deflate_decompress(char *src, size_t slen, char *dst, size_t dlen)
+static int decompress_zstd(const char *src, size_t slen, char *dst, size_t dlen)
 {
-	int error;
-	struct z_stream_s strm;
+	const size_t wksp_len = zstd_dctx_workspace_bound();
+	zstd_dctx *ctx;
+	void *wksp;
+	size_t out_len;
+	int ret = 0;
 
-	if (aa_g_rawdata_compression_level == 0) {
-		if (dlen < slen)
-			return -EINVAL;
-		memcpy(dst, src, slen);
-		return 0;
+	wksp = kvzalloc(wksp_len, GFP_KERNEL);
+	if (!wksp) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
-	memset(&strm, 0, sizeof(strm));
-
-	strm.workspace = kvzalloc(zlib_inflate_workspacesize(), GFP_KERNEL);
-	if (!strm.workspace)
-		return -ENOMEM;
-
-	strm.next_in = src;
-	strm.avail_in = slen;
-
-	error = zlib_inflateInit(&strm);
-	if (error != Z_OK) {
-		error = -ENOMEM;
-		goto fail_inflate_init;
+	ctx = zstd_init_dctx(wksp, wksp_len);
+	if (!ctx) {
+		ret = -EINVAL;
+		goto cleanup;
 	}
 
-	strm.next_out = dst;
-	strm.avail_out = dlen;
-
-	error = zlib_inflate(&strm, Z_FINISH);
-	if (error != Z_STREAM_END)
-		error = -EINVAL;
-	else
-		error = 0;
+	out_len = zstd_decompress_dctx(ctx, dst, dlen, src, slen);
+	if (zstd_is_error(out_len)) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
 
-	zlib_inflateEnd(&strm);
-fail_inflate_init:
-	kvfree(strm.workspace);
-	return error;
+cleanup:
+	kvfree(wksp);
+	return ret;
 }
 
 static ssize_t rawdata_read(struct file *file, char __user *buf, size_t size,
@@ -1373,9 +1362,9 @@ static int rawdata_open(struct inode *inode, struct file *file)
 
 	private->loaddata = loaddata;
 
-	error = deflate_decompress(loaddata->data, loaddata->compressed_size,
-				   RAWDATA_F_DATA_BUF(private),
-				   loaddata->size);
+	error = decompress_zstd(loaddata->data, loaddata->compressed_size,
+				RAWDATA_F_DATA_BUF(private),
+				loaddata->size);
 	if (error)
 		goto fail_decompress;
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 0d6585056f3d..715c10fe6d3e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -21,7 +21,7 @@
 #include <linux/user_namespace.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/netfilter_ipv6.h>
-#include <linux/zlib.h>
+#include <linux/zstd.h>
 #include <net/sock.h>
 #include <uapi/linux/mount.h>
 
@@ -1331,7 +1331,7 @@ module_param_named(hash_policy, aa_g_hash_policy, aabool, S_IRUSR | S_IWUSR);
 #endif
 
 /* policy loaddata compression level */
-int aa_g_rawdata_compression_level = Z_DEFAULT_COMPRESSION;
+int aa_g_rawdata_compression_level = ZSTD_CLEVEL_DEFAULT;
 module_param_named(rawdata_compression_level, aa_g_rawdata_compression_level,
 		   aacompressionlevel, 0400);
 
@@ -1513,9 +1513,9 @@ static int param_set_aacompressionlevel(const char *val,
 	error = param_set_int(val, kp);
 
 	aa_g_rawdata_compression_level = clamp(aa_g_rawdata_compression_level,
-					       Z_NO_COMPRESSION,
-					       Z_BEST_COMPRESSION);
-	pr_info("AppArmor: policy rawdata compression level set to %u\n",
+					       zstd_min_clevel(),
+					       zstd_max_clevel());
+	pr_info("AppArmor: policy rawdata compression level set to %d\n",
 		aa_g_rawdata_compression_level);
 
 	return error;
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 0acca6f2a93f..a974d02e49e6 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -16,7 +16,7 @@
 #include <asm/unaligned.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
-#include <linux/zlib.h>
+#include <linux/zstd.h>
 
 #include "include/apparmor.h"
 #include "include/audit.h"
@@ -1049,85 +1049,55 @@ struct aa_load_ent *aa_load_ent_alloc(void)
 	return ent;
 }
 
-static int deflate_compress(const char *src, size_t slen, char **dst,
-			    size_t *dlen)
+static int compress_zstd(const char *src, size_t slen, char **dst, size_t *dlen)
 {
-	int error;
-	struct z_stream_s strm;
-	void *stgbuf, *dstbuf;
-	size_t stglen = deflateBound(slen);
-
-	memset(&strm, 0, sizeof(strm));
-
-	if (stglen < slen)
-		return -EFBIG;
-
-	strm.workspace = kvzalloc(zlib_deflate_workspacesize(MAX_WBITS,
-							     MAX_MEM_LEVEL),
-				  GFP_KERNEL);
-	if (!strm.workspace)
-		return -ENOMEM;
-
-	error = zlib_deflateInit(&strm, aa_g_rawdata_compression_level);
-	if (error != Z_OK) {
-		error = -ENOMEM;
-		goto fail_deflate_init;
+	const zstd_parameters params =
+		zstd_get_params(aa_g_rawdata_compression_level, slen);
+	const size_t wksp_len = zstd_cctx_workspace_bound(&params.cParams);
+	void *wksp = NULL;
+	zstd_cctx *ctx = NULL;
+	size_t out_len = zstd_compress_bound(slen);
+	void *out = NULL;
+	int ret = 0;
+
+	out = kvzalloc(out_len, GFP_KERNEL);
+	if (!out) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
-	stgbuf = kvzalloc(stglen, GFP_KERNEL);
-	if (!stgbuf) {
-		error = -ENOMEM;
-		goto fail_stg_alloc;
+	wksp = kvzalloc(wksp_len, GFP_KERNEL);
+	if (!wksp) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
-	strm.next_in = src;
-	strm.avail_in = slen;
-	strm.next_out = stgbuf;
-	strm.avail_out = stglen;
-
-	error = zlib_deflate(&strm, Z_FINISH);
-	if (error != Z_STREAM_END) {
-		error = -EINVAL;
-		goto fail_deflate;
+	ctx = zstd_init_cctx(wksp, wksp_len);
+	if (!ctx) {
+		ret = -EINVAL;
+		goto cleanup;
 	}
-	error = 0;
-
-	if (is_vmalloc_addr(stgbuf)) {
-		dstbuf = kvzalloc(strm.total_out, GFP_KERNEL);
-		if (dstbuf) {
-			memcpy(dstbuf, stgbuf, strm.total_out);
-			kvfree(stgbuf);
-		}
-	} else
-		/*
-		 * If the staging buffer was kmalloc'd, then using krealloc is
-		 * probably going to be faster. The destination buffer will
-		 * always be smaller, so it's just shrunk, avoiding a memcpy
-		 */
-		dstbuf = krealloc(stgbuf, strm.total_out, GFP_KERNEL);
 
-	if (!dstbuf) {
-		error = -ENOMEM;
-		goto fail_deflate;
+	out_len = zstd_compress_cctx(ctx, out, out_len, src, slen, &params);
+	if (zstd_is_error(out_len)) {
+		ret = -EINVAL;
+		goto cleanup;
 	}
 
-	*dst = dstbuf;
-	*dlen = strm.total_out;
+	*dst = out;
+	*dlen = out_len;
 
-fail_stg_alloc:
-	zlib_deflateEnd(&strm);
-fail_deflate_init:
-	kvfree(strm.workspace);
-	return error;
+cleanup:
+	if (ret) {
+		kvfree(out);
+	}
 
-fail_deflate:
-	kvfree(stgbuf);
-	goto fail_stg_alloc;
+	kvfree(wksp);
+	return ret;
 }
 
 static int compress_loaddata(struct aa_loaddata *data)
 {
-
 	AA_BUG(data->compressed_size > 0);
 
 	/*
@@ -1136,8 +1106,8 @@ static int compress_loaddata(struct aa_loaddata *data)
 	 */
 	if (aa_g_rawdata_compression_level != 0) {
 		void *udata = data->data;
-		int error = deflate_compress(udata, data->size, &data->data,
-					     &data->compressed_size);
+		int error = compress_zstd(udata, data->size, &data->data,
+					  &data->compressed_size);
 		if (error)
 			return error;
 
-- 
2.34.1


