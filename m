Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A96178FA
	for <lists+apparmor@lfdr.de>; Thu,  3 Nov 2022 09:42:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oqVoB-0003yB-Cb; Thu, 03 Nov 2022 08:42:43 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3wrBiYwUKCM8C79vC19916z.x97vAAvC79C63DED.FwF8EF.x97@flex--rmoar.bounces.google.com>)
 id 1oqI4Z-0008P6-0f
 for apparmor@lists.ubuntu.com; Wed, 02 Nov 2022 18:02:43 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-370624ca2e8so82856427b3.16
 for <apparmor@lists.ubuntu.com>; Wed, 02 Nov 2022 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9l8lXjhxyvx7hugLBY5a32mtgpwYy/QS8EhOcey2iJI=;
 b=N4qvZiTh6z/VpHEhAgpt+iXW10wLeCyb2cfbL6vwglqWIp2RVKilvjOiNlHxER0jpt
 znhYMS+GXRgJc9ovLRn5F0PBQhLD2mYCI1X+ms77VFGTxodL6kBNC5q6U7m4pYdmSMZb
 dw+cilBQuDcwZRFBWtHD9kFcMemn/ocwOmlxiIyK7vquw6uzPO0tiaXqk8Tc0cfxQdhu
 FJORiG3npVqhFSKbb2N/st34l4T+XzzM47ZA7iF/2T/ZbgiEZNBJNz8O/1GKGekYcbip
 gVG6Si/IGK0IdLp+BA8pmoVlCCGx+OhJuyxPbqhpIltp+pDVcQZxMTAYruwIChHoEisR
 J5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9l8lXjhxyvx7hugLBY5a32mtgpwYy/QS8EhOcey2iJI=;
 b=v7on4WjQE9EU1Zy1Dnlna1qzBcbnDLQpw1RnkQL5r7hey1/jtQ2penu2S+bLusUuNn
 kk3c2apXJAmD+4pNKnUeNLg93wnMn+yogm9PExdjsiIkSx3tbnwO+5C4GeKQSBVFz94n
 mfT/BAGC9mcffi9Qhn63nC/sB6plfGQ6c2Z4fGl8IOZr6ztQeICOkG62VhApbIZuxHei
 ZCwziwelpZmz2EoJUliIXkCEf1Z2mjzGVUv9kyDZEKqvyA9JjHD0q8yz5e1D4zhSe0le
 MXiIOH6L5z9hiMTm7opOh1jEc2frcKrwVIqVmNOAGd+wx644ErD7HatheKmbcH01DVG0
 OhdQ==
X-Gm-Message-State: ACrzQf2ftdtE2EfjBY1AtaYWeq9diXWwGEa+gMTfvmXu1t7NAKG4s/gt
 3ktDp6zlLgCPdefZtcEvhOv453VtTg==
X-Google-Smtp-Source: AMsMyM5AVh8CpO5jJTevTDqw22vtL9e0CmtvIVvSCpW2+ILj37woZ0CBjDZE4kGPbtPZIRlCwwwEOVuZGA==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a25:ae08:0:b0:6ca:2041:7c8c with
 SMTP id
 a8-20020a25ae08000000b006ca20417c8cmr24515071ybj.250.1667412162715; Wed, 02
 Nov 2022 11:02:42 -0700 (PDT)
Date: Wed,  2 Nov 2022 17:59:59 +0000
In-Reply-To: <20221102175959.2921063-1-rmoar@google.com>
Mime-Version: 1.0
References: <20221102175959.2921063-1-rmoar@google.com>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221102175959.2921063-3-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Nov 2022 08:42:42 +0000
Subject: [apparmor] [PATCH v1 2/2] apparmor: test: make static symbols
 visible during kunit testing
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
Cc: tales.aparecida@gmail.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Use macros, VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT, to allow
static symbols to be conditionally set to be visible during KUnit
testing. Remove the need to include testing file in the implementation
file. Provide example of how static symbols can be dealt with in
testing.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 security/apparmor/Kconfig                 |  4 +-
 security/apparmor/Makefile                |  2 +
 security/apparmor/include/policy_unpack.h | 50 ++++++++++++++++
 security/apparmor/policy_unpack.c         | 72 +++++++----------------
 security/apparmor/policy_unpack_test.c    |  5 ++
 5 files changed, 80 insertions(+), 53 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index cb3496e00d8a..f334e7cccf2d 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -106,8 +106,8 @@ config SECURITY_APPARMOR_PARANOID_LOAD
 	  Disabling the check will speed up policy loads.
 
 config SECURITY_APPARMOR_KUNIT_TEST
-	bool "Build KUnit tests for policy_unpack.c" if !KUNIT_ALL_TESTS
-	depends on KUNIT=y && SECURITY_APPARMOR
+	tristate "Build KUnit tests for policy_unpack.c" if !KUNIT_ALL_TESTS
+	depends on KUNIT && SECURITY_APPARMOR
 	default KUNIT_ALL_TESTS
 	help
 	  This builds the AppArmor KUnit tests.
