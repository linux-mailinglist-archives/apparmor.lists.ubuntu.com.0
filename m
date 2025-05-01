Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD5AA6479
	for <lists+apparmor@lfdr.de>; Thu,  1 May 2025 21:55:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAZzm-00014O-6L; Thu, 01 May 2025 19:54:58 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAZzj-000141-3y
 for apparmor@lists.ubuntu.com; Thu, 01 May 2025 19:54:55 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E51873FB81
 for <apparmor@lists.ubuntu.com>; Thu,  1 May 2025 19:54:54 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22650077995so20065505ad.3
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 12:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746129293; x=1746734093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6BXNqFW6gIcHfET3WK5eJyBm2wKWw+Mk8fmnFTD5Tc=;
 b=a8wZGgcCG3eERL8h/9gCVaug3E2FQDpXwJGY4Ko5sq+0tHy3onlkn00nFwYBcsFvu3
 ImupYcvELSD+lpM/attUoGgKhTZo/cNXblDp5b7WA4aVIeIcEUQZc1e1D620r7dNlckK
 5rJzja64q7/u6HY/05MGatC4VMhJLF38ePGsfWIgeF/sU2J698hGznIeWXUUrO4lH+hr
 pr7qxOfZJB2ZrP0ZUz2PYPa+bnqjj8j5VLqo0anYX5mmQDKvQX+Kh57WdmjJkyw0X+vL
 gBemlCjnOlhJDIAlrxvmvP/L4/wR5PobS0qkqS5Do7xfFGnHwGgKw/8ixztYa27lifGn
 HPew==
X-Gm-Message-State: AOJu0YxpztCNcYNVBqfXNkeJ5dLuUaHYmX/V9nNbENcFkOC434UHl05Q
 7DC71n1vFLu57nlgQAXpYFiUTaUqzW2hcL2siwUrn+EGt712TwWEFPPRTwlT5S0KtfOjfG/XtGD
 nZiL0EkKXgjitxaproMvpxHLLao1owi+16rYoOUgEvqaFAKA76Y726c2e0KJbtgXTJwRRN9tvPe
 WHfxVg2jnP
X-Gm-Gg: ASbGnctaLMON0KvT/v289jLKUAaLAJHv66CbquB59ENvt+Y/qkyrQVP8OF/HETSzBuD
 gQABrTB9lRPWM4w0QTP40iPneBN9bgqcXxqoyAos+ZAti9SxwVF8ynSNGRLtq5JOP3AFAicQY7X
 XsN5hSFPwlT6hzAJNElrjQO2iHIYrXOpKIeNrZ/Hp9Ikg2Uynn9Cu1gjq6MD7jnTb8xrP4CAu/y
 FASHlxU/93Yifg9opr1X0v40DwyPYog4qao25vA5FMivc6IirRWLojOzgakYJiqHDj3p325Cr5q
 IyOvTT1lHlql/s9RF+hC1W9raj3vFF4PxcKWH2h5CeTV0XNgUInOeRkhdcwhfrwHbxZuRA==
X-Received: by 2002:a17:903:1983:b0:223:6455:8752 with SMTP id
 d9443c01a7336-22e103cd0a5mr4486925ad.43.1746129293657; 
 Thu, 01 May 2025 12:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyvaNKni39crj6x4T7mFXVL6O9wCr9vjyURUb6WdOsRoac08Ri5c5kUglL6kszZRGK0YEhEg==
X-Received: by 2002:a17:903:1983:b0:223:6455:8752 with SMTP id
 d9443c01a7336-22e103cd0a5mr4486755ad.43.1746129293313; 
 Thu, 01 May 2025 12:54:53 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1084dedfsm269275ad.27.2025.05.01.12.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 12:54:52 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 12:54:38 -0700
Message-ID: <20250501195440.372104-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501195440.372104-1-ryan.lee@canonical.com>
References: <20250501195440.372104-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/2] apparmor: ensure WB_HISTORY_SIZE value is a
	power of 2
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

WB_HISTORY_SIZE was defined to be a value not a power of 2, despite a 
comment in the declaration of struct match_workbuf stating it is and a
modular arithmetic usage in the inc_wb_pos macro assuming that it is. Bump
WB_HISTORY_SIZE's value up to 32 and add a BUILD_BUG_ON_NOT_POWER_OF_2
line to ensure that any future changes to the value of WB_HISTORY_SIZE
respect this requirement.

Fixes: 136db994852a ("apparmor: increase left match history buffer size")

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/match.h | 3 ++-
 security/apparmor/match.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
index 536ce3abd598..b45fc39fa837 100644
--- a/security/apparmor/include/match.h
+++ b/security/apparmor/include/match.h
@@ -137,7 +137,8 @@ aa_state_t aa_dfa_matchn_until(struct aa_dfa *dfa, aa_state_t start,
 
 void aa_dfa_free_kref(struct kref *kref);
 
-#define WB_HISTORY_SIZE 24
+/* This needs to be a power of 2 */
+#define WB_HISTORY_SIZE 32
 struct match_workbuf {
 	unsigned int count;
 	unsigned int pos;
diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 315fe74eac39..0172c06f6078 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -682,6 +682,7 @@ aa_state_t aa_dfa_matchn_until(struct aa_dfa *dfa, aa_state_t start,
 
 #define inc_wb_pos(wb)						\
 do {								\
+	BUILD_BUG_ON_NOT_POWER_OF_2(WB_HISTORY_SIZE);			\
 	wb->pos = (wb->pos + 1) & (WB_HISTORY_SIZE - 1);		\
 	wb->len = (wb->len + 1) & (WB_HISTORY_SIZE - 1);		\
 } while (0)
-- 
2.43.0


