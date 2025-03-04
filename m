Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F0265A4EEE3
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJI-0002la-Ei; Tue, 04 Mar 2025 20:56:16 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJG-0002kr-F7
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:14 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 096C73F46B
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:14 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2233b154004so112606235ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121772; x=1741726572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rri5m08XqiVElLmKZitxM1w5gpUdlymgmEACqgZA/1k=;
 b=nUc8z2n6OuH116znkqPpPnz1WMqN68SUfHR8ZopOlmDrX5V/MmdPyQ/S0vg1ZVwU3K
 QHXP3XzAzPiPEwJTDVGpRaQkGvBJeKWMBEQ3Jj/JUH93vNj5MYGBy5LZyMmN8LiM6AIh
 XYnj2VL1zXvdYrUIPokckC4L8MVYSRdazNzomID9sLkAVQP0W7g/TewBoY/4pgwfbnvJ
 rFLfRbGvk+KM8ZIBqL2mC8fM1RySkY4JLZCGZEsh9Cg/E6YsxshvDCFUvzUhiJb/8MEb
 ra/079NEbRf5PCPpTFDX9W0AvQbqeGF1H2wbTyG4ytcXdS6SDUyfevsp3oYchrbIndxV
 fJpQ==
X-Gm-Message-State: AOJu0Yz3gmXmEGa6gB8TymM6D43ArcfAVbqYrYtauOgxSi/cmAivWohe
 r1+x15WOij1K51pzrhjS21ISWYuzUJxkyoC33OAvWl1W6gLsH0j6hrpwYpxI2oULAzpxrVnp3In
 PRxpEJacE0f1eNAQ/aFDLkmxwu1tt9n/8pooJmkBzbaPNebcQAYbK7Jq8yYgR5qFAlGM29KCJ+y
 jt3A0eyw==
X-Gm-Gg: ASbGncvIiCacE8J/zNKgvbV05I6pHJab3OW2oUptPQLg52SRWrQMIpC3ghJljY5i+OJ
 rd/ygZCeHRUSFfJzV9AqQN2HQd7LzulZK7kOc3YdPB/Ts5NkZdzuhvNVxwcS3HG/F2JcCIMjxNS
 1dQxAbg1RW99hyvb4LeGDodvnhCc3A4N5d+fygNk907BiHsCoU2mUv4bKEp35jdBFvtqaO3/Hmb
 5VC8Zxhn9qWv/5EZg/CGBNCT23N/ljGdxKd6BKmkBbBoJcqkHJ8Sb7SVf0l1DZU8N57F14r0lN6
 F8UxtTQh+KIHeGRZ6fI6mHlB3dYH2oSeX28s/ANDDp9E0DdSrrb4RM/G8BSyIXxs4ZAUL2Q=
X-Received: by 2002:a17:903:32c7:b0:223:6657:5003 with SMTP id
 d9443c01a7336-223f1cf2109mr9041485ad.32.1741121772548; 
 Tue, 04 Mar 2025 12:56:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzoJhcTqLlOLAxvrY8ny2SsTKvyErRRv6wVNwerpy5CJP5kh/vKcgA6QH4d5Tv7zGXc8+55w==
X-Received: by 2002:a17:903:32c7:b0:223:6657:5003 with SMTP id
 d9443c01a7336-223f1cf2109mr9041235ad.32.1741121772184; 
 Tue, 04 Mar 2025 12:56:12 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:11 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:51 -0800
Message-ID: <20250304205556.290042-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/5] apparmor: don't return early in
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


