Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APqZJStDjml3BQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:16:27 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A721312E5
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:16:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqe2p-0000az-7O; Thu, 12 Feb 2026 21:16:15 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqe2n-0000ad-BO
 for apparmor@lists.ubuntu.com; Thu, 12 Feb 2026 21:16:13 +0000
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 386323F787
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 21:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770930973;
 bh=I3S+5O/8i3EyTZ0UMVUJI7pPlKSkzw2mskyiGUZrUkU=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=dQk5A+hxX505v3WmlIOycMvXDfJvsiUhXwow/BSD3CDEe9ASO+VEPHDGHRmbKNwpw
 9K98CAPpKjUZOec9nnBKSAggx+8iqrc2qnQF0pXyCHMiXveMOrFxrP2rmorTEiaFpM
 wHpIVYAs8BGYiBCa8Nw+P3pKUk+vdzEM6YbE0xsw4050p4XLLxUooDimCF3oMLymYX
 33hZmjcQn/0pPZvnOoqetzjjyJjEvQHu/XSl2yblEyzE+UbEKuzqiOg2VWhkTTtRwX
 Nv0LYfeMZlK2E8VAdJ0BafmiekrK1UdgHLuqOznpWxkqduQUiM90W28Y9nnRJwTq51
 aFa0KbsKj1trL0xSkgeVSTW4oOMywXRKf5ndbE5KoIOUu4WBZmdrMrxZ1mydhrYKrv
 qX7GCZkojYWZFhGXUzhTroomVJ7nQqU1J/AxTaNKvPL+sAXtIQWYCfl5aRK1fMO9ES
 sKWweLuX/PRjP0uwjvfG3VnX7OsVXZA7/A0nblRbXHVaWrM3bV/giGNeL33YqNKAm/
 o96EGzcThhY2zOdo2XB1trVHTTO7JvtNBg9U7XexpP/GutgCuW6AethqeqWlD3frPz
 EUyg08qo5zKevT5j0t/drt9uIPp+Dkm0paAdxmxYdWV6jGf8MGkJfAEF4865cgZowh
 pCKwW30PXXi/A5XZA9vOFD9o=
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b9ea5408fbso277811eec.1
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 13:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770930972; x=1771535772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3S+5O/8i3EyTZ0UMVUJI7pPlKSkzw2mskyiGUZrUkU=;
 b=oFA1/vIPTDzVfXXBsQPzrYlUKtD+nR+JZjJ91apMcunNrLfpro2uGply7dVMN67ujO
 pZznRhUaShaeKgSny+t9ZRWca2C0qLNdhxo+U6aS4e29jEFf0xGd8x4MmI8GNg1s+MQt
 OhX/QH6Jy+/SDWjhTixeKlo8eX/1QCfMnTyHgzLchh/f1F9OUWnSFykPVUhGcO6jEKQ4
 ah5Aed+JUxtI7DD2y1Ne4g/Maj+s3AgnEjzM99+YOWGv1Hsza3K2+ZbgkSLpD9fqn+GD
 4h0WcTX6uTgSOXY/SqhrNmkGFAQVqRMCF4rvv2lmJclzl3I/XqtUgIb8ZuBc//KigpFk
 meDQ==
X-Gm-Message-State: AOJu0YwaK3Wn7H88O2j238LQvaiGGJ4cy0rUZiPbQRRMkSmGjwMIjgRN
 QYbLbdaq1IKr35YoqA2xoICqF09Ngo4GihLUi88IztxNNQDilEROOUIo/XMU50tcEZlToNGHriZ
 6EGizHMOpjqwojf96QPRfAJ7H1pWjgna6GBVsUXT2vjdkMhpzBd2TGAY32jk5dSAe2PjCLZLdDA
 IWctv8kkLOCw==
