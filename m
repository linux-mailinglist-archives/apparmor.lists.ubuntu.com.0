Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF4B26EB0
	for <lists+apparmor@lfdr.de>; Thu, 14 Aug 2025 20:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1umcUp-0001hO-Kq; Thu, 14 Aug 2025 18:16:15 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <chandramohan.explore@gmail.com>)
 id 1umDvT-0002p3-3b
 for apparmor@lists.ubuntu.com; Wed, 13 Aug 2025 16:02:07 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2403df11a2aso46281715ad.0
 for <apparmor@lists.ubuntu.com>; Wed, 13 Aug 2025 09:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100925; x=1755705725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15PDS4kBFxnfhGyuPIxLhWrdICQOQTl1rvLJxElN8H8=;
 b=ELaXjHtNc5OonGIpfNQgc3IM30MVfXK9NyWXkOccX1wNZMwWl0+VQ6u2vPTYK3CVV4
 G00n/XFLuYw0swBxGqzZs8DJbxwjsGYw1KnRRQyiKwcEms01U/syO3QFpTioeIT6RPuk
 aNRgLPf4Cb9mngf8rKEK906Ky0f8h/2yLq3TXkDwCsNnRNAdx5jUlqo8t0Z+FTVi/z/T
 glPu+MX7xiNvPp1t/xUIFIRtIEfJ7PHgEmDPBcQVD5ChuYtjf3KzvMPT174mDtBcZ11A
 jC3CX1YcGTOctZHpFPpo5ZhXprc254K5inhXN0TFq24ngOZzIZATfJIqPCHIpX1WPYQg
 4Ung==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZhwUx0IfvCEC609rVeM3jijnJt8wuItWoHt+NgMw6HLra88XfX9c8DNAZD8iqdCLkE62/S/sq1g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwfYoMLf+TrW04jxegHoG6XIL+ZlIUEAXVwU3DRsR9vguXVuGfd
 dvK5KzXI+4osx56Zss9g+6z/zrho6IS2dS+z6ewBeFT/IdFcP+Tsov7u
X-Gm-Gg: ASbGncvtF2VyzkIP/Qxuj3BDVscHp7r6BtZ5fJJPJSuke4qxNq+FHmcCY5Ilhkw3FMW
 WKMSy+2Q/C2nLF46+9GEaMz0gFMyCl+M0HFE6M3pkBdiymAeO9qKoU8MzS5T8sBg1az7L0PpU+U
 QpYBSenaBXmfZ74ONngUe+bgb4beXcy9kfsg6HinRtqijwq8rbn6AWmU/6xyeuw1hWtRb84WGuq
 xZYy4gVNcZKIxAVut54vQ0LhsaeMF+66kPXlDe/DTjjcAxnr32zVtPnpfAgrkQKUtKnVaWMASsA
 JPMduYcEMnfe/CwL7jYdqcI+VDEka5D2NkSKal0lsnTHojAflybb6HEQUZUbBbD/14LyE9hewQq
 WPnaykuEk6n0jya/LeyXml3pV3ZCcBeaFJFskVA/TV7icgaotcIxGqLuk1/MC/kgjRWH3gWzoIk
 Ootw==
X-Google-Smtp-Source: AGHT+IFneh6DcSCXvD6FkQgAozlcfSCn7Et/p7McK6cLRii7ICb97K3VSPkcw+k/fd98jJHchkAFog==
X-Received: by 2002:a17:903:1aec:b0:240:2e93:8a9a with SMTP id
 d9443c01a7336-2430d1e570amr56436565ad.42.1755100924906; 
 Wed, 13 Aug 2025 09:02:04 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com
 ([2401:4900:1cb8:7b85:9b4a:84f0:66de:85c7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2429b4ca995sm197380615ad.177.2025.08.13.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:02:04 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org
Date: Wed, 13 Aug 2025 21:31:43 +0530
Message-ID: <20250813160148.132192-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.176;
 envelope-from=chandramohan.explore@gmail.com; helo=mail-pl1-f176.google.com
X-Mailman-Approved-At: Thu, 14 Aug 2025 18:16:14 +0000
Subject: [apparmor] [PATCH] apparmor: Remove unused value
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
Cc: linux-kernel-mentees@lists.linux.dev,
 Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The value "new" is being assigned to NULL but that statement does not
 have effect since "new" is being overwritten in the subsequent fallback case.

Remove the unused value. This issue was reported by coverity static
analyzer.

Fixes: a9eb185be84e9 (apparmor: fix x_table_lookup)
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 security/apparmor/domain.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 267da82afb14..9c0c7fa8de46 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -592,7 +592,6 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		if (!new || **lookupname != '&')
 			break;
 		stack = new;
-		new = NULL;
 		fallthrough;	/* to X_NAME */
 	case AA_X_NAME:
 		if (xindex & AA_X_CHILD)
-- 
2.43.0


