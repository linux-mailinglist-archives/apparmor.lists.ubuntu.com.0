Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 46251AA680A
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 02:56:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAehI-0007F2-JC; Fri, 02 May 2025 00:56:12 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAehG-0007EZ-VR
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 00:56:11 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7A1B3F4C6
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 00:56:10 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2262051205aso11032965ad.3
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 17:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746147369; x=1746752169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpudTJm1n4r2WVjrFWfp/Pu5w0N20PQJWid9Ml5Lc/A=;
 b=a0wTzyNYVUQBIJJ+Q6hzyTCOavbWqkLY/s2z+95iQnrzRQa9ZM2i2bSqXnx/EklTb6
 /VuL3y87hAVosdz5F2uPHX6kvF86DKlhgZXiJj3aH+RbvEFHIDJnQ72D7nWCdP2eYG7q
 ySAbYDGKaxm6PSzIaPqn0bGNzPR7jY2X9LY+eDHHliaNFgnRm/6NCPJDPzoi+vumAq7o
 uzch0gJBloJm/sUA4JA/JixGLkF0aurvESzm0HiGb12VrRjucOueTm5sGpgMvrNsIaaW
 d95coSfu1qe6KdQRJUMGEP5SjzjdLF+1b4aVbA220BhaaHTk4/VpYP+e0C0qYsLiLCfi
 SySg==
X-Gm-Message-State: AOJu0YyWdGfsGuX0Hs8hfsYlsSYTAWZQ/7w6EJm53qe0pDibUAlI76/c
 jys25Xo1LGQgTvrBzV+B0r0z3Iofv+RlFxVBZUi9xcZyJFKjUlc+o4MdOzUJrRHMa1WJPUo58ZW
 JBymVaWmeVh6Je0EsX8CdWI7laY4pBXxbp0dCpHjvQU4POf1xvbyfvVZ5NQlW2bXy3IXPSrPpac
 azctyJJod9
X-Gm-Gg: ASbGncsCN6PMEcTE6XxlStc1msExSYCjkbis4MHukNQCyozbLbf2UOLTw2lZW4e0T3G
 rIcTupVj0S6lPJd6Ol7Ug062t3/ls4aq3dx245wz2EDnhGPjBOJT7m/bb6PkaYJNBwaeUETI6JX
 oLe3cP8t9EGgJT1OK8kbzljEaKwt4vL//3BtAk4CVWWeuZaJJjQcL5uq+dMYcDod5a4uF/JFFhe
 cF2J0Bh9l+jfYDcMEbqN6xMfqvDaXcBdm3kZfu7S4Qo7jx1MhYzBRZkc/tV8BmpER3C+piMO61X
 Ttew4YhhCf0TPX8JMl2n/SILb6V+bA2qiQ4/7zZG1dXpHNvG11yeYsX7CSW3TO4Icnh+Lw==
X-Received: by 2002:a17:902:d4ce:b0:224:584:6f07 with SMTP id
 d9443c01a7336-22e1033c7bfmr14898305ad.37.1746147369305; 
 Thu, 01 May 2025 17:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNRof0iGlPB7DoO2SVuSlwyAfKhgefdL+ChpaY/A3SLaofUFN1j4pA1JbSNn8oqpA9kNmN4g==
X-Received: by 2002:a17:902:d4ce:b0:224:584:6f07 with SMTP id
 d9443c01a7336-22e1033c7bfmr14898105ad.37.1746147368999; 
 Thu, 01 May 2025 17:56:08 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fdc70sm2655635ad.108.2025.05.01.17.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 17:56:08 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 17:55:43 -0700
Message-ID: <20250502005558.8257-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502005558.8257-1-ryan.lee@canonical.com>
References: <20250502005558.8257-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/4] apparmor: force audit on unconfined exec if
	info is set by find_attach
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

find_attach may set info if something unusual happens during that process
(currently only used to signal conflicting attachments, but this could be
expanded in the future). This is information that should be propagated to
userspace via an audit message.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index ce8b057196b6..548eef3a8ea1 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -668,6 +668,22 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 	if (profile_unconfined(profile)) {
 		new = find_attach(bprm, profile->ns,
 				  &profile->ns->base.profiles, name, &info);
+		/* info set -> something unusual that we should report
+		 * Currently this is only conflicting attachments, but other
+		 * infos added in the future should also be logged by default
+		 * and only excluded on a case-by-case basis
+		 */
+		if (info) {
+			/* Because perms is never used again after this audit
+			 * we don't need to care about clobbering it
+			 */
+			perms.audit |= MAY_EXEC;
+			perms.allow |= MAY_EXEC;
+			/* Don't cause error if auditing fails */
+			(void) aa_audit_file(subj_cred, profile, &perms,
+				OP_EXEC, MAY_EXEC, name, target, new, cond->uid,
+				info, error, true);
+		}
 		if (new) {
 			AA_DEBUG(DEBUG_DOMAIN, "unconfined attached to new label");
 			return new;
-- 
2.43.0


