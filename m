Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2F4A438AE
	for <lists+apparmor@lfdr.de>; Tue, 25 Feb 2025 10:06:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tmqtg-0004IA-5O; Tue, 25 Feb 2025 09:06:36 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hector.cao@canonical.com>)
 id 1tmqte-0004Hw-P3
 for apparmor@lists.ubuntu.com; Tue, 25 Feb 2025 09:06:34 +0000
Received: from localhost.localdomain (1.general.hector.uk.vpn [10.172.192.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 4AFD53F0C6; 
 Tue, 25 Feb 2025 09:06:34 +0000 (UTC)
From: Hector Cao <hector.cao@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 25 Feb 2025 10:06:29 +0100
Message-ID: <20250225090629.6741-1-hector.cao@canonical.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] Add abstract profile for libnuma
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

For executables dynamically linked to libnuma, the runtimer linker
invokes libnuma functions (num_init) that try to access
/sys/devices/system/node/ and if the application's apparmor
profile does not allow this access, this access will be denied
by apparmor with following error message:

  apparmor="DENIED" operation="open" class="file"
  name="/sys/devices/system/node/" comm="qemu-bridge-hel"
  requested_mask="r" denied_mask="r" fsuid=1000 ouid=0

Here is the simplified call trace:

  0 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1
  1 ... in call_init (...) at ./elf/dl-init.c:74
  2 ... in call_init (...) at ./elf/dl-init.c:120
  3 _dl_init (...) at ./elf/dl-init.c:121
  4 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so.2

This commit adds an abstract profile that applications that are
linked to libnuma can include in their apparmor profile.

Signed-off-by: Hector Cao <hector.cao@canonical.com>
---
 profiles/apparmor.d/abstractions/libnuma | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 profiles/apparmor.d/abstractions/libnuma

diff --git a/profiles/apparmor.d/abstractions/libnuma b/profiles/apparmor.d/abstractions/libnuma
new file mode 100644
index 000000000..9126294c4
--- /dev/null
+++ b/profiles/apparmor.d/abstractions/libnuma
@@ -0,0 +1,19 @@
+# vim:syntax=apparmor
+# ------------------------------------------------------------------
+#
+#    Copyright (C) 2025 Canonical Ltd.
+#
+#    This program is free software; you can redistribute it and/or
+#    modify it under the terms of version 2 of the GNU General Public
+#    License published by the Free Software Foundation.
+#
+# ------------------------------------------------------------------
+
+  abi <abi/4.0>,
+
+  # this abstract profile can be included by applications that are
+  # dynamically linked to libnuma
+  # libnuma defines the function num_init() as the .init function
+  # to be called by the runtime linker (ld) when libnuma is loaded
+
+  @{sys}/devices/system/cpu/node/ r,
-- 
2.45.2


