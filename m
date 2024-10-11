Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC4B999930
	for <lists+apparmor@lfdr.de>; Fri, 11 Oct 2024 03:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sz4NU-0005Qe-M6; Fri, 11 Oct 2024 01:23:36 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ruanjinjie@huawei.com>)
 id 1sz4NR-0005PW-Hu
 for apparmor@lists.ubuntu.com; Fri, 11 Oct 2024 01:23:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XPpkx5qVYz1SBqQ;
 Fri, 11 Oct 2024 09:22:17 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id B0A59140257;
 Fri, 11 Oct 2024 09:23:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Oct
 2024 09:23:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <skhan@linuxfoundation.org>,
 <mike.salvatore@canonical.com>, <kees@kernel.org>,
 <brendan.higgins@linux.dev>, <apparmor@lists.ubuntu.com>,
 <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 11 Oct 2024 09:22:41 +0800
Message-ID: <20241011012241.3251128-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
Subject: [apparmor] [PATCH] apparmor: test: Fix memory leak for
	aa_unpack_strdup()
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
Cc: ruanjinjie@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The string allocated by kmemdup() in aa_unpack_strdup() is not
freed and cause following memory leaks, free them to fix it.

	unreferenced object 0xffffff80c6af8a50 (size 8):
	  comm "kunit_try_catch", pid 225, jiffies 4294894407
	  hex dump (first 8 bytes):
	    74 65 73 74 69 6e 67 00                          testing.
	  backtrace (crc 5eab668b):
	    [<0000000001e3714d>] kmemleak_alloc+0x34/0x40
	    [<000000006e6c7776>] __kmalloc_node_track_caller_noprof+0x300/0x3e0
	    [<000000006870467c>] kmemdup_noprof+0x34/0x60
	    [<000000001176bb03>] aa_unpack_strdup+0xd0/0x18c
	    [<000000008ecde918>] policy_unpack_test_unpack_strdup_with_null_name+0xf8/0x3ec
	    [<0000000032ef8f77>] kunit_try_run_case+0x13c/0x3ac
	    [<00000000f3edea23>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<00000000adf936cf>] kthread+0x2e8/0x374
	    [<0000000041bb1628>] ret_from_fork+0x10/0x20
	unreferenced object 0xffffff80c2a29090 (size 8):
	  comm "kunit_try_catch", pid 227, jiffies 4294894409
	  hex dump (first 8 bytes):
	    74 65 73 74 69 6e 67 00                          testing.
	  backtrace (crc 5eab668b):
	    [<0000000001e3714d>] kmemleak_alloc+0x34/0x40
	    [<000000006e6c7776>] __kmalloc_node_track_caller_noprof+0x300/0x3e0
	    [<000000006870467c>] kmemdup_noprof+0x34/0x60
	    [<000000001176bb03>] aa_unpack_strdup+0xd0/0x18c
	    [<0000000046a45c1a>] policy_unpack_test_unpack_strdup_with_name+0xd0/0x3c4
	    [<0000000032ef8f77>] kunit_try_run_case+0x13c/0x3ac
	    [<00000000f3edea23>] kunit_generic_run_threadfn_adapter+0x80/0xec
	    [<00000000adf936cf>] kthread+0x2e8/0x374
	    [<0000000041bb1628>] ret_from_fork+0x10/0x20

Cc: stable@vger.kernel.org
Fixes: 4d944bcd4e73 ("apparmor: add AppArmor KUnit tests for policy unpack")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 security/apparmor/policy_unpack_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index c64733d6c98f..f070902da8fc 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -281,6 +281,8 @@ static void policy_unpack_test_unpack_strdup_with_null_name(struct kunit *test)
 			   ((uintptr_t)puf->e->start <= (uintptr_t)string)
 			   && ((uintptr_t)string <= (uintptr_t)puf->e->end));
 	KUNIT_EXPECT_STREQ(test, string, TEST_STRING_DATA);
+
+	kfree(string);
 }
 
 static void policy_unpack_test_unpack_strdup_with_name(struct kunit *test)
@@ -296,6 +298,8 @@ static void policy_unpack_test_unpack_strdup_with_name(struct kunit *test)
 			   ((uintptr_t)puf->e->start <= (uintptr_t)string)
 			   && ((uintptr_t)string <= (uintptr_t)puf->e->end));
 	KUNIT_EXPECT_STREQ(test, string, TEST_STRING_DATA);
+
+	kfree(string);
 }
 
 static void policy_unpack_test_unpack_strdup_out_of_bounds(struct kunit *test)
@@ -313,6 +317,8 @@ static void policy_unpack_test_unpack_strdup_out_of_bounds(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, size, 0);
 	KUNIT_EXPECT_NULL(test, string);
 	KUNIT_EXPECT_PTR_EQ(test, puf->e->pos, start);
+
+	kfree(string);
 }
 
 static void policy_unpack_test_unpack_nameX_with_null_name(struct kunit *test)
-- 
2.34.1


