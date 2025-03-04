Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B5A4D08F
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:12:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGpM-0003W0-Dm; Tue, 04 Mar 2025 01:12:08 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGpK-0003Ut-TM
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:12:06 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 388943F129
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:12:05 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2233b764fc8so90074055ad.3
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741050723; x=1741655523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kGVU6Ddxko4CQgxTjp8M5b614YhLeniowSKEKugGkc=;
 b=leOxOzdQsNA2d1fc1TWXglFUPIhM3smpWRC0/iCLctv8ggb63+cXlFH9GXeT1jgwrs
 rySfTHqDBmdG8sStRS46kq5axnh0btNoxX5vGjwWT2RpAbBpC3xAfB0yAWG+Iew5tyvi
 AKyKL3hqg7BCPL2La3yHtCt7szE5hbU5LX4b/8oL5WGB+0m2dqdhG+5U/YtlLJSbxlNK
 5f5cbzy2Ljny8t0ryH8M4Yh1TBH6IqcJZvM+NHGCVdoe2qa5PHlxqcRqo+/h+iaY4pXV
 XCVdmQ3cS94E7tTVSxG2MkdhIA+SfDhFByUOA07W4g/qyKFmYvXfSXqxJSFazupOOPLe
 r48w==
X-Gm-Message-State: AOJu0Yw6gvNyMmuPpWQyqCkDsQTQK/te6+b+ovxmqjFp46ozWJ570ZWn
 YK942Ue+RLNHpvUe0xX+mPgQh5+EhzX460Ouc7jvEVRR0lI7WnIzzngpN88xroAOl4N3hAcgp+j
 uSL056bQ38XxAeN/jL7XD/FiUMiNDESmMWZUB5xXSeSa7DHAW8OXjSSqVqD6E46Wkm5A5Tnkkvx
 55fh7drQ==
X-Gm-Gg: ASbGncvcFUG8K7cVqyppCvuPiNHNf5AFfvRjqxg9Afr01eSWUBpz7gHx3+Rwf/m+KcT
 KP2dqD+6QWbSOIpn3Zl/4Yms7yW3qp2tNxOeziNZwDQ3CojFtpZ1ysZcXng0PAPGMZ3y2+GWIeF
 ovmORNr+SO9vyy1mJVh2Ylpu/gtSeAetm4nsKmiehsLKiE2b18KmMnfdsGQivNivwfPTRhFxjg2
 QYycfrrrJTp3Bs61R1G0jD5IvK/PtEXebExoLEC1GrXzse7dxuo9pkbs8r8PAY2C1AUGvQe5nvm
 MEQMpS17mA3aBuA53NPnc7FbYUzU4dx81zbE1Bpi+ERyWu4n5qLQAxNlkh4PTwtZ7GT/h4w=
X-Received: by 2002:a17:902:e543:b0:221:7b4a:474b with SMTP id
 d9443c01a7336-22368fba437mr218828585ad.24.1741050723085; 
 Mon, 03 Mar 2025 17:12:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfmikSvDXCmqvRoghm8aRYLhgx6qEWprkB7pzHRDb+Tgc1lh4yU4lZVd2xXOcP1iqASy3a2Q==
X-Received: by 2002:a17:902:e543:b0:221:7b4a:474b with SMTP id
 d9443c01a7336-22368fba437mr218828335ad.24.1741050722839; 
 Mon, 03 Mar 2025 17:12:02 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052c806sm84056955ad.235.2025.03.03.17.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:12:02 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:11:39 -0800
Message-ID: <20250304011144.31433-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304011144.31433-1-ryan.lee@canonical.com>
References: <20250304011144.31433-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 3/5] apparmor: rename
	policy_unpack.c:verify_header to unpack_and_verify_header
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

The function in question does not just verify the header but also does
unpacking, so give the function a more descriptive name.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/policy_unpack.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 6cf6e372d815..22af940a5f58 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1200,14 +1200,14 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 }
 
 /**
- * verify_header - unpack serialized stream header
+ * unpack_and_verify_header - unpack serialized stream header
  * @e: serialized data read head (NOT NULL)
  * @required: whether the header is required or optional
  * @ns: Returns - namespace if one is specified else NULL (NOT NULL)
  *
  * Returns: error or 0 if header is good
  */
-static int verify_header(struct aa_ext *e, int required, const char **ns)
+static int unpack_and_verify_header(struct aa_ext *e, int required, const char **ns)
 {
 	int error = -EPROTONOSUPPORT;
 	const char *name = NULL;
@@ -1504,7 +1504,7 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
 	*ns = NULL;
 	while (e.pos < e.end) {
 		void *start;
-		error = verify_header(&e, e.pos == e.start, ns);
+		error = unpack_and_verify_header(&e, e.pos == e.start, ns);
 		if (error)
 			goto fail;
 
-- 
2.43.0


