Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDvTKKeKj2nURQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 21:33:43 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07F139722
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 21:33:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqzqp-0000iF-8r; Fri, 13 Feb 2026 20:33:19 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqzqo-0000i8-8n
 for apparmor@lists.ubuntu.com; Fri, 13 Feb 2026 20:33:18 +0000
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 263003F637
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1771014798;
 bh=O/MFUWxnCLa/omhaMThluu/0+CHP5WlJjm7VB5wCbl8=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=cAMKco9bU7SioGUqLZjT6gJD7pVVGQMTS6cP9YjaihOyykQLtvveZg39pyRSRu2s5
 xpYgAw43DhXFa45z59s9NeuIXg7rXp0WuQbgL3kKSs3nv6nbDKtLo3xfeM2m2jVTgT
 Coq5klhTUrmoWeyPv1zyxZYgM8BiojpnfQkmnaSo8DWxsL9pMK1tkPmrcftCJNw8Fc
 xTxZvqb/2qaoeTU9pxsYjMN9CgAIEKBhPse9p6Sb9f6pRbT900LEa4d7bCrGuCY8Dj
 FFATqLOteRjxCCdO3te9H8v149/J/A1EeIW5mPcC2Wa8dDCs5KgCIX3usPAnzRQwjG
 iMJRaZo7ZIzNkwJ05x5ZAx4FpOFu+QbbpuMKFlpHM0bx+mg72Y0I2UZ6PXdUfDX8rQ
 asR93QmzSGXvtkNheclkLTAbqwLmXMxsxeOQJ0dNpg1GNg2qO4oUowveI6qG5cX6T9
 bze1QPCV+/h8YFsL1rWVp8vqIRjHUPzM7Hs/oe6KRC8bTsZZjbe1sYQp5fsgltNM55
 nCsxx/uIdL+r/ad47VW6GDHiAzfKDHj5SnE6whA/NB9GBmeUoEuxRAuSdI+XCGYJEB
 jt778u0E2cMDdYOyFdO/ktfBVOFiWtt0AlS2sM0JA4dKqBIpXz4yWgA4qRJSpFTxYu
 u6q64uE3QqqXLPpve35EMw3o=
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-12733e595e5so1676713c88.1
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 12:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771014796; x=1771619596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/MFUWxnCLa/omhaMThluu/0+CHP5WlJjm7VB5wCbl8=;
 b=CsqE0xjeFQb44mUUGVfxxYtnJKKlxKtVBjlf3BbYDHdf309xwmxnB8wdk1ckNtuxac
 v+YFZgIZelq9G8Y5FtRTBlC0eW63LfvxceDwUdxrvrn6tc0H1xBzgPYlUOjHgjbeWkqA
 GN+fmYiqsRrWkr5EYTeudWCoS4PAka6IjtjjSVib0NYbq/qahSYqekVM1kBUKBV7EEtj
 Kar9gh6DgT0rgcWgzUSQnIiHwGANHL9Aq51EGLcD5R5Ma7QqPcY+cJ3lx2+e1EANF6TD
 npgEoCilB1tfXvoRobifR6KZnbw0KC0VlvnRhZKLNs4t4rvOW4issPf9uJSFkrRV//MJ
 2moA==
X-Gm-Message-State: AOJu0YzkmDNrR+TWksF8Cc/ss3pJJ74JKIHgqrbCzpDPLsOLqeappYac
 NT9p68FwQjywsff58xyrDKmurbDDwI8WC7aRRx2PMbhvQnxO/DUoPL9z2LkNKB3rf/qUT5fqha/
 EH5HIm8rl7pnBowaKo36qElZj8XqY0xNBRX0mQJOLkBXahg98OD680mSH7JaGi074q5SscaxTU6
 oil4FytKWWlQ==
X-Gm-Gg: AZuq6aIFgk6ywBbQvXHkcJ3ngtoLG1eIQrdOWETY9DunN/dkRTnMpskNcrzr7XMUSPY
 SNl6QMCCEO8+yJt7tbKMKawUqTGP9qGAgzV+eWri9VMAewaAKYzPwTmvpCfHOOYRetw3rCYJJvf
 b4ckrb1t3ciz7UTZtlI22Ig5plj5nLjf+j5JG7oQrOUQhuFw5KID8x/WhewFacISTQ12RUNZomw
 mm9zS8jWfv0L/BfjX9Xg1iOpJlyZO8nVlgRByAZ+NYkpArxwxz6lfgUSxGQgi7z+ayUAyFLN+z2
 Rs62i3EwrrVFEM3KH1Dm5334y9y6NRrZP55y2qSG1W3cIuQ1yA4Js9ejdHN2jVhyz9SA89lVH84
 Lq/OeJ7LNug+YtOh7DvAD8RrTU1W5ddGyIyyxeFjLXukZlTZpcwMS0K7FCSoUK4GMQ2swnXkVEq
 /On76qzLRw9HpjxjcustHPle4SOrdAwyDnocTpuABYuHnTqbmaRcrQlxaPY2qVRhKicg==
