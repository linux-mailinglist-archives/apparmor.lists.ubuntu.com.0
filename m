Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A962978BD1
	for <lists+apparmor@lfdr.de>; Sat, 14 Sep 2024 01:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1spFbb-000507-Py; Fri, 13 Sep 2024 23:21:35 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1spFba-0004zR-1A
 for apparmor@lists.ubuntu.com; Fri, 13 Sep 2024 23:21:34 +0000
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B6F473F68D
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 23:21:33 +0000 (UTC)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-7d50c3d0f1aso1226291a12.3
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 16:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726269692; x=1726874492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjKX833wQjlQnNYvFehkB5ncwRsrmZKplKm5tqChim8=;
 b=OFr7RnA3m/47yAhoJ+d7g7hN/Jb8VaOySR28tl4lByNzYMAOdUIWtTy/2pzKYKonLZ
 lnQFaeY4vOic8dL4hhcFZCFxvPGVtRRa5OUfxS4A/r1WPy/1Dj607oY3lDDFsxfLBJ3F
 bUEan6YMuniOnZkIK/pN6ID61AgGxqt4/etxO/5+FsYz6fktYj5qCz6+rV1y3Wzz4AYC
 fVQ4reFBdzgxxzdo0E5EROxrTmIynM0wHnRrqlFqhDClroDqIfcUckRz3JgrBxWwuXhn
 hT0Ggcy2fzLhO/+EJX26+WRbp6EnTT3ceZotAy7wVPAytge9MFcPkNpv34upJaQocCGl
 aPFg==
X-Gm-Message-State: AOJu0Yw4N+QfP2Ys7Lt4HFmxhjKef6MfnM7U98iHejomY+kU4Ghlaj7z
 SVm9eI+kbhQ7d3zlzGLo1otXtBEnOHEvUIPQoTqROH0QrlqqwWhjdv8WSk2cWLUbRLf7yCnexwH
 c9U3Pt2RDlZ6KsMnJy0zPFkgV/lh+v9DndjBMy/DgpPGttyyFdKPEOt22fsBgvpo6V+kVbx415y
 0vNzDXCQ==
X-Received: by 2002:a05:6300:42:b0:1cf:6c87:89e5 with SMTP id
 adf61e73a8af0-1d112eaf2f9mr6630391637.48.1726269692235; 
 Fri, 13 Sep 2024 16:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExKKTxSoeNeazDPSFMgk1fGNcIbju/IjS17e1/t9NlIKt52rMPARUnsAcObyYRThvqgccS0g==
X-Received: by 2002:a05:6300:42:b0:1cf:6c87:89e5 with SMTP id
 adf61e73a8af0-1d112eaf2f9mr6630360637.48.1726269691725; 
 Fri, 13 Sep 2024 16:21:31 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944ab507asm112103b3a.50.2024.09.13.16.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 16:21:31 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Sep 2024 16:21:00 -0700
Message-ID: <20240913232104.1632869-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913232104.1632869-1-ryan.lee@canonical.com>
References: <20240913232104.1632869-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC,
	PATCH 3/3] apparmor: Make the audit cap cache timeout a sysctl
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

Instead of hardcoding the Apparmor capability audit cache timeout, expose
it as a sysctl. This uses the helper introduced in the previous patch of
this series.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/capability.c         | 6 ++++--
 security/apparmor/include/capability.h | 2 ++
 security/apparmor/lsm.c                | 7 +++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 64005b3d0fcc..764b5dd93366 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -25,6 +25,8 @@
  */
 #include "capability_names.h"
 
+unsigned int audit_cap_cache_timeout_us = 100;
+
 struct aa_sfs_entry aa_sfs_entry_caps[] = {
 	AA_SFS_FILE_STRING("mask", AA_SFS_CAPS_MASK),
 	AA_SFS_FILE_BOOLEAN("extended", 1),
@@ -68,12 +70,12 @@ static void audit_cb(struct audit_buffer *ab, void *va)
 static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile,
 		      int cap, int error)
 {
-	const u64 AUDIT_CACHE_TIMEOUT_NS = 100*1000; /* 100 us */
 	u64 audit_cache_expiration;
 	struct aa_ruleset *rules = list_first_entry(&profile->rules,
 						    typeof(*rules), list);
 	struct audit_cache *ent;
 	int type = AUDIT_APPARMOR_AUTO;
+	u64 audit_cap_cache_timeout_ns = 1000*(u64) audit_cap_cache_timeout_us;
 
 	ad->error = error;
 
@@ -95,7 +97,7 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 
 	/* Do simple duplicate message elimination */
 	ent = &get_cpu_var(audit_cache);
-	audit_cache_expiration = ent->ktime_ns_last_audited[cap] + AUDIT_CACHE_TIMEOUT_NS;
+	audit_cache_expiration = ent->ktime_ns_last_audited[cap] + audit_cap_cache_timeout_ns;
 	if (profile == ent->profile && cap_raised(ent->caps, cap)
 			&& ktime_get_ns() <= audit_cache_expiration) {
 		put_cpu_var(audit_cache);
diff --git a/security/apparmor/include/capability.h b/security/apparmor/include/capability.h
index 1ddcec2d1160..c38488b3fe00 100644
--- a/security/apparmor/include/capability.h
+++ b/security/apparmor/include/capability.h
@@ -34,6 +34,8 @@ struct aa_caps {
 	kernel_cap_t extended;
 };
 
+extern unsigned int audit_cap_cache_timeout_us;
+
 extern struct aa_sfs_entry aa_sfs_entry_caps[];
 
 kernel_cap_t aa_profile_capget(struct aa_profile *profile);
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index b9a92e500242..4af50bd3628a 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2480,6 +2480,13 @@ static struct ctl_table apparmor_sysctl_table[] = {
 		.mode           = 0600,
 		.proc_handler   = apparmor_dointvec,
 	},
+	{
+		.procname       = "apparmor_audit_capability_dedup_timeout_us",
+		.data           = &audit_cap_cache_timeout_us,
+		.maxlen         = sizeof(unsigned int),
+		.mode           = 0644,
+		.proc_handler   = apparmor_can_read_douintvec,
+	},
 	{ }
 };
 
-- 
Major items I'm seeking input on (reason for RFC designation):
- Whether to hardcode the expiration offset or whether to expose it as a sysctl

Items to bikeshed before merging:
- Name for the sysctl
- Name for the static variable that the sysctl writes to
- Type for the sysctl variable
(I used unsigned int to match the int type for the other sysctls, but semantically this should be a u64)