diff --git a/security/apparmor/Makefile b/security/apparmor/Makefile
index ff23fcfefe19..6a92428375eb 100644
--- a/security/apparmor/Makefile
+++ b/security/apparmor/Makefile
@@ -8,6 +8,8 @@ apparmor-y := apparmorfs.o audit.o capability.o task.o ipc.o lib.o match.o \
               resource.o secid.o file.o policy_ns.o label.o mount.o net.o
 apparmor-$(CONFIG_SECURITY_APPARMOR_HASH) += crypto.o
 
+obj-$(CONFIG_SECURITY_APPARMOR_KUNIT_TEST) += policy_unpack_test.o
+
 clean-files := capability_names.h rlim_names.h net_names.h
 
 # Build a lower case string table of address family names
diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index eb5f7d7f132b..a963687bcc9b 100644
--- a/security/apparmor/include/policy_unpack.h
+++ b/security/apparmor/include/policy_unpack.h
@@ -48,6 +48,43 @@ enum {
 	AAFS_LOADDATA_NDENTS		/* count of entries */
 };
 
+/*
+ * The AppArmor interface treats data as a type byte followed by the
+ * actual data.  The interface has the notion of a named entry
+ * which has a name (AA_NAME typecode followed by name string) followed by
+ * the entries typecode and data.  Named types allow for optional
+ * elements and extensions to be added and tested for without breaking
+ * backwards compatibility.
+ */
+
+enum aa_code {
+	AA_U8,
+	AA_U16,
+	AA_U32,
+	AA_U64,
+	AA_NAME,		/* same as string except it is items name */
+	AA_STRING,
+	AA_BLOB,
+	AA_STRUCT,
+	AA_STRUCTEND,
+	AA_LIST,
+	AA_LISTEND,
+	AA_ARRAY,
+	AA_ARRAYEND,
+};
+
+/*
+ * aa_ext is the read of the buffer containing the serialized profile.  The
+ * data is copied into a kernel buffer in apparmorfs and then handed off to
+ * the unpack routines.
+ */
+struct aa_ext {
+	void *start;
+	void *end;
+	void *pos;		/* pointer to current position in the buffer */
+	u32 version;
+};
+
 /*
  * struct aa_loaddata - buffer of policy raw_data set
  *
@@ -126,4 +163,17 @@ static inline void aa_put_loaddata(struct aa_loaddata *data)
 		kref_put(&data->count, aa_loaddata_kref);
 }
 
+#if IS_ENABLED(CONFIG_KUNIT)
+bool inbounds(struct aa_ext *e, size_t size);
+size_t unpack_u16_chunk(struct aa_ext *e, char **chunk);
+bool unpack_X(struct aa_ext *e, enum aa_code code);
+bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name);
+bool unpack_u32(struct aa_ext *e, u32 *data, const char *name);
+bool unpack_u64(struct aa_ext *e, u64 *data, const char *name);
+size_t unpack_array(struct aa_ext *e, const char *name);
+size_t unpack_blob(struct aa_ext *e, char **blob, const char *name);
+int unpack_str(struct aa_ext *e, const char **string, const char *name);
+int unpack_strdup(struct aa_ext *e, char **string, const char *name);
+#endif
+
 #endif /* __POLICY_INTERFACE_H */
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 55d31bac4f35..c23aa70349aa 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -14,6 +14,7 @@
  */
 
 #include <asm/unaligned.h>
+#include <kunit/visibility.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
 #include <linux/zlib.h>
@@ -37,43 +38,6 @@
 #define v7	7
 #define v8	8	/* full network masking */
 
-/*
- * The AppArmor interface treats data as a type byte followed by the
- * actual data.  The interface has the notion of a named entry
- * which has a name (AA_NAME typecode followed by name string) followed by
- * the entries typecode and data.  Named types allow for optional
- * elements and extensions to be added and tested for without breaking
- * backwards compatibility.
- */
-
-enum aa_code {
-	AA_U8,
-	AA_U16,
-	AA_U32,
-	AA_U64,
-	AA_NAME,		/* same as string except it is items name */
-	AA_STRING,
-	AA_BLOB,
-	AA_STRUCT,
-	AA_STRUCTEND,
-	AA_LIST,
-	AA_LISTEND,
-	AA_ARRAY,
-	AA_ARRAYEND,
-};
-
-/*
- * aa_ext is the read of the buffer containing the serialized profile.  The
- * data is copied into a kernel buffer in apparmorfs and then handed off to
- * the unpack routines.
- */
-struct aa_ext {
-	void *start;
-	void *end;
-	void *pos;		/* pointer to current position in the buffer */
-	u32 version;
-};
-
 /* audit callback for unpack fields */
 static void audit_cb(struct audit_buffer *ab, void *va)
 {
@@ -199,10 +163,11 @@ struct aa_loaddata *aa_loaddata_alloc(size_t size)
 }
 
 /* test if read will be in packed data bounds */
