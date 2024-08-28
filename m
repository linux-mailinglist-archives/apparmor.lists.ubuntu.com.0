Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018096558E
	for <lists+apparmor@lfdr.de>; Fri, 30 Aug 2024 05:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sjs0h-0004Wt-Es; Fri, 30 Aug 2024 03:09:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lihongbo22@huawei.com>)
 id 1sjHd4-0002uv-I4
 for apparmor@lists.ubuntu.com; Wed, 28 Aug 2024 12:18:27 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wv3MG4Ww7z16Pd1;
 Wed, 28 Aug 2024 20:17:30 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id DD808180106;
 Wed, 28 Aug 2024 20:18:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:18:18 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>
Date: Wed, 28 Aug 2024 20:26:18 +0800
Message-ID: <20240828122618.3697392-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=lihongbo22@huawei.com; helo=szxga08-in.huawei.com
X-Mailman-Approved-At: Fri, 30 Aug 2024 03:09:14 +0000
Subject: [apparmor] [PATCH -next] apparmor: Use IS_ERR_OR_NULL() helper
	function
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
 lihongbo22@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Use the IS_ERR_OR_NULL() helper instead of open-coding a
NULL and an error pointer checks to simplify the code and
improve readability.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 security/apparmor/path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/path.c b/security/apparmor/path.c
index 45ec994b558d..d6c74c357ffd 100644
--- a/security/apparmor/path.c
+++ b/security/apparmor/path.c
@@ -130,7 +130,7 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
 	/* handle error conditions - and still allow a partial path to
 	 * be returned.
 	 */
-	if (!res || IS_ERR(res)) {
+	if (IS_ERR_OR_NULL(res)) {
 		if (PTR_ERR(res) == -ENAMETOOLONG) {
 			error = -ENAMETOOLONG;
 			*name = buf;
-- 
2.34.1


