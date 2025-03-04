Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA01A4D107
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:35:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpHBj-0005yH-SV; Tue, 04 Mar 2025 01:35:15 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpHBi-0005y6-AW
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:35:14 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6E3153F31D
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:35:13 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2feda472a6eso4589853a91.0
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741052112; x=1741656912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtqeQVQFJ8A2Ir1Fjs2jsnGT5G308qgq0B0RlJmUZGw=;
 b=mwmq1QxMYTHt9UXfyk7BA5vlPDKNC3tbl7zpZzYA1VXhy3/oPdUn6g0KF46gNHYZLb
 uc44AYj45DyL1y/Gh5XOA9NyrPtt5R6pJGD1ENGKRouKVyaudd53lgU1md9kNEnjdAPG
 uLS1NUO2/OjlKYZD2NDvlL0sy42vrf7o0kgOos7IanuryvQ49qjO0XkbI6XCTSTQy3pc
 2lzQX9/uybfHPRH+UWxDjcGNgtwm/8EcbBJgeeiuskKMl9m3r3Uwq5SK+MPGhEgeEeR9
 8zY7Mta3zLhpJ1zzIP5KAKpSN+ardUZLOw42R2sEV/Vnox+f4HiR+HH9xI+J7CWyhpEB
 tMAA==
X-Gm-Message-State: AOJu0YzudMXVNcEX7dkWKGqUClfxJbOCQDfyl9bD7Ku1xjaddcMvNtUG
 wbsjznR4wxhsm99FZrTyEgEg1zkdlLpZgD46A9YiUMcnWq7xJQ0OdyQpVh674pjk6FrNZ9FlCN+
 5nV126JIa6apGGzA8g2kqUL4/qy6BB/B6B7vCGcZUJLG8aVX1fypUaJgMUFJDEXmVxlTKDrzqfi
 f1EB39IQ==
X-Gm-Gg: ASbGncutGwO5mp+BGMIaXa0h+TjP5EzKKObmPiatdRRh5qCv0nvwkJIj7tjotC/Doff
 Xt9GTwr4dlekd7m0lLxmyq8WSW83fWXtJ9jsCi/bKdA5MutNWPZTa7KI6aC3TMizh/97Jf1pUlb
 jyCud3OsERJJNknRYFV6wwgQPPGmnpZhKGIBhBXULSogGD5RJNnRYqwcnDnWjbJ4b7EEad8z9Ms
 IVd/yPVcUUeStSwjKxP4mMIdwFrr3otnLco6+mFs/uNGBJaB7/Xx1ZaId0nFOYZ/lWFp7sv2yRl
 JZeG5oBMNKhCcR3Q3FhZgOOdRhdcbq6WDtUWqrxeCe1mPSsjnvmS8DyZwYPyvcs3MHvTIVU=
X-Received: by 2002:a17:90b:4c07:b0:2ee:5bc9:75c7 with SMTP id
 98e67ed59e1d1-2febab2ec91mr22675644a91.5.1741052112122; 
 Mon, 03 Mar 2025 17:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKCWG7Y/h+IJiBeeQPxEduco30G3F+YdPnRVzQhdnWE0s9rUyoYOM4C9tClLrhY1inL+0x5w==
X-Received: by 2002:a17:90b:4c07:b0:2ee:5bc9:75c7 with SMTP id
 98e67ed59e1d1-2febab2ec91mr22675622a91.5.1741052111800; 
 Mon, 03 Mar 2025 17:35:11 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fea6753143sm9642486a91.4.2025.03.03.17.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:35:11 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:34:50 -0800
Message-ID: <20250304013452.68417-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: don't write to nullperms and allperms
	statics in aa_audit_file
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

nullperms and allperms are supposed to be constants that don't change. As
we can't update nullperms and the pointer arg to be const due to
prompt-mode profile updates in aa_audit_file, this is the next best way
to prevent nullperms from being written to.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index a59ba26e54d6..a4cdd6cb9af3 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -227,7 +227,12 @@ int aa_audit_file(const struct cred *subj_cred,
 		}
 		implicit_deny = (ad.request & ~perms->allow) & ~perms->deny;
 		if (USER_MODE(profile))
-			perms->prompt = ALL_PERMS_MASK;
+			/* Hacky workaround to avoid changing statics until the
+			 * write to perms can be moved out of aa_audit_file
+			 * and perms can be passed in as a const pointer
+			 */
+			if (perms != &nullperms && perms != &allperms)
+				perms->prompt = ALL_PERMS_MASK;
 
 		if (ad.request & MAY_EXEC)
 			AA_DEBUG(DEBUG_UPCALL,
-- 
2.43.0

base-kernel: Ubuntu-hwe-6.11-6.11.0-17.17_24.04.2
target: Ubuntu-kernel


