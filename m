Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 40851643E4C
	for <lists+apparmor@lfdr.de>; Tue,  6 Dec 2022 09:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2T85-0001MB-9m; Tue, 06 Dec 2022 08:16:41 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3z2eOYwUKCPotoqctiqqing.eqocrrctoqtnkuvu.wdwpvw.eqo@flex--rmoar.bounces.google.com>)
 id 1p2JMm-0008VB-I3
 for apparmor@lists.ubuntu.com; Mon, 05 Dec 2022 21:51:12 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-368994f4bc0so135301027b3.14
 for <apparmor@lists.ubuntu.com>; Mon, 05 Dec 2022 13:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bHaN/rxrdTlLNmHkIlcPiYJ+TDwo4KCFt7QuQtzqTRE=;
 b=ezbkPVk+gANDmDB3slX0LIDT+GXoGI4xG2jnCJZjxEIny0W/0FWw78vciEzyI7Ukj7
 RgSvvofXwpCVf2yARjRAT0576DboGtRN++XwON3MSO3eJyh2UCMFvEa++LYG7ErrzqO2
 C7f/wQsM5J3hXxmTTmc6B59reRG4wQqsC5bIuhPjgSs8h6zUZLTGtGQbZ/Xj/CmMm9Zh
 MYlG6+TnpqZknQxmbPLInZ/T1iDqcgFbIDGSl24zuHvhlIaw+D5OIy3lavnzA2+9ydFE
 QnJSImLeC199vLikRq0kVXpiNB+yoZuPobJ7kvcXcuBSIpZ1UnuoOZdNoIYf3Eg+ZSDa
 mdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHaN/rxrdTlLNmHkIlcPiYJ+TDwo4KCFt7QuQtzqTRE=;
 b=ufDxtp9Z7jdOfk9hJWevNGW+qRKfvxDrohPg5L6XAKPGzT+bGPfYf8tZGGPh2SpbPi
 9KOf6+M+tMCjiPRU0G0vlUuO0I88qgBcKHTlt9YramIBwVBzs8XUim85bPP6CR0dePn3
 bpwlSrosyivyfloH+eoLt7mETZ/WQ5aRR+iUoGooXSf3DbsmIYnSYOT2xKszq5EaSGdD
 SdW1s0DPtbq+l3oHdl2EEHWFXXpPbPpTE/Rs4/PJ+CSAwnHWQvYH+QXwSNhy33oSAw75
 r3pXs1ayIZtrgKJ3mAC/Q2QaP2J10LwZ95zHpqyxyQH+rHa7TTcDrUUWkmzt2hoMHuVK
 CSiA==
X-Gm-Message-State: ANoB5pkWEWY6OLmbce69VAuLzEQD43nXzSDThuCw3kd5cNxjZ0ktOwKL
 EBLYz5m7+ofx/yEOXNJHbEpaMj6zvw==
X-Google-Smtp-Source: AA0mqf6lvqWkEuvZgqLHmk5rJjpI3nI+CfBPBXL+rv479JHG6NqzXP82xrmhXOZP4uwHFTAxRMlOZaGtmQ==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a81:598b:0:b0:3b7:78c8:a205 with
 SMTP id
 n133-20020a81598b000000b003b778c8a205mr49937654ywb.188.1670277071514; Mon, 05
 Dec 2022 13:51:11 -0800 (PST)
Date: Mon,  5 Dec 2022 21:50:57 +0000
In-Reply-To: <20221205215058.143688-1-rmoar@google.com>
Mime-Version: 1.0
References: <20221205215058.143688-1-rmoar@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221205215058.143688-2-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com, 
 john.johansen@canonical.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 08:16:39 +0000
Subject: [apparmor] [PATCH v2 1/2] kunit: add macro to allow conditionally
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
is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change to
the symbol definition.

EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is enabled. Must
use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING) in test file in order to
use symbols.

Signed-off-by: Rae Moar <rmoar@google.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Reviewed-by: David Gow <davidgow@google.com>
---

Changes since v1:
 - Separated the documentation comments for macros.
 - Changed copyright date and author for new header file.

 include/kunit/visibility.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 include/kunit/visibility.h

diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
new file mode 100644
index 000000000000..0dfe35feeec6
--- /dev/null
+++ b/include/kunit/visibility.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit API to allow symbols to be conditionally visible during KUnit
+ * testing
+ *
+ * Copyright (C) 2022, Google LLC.
+ * Author: Rae Moar <rmoar@google.com>
+ */
+
+#ifndef _KUNIT_VISIBILITY_H
+#define _KUNIT_VISIBILITY_H
+
+#if IS_ENABLED(CONFIG_KUNIT)
+    /**
+     * VISIBLE_IF_KUNIT - A macro that sets symbols to be static if
+     * CONFIG_KUNIT is not enabled. Otherwise if CONFIG_KUNIT is enabled
+     * there is no change to the symbol definition.
+     */
+    #define VISIBLE_IF_KUNIT
+    /**
+     * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
+     * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
+     * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
+     * in test file in order to use symbols.
+     */
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
+	    EXPORTED_FOR_KUNIT_TESTING)
+#else
+    #define VISIBLE_IF_KUNIT static
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol)
+#endif
+
+#endif /* _KUNIT_VISIBILITY_H */
-- 
2.39.0.rc0.267.gcb52ba06e7-goog


