Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 07451A4D16B
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 03:09:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpHiP-0004KW-PZ; Tue, 04 Mar 2025 02:09:01 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpHiO-0004Jz-Kg
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 02:09:00 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E990A3FE32
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 02:08:59 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-223d86b4df0so13036905ad.3
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 18:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741054138; x=1741658938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwA3QkBZDTvjGAmBfPz6fmuwCLSgS6bgBBVBqRWXetA=;
 b=MS2Qmvwu9ICF8wHcLEn//4IpGvH0RVIjnU2DxofY8ZWtDVT1a29MCGbtVM8v/ZC5ad
 QmTXlb9589LrMXqFKXfggO2ptOSv2/BndycwNEqEQlkGKstHh4wixu4hG5QTrDRueDUZ
 ViRMtWmh9NcEWAX7F1ItXzDLdj7KAw5oMBMgVOWo4byVM/H8baDutcZP9shdiE00TYzL
 GxlDzLiy/jDyd+qgXHxo9vFKG9cSSe5R1DX6aoCA4+Riy+h65L2GzCw7CY23BvVliEUI
 fB19deGmCB6Ivgc7Os/pm9ztLuXNB5vLBP+awXOMf+uB9/Ns8p9BM1OTVsJ4CebbAvRE
 PmWw==
X-Gm-Message-State: AOJu0YzNTY1M/xU4+e/Ri0xe90RVzKp2xUh8GiW5M9S5MEeNvyX7U3kf
 qFGy9zgdqyxcue43WyPjiahw/qp/+3LSlNEKIc/u+0NFxBSqKRekq8FIafMUxb7t5sDmgE7x1sR
 Jid78lBOhYaCirtrmM2oVgP6voVEZuqjY/DRWYMSRaZK/BEntQ3Bgsk4Eddgu5lR7rc19omPZhK
 LRPn98yA==
X-Gm-Gg: ASbGncv8rHqbQ/wViA2i0QSQgsc2LIdM0Z0kMxYdLPPn4MZXUUvqjBVI6kNSnNk5RNo
 CcCrGEF4buik3OCNb2LK0YKhClHHGalYyPZera/f39PxLOXFTWPNU32UjdMcmu2LCqlfF5oPa3L
 WSx3NKCUfrtLArKK2c5QAuw7XqhnfWjrv9YO57M7b5MeyH0DOlGsdnHipGIapIhX0+ustKHL2Tm
 ud7U0hgkdwgw9qmfm7ZZLSHNcGazAh6AKlmdrFZaSq+KBlBit9DNTS3SJvtyYHTITP8Gedks8Or
 g91FF352Mky26JvC2sIL6ljBi/7in0sgBrF9M712iSHGFD2O383/t9puatW0s2pkEy8cKL8=
X-Received: by 2002:a17:902:f610:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-22368fa3822mr212892315ad.17.1741054138330; 
 Mon, 03 Mar 2025 18:08:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv4mFm7El1L1HnisQqzI+IntrcAZPGhF39cKXXkPLpCEWGq6q4jscIdbB7U6h5LzPRm4C1hg==
X-Received: by 2002:a17:902:f610:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-22368fa3822mr212892095ad.17.1741054138044; 
 Mon, 03 Mar 2025 18:08:58 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7358603f4a2sm7307217b3a.173.2025.03.03.18.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 18:08:57 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 18:08:49 -0800
Message-ID: <20250304020851.81749-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/2] apparmor: constify aa_perms pointer argument
	to aa_audit_file
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

The aa_audit_file function doesn't modify aa_perms, so pass the pointer
in as const.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c         | 2 +-
 security/apparmor/include/file.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index d52a5b14dad4..f3463f82fea3 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -92,7 +92,7 @@ static void file_audit_cb(struct audit_buffer *ab, void *va)
  * Returns: %0 or error on failure
  */
 int aa_audit_file(const struct cred *subj_cred,
-		  struct aa_profile *profile, struct aa_perms *perms,
+		  struct aa_profile *profile, const struct aa_perms *perms,
 		  const char *op, u32 request, const char *name,
 		  const char *target, struct aa_label *tlabel,
 		  kuid_t ouid, const char *info, int error)
diff --git a/security/apparmor/include/file.h b/security/apparmor/include/file.h
index 6e8f2aa66cd6..efc11b1bd9e0 100644
--- a/security/apparmor/include/file.h
+++ b/security/apparmor/include/file.h
@@ -72,7 +72,7 @@ struct path_cond {
 #define COMBINED_PERM_MASK(X) ((X).allow | (X).audit | (X).quiet | (X).kill)
 
 int aa_audit_file(const struct cred *cred,
-		  struct aa_profile *profile, struct aa_perms *perms,
+		  struct aa_profile *profile, const struct aa_perms *perms,
 		  const char *op, u32 request, const char *name,
 		  const char *target, struct aa_label *tlabel, kuid_t ouid,
 		  const char *info, int error);
-- 
2.43.0

base-kernel: v6.14-rc5
target: v6.14

