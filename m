Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AFA4D16A
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 03:09:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpHiU-0004LD-To; Tue, 04 Mar 2025 02:09:06 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpHiT-0004L4-5u
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 02:09:05 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE7CF3F11F
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 02:09:04 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-223a2770b75so38664455ad.1
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 18:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741054143; x=1741658943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96p9O2q5SDV6010sFUwGcIpCVAUSHKa7wwed/uGDTPY=;
 b=S4uG9TGO2YKUZUnUIde5wqlxeGKvevlxAAB+M2WDqhxq7LPelvCaXMz/BytN2efwwG
 Sd+b0G2fd5vNXAcxkMPVnGCfsZMzvCVcxmblgOHqj+nOXLEHgaAmpiP1Ybe7wNIGI8cI
 Yx8cPHjg7Q2paG0Rc7PQN9ym1r7s6nuN9C0HPCbYQG/hxGnaKL6Maj/ydplDZGd5Z1F1
 e4aIYM+7C02RMl96r3pvq1864bm4tkc+3bddpsyf2NQgTHwwc1tjS8osUebcBHOuZP+E
 6z67u0WASQl7QOO2QnXZ3l5oTOz11MHHbNNe5JLgshqPvC3LMDT8CXrwXYlOHAy7lOQa
 plbw==
X-Gm-Message-State: AOJu0YyBJZWb2+ZeAorok1ylByglMfEF2S/ZmUORZqeujGB8N1tM290a
 ssO0YM2qKk6I9bBKoZ86WJi4XsnS4Pt+XuSrWIFjmGUFxZRqfF4KLNOuSmeL0PyHmG9zN+rvoZz
 PKs+pse9gAuDMMO5eJh5SoWqdp9n2ROmI9il9t0JnxS1rDQywQQN4SUFvaM0oCyZJLWLztuDGMt
 w0Ys1xpQ==
X-Gm-Gg: ASbGncsGBLUq6gybFIcVauJP81FHA/9P+TPfx7OHZdOUXDQBM5pV3UsymHX20chGJ84
 5Lc2DyN3OBCnI01H+oRFJBR5xcnHho5uQiU8g4eLX+5qnPjcdu1rfHISilln6EwN4M4jeLnlyVE
 wfGRYMw08I/ie34Q0U5ZTmr41WWoUmMixRmM0MvagBHCUMsAT46zEm/XowZGSqQSv7uzSJto3f9
 GULVPEIg7wGxg/OHn2Pouw7GuyTDolsIiyncQ9FaFEWG9Dqmpmp4Mt9EZBHkB9xdZDg4d3zPmhf
 tsYSt+brQeuNymz1HDtpsnYJ9f773jOE2gvqsrmIwe+d5m1yCx477xrxi2gLzeU0+jbIO/E=
X-Received: by 2002:a05:6a00:6810:b0:736:32d2:aa93 with SMTP id
 d2e1a72fcca58-73632d2ab67mr12788612b3a.20.1741054143496; 
 Mon, 03 Mar 2025 18:09:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpgcQCoersruX8dUmZXehQgnkD9+4KRHv5gas74xmTBO/zWoGAL4BV6Tpv/AYAmIUwUxMKyw==
X-Received: by 2002:a05:6a00:6810:b0:736:32d2:aa93 with SMTP id
 d2e1a72fcca58-73632d2ab67mr12788583b3a.20.1741054143090; 
 Mon, 03 Mar 2025 18:09:03 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7358603f4a2sm7307217b3a.173.2025.03.03.18.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 18:09:02 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 18:08:50 -0800
Message-ID: <20250304020851.81749-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304020851.81749-1-ryan.lee@canonical.com>
References: <20250304020851.81749-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: constify the nullperms value to
	prevent inadvertent changes
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

nullperms represents a permissions set that allows nothing, so it should
never be changed by any of the code using it. Making it const will allow
this to be enforced or warned on at compile time.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
This patch requires "apparmor: constify some of the pointer arguments of audit_mount"
to be applied in order to compile without warnings.
 security/apparmor/include/perms.h | 2 +-
 security/apparmor/lib.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/include/perms.h b/security/apparmor/include/perms.h
index bbaa7d39a39a..a6784a8efad6 100644
--- a/security/apparmor/include/perms.h
+++ b/security/apparmor/include/perms.h
@@ -96,7 +96,7 @@ struct aa_perms {
 #define AA_INDEX_NONE			0
 
 #define ALL_PERMS_MASK 0xffffffff
-extern struct aa_perms nullperms;
+extern const struct aa_perms nullperms;
 extern struct aa_perms allperms;
 
 /**
diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index 7db62213e352..a773a0070704 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -20,7 +20,7 @@
 #include "include/perms.h"
 #include "include/policy.h"
 
-struct aa_perms nullperms;
+const struct aa_perms nullperms;
 struct aa_perms allperms = { .allow = ALL_PERMS_MASK,
 			     .quiet = ALL_PERMS_MASK,
 			     .hide = ALL_PERMS_MASK };
-- 
2.43.0

base-kernel: v6.14-rc5
target: v6.14

