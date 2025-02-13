Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA1A348AB
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2025 16:57:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tibb3-0003Uv-5s; Thu, 13 Feb 2025 15:57:49 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hector.cao@canonical.com>)
 id 1tibb1-0003Uo-KZ
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 15:57:47 +0000
Received: from localhost.localdomain (1.general.hector.uk.vpn [10.172.192.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 135573F18A; 
 Thu, 13 Feb 2025 15:57:47 +0000 (UTC)
From: Hector Cao <hector.cao@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 13 Feb 2025 16:57:12 +0100
Message-ID: <20250213155741.1619500-1-hector.cao@canonical.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2] Allow access to sys devices nodes for libnuma
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

Allow access to this sysfs folder so that we do not have to
specify this permission for every executable linked to libnuma

Changes in v2:
  - Fix typo: add missing ending '/' character to the path

Signed-off-by: Hector Cao <hector.cao@canonical.com>
---
 profiles/apparmor.d/abstractions/base | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor.d/abstractions/base
index bf3f3184e..52cbab920 100644
--- a/profiles/apparmor.d/abstractions/base
+++ b/profiles/apparmor.d/abstractions/base
@@ -108,6 +108,8 @@
   @{sys}/devices/system/cpu/       r,
   @{sys}/devices/system/cpu/online r,
   @{sys}/devices/system/cpu/possible r,
+  # runtime initialization for binaries linked to libnuma
+  @{sys}/devices/system/node/     r,
 
   # transparent hugepage support
   @{sys}/kernel/mm/transparent_hugepage/hpage_pmd_size r,
-- 
2.45.2


