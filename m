Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F8AA680C
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 02:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAehP-0007Im-Sq; Fri, 02 May 2025 00:56:19 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAehO-0007Gy-6b
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 00:56:18 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 974423F5B1
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 00:56:17 +0000 (UTC)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-afd3f1adff7so1847511a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 17:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746147376; x=1746752176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vB/xgsfPTK0VGcoXuV1VvfoW7pWrb+fAc1NRvRE262E=;
 b=WUPpRlt2s8NJbYufT4MqZj5E9BuByU9lQZl5S8LCC0j6JHdaXFwo204FmfLSeG+26Y
 Dh/hjlv4MIvTZjCUxZ9p33fUUdaV/dZFSLrJa9YmQiExxx8lkWZX1Ftevx2Z2x9gzcay
 u1lqrTa0Ueq1JIBc8ns0Ej/HEWhozEU8kV5n0As3nZ8ACJ2kcCsErKqzWf0AJJgnW3n9
 msT+jFHT+npxRahkt8wnEGKsA0QlkeuZY7BUl7qE6O7V38h7kXwqWkmV9FIrOT/Ph8j9
 EuzhfiC5ZOnPqKSICWK0fevQP8bCVA25yPqB0MV6qfTn6TFbV+3zbVWQaQcw4CV5z0dh
 0ojw==
X-Gm-Message-State: AOJu0YybeV3GVDj7BsfkO3vBXBfEgke4LonCHnMSLpWIxi1sNwrxCjAJ
 FHq2VtAdkN/jBLaUXRVWVNLymVibN4XYcdndLIUOmxg5CQbQ8s8PRIz9aJdmDeMfF77aRvaEnEt
 PCEIC74k2gVMoGXG6wue724ziGTWXZI/0ay41wkn8BeOUpv3Js/dNqm12J8SCG2gsn2M7Qb8k+Y
 zSadSTfIlp
X-Gm-Gg: ASbGncteIZxuRrfkxtRpwlJUpp9lRlQhFKw1a3V/Mhk6OTllJ7d7AgRV6rTgUY85iTL
 MHSGa43jHD7wDOJ2ucvXudWGdlRxAcudoeKt8HfCn7UEC3HFV/vUDIvfAt9ByJ9scxcX7KhbV8M
 RXO74xvT4dGClxm5beJBdvfQUqJ1fLQ9nAUbvqve/paL4LvazprlZSvubNW7LJsTPMmW3mg2eP8
 9KZvowvvh0HXJJFdflfUCxQz+/veaFhSepa3DdGX4cvYQUTrjcJRPR9Vlv3vrT9Mycg5us0cpKb
 MMzCzuDPogVSnqeaBYUZAnKWkRMVhdWDmQWtJPe4ow6O+dvMKy0LWdh09VMTgaU3Wk0T6g==
X-Received: by 2002:a17:902:d486:b0:21f:40de:ae4e with SMTP id
 d9443c01a7336-22e100563eemr15234955ad.9.1746147376253; 
 Thu, 01 May 2025 17:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2NGbEmjEdALp2cyWKjBeGwV4HO2lXWOegl3fzDGUSrhTiIk9MJnl7r2etpAh81jwTHUMBIw==
X-Received: by 2002:a17:902:d486:b0:21f:40de:ae4e with SMTP id
 d9443c01a7336-22e100563eemr15234745ad.9.1746147375888; 
 Thu, 01 May 2025 17:56:15 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fdc70sm2655635ad.108.2025.05.01.17.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 17:56:15 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 17:55:45 -0700
Message-ID: <20250502005558.8257-4-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502005558.8257-1-ryan.lee@canonical.com>
References: <20250502005558.8257-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 3/4] apparmor: include conflicting attachment
	info for confined ix/ux fallback
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

Instead of silently overwriting the conflicting profile attachment string,
include that information in the ix/ux fallback string that gets set as info
instead. Also add a warning print if some other info is set that would be
overwritten by the ix/ux fallback string or by the profile not found error.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index a73307ee1c7f..e8cd9badfb54 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -30,6 +30,10 @@
 #include "include/policy_ns.h"
 
 static const char * const CONFLICTING_ATTACH_STR = "conflicting profile attachments";
+static const char * const CONFLICTING_ATTACH_STR_IX =
+	"conflicting profile attachments - ix fallback";
+static const char * const CONFLICTING_ATTACH_STR_UX =
+	"conflicting profile attachments - ux fallback";
 
 /**
  * may_change_ptraced_domain - check if can change profile on ptraced task
@@ -577,6 +579,8 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 	struct aa_label *stack = NULL;
 	struct aa_ns *ns = profile->ns;
 	u32 xtype = xindex & AA_X_TYPE_MASK;
+	/* Used for info checks during fallback handling */
+	const char *old_info = NULL;
 
 	switch (xtype) {
 	case AA_X_NONE:
@@ -612,12 +616,32 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 			/* (p|c|n)ix - don't change profile but do
 			 * use the newest version
 			 */
-			*info = "ix fallback";
+			if (*info == CONFLICTING_ATTACH_STR) {
+				*info = CONFLICTING_ATTACH_STR_IX;
+			} else {
+				old_info = *info;
+				*info = "ix fallback";
+			}
 			/* no profile && no error */
 			new = aa_get_newest_label(&profile->label);
 		} else if (xindex & AA_X_UNCONFINED) {
 			new = aa_get_newest_label(ns_unconfined(profile->ns));
-			*info = "ux fallback";
+			if (*info == CONFLICTING_ATTACH_STR) {
+				*info = CONFLICTING_ATTACH_STR_UX;
+			} else {
+				old_info = *info;
+				*info = "ux fallback";
+			}
+		}
+		/* We set old_info on the code paths above where overwriting
+		 * could have happened, so now check if info was set by
+		 * find_attach as well (i.e. whether we actually overwrote)
+		 * and warn accordingly.
+		 */
+		if (old_info && old_info != CONFLICTING_ATTACH_STR) {
+			pr_warn_ratelimited(
+				"AppArmor: find_attach (from profile %s) audit info \"%s\" dropped",
+				profile->base.hname, old_info);
 		}
 	}
 
@@ -703,6 +727,11 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 			/* hack ix fallback - improve how this is detected */
 			goto audit;
 		} else if (!new) {
+			if (info) {
+				pr_warn_ratelimited(
+					"AppArmor: profile_transition (from profile %s) audit info \"%s\" dropped on missing transition",
+					profile->base.hname, info);
+			}
 			info = "profile transition not found";
 			/* remove MAY_EXEC to audit as failure or complaint */
 			perms.allow &= ~MAY_EXEC;
-- 
2.43.0


