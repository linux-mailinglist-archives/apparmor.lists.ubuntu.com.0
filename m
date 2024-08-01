Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A5945843
	for <lists+apparmor@lfdr.de>; Fri,  2 Aug 2024 08:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sZmAR-00033A-Qb; Fri, 02 Aug 2024 06:53:35 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <simeddon@gmail.com>)
 id 1sZTCL-0000Q4-36
 for apparmor@lists.ubuntu.com; Thu, 01 Aug 2024 10:38:17 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2cb576db1c5so4435729a91.1
 for <apparmor@lists.ubuntu.com>; Thu, 01 Aug 2024 03:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722508695; x=1723113495;
 h=content-transfer-encoding:commitdate:authordate:author:mime-version
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OddAGnogMzwyUywxt75MAgs7i5xQVWsmf4N9UvPIx4=;
 b=U+1QCVcXQyvo8YyjoEij2R0aEWNH+C99Asyh97GF42usyUjSh8VbgiJCjeU+2MzcGW
 Q3kBXLs9gMwBpqArvayR0M8bTai+y+4YDMBF3JnCc/5Kr3adWiee+Kla3Dozlxm9cudX
 /75ZM/9fTFGMfPoaGP2VY4ek56L+0ohHQKSJ7a9zNiblWOQZ35/DwcQ3GGxSyvnj79zK
 3tvOFl4K6itE9hP+j/reTYHsHOOeDQnYDQUGGVPhhOHJlQMEwtXeAyMl7rFKVHcNtCw4
 6Z80YK7ZPsQMIhnFLdNEp2J9CAYPt6mRdijhjeBVlN3rYe5ORUZpCh7DXe45sEDZi4JC
 8X+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmn4AVEOtHtqFS9qtTW5y1IXO1hoQ5zOpSsr6/qvSFJ0jzLlHM+qQ/g+K0DFXKhEVgg9W2udIEY50bdzDJYIxpXN9hCZr9IAFb
X-Gm-Message-State: AOJu0YxB2fSdwQGirhPvdUCsodfuAhfGZmFU9qxqR7o6nczOI1sMsFv3
 iqAC6AuJ66Xm8xyr7NOoUcwgnQfD0/p1jWsNg5LopBrYndPSfnkA
X-Google-Smtp-Source: AGHT+IFBI0DHScbC6amgBlVxn2J2zKkK3OutMUhQqP09Suo5Mh50hQluUVwU+3AmXk5ocswYWrT2SA==
X-Received: by 2002:a17:90b:380d:b0:2cd:27be:8218 with SMTP id
 98e67ed59e1d1-2cfe774a1e7mr2420917a91.8.1722508695210; 
 Thu, 01 Aug 2024 03:38:15 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfdc4add69sm2895495a91.47.2024.08.01.03.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 03:38:14 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: =corbet@lwn.net
Date: Thu,  1 Aug 2024 15:53:57 +0530
Message-Id: <20240801102356.93591-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Author: Siddharth Menon <simeddon@gmail.com>
AuthorDate: Fri Jul 26 23:43:49 2024 +0530
CommitDate: Thu Aug 1 15:35:52 2024 +0530
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.52; envelope-from=simeddon@gmail.com;
 helo=mail-pj1-f52.google.com
X-Mailman-Approved-At: Fri, 02 Aug 2024 06:53:32 +0000
Subject: [apparmor] [PATCH v2 1/1] Docs: Update LSM/apparmor.rst
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
Cc: Siddharth Menon <simeddon@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, apparmor@lists.ubuntu.com,
 =linux-doc@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Docs: Update LSM/apparmor.rst

After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
to enable and configuring AppArmor.
Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not
used either. Instead, the CONFIG_LSM parameter manages the order and
selection of LSMs.

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
V1 -> V2: Removed historical information and addressed review comments
 
 Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..47939ee89d74 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+The CONFIG_LSM parameter manages the order and selection of LSMs.
+Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
+in the list.
 
 Build the kernel
 
-- 
2.39.2


