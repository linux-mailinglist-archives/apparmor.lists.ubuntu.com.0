Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87AA4D0AB
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:21:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGyB-0004rm-JM; Tue, 04 Mar 2025 01:21:15 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGy9-0004rZ-M0
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:21:13 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C32F93F129
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:21:11 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2fe862ea448so16076403a91.3
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741051270; x=1741656070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/iBce5ACXUgIE76EZ5+dJTeWEvTZy/nHMEluOFujg4=;
 b=iWs6KVAvOiqv2zC/+SN1YcgfrqNPJBktdKTX07rNzHNyrR/wt8tECXvWYs8ctfeg0S
 jqSZvqEOr0PHo0f9H3mUto4coQlIg+1YB17KgxfRVySFoMHlKEuPiH2Myp6zdwFG+pX+
 1ndx8GCAiJOL+9nK6v+eowmvcZl/cqsfw+LV9z0rnrBs3A6JeNKqSFjsGmrv1YQaHHpG
 2XYWF58CCFGCxtefaF/BSy8R4vArRJnV7+4HKrtBKzV6nFcsPzidiMP1Jmss3dLgwjQF
 Z5yKIuOEeH4G6SazkMsQ+g4UGXtKteNfbtbKhiK9edaVLpR/Nlqcvcv+2q9eNEkuztm3
 lWvw==
X-Gm-Message-State: AOJu0Yy19+BLW90ICG7VyEfQDk37UPNCyg+AOaFnAkkdJqtgH3X+FtsK
 /cird1P41PuxRrAPNAyj6NXNSpht2Rcd+oxK3hsb+ViMHvrCDjTMQE8O02Ji+q71TunxjXChehH
 dc1S6SzIeY5uAokC6cQmbEt+u208tDu2NLC1MQIqQg8x3zS6HOgXBh73tftcZiuKwW6mgRok3yG
 caRyygzg==
X-Gm-Gg: ASbGnctV0SH9S0LyCg4fTZbmKmLKVJQ+0FtPfBvUno5Guw1Se2+PsFWqjg7i2dbinoz
 8U10OMhe9Ea5XU6tK2uFAvkD+xtB+bE8BqkyB+zzu7vrpAiUKvvpKx2r17M1yQYKVLlOEi2H4a5
 X+IBy6M4uiv8QX9U67Ic2hX3Av+oXvusTSQ+wKaFuTuGaOvV5zFypXCqIrAScpe+5W5xEv/belL
 EpH8KfrbHC8kwxVX6i74ZjqqhffsXezPuJdogGRvbIm4i3WqqpdwLcpMdBMPhLigK+Tpymb43wj
 FKmgJ4WBeX0deBkz9TZ9Z/cMckzcu3z10J7NsZ475+CWUISvSMb+bgSji1/fDP+PEmNh9o0=
X-Received: by 2002:a05:6a21:3d83:b0:1f3:289e:36d9 with SMTP id
 adf61e73a8af0-1f3289e3a2fmr8165478637.40.1741051270051; 
 Mon, 03 Mar 2025 17:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGimRgjbluZTZndpiwmBwWTjf1ockiYZc3VSYTaalhS6Gm+EPFqNvGg4rTa7OmNjvNW9PAq2w==
X-Received: by 2002:a05:6a21:3d83:b0:1f3:289e:36d9 with SMTP id
 adf61e73a8af0-1f3289e3a2fmr8165451637.40.1741051269671; 
 Mon, 03 Mar 2025 17:21:09 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7de19d1dsm8922171a12.25.2025.03.03.17.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:21:09 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:20:46 -0800
Message-ID: <20250304012049.62969-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: remove unused profile argument from
	file.c:check_user
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

The profile argument is not used by this function, so don't pass it in.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 6acf0f029604..a59ba26e54d6 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -134,8 +134,7 @@ static int check_cache(struct aa_profile *profile,
 // error - immediate return
 //       - debug message do audit
 // caching is handled on listener task side
-static int check_user(struct aa_profile *profile,
-		      struct apparmor_audit_data *ad,
+static int check_user(struct apparmor_audit_data *ad,
 		      struct aa_perms *perms)
 {
 	struct aa_audit_node *node = NULL;
@@ -243,7 +242,7 @@ int aa_audit_file(const struct cred *subj_cred,
 		 */
 		if (prompt && !(request & perms->deny) &&
 		    (perms->prompt & implicit_deny) == implicit_deny) {
-			err = check_user(profile, &ad, perms);
+			err = check_user(&ad, perms);
 			if (err == -ERESTARTSYS) {
 				AA_DEBUG(DEBUG_UPCALL, "    check user returned -ERESTART_SYS");
 				/* are there other errors we should bail on */
-- 
2.43.0
Please let me know if check_user is meant to use the profile argument in the future.

base-kernel: Ubuntu-hwe-6.11-6.11.0-17.17_24.04.2
target: Ubuntu-kernel