-static bool inbounds(struct aa_ext *e, size_t size)
+VISIBLE_IF_KUNIT bool inbounds(struct aa_ext *e, size_t size)
 {
 	return (size <= e->end - e->pos);
 }
+EXPORT_SYMBOL_IF_KUNIT(inbounds);
 
 static void *kvmemdup(const void *src, size_t len)
 {
@@ -220,7 +185,7 @@ static void *kvmemdup(const void *src, size_t len)
  *
  * Returns: the size of chunk found with the read head at the end of the chunk.
  */
-static size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
+VISIBLE_IF_KUNIT size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
 {
 	size_t size = 0;
 	void *pos = e->pos;
@@ -239,9 +204,10 @@ static size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
 	e->pos = pos;
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_u16_chunk);
 
 /* unpack control byte */
-static bool unpack_X(struct aa_ext *e, enum aa_code code)
+VISIBLE_IF_KUNIT bool unpack_X(struct aa_ext *e, enum aa_code code)
 {
 	if (!inbounds(e, 1))
 		return false;
@@ -250,6 +216,7 @@ static bool unpack_X(struct aa_ext *e, enum aa_code code)
 	e->pos++;
 	return true;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_X);
 
 /**
  * unpack_nameX - check is the next element is of type X with a name of @name
@@ -267,7 +234,7 @@ static bool unpack_X(struct aa_ext *e, enum aa_code code)
  *
  * Returns: false if either match fails, the read head does not move
  */
-static bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
+VISIBLE_IF_KUNIT bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
 {
 	/*
 	 * May need to reset pos if name or type doesn't match
@@ -296,6 +263,7 @@ static bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
 	e->pos = pos;
 	return false;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_nameX);
 
 static bool unpack_u8(struct aa_ext *e, u8 *data, const char *name)
 {
@@ -315,7 +283,7 @@ static bool unpack_u8(struct aa_ext *e, u8 *data, const char *name)
 	return false;
 }
 
-static bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
+VISIBLE_IF_KUNIT bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
 {
 	void *pos = e->pos;
 
@@ -332,8 +300,9 @@ static bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
 	e->pos = pos;
 	return false;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_u32);
 
-static bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
+VISIBLE_IF_KUNIT bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
 {
 	void *pos = e->pos;
 
@@ -350,8 +319,9 @@ static bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
 	e->pos = pos;
 	return false;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_u64);
 
-static size_t unpack_array(struct aa_ext *e, const char *name)
+VISIBLE_IF_KUNIT size_t unpack_array(struct aa_ext *e, const char *name)
 {
 	void *pos = e->pos;
 
@@ -368,8 +338,9 @@ static size_t unpack_array(struct aa_ext *e, const char *name)
 	e->pos = pos;
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_array);
 
-static size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
+VISIBLE_IF_KUNIT size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
 {
 	void *pos = e->pos;
 
@@ -390,8 +361,9 @@ static size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
 	e->pos = pos;
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_blob);
 
-static int unpack_str(struct aa_ext *e, const char **string, const char *name)
+VISIBLE_IF_KUNIT int unpack_str(struct aa_ext *e, const char **string, const char *name)
 {
 	char *src_str;
 	size_t size = 0;
@@ -413,8 +385,9 @@ static int unpack_str(struct aa_ext *e, const char **string, const char *name)
 	e->pos = pos;
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_str);
 
-static int unpack_strdup(struct aa_ext *e, char **string, const char *name)
+VISIBLE_IF_KUNIT int unpack_strdup(struct aa_ext *e, char **string, const char *name)
 {
 	const char *tmp;
 	void *pos = e->pos;
@@ -432,6 +405,7 @@ static int unpack_strdup(struct aa_ext *e, char **string, const char *name)
 
 	return res;
 }
+EXPORT_SYMBOL_IF_KUNIT(unpack_strdup);
 
 
 /**
@@ -1251,7 +1225,3 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 
 	return error;
 }
-
-#ifdef CONFIG_SECURITY_APPARMOR_KUNIT_TEST
-#include "policy_unpack_test.c"
-#endif /* CONFIG_SECURITY_APPARMOR_KUNIT_TEST */
diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 0a969b2e03db..3474fe2cd922 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -4,6 +4,7 @@
  */
 
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "include/policy.h"
 #include "include/policy_unpack.h"
@@ -43,6 +44,8 @@
 #define TEST_ARRAY_BUF_OFFSET \
 	(TEST_NAMED_ARRAY_BUF_OFFSET + 3 + strlen(TEST_ARRAY_NAME) + 1)
 
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
 struct policy_unpack_fixture {
 	struct aa_ext *e;
 	size_t e_size;
@@ -605,3 +608,5 @@ static struct kunit_suite apparmor_policy_unpack_test_module = {
 };
 
 kunit_test_suite(apparmor_policy_unpack_test_module);
+
+MODULE_LICENSE("GPL");
-- 
2.38.1.273.g43a17bfeac-goog