X-Received: by 2002:a05:7022:4389:b0:127:3214:c869 with SMTP id
 a92af1059eb24-12741bd5001mr213612c88.44.1771014796405; 
 Fri, 13 Feb 2026 12:33:16 -0800 (PST)
X-Received: by 2002:a05:7022:4389:b0:127:3214:c869 with SMTP id
 a92af1059eb24-12741bd5001mr213608c88.44.1771014795927; 
 Fri, 13 Feb 2026 12:33:15 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1272a6fe357sm8463573c88.16.2026.02.13.12.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 12:33:15 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Feb 2026 12:33:11 -0800
Message-ID: <20260213203312.992228-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: make include headers self-contained
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 5D07F139722
X-Rspamd-Action: no action

Besides of resolving clangd IDE warnings, self-contained headers will be
less likely to break if the surrounding includes in .c files using them
change.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/apparmorfs.h    | 3 +++
 security/apparmor/include/capability.h    | 1 +
 security/apparmor/include/ipc.h           | 1 +
 security/apparmor/include/path.h          | 3 +++
 security/apparmor/include/policy_unpack.h | 1 +
 security/apparmor/include/procattr.h      | 2 ++
 security/apparmor/include/task.h          | 5 +++++
 7 files changed, 16 insertions(+)

This patch applies cleanly to the Ubuntu 6.17 kernel.

diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index 61d37ab9ee4b..ba922b918d32 100644
--- a/security/apparmor/include/apparmorfs.h
+++ b/security/apparmor/include/apparmorfs.h
@@ -11,6 +11,9 @@
 #ifndef __AA_APPARMORFS_H
 #define __AA_APPARMORFS_H
 
+#include <linux/init.h>
+#include <linux/types.h>
+
 extern struct path aa_null;
 
 enum aa_sfs_type {
diff --git a/security/apparmor/include/capability.h b/security/apparmor/include/capability.h
index 1ddcec2d1160..3fb8b8f2182a 100644
--- a/security/apparmor/include/capability.h
+++ b/security/apparmor/include/capability.h
@@ -11,6 +11,7 @@
 #ifndef __AA_CAPABILITY_H
 #define __AA_CAPABILITY_H
 
+#include <linux/capability.h>
 #include <linux/sched.h>
 
 #include "apparmorfs.h"
diff --git a/security/apparmor/include/ipc.h b/security/apparmor/include/ipc.h
index 72f2a6112892..0291da598881 100644
--- a/security/apparmor/include/ipc.h
+++ b/security/apparmor/include/ipc.h
@@ -13,6 +13,7 @@
 
 #include <linux/msg.h>
 #include <linux/sched.h>
+#include "audit.h"
 #include "inode.h"
 #include "perms.h"
 
diff --git a/security/apparmor/include/path.h b/security/apparmor/include/path.h
index 43e61c9f1fe2..b4adfb676a59 100644
--- a/security/apparmor/include/path.h
+++ b/security/apparmor/include/path.h
@@ -11,6 +11,9 @@
 #ifndef __AA_PATH_H
 #define __AA_PATH_H
 
+#include <linux/path.h>
+#include <linux/types.h>
+
 enum path_flags {
 	PATH_IS_DIR = 0x1,		/* path is a directory */
 	PATH_SOCK_COND = 0x2,
diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index 1cb72267ea0f..7ca7d710251f 100644
--- a/security/apparmor/include/policy_unpack.h
+++ b/security/apparmor/include/policy_unpack.h
@@ -16,6 +16,7 @@
 #include <linux/dcache.h>
 #include <linux/workqueue.h>
 
+#include "lib.h"
 
 struct aa_load_ent {
 	struct list_head list;
diff --git a/security/apparmor/include/procattr.h b/security/apparmor/include/procattr.h
index 03dbfdb2f2c0..56acd1bdb634 100644
--- a/security/apparmor/include/procattr.h
+++ b/security/apparmor/include/procattr.h
@@ -11,6 +11,8 @@
 #ifndef __AA_PROCATTR_H
 #define __AA_PROCATTR_H
 
+#include "label.h"
+
 int aa_getprocattr(struct aa_label *label, char **string, bool newline);
 int aa_setprocattr_changehat(char *args, size_t size, int flags);
 
diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
index ff8bed8f60b2..452d3b3baa9b 100644
--- a/security/apparmor/include/task.h
+++ b/security/apparmor/include/task.h
@@ -10,6 +10,11 @@
 #ifndef __AA_TASK_H
 #define __AA_TASK_H
 
+#include <linux/sched.h>
+
+#include "audit.h"
+#include "label.h"
+
 static inline struct aa_task_ctx *task_ctx(struct task_struct *task)
 {
 	return task->security + apparmor_blob_sizes.lbs_task;
-- 
2.43.0


