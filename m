Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E65AA680B
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 02:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAehN-0007Gp-N5; Fri, 02 May 2025 00:56:17 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAehL-0007FP-MU
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 00:56:15 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33E4F3FE56
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 00:56:14 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2264e5b2b7cso12782105ad.2
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 17:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746147373; x=1746752173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAJ4y7AD23QMgyXMj3oB+8rFF4DbFVqKbk068TjigjU=;
 b=wXCVKy6X8CzxlkKZFRiWgYBk9+yFDsp4rDxL279yEQLrgzdFa8b9Frz1mvIfAUrMx4
 0FrYbN/S6eLybHqklHctjsB3i5SOpJSA6+MWYzDZ6sV4MQVSsxrPRAn/K5Ertyx6Vg14
 ZTCNn3KtJDEDZb0uX2piLPk3PlwcdMymkFhHkIou9T9txiLPzIP9B++NWT4lcAvLnX7h
 k71gfNfnO+Km3a/HtnCXbwGBW8cnkhns5EtvhTXnwhcfL++PJUCILe59udF5beJoVezc
 DVzlGomHBEzfkf+EdtWg1IDJvx/OPxR2vL3ZB90+7mSe5WpaNJY1XcQPGzHHICdoGPhg
 PZrg==
X-Gm-Message-State: AOJu0Ywnh89LVbwZBmYx0HX0pdlLLi4Uj3pVl0d/SM4QGI2mxKn6nQyf
 6EEBwlwbWKTX9CYem0YcuLp2RJ/Sg4CLlv2YXpZsJTKpitysVpjKIU8Zhqj0DoR3FXpTKAWVi+f
 EtzsN7vXauO4kMOe0HDXJ25+Piy70QutV7OzOcK4P0QwlkOBV+iLiqf3rAeHJ55owq8ztR1qWV0
 5//yJJDs4h
X-Gm-Gg: ASbGncufQCqwbEEYnaToHHS1Aw30KVl60KQw8HtHAQzh/EKS4elSvUyBs4mwHX2MTvh
 YtgY6uTY/v3DosGB9k2TkZ8Hq1JwpVkZLr9bjqF/FhEZCutyR2Bd0vwTvtLCDo13zJed0zds2l1
 5LjuzTF1uM53wRL5HiUvOyCbeH9PxPBmOSk22QwCD2/Rch6y/43+DbjxM3I8uvvUDio+HEXKv1t
 uInV9Sm2mLYYEfhys/+/PnsSBGDe0BhbXveiDHe24DACTbaDyt0wjNSbMVR/iUq7hidiSOWP+ig
 Aj512OZ5PnmJBoOkEeATEyA5O1df7JPpXhAvlS956jNrdYsbJTOP17Q1mLVjd+AntoTcsA==
X-Received: by 2002:a17:902:ce04:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1031e381mr16613795ad.12.1746147372849; 
 Thu, 01 May 2025 17:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFugqpAtoxkdpZ8dqBeL9NIs7DrLbHk3NOUUuAql1oKE0X0AI9pPj167Xb5NtMeF8KeX5vGJw==
X-Received: by 2002:a17:902:ce04:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1031e381mr16613615ad.12.1746147372527; 
 Thu, 01 May 2025 17:56:12 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fdc70sm2655635ad.108.2025.05.01.17.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 17:56:12 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 17:55:44 -0700
Message-ID: <20250502005558.8257-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502005558.8257-1-ryan.lee@canonical.com>
References: <20250502005558.8257-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/4] apparmor: move the "conflicting profile
	attachments" infostr to a const declaration
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

Instead of having a literal, making this a constant will allow for (hacky)
detection of conflicting profile attachments from inspection of the info
pointer. This is used in the next patch to augment the information provided
through domain.c:x_to_label for ix/ux fallback.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 548eef3a8ea1..a73307ee1c7f 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -29,6 +29,8 @@
 #include "include/policy.h"
 #include "include/policy_ns.h"
 
+static const char * const CONFLICTING_ATTACH_STR = "conflicting profile attachments";
+
 /**
  * may_change_ptraced_domain - check if can change profile on ptraced task
  * @to_cred: cred of task changing domain
@@ -486,7 +488,7 @@ static struct aa_label *find_attach(const struct linux_binprm *bprm,
 
 	if (!candidate || conflict) {
 		if (conflict)
-			*info = "conflicting profile attachments";
+			*info = CONFLICTING_ATTACH_STR;
 		rcu_read_unlock();
 		return NULL;
 	}
-- 
2.43.0


