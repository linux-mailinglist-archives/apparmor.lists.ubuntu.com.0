Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A592A4D08E
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:12:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGpG-0003UU-1E; Tue, 04 Mar 2025 01:12:02 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGpE-0003Tu-3D
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:12:00 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9A4BF3FE32
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:11:58 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22379af38e0so48159045ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741050717; x=1741655517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VmGl4BFZ9IDMSu4AWQ6iESLo0o/Ktugc4nBN2ARC/dI=;
 b=n7TzylDI8vkLDOV9Q7xZ0YyiBdCwlR9udIZcRknKha9zugwqJaLnONKr0GbCmREyjW
 qv9Ffa+nDbGdU6K/ZgKBO+CATeFPE6aw6m4wQ4qoU7tSumYW70zkPkAnNhwYI1+t6LlR
 K1Ut4MfZAf1ljhYYznJc63mYRhhv6Zpkmda/BHDus/pxsZKwPczN7GAT/XjHRVJhU7FY
 Je87IXhQO7dxd448opeVh+dcuU0udFyv6dbpXRoh0oBWqGhYkgp5I/DYeEaZ0ytgMaK0
 tiGXEabfhmwdjeADOZm7zIoLeBsLv3kwPN5huoQv6x84WhL1EflJeNZhin6vkJwiWBf1
 uxwQ==
X-Gm-Message-State: AOJu0Yxj4NKTIvph2g6tNL9kGIrg/0EhnRRiFnkiZ0HDXqOzmwmS/jpy
 GKrn5RQ577Q0V0avXdwNlIqUZ7QGEs5LGOcBG9rGFFGkHUjj6n9qYW7qZbog6SE4dGJYgSbxPNU
 EKMhV4+0JeS5HVJu5wh/vgtem2QNsoFFSXpjIDeQKqbTeak/ulQzbW+4iAMbBhTE8777ua6LO9G
 I3StPn1g==
X-Gm-Gg: ASbGnctuGz8oAh3ziKB8bsi0jP9tmIBftlLDZ1/EajxDgMQ7ezfpoc1V1J+KAjNhuCT
 ixePCIg7pVEoUquZwVZf7SEeb8/nni0asY40rgcLQZ/MJPmCK3sgiTO8YkCwmMxHk8WYz20KPwK
 xdeqLL+SlXNaikbBrUchCHNEccn/4KpoGeSCn+dhKYR4iXqyTQMRFXMDUb333Vxrpwj5Kgzou6Y
 7BFm0H3V5UJdr1NJ3orVX/aOt0NWmypqFdljz7wu617TLPG3Hs1MSLQAtxJg2Ksqjj69HZEJO3d
 2lECEn1JCoVxy6AYWkFERUrXDpOyZ7HSlxIYKH6FpKRK9jQbG6ozfSPfWJ5/wh5GC1rdJ/g=
X-Received: by 2002:a17:903:2302:b0:221:2f4:5446 with SMTP id
 d9443c01a7336-22368fba4aemr217602155ad.25.1741050716941; 
 Mon, 03 Mar 2025 17:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgaM4MDVK6zQtKcWdtYys2EsOVPS+WzNwRtYIfX5QljWicuPRbDJuL/zJZ1EWabIhTwKsplw==
X-Received: by 2002:a17:903:2302:b0:221:2f4:5446 with SMTP id
 d9443c01a7336-22368fba4aemr217601955ad.25.1741050716646; 
 Mon, 03 Mar 2025 17:11:56 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052c806sm84056955ad.235.2025.03.03.17.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:11:56 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:11:37 -0800
Message-ID: <20250304011144.31433-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/5] apparmor: constify some of the pointer
	arguments of audit_mount
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

Unfortunately, the profile pointer itself cannot be constified because
aa_audit itself needs to extract non-const pointers from the profile
struct.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/mount.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index bf8863253e07..1e1878a2ed6b 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -136,7 +136,8 @@ static int audit_mount(const struct cred *subj_cred,
 		       const char *name, const char *src_name,
 		       const char *type, const char *trans,
 		       unsigned long flags, const void *data, u32 request,
-		       struct aa_perms *perms, const char *info, int error)
+		       const struct aa_perms *perms,
+		       const char *info, int error)
 {
 	int audit_type = AUDIT_APPARMOR_AUTO;
 	DEFINE_AUDIT_DATA(ad, LSM_AUDIT_DATA_NONE, AA_CLASS_MOUNT, op);
-- 
2.43.0


