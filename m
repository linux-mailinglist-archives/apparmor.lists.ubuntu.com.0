Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66F978BD2
	for <lists+apparmor@lfdr.de>; Sat, 14 Sep 2024 01:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1spFbU-0004y6-E5; Fri, 13 Sep 2024 23:21:28 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1spFbS-0004xp-L9
 for apparmor@lists.ubuntu.com; Fri, 13 Sep 2024 23:21:26 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 73E373F2FC
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 23:21:26 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-718d6428b8bso2905112b3a.3
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 16:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726269685; x=1726874485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIN4jBCdKp0flRAICAg2aiyXWghS/T074nHbUraxUoM=;
 b=wuN+yn9Lq0N2FREGvxYJrlUfLipLQHhqV5md7hMOZhf4VySsbaGuWbcAn6Z3VdCORR
 xEHpMFTfIWSmEuCGfrvp46ILEhoaqV/10GOyldG7cfrz7OehqNJMWeZKJB63ec0Ukiyt
 jRcIE6ykNEmYfPRds1pc6yXrAM7/Wi2SRPmOgzLwcxxuqPAFbXDT9qXZktzV/uzltOrb
 luDIapI9wA7db2N1/ZUB7WDyy+J7fpQkBjYeNNLYSp0w8+Iy5mxgQ7FKnuIjwxPte5Y+
 gujyigo0PxjAmc6cv4u8Lh+YO+R4NcCEOsxamQamt7xhNhLd8hUOI36Ni+lo1ThVZt9s
 q5NA==
X-Gm-Message-State: AOJu0YyQU2VcsGBq7kQ+M/UU9inG+15trlfOjyzqBm/UjLms3LDqBSNX
 EcfF3nJeVt5xGpxX81ar+bAoEPTwcEheJYYpXc3xgVG7FTh09TkMFhGDYeK8epdtEE6WAMCQ1O7
 Lw9R7lI+24CmZh9RX0fipsbGP3Pd1cr7n8dznVjOXAHfk1wiOrET4KisCZNi+oRNDoh20/qXRRv
 ffZIQVuQ==
X-Received: by 2002:a05:6a00:4b52:b0:717:9754:4ade with SMTP id
 d2e1a72fcca58-719261edaaemr11148154b3a.22.1726269684923; 
 Fri, 13 Sep 2024 16:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiEdGm6WTu2RIs6bHkSrYUp5EAqh+/7QIwvoqqtTa9KN8UV8/17KIZd0fcLNr0vqEoBNeiiw==
X-Received: by 2002:a05:6a00:4b52:b0:717:9754:4ade with SMTP id
 d2e1a72fcca58-719261edaaemr11148125b3a.22.1726269684440; 
 Fri, 13 Sep 2024 16:21:24 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944ab507asm112103b3a.50.2024.09.13.16.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 16:21:24 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Sep 2024 16:20:58 -0700
Message-ID: <20240913232104.1632869-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC,
	PATCH 1/3] apparmor: add a cache entry expiration time aging out
	capability audit cache
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

When auditing capabilities, AppArmor uses a per-CPU, per-profile cache
such that the same capability for the same profile doesn't get repeatedly
audited, with the original goal of reducing audit logspam. However, this
cache does not have an expiration time, resulting in confusion when a
profile is shared across binaries (for example) and an expected DENIED
audit entry doesn't appear, despite the cache entry having been populated
much longer ago. This confusion was exacerbated by the per-CPU nature of
the cache resulting in the expected entries sporadically appearing when
the later denial+audit occurred on a different CPU.

To resolve this, record the last time a capability was audited for a
profile and add a timestamp expiration check before doing the audit. This
first patch hardcodes a small duration for the timeout period.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/capability.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 7c0f66f1b297..64005b3d0fcc 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/gfp.h>
 #include <linux/security.h>
+#include <linux/timekeeping.h>
 
 #include "include/apparmor.h"
 #include "include/capability.h"
@@ -33,6 +34,8 @@ struct aa_sfs_entry aa_sfs_entry_caps[] = {
 struct audit_cache {
 	struct aa_profile *profile;
 	kernel_cap_t caps;
+	/* Capabilities go from 0 to CAP_LAST_CAP */
+	u64 ktime_ns_last_audited[CAP_LAST_CAP+1];
 };
 
 static DEFINE_PER_CPU(struct audit_cache, audit_cache);
@@ -65,6 +68,8 @@ static void audit_cb(struct audit_buffer *ab, void *va)
 static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile,
 		      int cap, int error)
 {
+	const u64 AUDIT_CACHE_TIMEOUT_NS = 100*1000; /* 100 us */
+	u64 audit_cache_expiration;
 	struct aa_ruleset *rules = list_first_entry(&profile->rules,
 						    typeof(*rules), list);
 	struct audit_cache *ent;
@@ -90,7 +95,9 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 
 	/* Do simple duplicate message elimination */
 	ent = &get_cpu_var(audit_cache);
-	if (profile == ent->profile && cap_raised(ent->caps, cap)) {
+	audit_cache_expiration = ent->ktime_ns_last_audited[cap] + AUDIT_CACHE_TIMEOUT_NS;
+	if (profile == ent->profile && cap_raised(ent->caps, cap)
+			&& ktime_get_ns() <= audit_cache_expiration) {
 		put_cpu_var(audit_cache);
 		if (COMPLAIN_MODE(profile))
 			return complain_error(error);
@@ -99,6 +106,7 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 		aa_put_profile(ent->profile);
 		ent->profile = aa_get_profile(profile);
 		cap_raise(ent->caps, cap);
+		ent->ktime_ns_last_audited[cap] = ktime_get_ns();
 	}
 	put_cpu_var(audit_cache);
 
-- 
Major items I'm seeking input on (reason for RFC designation):
- Whether storing a timestamp per capability is the best approach or whether we should do something else
- Whether to hardcode the expiration offset or whether to expose it as a sysctl (see PATCH 3/3 of this series)


