Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 02473A5E2FC
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQA1-0001y8-Op; Wed, 12 Mar 2025 17:46:29 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQA0-0001xP-Fq
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:28 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 197BB3F2C4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:28 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-225505d1ca5so1587125ad.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801587; x=1742406387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8P97zEwMygELCTkzf/GqaLA9tMQa1BBb9BjHCrPJ5/U=;
 b=PsHzS9d/SHZxcOrK44drssIS7N3VZ9M1HxW1W9NaqQTVI+GrWJFse7DJD3MDIrfljY
 YISmY/98IfuF9QBUmpBymt332xbLbOl7DT6+oLcP8KvrfMU94sVV9W1Ce2K2yaxh+tOI
 2/fcHaMvUXgY3XBPh5li8ek5KM/tpBikxTL3+LhLLKfOiiN5Tp8MutA836XtQ66vjywA
 C4Z4P6ohv/6bS/SJxT6lKTxs75vy73LfOKmK07g/HjVwDPdAW/aUEVY1POD76v5VqfqV
 MOvLhyzL6qVOFBTypbyC0xte6ts+qLb6sm8NiJYdej9DsV3cOqUbKCHyHFjzZhZdYiMT
 NQZw==
X-Gm-Message-State: AOJu0Yz+/BHkvURw+zuOetGyaFzMQJg5W7P5dTMSjTB+vSn+KotDmtJb
 Zad0B2VzuqNDoEfNrFnFGXEw80sF+88tlA/HCFqvXtRZ5oU6G5ZPy1QnkKAuwofJqMVgHJrJZZd
 zp9yu0nhKm/+YhA/cYMqpI1rImmQ/LRvJgeyEbnQ3eLR6u/4dgS+PHLHbr3wuc7k7p//CnwsCvI
 caRFNs1A==
X-Gm-Gg: ASbGnctFJ4okZEfUjG0bfgZn80a6Ui+t20VE41fIf+iA2oOQjTQGleVUjYghuoRIBSh
 TA63OafFJdRRx5dqlC7wHbpiFE4lcZqDFUj5686wX3FZRCmR9IoIjSo5tVOBJk9vZ6QdOXArsWA
 ahC3QKFL3CgBzfKuVr4zYkWgAkYJ0T5VWviJIToPvqPczNPdCqVTSsFKwhffC0Pu6ka9SeeFgi8
 YGpF/lU/hT+C8AvAID4vUZfhizLdhsin1kvFciMoxQ4UXLQVmlITFHP5weRgRwEeIlPH02aOOY2
 sm31yTiFfdDL8mVAZi2RnTTgJ8UKGoywLL/yTXBD++qjEKOKffIwiMeFr4VAegUCPYJfL9w=
X-Received: by 2002:a05:6a00:3d0c:b0:736:39d4:ccf6 with SMTP id
 d2e1a72fcca58-736eb7ca147mr13764915b3a.8.1741801586789; 
 Wed, 12 Mar 2025 10:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQlsg1um/S1+uWVqDDQ0XUH5PtUfDneyLSy13fCkPW1ypZR8oM1pPkUtVEk53qUZBXrmHFPg==
X-Received: by 2002:a05:6a00:3d0c:b0:736:39d4:ccf6 with SMTP id
 d2e1a72fcca58-736eb7ca147mr13764892b3a.8.1741801586464; 
 Wed, 12 Mar 2025 10:46:26 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:25 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:46:03 -0700
Message-ID: <20250312174605.95563-6-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312174605.95563-1-ryan.lee@canonical.com>
References: <20250312174605.95563-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 5/5] apparmor: disable aa_audit_file
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
inheritance better, the best we can do for now is disable the AA_BUG line
when the profile is in complain mode.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---

v1 -> v2: only skip the AA_BUG line in complain mode

 security/apparmor/file.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index c430e031db31..60d6273713f9 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -271,7 +271,19 @@ int aa_audit_file(const struct cred *subj_cred,
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
+		 * AA_BUG line when in complain mode.
+		 */
+		if (!COMPLAIN_MODE(profile))
+			AA_BUG(!ad.request);
 
 		if (ad.request & perms->kill)
 			type = AUDIT_APPARMOR_KILL;
-- 
2.43.0


