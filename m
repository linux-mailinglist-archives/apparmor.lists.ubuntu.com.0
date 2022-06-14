Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3C54BAB5
	for <lists+apparmor@lfdr.de>; Tue, 14 Jun 2022 21:41:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1o1CQD-000376-Ra; Tue, 14 Jun 2022 19:41:53 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1o1CQB-00036O-Us
 for apparmor@lists.ubuntu.com; Tue, 14 Jun 2022 19:41:51 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5850C3F1AE
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655235711;
 bh=VczbNSOhvLp70r4vYmWAyithT2KiydJCdi6hkVM7m/s=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eexuu1LMrA4C9EaQszH40Z2kswEqkYgVX/I+fTYd5rnBoPMy4itfDf4oKNbsUOYNv
 1g0z750i8j/uUgbdsV3m/ANBPoYi2uvF9UK+H//bGKXUH76tufh/IUEJsgMefNp/eA
 dZhWLoQxq8P43l/eL5qGX09KKtWOGabxWH86pLSa3dzAZ8LICkCVMPxS+vV6SC6PLr
 z5Dnv8A1mKETDAVwTu3wnIqFutzzjv2aeXEHrxg4Z8u84gzQPkObhYdqIbbVRR1wBA
 MmG14v+aq1ESDtV13CwA+QhZ6z1wrKNdxff9I+IRGFrlcuTvPKuMZS/kJnJIreNmQR
 9Zj7oIaeQk43A==
Received: by mail-qk1-f197.google.com with SMTP id
 az18-20020a05620a171200b006a708307e94so8262298qkb.14
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 12:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VczbNSOhvLp70r4vYmWAyithT2KiydJCdi6hkVM7m/s=;
 b=EWWdfGsY1QovRWO7FPQhhydQ9N2/ZSCfh+oI+p44fmhsFW9zXKoyxxY8PCSviw4U5D
 mAz5mPFiNfvVcW8rYIjcv87qrj5DBQ754KJdl4gwnf5xqhCqHJOk9uJKC7iboSfFiVUZ
 mhlmWnz5LWI1LAtZYUHG/Zn8ubfbECFVVbX1ECEy89icV7azwZwenwJqhyeMy9HsPv9p
 8CPaGMy7s+utPZhSnINNI+FvDCGbSrljWnTaS0ld9DF8uPpC7jKmSHNIDk1Of36AOCB+
 x7iCXmHoPZV99d/2r34d7lOruY5mLDurdQWh8rNXoc3tXykfSZvvNdTrgEiCBXAkq30p
 xpBw==
X-Gm-Message-State: AOAM533Ij0gtUSk02MEelAgl6trRQ5IERyLr31K6EU3Bs6F12KTMrxku
 e9ipKNZ6EWqHNV+L+JWxZ0Iq+8PCVmx95Sv6AmQMmlL+iaG2XzT4qmWUFHvKRv1FNpx5t+unenX
 QFvga3Is6XxUaXrgpOSJh+2jrpUhbJE/bvULpEg==
X-Received: by 2002:a05:622a:11c2:b0:305:4:2d70 with SMTP id
 n2-20020a05622a11c200b0030500042d70mr5581163qtk.477.1655235710189; 
 Tue, 14 Jun 2022 12:41:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmPgR7IQIa5j3GMsQphW1M5NhR5hzRX2D8RPrhqCsVx7bAzd0QogQt9kXNNnmImxC2jm40MA==
X-Received: by 2002:a05:622a:11c2:b0:305:4:2d70 with SMTP id
 n2-20020a05622a11c200b0030500042d70mr5581152qtk.477.1655235709892; 
 Tue, 14 Jun 2022 12:41:49 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05620a424b00b006a6a7b4e7besm10626389qko.109.2022.06.14.12.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:41:49 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 14 Jun 2022 14:40:51 -0500
Message-Id: <20220614194052.1833833-2-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614194052.1833833-1-jon.tourville@canonical.com>
References: <20220614194052.1833833-1-jon.tourville@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 1/2] apparmor: use zstd compression for
	profile data
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

Change the algorithm used by apparmor to compress profile data from
zlib to zstd, using the new zstd API introduced in 5.16.

Zstd provides a larger range of compression levels than zlib and
significantly better performance at the default level (for a relatively
small increase in compressed size).

The apparmor module parameter raw_data_compression_level is now clamped
to the minimum and maximum compression levels reported by the zstd
library. A compression level of 0 retains the previous behavior of
disabling policy compression instead of using zstd's behavior, which is
to use the default compression level.

Signed-off-by: Jon Tourville <jon.tourville@canonical.com>
---
 security/apparmor/Kconfig         |   4 +-
 security/apparmor/apparmorfs.c    |  63 +++++++----------
 security/apparmor/lsm.c           |  10 +--
 security/apparmor/policy_unpack.c | 109 ++++++++++++++----------------
 4 files changed, 83 insertions(+), 103 deletions(-)

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
index 0acca6f2a93f..f70d6746fa3b 100644
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
@@ -1049,85 +1049,76 @@ struct aa_load_ent *aa_load_ent_alloc(void)
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
+	ctx = zstd_init_cctx(wksp, wksp_len);
+	if (!ctx) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
 
-	error = zlib_deflate(&strm, Z_FINISH);
-	if (error != Z_STREAM_END) {
-		error = -EINVAL;
-		goto fail_deflate;
+	out_len = zstd_compress_cctx(ctx, out, out_len, src, slen, &params);
+	if (zstd_is_error(out_len)) {
+		ret = -EINVAL;
+		goto cleanup;
 	}
-	error = 0;
 
-	if (is_vmalloc_addr(stgbuf)) {
-		dstbuf = kvzalloc(strm.total_out, GFP_KERNEL);
-		if (dstbuf) {
-			memcpy(dstbuf, stgbuf, strm.total_out);
-			kvfree(stgbuf);
+	if (is_vmalloc_addr(out)) {
+		*dst = kvzalloc(out_len, GFP_KERNEL);
+		if (*dst) {
+			memcpy(*dst, out, out_len);
+			kvfree(out);
+			out = NULL;
 		}
-	} else
+	} else {
 		/*
 		 * If the staging buffer was kmalloc'd, then using krealloc is
 		 * probably going to be faster. The destination buffer will
 		 * always be smaller, so it's just shrunk, avoiding a memcpy
 		 */
-		dstbuf = krealloc(stgbuf, strm.total_out, GFP_KERNEL);
+		*dst = krealloc(out, out_len, GFP_KERNEL);
+	}
 
-	if (!dstbuf) {
-		error = -ENOMEM;
-		goto fail_deflate;
+	if (!*dst) {
+		ret = -ENOMEM;
+		goto cleanup;
 	}
 
-	*dst = dstbuf;
-	*dlen = strm.total_out;
+	*dlen = out_len;
 
-fail_stg_alloc:
-	zlib_deflateEnd(&strm);
-fail_deflate_init:
-	kvfree(strm.workspace);
-	return error;
+cleanup:
+	if (ret) {
+		kvfree(out);
+		*dst = NULL;
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
@@ -1136,8 +1127,8 @@ static int compress_loaddata(struct aa_loaddata *data)
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


