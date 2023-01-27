Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F367F681
	for <lists+apparmor@lfdr.de>; Sat, 28 Jan 2023 10:00:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pLh4P-0006c1-Rg; Sat, 28 Jan 2023 09:00:21 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3OTDUYwUKCBA724q7w44w1u.s42q55q72471y898.ArA39A.s42@flex--rmoar.bounces.google.com>)
 id 1pLV5X-0007cR-4D
 for apparmor@lists.ubuntu.com; Fri, 27 Jan 2023 20:12:43 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 a14-20020a5b0ace000000b007bf99065fcbso6442563ybr.2
 for <apparmor@lists.ubuntu.com>; Fri, 27 Jan 2023 12:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U5PweF5Md6NbIdnNvsH2BayzCnZUUA5GzHDCZFW7bFw=;
 b=ONWctdoEud7qQ4B99HG3h//Nh6GFQlodrwLFPGz7gXjP/o0pmC2lz/qXuJQsiAbwzm
 SxXvQaEy5uFk4g8C8Ye8SoZfrkZniuArrj65jPMjByR+bJNLMuQLqllZTO/xvgSAMAUc
 bhHbrtseaiyH7TspyFJj83HWGtNFn0r1BrpHVv71Nalq3rIuVU9t+fYuruji6+laUcs6
 UnCng6BcdB7yF8DLHN6LpqQDsWsAoS5KbB84BbmoO/35D3s/6TkTqmydFW7atw+np343
 IftJe77NrK2rUbZ5jJ7tB2zyseRG/CNlTr3gk/ZLWRvIYyJ6cU5w/3IWldHh45/MzENF
 Skdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U5PweF5Md6NbIdnNvsH2BayzCnZUUA5GzHDCZFW7bFw=;
 b=UtM+2q7vMEnADpsTTCnGmQu+tOFRjcD47svgBcKH7MMcuXKZlBxSFMjRz2L1ErQ4LF
 +l1UhBl0CoqUmSOahg+swwsbsL4PCIQyyvg+WgspbZAceUfQntozIWoxDXDm17dfqwwM
 Yg0G5fnBxMWfsXZmeZviAihjSh4Tz2ivnUrA4Cjt+NA9pK2PSkP/oymbOJs+lgU/kLDI
 2V2U8gDOnL3RBMkbDcgGSzxcX8i76/HOTk/XVTM9noX/Za24PoeNMWjfHnGzQ7/b+DTq
 sxdaMTUpIM2S9zU2LkxxPHEk6CoMrtCUBhIGvm8eUQnXpyoWzri+PWcoJCSmYnVP29Mx
 z4RA==
X-Gm-Message-State: AO0yUKXRHD8q0xmFJqbdGbdForAI0r9upntsORN8TV+ps5UE+7tTA1lW
 IAQSgd2KUmQRYaBrRL8KB3NSZZ11xQ==
X-Google-Smtp-Source: AK7set8VJGEtbKBZlU6hCuahzp1rc7G7d7am0mQLFXrImBHYa3g9f/I+bQ2PeH4yNwPIDrBhDJ5z+OkK4A==
X-Received: from rmoar-specialist.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:7d90:c0a8:45d3])
 (user=rmoar job=sendgmr) by 2002:a81:61c6:0:b0:50e:8ebe:45be with SMTP id
 v189-20020a8161c6000000b0050e8ebe45bemr193751ywb.214.1674850361795; Fri, 27
 Jan 2023 12:12:41 -0800 (PST)
Date: Fri, 27 Jan 2023 20:12:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127201219.775410-1-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: john.johansen@canonical.com, brendanhiggins@google.com, 
 davidgow@google.com, dlatypov@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 28 Jan 2023 09:00:20 +0000
Subject: [apparmor] [PATCH v1] apparmor: fix use of strcpy in
	policy_unpack_test
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
Cc: kernel test robot <lkp@intel.com>, apparmor@lists.ubuntu.com,
 Rae Moar <rmoar@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Replace the use of strcpy() in build_aa_ext_struct() in
policy_unpack_test.c with strscpy().

strscpy() is the safer method to use to ensure the buffer does not
overflow. This was found by kernel test robot:
https://lore.kernel.org/all/202301040348.NbfVsXO0-lkp@intel.com/.

Reported-by: kernel test robot <lkp@intel.com>

Signed-off-by: Rae Moar <rmoar@google.com>
---

Note: This patch is based on the apparmor-next branch. However, the
patch should also apply cleanly to the kselftest/kunit branch.

 security/apparmor/policy_unpack_test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index e1bfdab524b7..5c9bde25e56d 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -69,31 +69,30 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_STRING_NAME) + 1;
-	strcpy(buf + 3, TEST_STRING_NAME);
+	strscpy(buf + 3, TEST_STRING_NAME, e->end - (void *)(buf + 3));
 
 	buf = e->start + TEST_STRING_BUF_OFFSET;
 	*buf = AA_STRING;
 	*(buf + 1) = strlen(TEST_STRING_DATA) + 1;
-	strcpy(buf + 3, TEST_STRING_DATA);
-
+	strscpy(buf + 3, TEST_STRING_DATA, e->end - (void *)(buf + 3));
 	buf = e->start + TEST_NAMED_U32_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_U32_NAME) + 1;
-	strcpy(buf + 3, TEST_U32_NAME);
+	strscpy(buf + 3, TEST_U32_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U32_NAME) + 1) = AA_U32;
 	*((u32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = TEST_U32_DATA;
 
 	buf = e->start + TEST_NAMED_U64_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_U64_NAME) + 1;
-	strcpy(buf + 3, TEST_U64_NAME);
+	strscpy(buf + 3, TEST_U64_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U64_NAME) + 1) = AA_U64;
 	*((u64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = TEST_U64_DATA;
 
 	buf = e->start + TEST_NAMED_BLOB_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_BLOB_NAME) + 1;
-	strcpy(buf + 3, TEST_BLOB_NAME);
+	strscpy(buf + 3, TEST_BLOB_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_BLOB_NAME) + 1) = AA_BLOB;
 	*(buf + 3 + strlen(TEST_BLOB_NAME) + 2) = TEST_BLOB_DATA_SIZE;
 	memcpy(buf + 3 + strlen(TEST_BLOB_NAME) + 6,
@@ -102,7 +101,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	buf = e->start + TEST_NAMED_ARRAY_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_ARRAY_NAME) + 1;
-	strcpy(buf + 3, TEST_ARRAY_NAME);
+	strscpy(buf + 3, TEST_ARRAY_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_ARRAY_NAME) + 1) = AA_ARRAY;
 	*((u16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = TEST_ARRAY_SIZE;
 

base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
-- 
2.39.1.456.gfc5497dd1b-goog


