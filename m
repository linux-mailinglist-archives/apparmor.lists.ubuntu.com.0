Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1094C255
	for <lists+apparmor@lfdr.de>; Thu,  8 Aug 2024 18:11:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sc5jp-0001Pz-JX; Thu, 08 Aug 2024 16:11:41 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <groeck7@gmail.com>) id 1sc5Y8-0000Ft-I0
 for apparmor@lists.ubuntu.com; Thu, 08 Aug 2024 15:59:36 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso913489b3a.0
 for <apparmor@lists.ubuntu.com>; Thu, 08 Aug 2024 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723132775; x=1723737575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kUjHTbBqy9ZeAxHJojWr0iq+a17EATMPja0/Lfx1fo=;
 b=T2+XbPV6ECwqc5Uerg24uqSLSt2s+F3pnObUkznCeKofj/Lhg364l1BNcxlMkQnH64
 hxDqsvSFHFBs+LeSZz9Rg8obsECE4XvHfi658gdOeuY4MA/8r58PLEIjMIjdqhb8ltPE
 glPElA8te73n6NuqG5kklp+L2CCvbeCkQ2uOxE+MfpsANMXSfpO8fT+rWoAO+YQnpjZ8
 JD9+QwxbSRCxKWwpeLdeiqMnqPzR2zCKM9Hf5UfUlbF86gC8A4709upq3dik0AYEYxCo
 F6n9TVLN+bpUK9gLktqi6G+eDnEtRO8PqhsCM8+cPeRTY4QyizrXLHou2wBDRkwH6Jhy
 BD8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn19IexWf3IRHvC72yQTpGgMZ4wGXD8j9PNFJtdMKKGJTqxnUwl/s2j4f5XKf5XQzDJRNUdxag6T/uNWpUw/S1tbLf60wlYX2X
X-Gm-Message-State: AOJu0YyWyQCoRqwOsb7EZTRjieyGxicCpX16HZhGVBxn04joVF+gxLuw
 ZH4DDHMwOPaOeWBaPrTYXSSxgNoNQaGBDLiTucCS6R2XzGpQmaQV
X-Google-Smtp-Source: AGHT+IF26TxdY5EP8WiP7V6kZ8hbYlBiQ0hXvxyoqIa69Gvjfa7kAqBGwR4qbH+/xobCbCcK2vXOew==
X-Received: by 2002:a05:6a21:6da8:b0:1c4:87b9:7ef9 with SMTP id
 adf61e73a8af0-1c6fcfec8a4mr2814985637.42.1723132774440; 
 Thu, 08 Aug 2024 08:59:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1b3a9e308sm3619406a91.9.2024.08.08.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 08:59:33 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: John Johansen <john.johansen@canonical.com>
Date: Thu,  8 Aug 2024 08:59:31 -0700
Message-ID: <20240808155931.1290349-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.173; envelope-from=groeck7@gmail.com;
 helo=mail-pf1-f173.google.com
X-Mailman-Approved-At: Thu, 08 Aug 2024 16:11:40 +0000
Subject: [apparmor] [PATCH] apparmor: fix policy_unpack_test on big endian
	systems
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
Cc: Paul Moore <paul@paul-moore.com>, Kees Cook <keescook@chromium.org>,
 Brendan Higgins <brendanhiggins@google.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

policy_unpack_test fails on big endian systems because data byte order
is expected to be little endian but is generated in host byte order.
This results in test failures such as:

 # policy_unpack_test_unpack_array_with_null_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:150
    Expected array_size == (u16)16, but
        array_size == 4096 (0x1000)
        (u16)16 == 16 (0x10)
    # policy_unpack_test_unpack_array_with_null_name: pass:0 fail:1 skip:0 total:1
    not ok 3 policy_unpack_test_unpack_array_with_null_name
    # policy_unpack_test_unpack_array_with_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:164
    Expected array_size == (u16)16, but
        array_size == 4096 (0x1000)
        (u16)16 == 16 (0x10)
    # policy_unpack_test_unpack_array_with_name: pass:0 fail:1 skip:0 total:1

Add the missing endianness conversions when generating test data.

Fixes: 4d944bcd4e73 ("apparmor: add AppArmor KUnit tests for policy unpack")
Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 security/apparmor/policy_unpack_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 874fcf97794e..c64733d6c98f 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -80,14 +80,14 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_U32_NAME) + 1;
 	strscpy(buf + 3, TEST_U32_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U32_NAME) + 1) = AA_U32;
-	*((u32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = TEST_U32_DATA;
+	*((__le32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = cpu_to_le32(TEST_U32_DATA);
 
 	buf = e->start + TEST_NAMED_U64_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_U64_NAME) + 1;
 	strscpy(buf + 3, TEST_U64_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U64_NAME) + 1) = AA_U64;
-	*((u64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = TEST_U64_DATA;
+	*((__le64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = cpu_to_le64(TEST_U64_DATA);
 
 	buf = e->start + TEST_NAMED_BLOB_BUF_OFFSET;
 	*buf = AA_NAME;
@@ -103,7 +103,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_ARRAY_NAME) + 1;
 	strscpy(buf + 3, TEST_ARRAY_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_ARRAY_NAME) + 1) = AA_ARRAY;
-	*((u16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = TEST_ARRAY_SIZE;
+	*((__le16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = cpu_to_le16(TEST_ARRAY_SIZE);
 
 	return e;
 }
-- 
2.45.2


