Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCE9690EC
	for <lists+apparmor@lfdr.de>; Tue,  3 Sep 2024 03:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1slINN-0002ZX-Av; Tue, 03 Sep 2024 01:30:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ruanjinjie@huawei.com>)
 id 1sl1WQ-0003dU-JL
 for apparmor@lists.ubuntu.com; Mon, 02 Sep 2024 07:30:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wy0jv4LP3zpVJg;
 Mon,  2 Sep 2024 15:28:51 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 06250140120;
 Mon,  2 Sep 2024 15:30:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Sep
 2024 15:30:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <ruanjinjie@huawei.com>, <apparmor@lists.ubuntu.com>, 
 <linux-security-module@vger.kernel.org>
Date: Mon, 2 Sep 2024 15:39:04 +0800
Message-ID: <20240902073904.3520301-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Mailman-Approved-At: Tue, 03 Sep 2024 01:30:32 +0000
Subject: [apparmor] [PATCH -next] apparmor: Remove unused parameter L1 in
	macro next_comb
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

In the macro definition of next_comb(), a parameter L1 is accepted,
but it is not used. Hence, it should be removed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 security/apparmor/include/label.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/include/label.h b/security/apparmor/include/label.h
index 2a72e6b17d68..2635eef0ae2b 100644
--- a/security/apparmor/include/label.h
+++ b/security/apparmor/include/label.h
@@ -160,7 +160,7 @@ int aa_label_next_confined(struct aa_label *l, int i);
 #define label_for_each_cont(I, L, P)					\
 	for (++((I).i); ((P) = (L)->vec[(I).i]); ++((I).i))
 
-#define next_comb(I, L1, L2)						\
+#define next_comb(I, L2)						\
 do {									\
 	(I).j++;							\
 	if ((I).j >= (L2)->size) {					\
@@ -174,7 +174,7 @@ do {									\
 #define label_for_each_comb(I, L1, L2, P1, P2)				\
 for ((I).i = (I).j = 0;							\
 	((P1) = (L1)->vec[(I).i]) && ((P2) = (L2)->vec[(I).j]);		\
-	(I) = next_comb(I, L1, L2))
+	(I) = next_comb(I, L2))
 
 #define fn_for_each_comb(L1, L2, P1, P2, FN)				\
 ({									\
-- 
2.34.1


