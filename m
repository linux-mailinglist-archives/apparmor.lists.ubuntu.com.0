Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C133C64525C
	for <lists+apparmor@lfdr.de>; Wed,  7 Dec 2022 04:04:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2kj4-00076x-RK; Wed, 07 Dec 2022 03:04:02 +0000
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3L--PYwUKCHAfacOfUccUZS.QcaOddOfacfZWghg.iPibhi.Qca@flex--rmoar.bounces.google.com>)
 id 1p2jQm-0005An-Qi
 for apparmor@lists.ubuntu.com; Wed, 07 Dec 2022 01:41:04 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-3dddef6adb6so158699207b3.11
 for <apparmor@lists.ubuntu.com>; Tue, 06 Dec 2022 17:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Av2mFA0WtwRQfRDDp1AcFtZ65WBT5TfOYBGjpZc8U=;
 b=ZSeF6gIU33eO2yCx/RBxl96g1hXO/NUYpPapQeVcTwE4Vg0/fBOlVSrYS97e5ecEHO
 XNPpGZncy+/Gh7h+b4LSvjIumlhokHRE09Pwo7LwQKIekr8yixl8QCQ0KIukFe02w2wT
 comOtXMfhFDFAUoy5ivekITX41zI6WVG8czk1z8lYcycv6IVhBJdmK46mlZx35jcXgGF
 52pVZ8bzYLziNsMyUyQuMCEgz7XPjBlw0nbxY2WuQhHIoAgQn08onIVu02uiAZ094hGO
 rj7k4ucJcfb9tH6AEsJFJuADrgzDJeFRHEC1Ct11VgyQJ5N4T7/YnDQOTYD7sdUrRawe
 sCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Av2mFA0WtwRQfRDDp1AcFtZ65WBT5TfOYBGjpZc8U=;
 b=kg5kBNCW1CmqsolZwdmIFYl1VWv6uB0vKE4yB3gGPuGsODMnhlxOfylMKRy1AaAqPd
 SByEzKDdUgcpueungzU0kPaicsyddJ1+RZ0RvaMVoYcGQ05rCw3qRcy9ne33Z/Ztjc4q
 VwXIbeFDCtH88OwuSPXAi7l8GgBunr8R09GXiDvjaE5UYv4muVb2xed6fV35LzuTYNnd
 ik27qDbJ+V5vmmsJcahODPly1XNaH5LTBDk13FwBf9i6kxG1TAAlatDg6o5R7LEkrFd+
 blMoW3llD4Gd1u2cBZMafqUmbXSHIGl6MZdJ0rAFzwU/DjPv5cXMO/DVCB5IqqdaF+zf
 XwKA==
X-Gm-Message-State: ANoB5pklOqZaY4bTvm299/48GSxaJUtnEF5eEp6XhG+1C1ZmAfZsQWe+
 k6LTj8NuUt6tYZZihu14SAGwobu0zQ==
X-Google-Smtp-Source: AA0mqf75lqEvLvU57b4+1woivfdGDV7Rrauznoz21g86JMzcwRQz2dnJ6LFhFHKTp7RgXkDvBHH/e74eaQ==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a81:a1ce:0:b0:3bc:16af:8ded with
 SMTP id
 y197-20020a81a1ce000000b003bc16af8dedmr50465406ywg.176.1670377263945; Tue, 06
 Dec 2022 17:41:03 -0800 (PST)
Date: Wed,  7 Dec 2022 01:40:23 +0000
In-Reply-To: <20221207014024.340230-1-rmoar@google.com>
Mime-Version: 1.0
References: <20221207014024.340230-1-rmoar@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221207014024.340230-2-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com, 
 john.johansen@canonical.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Dec 2022 03:04:02 +0000
Subject: [apparmor] [PATCH v3 1/2] kunit: add macro to allow conditionally
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

Changes since v2:
 - No changes to this patch.

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


