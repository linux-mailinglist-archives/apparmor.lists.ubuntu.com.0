Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A505DA4EEE7
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJP-0002r2-8N; Tue, 04 Mar 2025 20:56:23 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJN-0002p3-7f
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:21 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A14233F46B
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:20 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22367f4e9b9so83369845ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121779; x=1741726579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4TkXco4IOyoJNtmYlGkm/c0lHHL2LmhxY9Y5H+9Ozo=;
 b=Lb4Hmg+afziUdUoErjB0xyi5WJ777ck7vSQyUm0unEeIlw8uT5zh6lTLCKUv9V/ATY
 Orfpmu+Ea33/T7jt8Dt2BqDoA7STAQnlHAcxDMd321dQAux34B4TM1w1dGDNDtU6oPTN
 jMl7tRRrqFqqrodWrriPgpbI6THILWdqCWXmmxQX/9vGyj69871xn634A2jIgF7+tADp
 vjIORSWW5C94EWODE0YAD7rld03MsLWDGZddzmohbpntYi5xAGaEGi8f8P68HUoK/p9l
 x9t20+h83qFjDYObdPOzdyu4Gf0xj/JGtp1WUW1AO2BFdEWwxgxeQvzk7/7fdnxLTtkF
 Dneg==
X-Gm-Message-State: AOJu0YzND1Xqp+pUzONgpSmAdM/hXqCZCZ7RuYYzirqcqqGlEC+4iqqq
 Ov/xTjVjpwA+UfDTHnFlfprWwM0R1Vqpg6bXTNK1AMFkD2tuzE5gmuAyN9Sdks61YvuMxxEvUnJ
 0nMc7bQN+LBaZJZCc3Ru0+elvPlE+0eGFV9mPpyYQ3zO0Mi1MmM5/e9uucT41Pl6ridUdO8k1fZ
 DyOk/NJg==
X-Gm-Gg: ASbGnctEklPbXVLATeTnnvPhHM46qnJnrVrNmzY/lKQNN8U2nIDfJjZqexPO5ph1Oc/
 5gYmaEiBGzsGY2TJUGT61WWDCqCiEcUCj4+EF5hnO3bNHQ3eAGGyOI4BgxgfjXijXCbMuGeMIIU
 5AMjG2PId8MvZKh5Ms5UL8FXs5qmyHwBqrQQi9Dw8B8No0GR/vNTTM0OKKDN3YmeH5RVW9/suOC
 MXxDUyDMJkTY/fxZ82rHUtRU774b/t+rq0ybBgwtOAnbmBvndJKzh0Eod/pEHRJMAakHEDIjFk3
 KayV9emUv48lVhYXSSejd5TiWT0Vdd30T8vALYrgncXML7pPDn2iJ0HUX5GltlY+pt+EGpE=
X-Received: by 2002:a05:6a00:3e04:b0:730:4c55:4fdf with SMTP id
 d2e1a72fcca58-73682bb37bemr530354b3a.7.1741121779110; 
 Tue, 04 Mar 2025 12:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjghEPQis2sW8UvrehJnoEJ0bZ7SCfMQlQJ0aX+8XK4N3X3oCPE2ob3IrilJ4EFdmPrLg46A==
X-Received: by 2002:a05:6a00:3e04:b0:730:4c55:4fdf with SMTP id
 d2e1a72fcca58-73682bb37bemr530337b3a.7.1741121778874; 
 Tue, 04 Mar 2025 12:56:18 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:18 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:54 -0800
Message-ID: <20250304205556.290042-6-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 5/5] apparmor: disable aa_audit_file
	AA_BUG(!ad.request) due to fd inheritance
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

Inheritance of fd's triggers the lookup logic, and O_PATH fd's are checked
with an empty request set. If the O_PATH fd corresponds to a disconnected
path for an application with a profile in complain mode, we have an error
without a request bit set in aa_audit_file. Until we can handle O_PATH fd
inheritance better, the best we can do for now is disable the AA_BUG line.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index c430e031db31..3267a597526e 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -271,7 +271,18 @@ int aa_audit_file(const struct cred *subj_cred,
 	} else {
 		/* only report permissions that were denied */
 		ad.request = ad.request & ~perms->allow;
-		AA_BUG(!ad.request);
+
+		/*
+		 * Inheritance of fd's across execution boundaries causes the
+		 * path name lookup logic to be triggered for all the fd's.
+		 * This includes O_PATH fd's for which the original requested
+		 * set is empty. An O_PATH fd with a disconnected path results
+		 * in a lookup error, which in complain mode, means we reach
+		 * this branch with an empty request. Until we have a better
+		 * way to detect and handle this case, we have to disable this
+		 * AA_BUG line.
+		 */
+		// AA_BUG(!ad.request);
 
 		if (ad.request & perms->kill)
 			type = AUDIT_APPARMOR_KILL;
-- 
2.43.0


