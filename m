Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F98984FA1
	for <lists+apparmor@lfdr.de>; Wed, 25 Sep 2024 02:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1stGKW-0005Kl-0d; Wed, 25 Sep 2024 00:56:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1stGKU-0005Kc-ON
 for apparmor@lists.ubuntu.com; Wed, 25 Sep 2024 00:56:30 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6DEBA3F4BE
 for <apparmor@lists.ubuntu.com>; Wed, 25 Sep 2024 00:56:30 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-7e6c40a5795so60613a12.3
 for <apparmor@lists.ubuntu.com>; Tue, 24 Sep 2024 17:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727225789; x=1727830589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g6jTyG9XwpJLbzw7L7vKp8L7s67KfBLTfcTLXaEnfig=;
 b=CFTyuDdBEGgGKpHM+CZWtqJDJGy8FaCZgV7iCGSDGvBu4AUHmkG+q3I67J2RqlQkrn
 +WuScniL2VFkd9hbzXkh9zHHj6Oi3/7QqU0X+cwMNuiqmAIcUjlLU7O3kUhQFKvCUPHT
 THtcFd7rTfQA0UoU0J+cRLUW73R9sUAI5lpXavBE+2553BnOX5Q9rTN6pkcRR5hPVjzd
 hVXnzTicDBuwED0HrJDUyGfscJgt2BrY4FB3VJqevvHIfS2Rt+hmcTbtR/E1dJeLf+IF
 rlbXCI0xYBK/OphcEBLXns3Wg3dSWPfa7AQ7XXH3tYOG7fu3jXrvq80cj2kX0y9V1RLU
 lvdw==
X-Gm-Message-State: AOJu0YxKbCDrHZAJ8HBxTgeZnrvzSZdFe1ud1WfUMYUWhgloa6TVKYIx
 rR2vs52MlorGnis95snriSeahAz2hDaYENxZDSuwms+5a7ogCNJ3/XGQMWyTsLhRjL7WgW0AA0i
 +w5mhJppZCfPrGw1Qfo0VAPGdekjuWzt/+Erzh4TNplaSAhbEOsO2dbWK2lyvIlwnYIaF5ThDxu
 Nf8OIh9g==
X-Received: by 2002:a05:6a21:790:b0:1cf:2d52:415e with SMTP id
 adf61e73a8af0-1d4e0bed971mr1292514637.36.1727225788928; 
 Tue, 24 Sep 2024 17:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHeO7gq1GYzESusD/Ujy+0OE96w/ADjpX9IGVyo/WvH12aZ6KKeaO+dxv2J9DMFhsVZW+65g==
X-Received: by 2002:a05:6a21:790:b0:1cf:2d52:415e with SMTP id
 adf61e73a8af0-1d4e0bed971mr1292495637.36.1727225788606; 
 Tue, 24 Sep 2024 17:56:28 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71afc847924sm1723221b3a.58.2024.09.24.17.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 17:56:28 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 24 Sep 2024 17:56:05 -0700
Message-ID: <20240925005607.260221-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: document capability.c:profile_capable
	ad ptr not being NULL
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

The profile_capabile function takes a struct apparmor_audit_data *ad,
which is documented as possibly being NULL. However, the single place that
calls this function never passes it a NULL ad. If we were ever to call
profile_capable with a NULL ad elsewhere, we would need to rework the
function, as its very first use of ad is to dereference ad->class without
checking if ad is NULL.

Thus, document profile_capable's ad parameter as not accepting NULL.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/capability.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 61d7ab4255b0..9f89e8b94993 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -115,7 +115,7 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
  * @profile: profile being enforced    (NOT NULL, NOT unconfined)
  * @cap: capability to test if allowed
  * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
- * @ad: audit data (MAY BE NULL indicating no auditing)
+ * @ad: audit data (NOT NULL)
  *
  * Returns: 0 if allowed else -EPERM
  */
-- 
2.43.0


