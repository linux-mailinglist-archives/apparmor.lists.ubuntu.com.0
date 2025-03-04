Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2EA4D090
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:12:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGpK-0003Uy-8o; Tue, 04 Mar 2025 01:12:06 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGpI-0003UK-FL
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:12:04 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 465F13F129
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:12:01 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22348343f5aso91784735ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741050720; x=1741655520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sctD7ds0IP3JyAJVEv+XZfH08lF02x3eFbhWuZqj8c=;
 b=jiKIzShbipWKManQzJgfXYBkFvk1R6e8Rl1jO3lK3FnAH/naObKIivCC9X6yL3aP11
 TXXfpcEdnMAM9JxzlvnG+AQvMvgIJRJmdjjWREoL2oWQmaHRqPcnEhqDcMGIiALMBBBB
 Hw3NJWk+DHpGQCswz3B1PCJ9XZZmtbAc/fszQxL/9Zu0tuxrtqKH2QTIIIIOxY1pTx1g
 kuRTMYA5S+yCQlZrg5ZEPMmcNpY1hYlf/X7jwfLDx7FlNjXrQd8VebSc8cAWP7AoOfcp
 sgPOBRUzVoIJaW9mPH3nNPI5/7XRQstwT7X2SrMHG7HBJj++qH4cujnQBlnNzmpnDmhX
 A4QA==
X-Gm-Message-State: AOJu0YyLUQDKd9dqpmRyMfaCXpikGh3WlK4eYJ10z1djtWlbaAfk17l7
 wv2uqiC9cbeEk/OCJOJQ4cKnVyHQPCqba+cukbciUi8zjVTdIjNMHVSNcG9ivTBu+h8XSHlhO1Z
 MwtGPZwt7kPdF31mSxK+9PKjltDFj6FGlXl1ek1II1wNYNNbDohB9DsHs/55xcBI+o6NM+kV/0A
 +xD125UA==
X-Gm-Gg: ASbGncs+tznrMMHo2u5700CyO0LXV8r5XKzvkryuVjMLdgpY4DfWIELU3+g6KBCOHfn
 lVYMDKR+9o6ImjVkaQ9XOQ822KCKTQZqmZTmfNJ8KLVl1k5FnXie++2ITcDiRTuxGFUbIO/7DWt
 GXuIs3sizgkzW8e9sJSkpJx4sGacegrya7gCc1Y8XG4haHCCG8rsGNGVk5yDoRimk1NJklG76HV
 d4ErBxuKQIetfNL45dIfH506upiEE/5PG1djdurt5AfRV0SzlnZ/Yt24d/9peLzncEU88K3BRYc
 yw7PNPP6ZYYxXHBKXF6QyO75EplX+AY2nY4OgWrKlabHcd3WUe9HIdqT+SeoU5X8K1icNOs=
X-Received: by 2002:a17:903:244d:b0:223:325c:89f6 with SMTP id
 d9443c01a7336-22368f6a614mr241899745ad.10.1741050719948; 
 Mon, 03 Mar 2025 17:11:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuUUObFBIJYnqAd62p8fO5FUilV2IkcoiQnlKaCxGF7gCSOWVOssOwjk9a4VX2GubK3+kSSA==
X-Received: by 2002:a17:903:244d:b0:223:325c:89f6 with SMTP id
 d9443c01a7336-22368f6a614mr241899365ad.10.1741050719599; 
 Mon, 03 Mar 2025 17:11:59 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052c806sm84056955ad.235.2025.03.03.17.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:11:59 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:11:38 -0800
Message-ID: <20250304011144.31433-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304011144.31433-1-ryan.lee@canonical.com>
References: <20250304011144.31433-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/5] apparmor: constify some pointer arguments to
	some audit-related functions
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

The constified pointer arguments are not actually modified, so encode this
into the function prototypes.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/audit.c          | 10 +++++-----
 security/apparmor/include/audit.h  | 10 +++++-----
 security/apparmor/include/policy.h |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
index f0619676fc4a..100eaf9cab00 100644
--- a/security/apparmor/audit.c
+++ b/security/apparmor/audit.c
@@ -302,8 +302,8 @@ static int uid_cmp(kuid_t lhs, kuid_t rhs)
 }
 
 /* std C cmp.  negative is less than, 0 is equal, positive greater than */
-long aa_audit_data_cmp(struct apparmor_audit_data *lhs,
-		       struct apparmor_audit_data *rhs)
+long aa_audit_data_cmp(const struct apparmor_audit_data *lhs,
+		       const struct apparmor_audit_data *rhs)
 {
 	long res;
 
@@ -374,7 +374,7 @@ void aa_audit_node_free_kref(struct kref *kref)
 	audit_node_free(node);
 }
 
-struct aa_audit_node *aa_dup_audit_data(struct apparmor_audit_data *orig,
+struct aa_audit_node *aa_dup_audit_data(const struct apparmor_audit_data *orig,
 					gfp_t gfp)
 {
 	struct aa_audit_node *copy;
@@ -477,8 +477,8 @@ __out_skip:								\
 })
 
 // increments refcount on node
-struct aa_audit_node *aa_audit_cache_find(struct aa_audit_cache *cache,
-					  struct apparmor_audit_data *ad)
+struct aa_audit_node *aa_audit_cache_find(const struct aa_audit_cache *cache,
+					  const struct apparmor_audit_data *ad)
 {
 	struct aa_audit_node *node;
 
diff --git a/security/apparmor/include/audit.h b/security/apparmor/include/audit.h
index 97e4beccf3a7..9182abc7ed01 100644
--- a/security/apparmor/include/audit.h
+++ b/security/apparmor/include/audit.h
@@ -205,8 +205,8 @@ static inline void aa_audit_cache_init(struct aa_audit_cache *cache)
 	INIT_LIST_HEAD(&cache->head);
 }
 
-struct aa_audit_node *aa_audit_cache_find(struct aa_audit_cache *cache,
-					  struct apparmor_audit_data *ad);
+struct aa_audit_node *aa_audit_cache_find(const struct aa_audit_cache *cache,
+					  const struct apparmor_audit_data *ad);
 struct aa_audit_node *aa_audit_cache_insert(struct aa_audit_cache *cache,
 					    struct aa_audit_node *node);
 void aa_audit_cache_update_ent(struct aa_audit_cache *cache,
@@ -259,10 +259,10 @@ int aa_audit_rule_match(struct lsmblob *blob, u32 field, u32 op, void *vrule);
 
 
 void aa_audit_node_free_kref(struct kref *kref);
-struct aa_audit_node *aa_dup_audit_data(struct apparmor_audit_data *orig,
+struct aa_audit_node *aa_dup_audit_data(const struct apparmor_audit_data *orig,
 					gfp_t gfp);
-long aa_audit_data_cmp(struct apparmor_audit_data *lhs,
-		       struct apparmor_audit_data *rhs);
+long aa_audit_data_cmp(const struct apparmor_audit_data *lhs,
+		       const struct apparmor_audit_data *rhs);
 
 
 static inline struct aa_audit_node *aa_get_audit_node(struct aa_audit_node *node)
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index d5aeb7b71d29..bd89a2cd2128 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -413,7 +413,7 @@ static inline void aa_put_profile(struct aa_profile *p)
 		kref_put(&p->label.count, aa_label_kref);
 }
 
-static inline int AUDIT_MODE(struct aa_profile *profile)
+static inline int AUDIT_MODE(const struct aa_profile *profile)
 {
 	if (aa_g_audit != AUDIT_NORMAL)
 		return aa_g_audit;
-- 
2.43.0


