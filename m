Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB797D9E8
	for <lists+apparmor@lfdr.de>; Fri, 20 Sep 2024 21:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1srjh6-0006Fd-A8; Fri, 20 Sep 2024 19:53:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1srjh4-0006FP-BF
 for apparmor@lists.ubuntu.com; Fri, 20 Sep 2024 19:53:30 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0B4F53F193
 for <apparmor@lists.ubuntu.com>; Fri, 20 Sep 2024 19:53:30 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d889fde2aaso3081012a91.0
 for <apparmor@lists.ubuntu.com>; Fri, 20 Sep 2024 12:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726862008; x=1727466808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0FtPeY+2k8eWB5vNiZD8wdSSo7ZZUk/zlWz5HzNo0c=;
 b=fvmNBEzMnO5bN3IJZOqpIpQoDN0yjjoI7+eDbJGEHfpi6PDV/RIO9ijSNEWFS7ffr4
 owkfTFixF3p0lbtHXUl/1YcKJE0zmdVcYYAKCu2YrT1z3FvUP7sEGsIRgEM9nU2NKkP1
 9ut7wsp4UdfyCRQ2zanyHIoyY9GMz9ZYcz9I+VXmADlaAdLQxJYDHJCROg9flSERJzms
 BE6AWpd4J74d3eljXurl2YP4QW98msD5mUbbj9NTvEBRO40ehyIPdvqisU/xj2qGXKs2
 Hn3buh1jJ7mxpGT0Vzsh8LuXckRSt8KmxwT+edbWbxyypEm6F8x1ZAVCc8/kVHmCsACi
 ADBw==
X-Gm-Message-State: AOJu0YyhtDrsCTVUJdPwZLHWQPCvESAEOccSIMGgg88b4o39wGE+Z7hz
 CxxRNPBcqBnITxJXTWUcPs67cK8qJU0pl/g8pdSe1q0j9VXaNx6WAiR3+0w4mqpiX1B7mnFwLjA
 k/7OUVoWF7DUnzsuCMWRc9/1Ezpp98QSuPSdBanYFCy3m2RwpJH5ZYmZoNFEvj6ILzvbPUaEPa/
 PjEhII3A==
X-Received: by 2002:a17:90b:4a10:b0:2d8:b26f:694f with SMTP id
 98e67ed59e1d1-2dd80c4dd76mr4612499a91.17.1726862008640; 
 Fri, 20 Sep 2024 12:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8WW4IVh5gUt669vPytqBDLmdhnNHNTwF4KoEqzqBTm7hfOPEDbEwJLAQhnthVlKIRTug0rQ==
X-Received: by 2002:a17:90b:4a10:b0:2d8:b26f:694f with SMTP id
 98e67ed59e1d1-2dd80c4dd76mr4612485a91.17.1726862008286; 
 Fri, 20 Sep 2024 12:53:28 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd7f955c86sm2366855a91.52.2024.09.20.12.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 12:53:27 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 20 Sep 2024 12:53:15 -0700
Message-ID: <20240920195317.325627-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2] apparmor: add a cache entry expiration time
	aging out capability audit cache
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
profile and add a timestamp expiration check before doing the audit.

v1 -> v2:
 - Hardcode a longer timeout and drop the patches making it a sysctl,
   after discussion with John Johansen.
 - Cache the expiration time instead of the last-audited time. This value
   can never be zero, which lets us drop the kernel_cap_t caps field from
   the cache struct.

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
@@ -33,6 +34,7 @@ struct aa_sfs_entry aa_sfs_entry_caps[] = {
 struct audit_cache {
 	struct aa_profile *profile;
-	kernel_cap_t caps;
+	/* Capabilities go from 0 to CAP_LAST_CAP */
+	u64 ktime_ns_expiration[CAP_LAST_CAP+1];
 };
 
 static DEFINE_PER_CPU(struct audit_cache, audit_cache);
@@ -64,6 +67,8 @@ static void audit_cb(struct audit_buffer *ab, void *va)
 static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile,
 		      int cap, int error)
 {
+	const u64 AUDIT_CACHE_TIMEOUT_NS = 1000*1000*1000; /* 1 second */
+
 	struct aa_ruleset *rules = list_first_entry(&profile->rules,
 						    typeof(*rules), list);
 	struct audit_cache *ent;
@@ -90,7 +94,8 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 
 	/* Do simple duplicate message elimination */
 	ent = &get_cpu_var(audit_cache);
-	if (profile == ent->profile && cap_raised(ent->caps, cap)) {
+	/* If the capability was never raised the timestamp check would also catch that */
+	if (profile == ent->profile && ktime_get_ns() <= ent->ktime_ns_expiration[cap]) {
 		put_cpu_var(audit_cache);
 		if (COMPLAIN_MODE(profile))
 			return complain_error(error);
@@ -99,6 +104,6 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 		aa_put_profile(ent->profile);
 		ent->profile = aa_get_profile(profile);
-		cap_raise(ent->caps, cap);
+		ent->ktime_ns_expiration[cap] = ktime_get_ns() + AUDIT_CACHE_TIMEOUT_NS;
 	}
 	put_cpu_var(audit_cache);
 
-- 
This patch supersedes an earlier patchset with tags [RFC, PATCH #/3] with the same subject line.

