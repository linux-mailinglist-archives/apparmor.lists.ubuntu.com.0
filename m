Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401373CDB7
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKL-0002Iv-Le; Sun, 25 Jun 2023 01:14:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEKB-0002Dk-2h
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:55 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QpXz55rw9zTkxp;
 Sun, 25 Jun 2023 09:13:05 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:52 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:45 +0800
Message-ID: <20230625011349.1457810-8-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
References: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Subject: [apparmor] [PATCH -next 07/11] apparmor: Fix kernel-doc warnings in
	apparmor/match.c
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

Fix kernel-doc warnings:

security/apparmor/match.c:148: warning: Function parameter or member
'tables' not described in 'verify_table_headers'
security/apparmor/match.c:289: warning: Excess function parameter
'kr' description in 'aa_dfa_free_kref'
security/apparmor/match.c:289: warning: Function parameter or member
'kref' not described in 'aa_dfa_free_kref'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 security/apparmor/match.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index b97ef5e1db73..7bdcca2aed7d 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -136,7 +136,7 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
 
 /**
  * verify_table_headers - verify that the tables headers are as expected
- * @tables - array of dfa tables to check (NOT NULL)
+ * @tables: array of dfa tables to check (NOT NULL)
  * @flags: flags controlling what type of accept table are acceptable
  *
  * Assumes dfa has gone through the first pass verification done by unpacking
@@ -283,7 +283,7 @@ static void dfa_free(struct aa_dfa *dfa)
 
 /**
  * aa_dfa_free_kref - free aa_dfa by kref (called by aa_put_dfa)
- * @kr: kref callback for freeing of a dfa  (NOT NULL)
+ * @kref: kref callback for freeing of a dfa  (NOT NULL)
  */
 void aa_dfa_free_kref(struct kref *kref)
 {
-- 
2.25.1


