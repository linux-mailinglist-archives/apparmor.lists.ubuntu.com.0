Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7DA5E2FE
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQAB-00022n-4n; Wed, 12 Mar 2025 17:46:39 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQAA-0001yV-PS
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:38 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 077CB3F2B4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:29 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2255ae39f8fso20873205ad.0
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801583; x=1742406383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rri5m08XqiVElLmKZitxM1w5gpUdlymgmEACqgZA/1k=;
 b=jH+R/PHPealp12wwFXk0JMrSVHgSqcGGh6Rd1u9xXRvqVCnRHRRChFyjudCyHmr90N
 2n36bDLaaT+hRN+nV8WcWH42jrKs4NYShYbGjFCAB78jSxLQn8KRWK4LKZs2i8drpcjD
 cuF9/8CzO/e+sm8dP7N44DkKfx2V2aY5OUxkgru9XkbfzFmJNyVO/ND7L26QXL5DBIw8
 50aWyg0NmZTqGSYwY0E0wMoeO6KALjgQObxdqaJiLj+uL/sLvMAEkgbiY/zR26BBwiOe
 IhT7AJEkk1/FQPCd2H+yX1lxq67hlQ9vz/uD1B4K2qgXnP6YHrblapPRRumGDqMJAjBQ
 POhg==
X-Gm-Message-State: AOJu0YxMI8Xb7oFm1m2G64V/hYOwfYaU4O9Jgk00Q1UlzC+0gq+cfV8C
 tvDJJFA9c6ewaUHvRxeFVuN6nllgfu24E5oMRz5OPnV6ohF2hVPiWhMUUlI8qOrxdzersMqOxID
 /LtBOZbROztiZQQE6HDTp8e2wCCBOdiz8XZFsPdOapzPWC3LpOtreAfndIl7R1ESe9677qqPAZ1
 vk5YZ88w==
X-Gm-Gg: ASbGnctk69mG9wxHnibleWAVKON302Gwgy+ChsFzDr/qWOD3a6x6Ce/7ofjg0VnirEx
 q9YW22aqx1n3+5K0kRbRRVisxNsLO0Qk6dL8ORX99AIbHAHSEbBBmoPD8f/fVB8P+itg4kAE+zp
 l5v1BduvMqw7Ic8iSEDp0evOZuOVMPZmbw3p6IwV8cUetNeta7d/jDfSTHIIwd2HiliqQb3crvP
 0qlwLf27tx8PrxlGj7brO8/IW04rTqTQK5/V4YI7LcgP5LY1ugGDM/5Win0+O2wPXUCtFJ0Euf6
 8VLwfM9j3VKPbZVwUiSg2jLU0Qe9etVnYHmr2f/+4jZ6XTTkKoSV5rQzIq5V2Ly8sZwK/cE=
X-Received: by 2002:aa7:98dd:0:b0:732:706c:c4ff with SMTP id
 d2e1a72fcca58-7370d3b5e39mr579639b3a.7.1741801583085; 
 Wed, 12 Mar 2025 10:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3tcICZJXAofhNyoYZEvft/M56tYF1Zxu5HzCYmQjsFA4FC+EYps9hNz0qrjbD/fqwmGCdsg==
X-Received: by 2002:aa7:98dd:0:b0:732:706c:c4ff with SMTP id
 d2e1a72fcca58-7370d3b5e39mr579612b3a.7.1741801582749; 
 Wed, 12 Mar 2025 10:46:22 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:22 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:46:00 -0700
Message-ID: <20250312174605.95563-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312174605.95563-1-ryan.lee@canonical.com>
References: <20250312174605.95563-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 2/5] apparmor: don't return early in
	profile_path_perm for disconnected paths in complain mode
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

profile_path_perm does the path lookup for file operations. If in complain
mode, don't return early upon path lookup failure, but instead proceed to
file path mediation. Because of the sentinel character replacement, the
mediation will fail, and the subsequent audit mechanisms will allow the
operation to proceed while generating a complain-mode audit log.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 5e0cadb75651..c430e031db31 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -403,7 +403,7 @@ static int profile_path_perm(const char *op, const struct cred *subj_cred,
 	error = path_name(op, subj_cred, &profile->label, path,
 			  flags | profile->path_flags, buffer, &name, cond,
 			  request);
-	if (error)
+	if (error && !COMPLAIN_MODE(profile))
 		return error;
 	error = __aa_path_perm(op, subj_cred, profile, name, request, cond,
 			       flags, perms, prompt);
-- 
2.43.0


