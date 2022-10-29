Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C15596128A8
	for <lists+apparmor@lfdr.de>; Sun, 30 Oct 2022 08:24:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1op2fl-0005xY-7d; Sun, 30 Oct 2022 07:23:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huawei.com>) id 1ooaeC-00006u-Sl
 for apparmor@lists.ubuntu.com; Sat, 29 Oct 2022 01:28:29 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MzhYp6j8DzFqRp;
 Sat, 29 Oct 2022 09:25:34 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 09:28:24 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>
Date: Sat, 29 Oct 2022 09:25:05 +0800
Message-ID: <20221029012505.227136-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 30 Oct 2022 07:23:56 +0000
Subject: [apparmor] [PATCH] apparmor: Add __init annotation to
	aa_{setup/teardown}_dfa_engine()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The aa_setup_dfa_engine() and aa_teardown_dfa_engine() is only called in
apparmor_init(), so let us add __init annotation to them.

Fixes: 11c236b89d7c ("apparmor: add a default null dfa")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/match.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 5095c26ca683..b97ef5e1db73 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -31,7 +31,7 @@ static char stacksplitdfa_src[] = {
 };
 struct aa_dfa *stacksplitdfa;
 
-int aa_setup_dfa_engine(void)
+int __init aa_setup_dfa_engine(void)
 {
 	int error;
 
@@ -59,7 +59,7 @@ int aa_setup_dfa_engine(void)
 	return 0;
 }
 
-void aa_teardown_dfa_engine(void)
+void __init aa_teardown_dfa_engine(void)
 {
 	aa_put_dfa(stacksplitdfa);
 	aa_put_dfa(nulldfa);
-- 
2.17.1


