Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 91879824CB0
	for <lists+apparmor@lfdr.de>; Fri,  5 Jan 2024 03:01:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rLZWj-0002HM-4y; Fri, 05 Jan 2024 02:01:37 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <cuigaosheng1@huawei.com>)
 id 1rLZWe-0002H4-5n
 for apparmor@lists.ubuntu.com; Fri, 05 Jan 2024 02:01:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4T5mqh5mPmz1g1wj;
 Fri,  5 Jan 2024 10:00:00 +0800 (CST)
Received: from kwepemd100002.china.huawei.com (unknown [7.221.188.184])
 by mail.maildlp.com (Postfix) with ESMTPS id D56751A0172;
 Fri,  5 Jan 2024 10:01:27 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd100002.china.huawei.com (7.221.188.184) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Fri, 5 Jan 2024 10:01:27 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <georgia.garcia@canonical.com>,
 <cuigaosheng1@huawei.com>
Date: Fri, 5 Jan 2024 10:01:26 +0800
Message-ID: <20240105020126.315700-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100002.china.huawei.com (7.221.188.184)
Subject: [apparmor] [PATCH] apparmor: Fix memory leak in unpack_profile()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The aa_put_pdb(rules->file) should be called when rules->file is
reassigned, otherwise there may be a memory leak.

This was found via kmemleak:

unreferenced object 0xffff986c17056600 (size 192):
  comm "apparmor_parser", pid 875, jiffies 4294893488
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 89 14 04 6c 98 ff ff  ............l...
    00 00 8c 11 6c 98 ff ff bc 0c 00 00 00 00 00 00  ....l...........
  backtrace (crc e28c80c4):
    [<ffffffffba25087f>] kmemleak_alloc+0x4f/0x90
    [<ffffffffb95ecd42>] kmalloc_trace+0x2d2/0x340
    [<ffffffffb98a7b3d>] aa_alloc_pdb+0x4d/0x90
    [<ffffffffb98ab3b8>] unpack_pdb+0x48/0x660
    [<ffffffffb98ac073>] unpack_profile+0x693/0x1090
    [<ffffffffb98acf5a>] aa_unpack+0x10a/0x6e0
    [<ffffffffb98a93e3>] aa_replace_profiles+0xa3/0x1210
    [<ffffffffb989a183>] policy_update+0x163/0x2a0
    [<ffffffffb989a381>] profile_replace+0xb1/0x130
    [<ffffffffb966cb64>] vfs_write+0xd4/0x3d0
    [<ffffffffb966d05b>] ksys_write+0x6b/0xf0
    [<ffffffffb966d10e>] __x64_sys_write+0x1e/0x30
    [<ffffffffba242316>] do_syscall_64+0x76/0x120
    [<ffffffffba4000e5>] entry_SYSCALL_64_after_hwframe+0x6c/0x74

So add aa_put_pdb(rules->file) to fix it when rules->file is reassigned.

Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/policy_unpack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 47ec097d6741..16afe992a724 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1022,8 +1022,10 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 		}
 	} else if (rules->policy->dfa &&
 		   rules->policy->start[AA_CLASS_FILE]) {
+		aa_put_pdb(rules->file);
 		rules->file = aa_get_pdb(rules->policy);
 	} else {
+		aa_put_pdb(rules->file);
 		rules->file = aa_get_pdb(nullpdb);
 	}
 	error = -EPROTO;
-- 
2.25.1


