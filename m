Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 57500986649
	for <lists+apparmor@lfdr.de>; Wed, 25 Sep 2024 20:30:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1stWmK-0002vy-G5; Wed, 25 Sep 2024 18:30:20 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1stWmI-0002vp-7x
 for apparmor@lists.ubuntu.com; Wed, 25 Sep 2024 18:30:18 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F310E3F6EB
 for <apparmor@lists.ubuntu.com>; Wed, 25 Sep 2024 18:30:17 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-719b6c55a7cso290394b3a.0
 for <apparmor@lists.ubuntu.com>; Wed, 25 Sep 2024 11:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727289016; x=1727893816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFWYt4LzAK0BBuyZr84k/GExwtwwTwDFSMvxRBe3vXI=;
 b=cJQ6p869azVPFcRL6oPTTFnmK/pVRU1iacKZc39kRDC2q9XTBIH8c6dfivc6OCEQGc
 uHiC1uThjr57Q66f5nAFFtJOTCqayKDUR4pQXP22CI///jbnKMYIUnuUvx+VEDbMDfkt
 JimLS1YCwQ3YcK5q+YtYFQNDSmm7zk5vxjJLCy4gmlddCo8LrX19Fw1GnRW1HpAB7+nL
 81HcJbDc9+GTFIq0gZ6J02Ma57roArmPsHkCYpSBjv4FtVveAykdRm5T3EViOgqqII9D
 qXtwhc9Xxic0WE7HuicbiZl1LYM/L7MzDbZq6XyRKuTkTT8//DbU8wW5eRZjZS+A//JT
 4IwA==
X-Gm-Message-State: AOJu0YzIzsEDXF+Yxm0Bmox5+DJgLuw5LwRkS9WMRF9EAv4CRAGletVX
 AukPPQfL9Xt+HdswiSLyPh2iJzwA3nQeMtuu8TptP/YHRfy7n7DlFgMkdz93WySr/m5WF3ryrdt
 /ianNX3W6bFC3cH/0Ci6Hfpn7DD6etP5vL5T98xrChXMpTiwkiJ3nSHskeUFtP7hc0ZtzwR2sYE
 yJPEaufQ==
X-Received: by 2002:a05:6a21:3403:b0:1cf:ff65:22f4 with SMTP id
 adf61e73a8af0-1d4e0be9f1emr4356173637.41.1727289016230; 
 Wed, 25 Sep 2024 11:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlGhGKjdIIYXPyxSb/wjesfnwvjgexZRWqdPJRr7X+9Z5mDMmDGIDB03cOw8pRMzGTXtb/Q==
X-Received: by 2002:a05:6a21:3403:b0:1cf:ff65:22f4 with SMTP id
 adf61e73a8af0-1d4e0be9f1emr4356153637.41.1727289015894; 
 Wed, 25 Sep 2024 11:30:15 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71afc939f75sm3029138b3a.125.2024.09.25.11.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 11:30:15 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 25 Sep 2024 11:30:11 -0700
Message-ID: <20240925183012.455272-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: audit_cap dedup based on subj_cred
	instead of profile
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

The previous audit_cap cache deduping was based on the profile that was
being audited. This could cause confusion due to the deduplication then
occurring across multiple processes, which could happen if multiple
instances of binaries matched the same profile attachment (and thus ran
under the same profile) or a profile was attached to a container and its
processes.

Instead, perform audit_cap deduping over ad->subj_cred, which ensures the
deduping only occurs across a single process, instead of across all
processes that match the current one's profile.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/capability.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 61d7ab4255b0..3729c7fc86f9 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -32,7 +32,7 @@ struct aa_sfs_entry aa_sfs_entry_caps[] = {
 };
 
 struct audit_cache {
-	struct aa_profile *profile;
+	const struct cred *ad_subj_cred;
 	/* Capabilities go from 0 to CAP_LAST_CAP */
 	u64 ktime_ns_expiration[CAP_LAST_CAP+1];
 };
@@ -95,14 +95,14 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
 	/* Do simple duplicate message elimination */
 	ent = &get_cpu_var(audit_cache);
 	/* If the capability was never raised the timestamp check would also catch that */
-	if (profile == ent->profile && ktime_get_ns() <= ent->ktime_ns_expiration[cap]) {
+	if (ad->subj_cred == ent->ad_subj_cred && ktime_get_ns() <= ent->ktime_ns_expiration[cap]) {
 		put_cpu_var(audit_cache);
 		if (COMPLAIN_MODE(profile))
 			return complain_error(error);
 		return error;
 	} else {
-		aa_put_profile(ent->profile);
-		ent->profile = aa_get_profile(profile);
+		put_cred(ent->ad_subj_cred);
+		ent->ad_subj_cred = get_cred(ad->subj_cred);
 		ent->ktime_ns_expiration[cap] = ktime_get_ns() + AUDIT_CACHE_TIMEOUT_NS;
 	}
 	put_cpu_var(audit_cache);
-- 
2.43.0
The patch, as currently presented, depends on the patch "apparmor: add a
cache entr expiration time aging out capability audit cache"
(https://lists.ubuntu.com/archives/apparmor/2024-September/013368.html)
being applied first, but I can produce a version of this patch that applies
without that one if necessary.

