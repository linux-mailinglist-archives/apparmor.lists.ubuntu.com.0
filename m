Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBDjKqeKj2nURQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 21:33:43 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 81737139723
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 21:33:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqzqy-0000ip-DI; Fri, 13 Feb 2026 20:33:28 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqzqx-0000ic-0y
 for apparmor@lists.ubuntu.com; Fri, 13 Feb 2026 20:33:27 +0000
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D99A33FCC5
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1771014806;
 bh=i9DCpvmhvH3AlttUkDaI/3fWdUR5B3nkDXB2hKoi5z4=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=shqhnINwQ1FTAOC7uoSPARpJQKLFsNw1PlL6UiwCOQTuHsG2In0j0nUowigj9Y2P+
 +eiAdfcQep4csVYuo6w+zSlBgY+hSQwXldScWisH3W4mQfGbch39sh5UUjaLR+mIMP
 n8yZLUKY45MdT5E8cGmfJ3+9SJnmG1ciU8zjc4tO2m/SHYzmYTEZeVVC4cikVo4mJG
 0og5UhAD+7q7J4cdYo7ku3fa25rZ0Ezyt60bGMHTrPG0DVEM6ZdaLK01cGMiMHoeq6
 Oy2AUUL4wHW3oqvPkxaPJjd9yx9foXJkshQ2ClKhvbR0WBq7MNjfd+30ySWITx0OW1
 q6msD0HHpsdpsQUvognMlVs7gWJZRH5+urn/Ukq4MSicfBzKDt1kpyaTXV6da0RGVC
 RERc/JsrprnX7qtp1vp8HeEB/xSMzuMSisfpIkb62Lx2SYOWlwWB5ex8ksmwlWrghM
 Zjr2bJR1SL8GOb8ZW3mavlXn6++wLiPZJovQIEQGrZFkj57shie5zOEFnigOCZ1uSX
 pZxBuzw3myUSYIM3NvhXppcl+1wwAgckDW/S7jLYAmRktFELcDiqQ0S09BRvV4OJ5C
 PUIeKw5/k+cJTgDkmFfDsrluhcaRhvCCdUfZLy3mGCIfUPNc6YIJ/fnlgVlNJqymyn
 yfVvLlTIGgQNxwLLL3xrIoZw=
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-12737f276a2so3715481c88.1
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 12:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771014805; x=1771619605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9DCpvmhvH3AlttUkDaI/3fWdUR5B3nkDXB2hKoi5z4=;
 b=eFqj18XJiGjcW34uAH5fb4+uf0/BV0RQvB16e1a5tH9NrMwVVagEBwBDA2jC6Kfw5h
 iwfG3k0akc6XRfF3hF/P1WfW1aVcdHANk+9XqfbPH2FLgJ23WcBuoT/I6GTiLVgk2q9u
 JAds/laNXnrqa45J6EOEi1TGzAgqHWbYTh1UtDwDkFbn6hwBhXU3zP7fqmkzPFqL9EZm
 ASS+Ix3ddLctjeiwHkQs78U+mrLMGx03MgrSNsX11mSm1IZz4pF7HW+r5Q1eN4mBzgjP
 SShRZxGCvZprLqIqQEGGhW5EZEg4UYsKidZxs0vdt8KVTAhcfYxGaRnSaqRtbA+uz2Qc
 Yd5w==
X-Gm-Message-State: AOJu0YwjEizQeC1LkZCSEuTt5Yfq4nDY1kYirfxxAZf64MNIvVTXRwYI
 gBTxsUTZ+C3NPbOdT6wUyYffH4MJV54zws8NfCK9Ss/I/Io8kihSTkCPUeMmoe3pW8CUjQGFMEg
 FAzxrgMEMZhvKw0mJlTZXv+Wuude2dNy2MZFdsm+t/oAZGLS7KiHgcSxbZR7upnlUNSyqtI+rJF
 k0OWXIVONwjw==
X-Gm-Gg: AZuq6aKIqIOalC9I1mF1B5gHzLmjXEI6eY1XGMLeg5zDyyOcoj3el0aBn5Kk9Bbig0F
 qtu/UpxQOD4HMcQ+P8nvFnpty8HZ9aq7XsaAQ24Jz9MbyfYsQPZeTVEbx0302214gvsM+lrPUsc
 f0j+gnsmYbg8VS8+NT5Z/hmiQ8TaisEeAYS7NR5SNQSJH/q3msFzewT7gok3E4lpcsnV0kKcufF
 xv2WMd4Jp2pFsLLImd420GpJZq3hP22C3ptKpKm0RyI6s8PXFegMcmX/5yriOGHIya11D1Z3XeR
 +875BgG7OsZsduOZWP8yPLcLtudMP8Bo1NVTAK5Eqx9Al6wpD0bRvfGVHQ/6INHMCKdHL7/MxmN
 vyWAeEX9s6e2vaBBX3GAUIRvkxpfRSAfONkayeL0byblXt4b1ppanWgRRL0lBU+wNBxyWClQt3O
 SF17ToxC4fFScr47yW3+CdK/TUJqxOk3NVRWVc42BC1OdVyeeRn/JNC2P79DpXhjbayw==
