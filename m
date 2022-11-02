Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AED6178F9
	for <lists+apparmor@lfdr.de>; Thu,  3 Nov 2022 09:42:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oqVoC-0003yK-FB; Thu, 03 Nov 2022 08:42:44 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3v7BiYwUKCMw946s9y66y3w.u64s77s946930ABA.CtC5BC.u64@flex--rmoar.bounces.google.com>)
 id 1oqI4W-0008PP-PA
 for apparmor@lists.ubuntu.com; Wed, 02 Nov 2022 18:02:40 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 y6-20020a25b9c6000000b006c1c6161716so16900182ybj.8
 for <apparmor@lists.ubuntu.com>; Wed, 02 Nov 2022 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CAYN6r+yTQvu28IFOFbzBkKteLNKvCbZnYXbZl6k2DY=;
 b=FrgvbWPhRA4VD87zdgqKKiY5UHCDYtYfe7CjaP2xgmEOG1Y05NjZSf3gzQWW8T0Uct
 kwK/a9hcGw0YEYKVOJVFR5P9iNYw89sCx6ZHsJggC73BExIAmjho5Pbue4CgNBI3QOgO
 FoPe42kXbj+qL8yjM5/fdOTg+3rYiSOtiXyjG+vM72l5OUaB8j+A2cgCkgbbQKnrcMOV
 vjVP5OOJMItX52jvTtAXnPZObQ6EUQSPLAa0t1h0Rw23k0Jw4oAggVMoBX89jk82PyRN
 zVVthy9iTThict8/JGXYxe/C830qJ3olt0/g7iLirWIKcLukRfjGALBtlSWm2uBgHMk7
 3wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CAYN6r+yTQvu28IFOFbzBkKteLNKvCbZnYXbZl6k2DY=;
 b=KU49LbDxW6RiWfpeNawsNCp2PkYvJIni0QTWQq7N+tUP361zLte1+5v0KzVUIUraaf
 +AGLA3z18D8EnzKVTStHazw08zfm47vNAoctICguiqsjXlJ8mFlM4vcH89R5ga7k2Daf
 00gFEyKd4olw067CugRBT7duhPmoyd7ch3cwz6fegn6oQ5o3YhcFm3X/yJk6l+pu4Ihh
 T37cg2NhqK3Vo89rcTMChPr3RWI0s9f/aNGKaCHs9KZIVWLDpz7/aPE6TR+USqrbm59V
 2uKhrA2IfD+8W0KAruU2cHIsgoNgS2y39A5/sYWc0MGjrI4TNoy66zGKUJoer9WiRWCg
 vwaw==
X-Gm-Message-State: ACrzQf2AIbEGAsSTUDXR4XpbTHmJot27PG9pCDfAZVTjXASgg1U2hLiO
 FHsCWXoi88ldVlbJWS2uG4JVdMm1Ww==
X-Google-Smtp-Source: AMsMyM64HlkRFhAbArKDmM55aNm5YRW0BBSHLMBYENZZs5lf+VgK/ijoO38lHLz2MMzG8f46iR30Y68UQQ==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a05:6902:1247:b0:6ca:88e8:6f43
 with SMTP id
 t7-20020a056902124700b006ca88e86f43mr24295801ybu.289.1667412159822; Wed, 02
 Nov 2022 11:02:39 -0700 (PDT)
Date: Wed,  2 Nov 2022 17:59:58 +0000
In-Reply-To: <20221102175959.2921063-1-rmoar@google.com>
Mime-Version: 1.0
References: <20221102175959.2921063-1-rmoar@google.com>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221102175959.2921063-2-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Nov 2022 08:42:42 +0000
Subject: [apparmor] [PATCH v1 1/2] kunit: add macro to allow conditionally
 exposing static symbols to tests
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

Create two macros:

VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
to the symbol definition.

EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is enabled. Must
use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING) in test file in order to
use symbols.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 include/kunit/visibility.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/kunit/visibility.h

diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
new file mode 100644
index 000000000000..eb22c9e6b4eb
--- /dev/null
+++ b/include/kunit/visibility.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit API to allow symbols to be conditionally visible during KUnit
+ * testing
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins@google.com>
+ */
+
+#ifndef _KUNIT_VISIBILITY_H
+#define _KUNIT_VISIBILITY_H
+
+/**
+ * VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
+ * is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
+ * to the symbol definition.
+ *
+ * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
+ * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
+ * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
+ * in test file in order to use symbols.
+ */
+#if IS_ENABLED(CONFIG_KUNIT)
+    #define VISIBLE_IF_KUNIT
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
+	    EXPORTED_FOR_KUNIT_TESTING)
+#else
+    #define VISIBLE_IF_KUNIT static
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol)
+#endif
+
+#endif /* _KUNIT_VISIBILITY_H */
-- 
2.38.1.273.g43a17bfeac-goog