X-Gm-Gg: AZuq6aLKYUQGFa3hEMpeZX6YLdtsaBTDShhZc6eyQD0+WLw/Hkxik20mhlNpaI4HYem
 wuJTAKuKoBv5xcGF1jnZRdGXkSxmERM8obU7KUvvepvmJlKgJxnIRgjdhzRlfkZaKTrIFvLI0Bb
 TgfuIzeBBUGTS2Tcrxj55yiOCgss5sy09n4A0QS8l3X7zoU0kBPo/ku2N0lT2Urep8NsdeiZsMB
 UqQtKxXLyi2LatT5Uf2TRsR/WBwhKR8hJ7bM0g1iq5O1qXJzbBh02C4n+qJLAj3gxCiaIsUQ6fk
 eMXbkRuJcm5KjKeHEm6pwVYZn/m8/ur/K78OF9ha6EZy4p5E9OItBb48P5u3G0iKHgf7tA/GB8e
 Gh1BPW9l7FwJu1jzZUmYH3TAlkl2HqP1d8rxaZFH70XZu58CPNwJ4YdSxXM6/GXea54LYRnw+ev
 2OyYUWbk+stz+Ww+kN9r97pXOrId5OzOs1Zf0cn77xpZq6LuOTIY5WOp9RqA6L76eHrQ==
X-Received: by 2002:a05:7300:bc8a:b0:2ab:8ef5:df2 with SMTP id
 5a478bee46e88-2baba1095b2mr100520eec.35.1770930971729; 
 Thu, 12 Feb 2026 13:16:11 -0800 (PST)
X-Received: by 2002:a05:7300:bc8a:b0:2ab:8ef5:df2 with SMTP id
 5a478bee46e88-2baba1095b2mr100507eec.35.1770930971169; 
 Thu, 12 Feb 2026 13:16:11 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba9dba2fe9sm4257860eec.7.2026.02.12.13.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 13:16:10 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 12 Feb 2026 13:16:03 -0800
Message-ID: <20260212211604.396098-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: fix net.h and policy.h circular
	include pattern
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 70A721312E5
X-Rspamd-Action: no action

While the #ifdef guards prevent the circular include from blowing up,
policy.h does not actually need anything from net.h. Remove, that include
and instead include net.h in the other files that need it.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/af_inet.c        | 2 +-
 security/apparmor/af_unix.c        | 1 +
 security/apparmor/apparmorfs.c     | 1 +
 security/apparmor/include/policy.h | 1 -
 security/apparmor/policy.c         | 1 +
 security/apparmor/policy_unpack.c  | 1 +
 6 files changed, 5 insertions(+), 2 deletions(-)

This patch applies cleanly to the Ubuntu 6.17 kernel.

diff --git a/security/apparmor/af_inet.c b/security/apparmor/af_inet.c
index 5255595a6876..c30a14bd7822 100644
--- a/security/apparmor/af_inet.c
+++ b/security/apparmor/af_inet.c
@@ -18,7 +18,7 @@
 #include "include/apparmor.h"
 #include "include/file.h"
 #include "include/label.h"
-#include "include/path.h"
+#include "include/net.h"
 #include "include/policy.h"
 #include "include/cred.h"
 
diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index f8f7d17a61ca..543f18121be3 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -20,6 +20,7 @@
 #include "include/apparmor.h"
 #include "include/file.h"
 #include "include/label.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/cred.h"
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 6b18775705f9..2253f4b7fd48 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -33,6 +33,7 @@
 #include "include/crypto.h"
 #include "include/ipc.h"
 #include "include/label.h"
+#include "include/net.h"
 #include "include/policy.h"
 #include "include/policy_ns.h"
 #include "include/resource.h"
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index e3cf1a03f79d..855657b3d2b9 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -26,7 +26,6 @@
 #include "file.h"
 #include "lib.h"
 #include "label.h"
-#include "net.h"
 #include "perms.h"
 #include "resource.h"
 
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 7fa346000aa9..9ae858a203bc 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -81,6 +81,7 @@
 #include "include/file.h"
 #include "include/ipc.h"
 #include "include/match.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/policy_ns.h"
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 74cdfdd43d7e..7d4dd17a97be 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -25,6 +25,7 @@
 #include "include/crypto.h"
 #include "include/file.h"
 #include "include/match.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/policy_unpack.h"
-- 
2.43.0


