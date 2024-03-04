Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 87944875416
	for <lists+apparmor@lfdr.de>; Thu,  7 Mar 2024 17:19:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1riGSn-0003f4-2H; Thu, 07 Mar 2024 16:19:26 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <colin.i.king@gmail.com>)
 id 1rhBJA-00072w-VJ
 for apparmor@lists.ubuntu.com; Mon, 04 Mar 2024 16:37:00 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-412e92deb18so2791385e9.1
 for <apparmor@lists.ubuntu.com>; Mon, 04 Mar 2024 08:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709570216; x=1710175016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D57LV4PQlM/pc6do6owRfCiEmFwq5OiC/rPbAO2Ui6E=;
 b=obiCeS+StXOql2GgreJxdOFCTqvNuZEfqTd58hfAcMdBeGOrd4A3GZu/PObkWp8Ptg
 CUbli4RnanRQ+4u34WpvOmIcA4VcNhFwcs9tbO4A4JeVLlXy3P1OcPxeQLuC4rNf5VnY
 T03PNgeGH0zzoZx0VoTl0WnzGKdWz4Aoiaj7omWwMK7upS0HTuKmhOiRXkIBGMYdSEI6
 IF0D/hyc9xu3TGu7pwwRoVNrjHRrPYRxyCcfjLu9AKyQyf2mdDCHXcCQFqRvg4RF3l/J
 d9RgApk+9A2VJliA7QhOLf8uTd8VHVvFJBrpIIF11hrbXSA/MKVCCDkITo5JL5sOFDe4
 FRgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7WfJjDAB0H2FodewZxcWdF2KyN1U3xNVourCZFq1PlMpZe2edS+jNKqr3HHjOg3PJ2LUXDaAxfAA/LbDiYCuljQe2UUqL6KP
X-Gm-Message-State: AOJu0Yyq7ILigHJX4RiqYfUK3RHLqAcXB/t96hL2FyhWv3vI25LzwQq+
 Fqzhkyqu1A1oUss7eOYMq8tuPExtPrw2MP8+vRhKyybMl3z9jb74
X-Google-Smtp-Source: AGHT+IGwhHmhMCQY5Wj9Ojyw77j2lS7hN7OmHTas5EyAlXpHFn/hpF7T3R90MIEi3AEaS8ApQIaj/g==
X-Received: by 2002:a05:600c:4f83:b0:412:bef7:317c with SMTP id
 n3-20020a05600c4f8300b00412bef7317cmr8052982wmq.13.1709570216101; 
 Mon, 04 Mar 2024 08:36:56 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b00412e556d4besm2679933wms.48.2024.03.04.08.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:36:55 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Mon,  4 Mar 2024 16:36:55 +0000
Message-Id: <20240304163655.771616-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.49;
 envelope-from=colin.i.king@gmail.com; helo=mail-wm1-f49.google.com
X-Mailman-Approved-At: Thu, 07 Mar 2024 16:19:01 +0000
Subject: [apparmor] [PATCH][next] apparmor: remove useless static inline
	function is_deleted
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The inlined function is_deleted is redundant, it is not called at all
from any function in security/apparmor/file.c and so it can be removed.

Cleans up clang scan build warning:
security/apparmor/file.c:153:20: warning: unused function
'is_deleted' [-Wunused-function]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 security/apparmor/file.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index c03eb7c19f16..d52a5b14dad4 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -144,19 +144,6 @@ int aa_audit_file(const struct cred *subj_cred,
 	return aa_audit(type, profile, &ad, file_audit_cb);
 }
 
-/**
- * is_deleted - test if a file has been completely unlinked
- * @dentry: dentry of file to test for deletion  (NOT NULL)
- *
- * Returns: true if deleted else false
- */
-static inline bool is_deleted(struct dentry *dentry)
-{
-	if (d_unlinked(dentry) && d_backing_inode(dentry)->i_nlink == 0)
-		return true;
-	return false;
-}
-
 static int path_name(const char *op, const struct cred *subj_cred,
 		     struct aa_label *label,
 		     const struct path *path, int flags, char *buffer,
-- 
2.39.2