X-Received: by 2002:a05:7022:249c:b0:119:e56b:989b with SMTP id
 a92af1059eb24-1273adef076mr1037854c88.2.1771014805233; 
 Fri, 13 Feb 2026 12:33:25 -0800 (PST)
X-Received: by 2002:a05:7022:249c:b0:119:e56b:989b with SMTP id
 a92af1059eb24-1273adef076mr1037844c88.2.1771014804744; 
 Fri, 13 Feb 2026 12:33:24 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12742aff32asm35089c88.0.2026.02.13.12.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 12:33:24 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Feb 2026 12:33:20 -0800
Message-ID: <20260213203321.996417-1-ryan.lee@canonical.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 81737139723
X-Rspamd-Action: no action

Besides of resolving clangd IDE warnings, self-contained headers will be
less likely to break if the surrounding includes in .c files using them
change.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/apparmorfs.h    | 3 +++
 security/apparmor/include/audit.h         | 3 ++-
 security/apparmor/include/capability.h    | 1 +
 security/apparmor/include/ipc.h           | 2 ++
 security/apparmor/include/path.h          | 3 +++
 security/apparmor/include/perms.h         | 1 +
 security/apparmor/include/policy_unpack.h | 1 +
 security/apparmor/include/procattr.h      | 2 ++
 security/apparmor/include/resource.h      | 1 +
 security/apparmor/include/secid.h         | 1 +
 security/apparmor/include/task.h          | 5 +++++
 11 files changed, 22 insertions(+), 1 deletion(-)

This patch applies cleanly to the upstream kernel.

diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index dd580594dfb7..e8f8c0953364 100644
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
diff --git a/security/apparmor/include/audit.h b/security/apparmor/include/audit.h
index 1a71a94ea19c..851fd2821a6c 100644
--- a/security/apparmor/include/audit.h
+++ b/security/apparmor/include/audit.h
@@ -17,9 +17,10 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
-#include "file.h"
 #include "label.h"
 
+struct aa_profile;
+
 extern const char *const audit_mode_names[];
 #define AUDIT_MAX_INDEX 5
 enum audit_mode {
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
index 323dd071afe9..98dc0b6c05a7 100644
--- a/security/apparmor/include/ipc.h
+++ b/security/apparmor/include/ipc.h
@@ -13,6 +13,8 @@
 
 #include <linux/sched.h>
 
+#include "label.h"
+
 #define SIGUNKNOWN 0
 #define MAXMAPPED_SIG 35
 
diff --git a/security/apparmor/include/path.h b/security/apparmor/include/path.h
index 8bb915d48dc7..250812a77e11 100644
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
diff --git a/security/apparmor/include/perms.h b/security/apparmor/include/perms.h
index 37a3781b99a0..3a472c11c4b1 100644
--- a/security/apparmor/include/perms.h
+++ b/security/apparmor/include/perms.h
@@ -11,6 +11,7 @@
 #define __AA_PERM_H
 
 #include <linux/fs.h>
+#include "audit.h"
 #include "label.h"
 
 #define AA_MAY_EXEC		MAY_EXEC
diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index a6f4611ee50c..c65a83682737 100644
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
 
diff --git a/security/apparmor/include/resource.h b/security/apparmor/include/resource.h
index ad2c0da8e64f..a3d1cd28b403 100644
--- a/security/apparmor/include/resource.h
+++ b/security/apparmor/include/resource.h
@@ -15,6 +15,7 @@
 #include <linux/sched.h>
 
 #include "apparmorfs.h"
+#include "label.h"
 
 struct aa_profile;
 
diff --git a/security/apparmor/include/secid.h b/security/apparmor/include/secid.h
index 6025d3849cf8..a0d458d7ffa4 100644
--- a/security/apparmor/include/secid.h
+++ b/security/apparmor/include/secid.h
@@ -10,6 +10,7 @@
 #ifndef __AA_SECID_H
 #define __AA_SECID_H
 
+#include <linux/security.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
index b1aaaf60fa8b..017d8b06b8f2 100644
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


