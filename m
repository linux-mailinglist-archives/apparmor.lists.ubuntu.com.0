Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCBDAA680D
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 02:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAehR-0007KF-02; Fri, 02 May 2025 00:56:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAehQ-0007JP-Al
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 00:56:20 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2847E3F4C6
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 00:56:20 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22c35bafdbdso22165185ad.1
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 17:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746147378; x=1746752178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfSXVqb+qMgaf7XW7hvqxGPbx2zpp2mSgIBP6fIsT8c=;
 b=cZ9ZcRNbW3R/KYtxMNFcyDVffWjuQprjOiN7kY0Q+bL+ttqfdA57QVhKKA1SwWexGN
 AtPDZy7xOQjJwAzCj2lQLWMJiwzGMbVQP1wL9NdnLkuN0izN0vuY0AVln8nmz8sLUAcj
 QQNTRzv0pKtkDvVdpaMGzoEJIDYuslBmX8J+GxdZZzGL+p7eX6luzXdpNYJMdhmipYji
 u5FwBzDCzqNVfbvrxahQncor7esOzlMTh4YudjW8R/0VXtd3kWl/u7qspbeCb3TAXPb/
 DMGmrxubvzUT7LpUvXz9aLwlUBGuHDWrK1rx1BcJnc7kadMxrr/BgI8oPGun50NH948o
 zP4Q==
X-Gm-Message-State: AOJu0YxgRqU2wdcWi2pL7sqj9GH6EM50iZotwnK7YRVIIipNp+p6zy9v
 4t7Wuv+eKUTG/B4qi+alMdmgH2hlNBhzmW95Tbl8BmlQIGEWDUs5VJV8XvNeIW9XqGI97hSJoHW
 csVqbkV3qb1ji+Ynefc4xWCHwvBU8ViOJnphPZHhwwWL4YubdIwPr7x4hO/V65/3c7LGKTmNuBe
 rFpcDEeh3Q
X-Gm-Gg: ASbGncucLwm6cyqgMS9HKUjOvSIvJNfM7o5aKao3BPhg61YDbGcBbBKao3PIrrmdtm0
 kUzBIv0pk5j50iI6pRDTmtnqQVSt4eM2o3f/sPnb3sJwsvsydiMLtdUov5F6Qq3q526Bro2VCsL
 JyQD5s/lLldfSnFqyJLpRo8qppRT3UO6oOFME2kQcrjitSOf9desnfOGxzCY89pcgFuEDu2rM3m
 X4qPjG7YelU8lh/Z8E+HLRSpdqD58HLI1S1Kd8l27rGrC5KlO7xtiu/eGR9fIl5gAQz/us8jwA/
 yfASkaU/hR2ISWpMUZ1+vFPIaDqwR5/Rvk/3kmc4yMrIPYhrgx8w5lUECQHRpMyOKJG49A==
X-Received: by 2002:a17:902:ec86:b0:225:ac99:ae0f with SMTP id
 d9443c01a7336-22e102b5f22mr15660385ad.1.1746147378195; 
 Thu, 01 May 2025 17:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk8cA2Qd0t80r1i7CiUiUafo/OAtAmBS9Twcj9FxN8fywgGGKyttDepeGeBrymKJrqiXzmDg==
X-Received: by 2002:a17:902:ec86:b0:225:ac99:ae0f with SMTP id
 d9443c01a7336-22e102b5f22mr15660175ad.1.1746147377854; 
 Thu, 01 May 2025 17:56:17 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fdc70sm2655635ad.108.2025.05.01.17.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 17:56:17 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 17:55:46 -0700
Message-ID: <20250502005558.8257-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502005558.8257-1-ryan.lee@canonical.com>
References: <20250502005558.8257-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 4/4] apparmor: force auditing of conflicting
	attachment execs from confined
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

Conflicting attachment paths are an error state that result in the
binary in question executing under an unexpected ix/ux fallback. As such,
it should be audited to record the occurrence of conflicting attachments.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index e8cd9badfb54..b33ce6be9427 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -724,6 +724,14 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 		new = x_to_label(profile, bprm, name, perms.xindex, &target,
 				 &info);
 		if (new && new->proxy == profile->label.proxy && info) {
+			/* Force audit on conflicting attachment fallback
+			 * Because perms is never used again after this audit
+			 * we don't need to care about clobbering it
+			 */
+			if (info == CONFLICTING_ATTACH_STR_IX
+			   || info == CONFLICTING_ATTACH_STR_UX)
+				perms.audit |= MAY_EXEC;
+				perms.allow |= MAY_EXEC;
 			/* hack ix fallback - improve how this is detected */
 			goto audit;
 		} else if (!new) {
-- 
2.43.0


