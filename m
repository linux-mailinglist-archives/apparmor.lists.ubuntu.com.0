Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A49255F411B
	for <lists+apparmor@lfdr.de>; Tue,  4 Oct 2022 12:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1offXF-0007Oe-Bs; Tue, 04 Oct 2022 10:52:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <usama.anjum@collabora.com>) id 1ofdYM-0007Ln-29
 for apparmor@lists.ubuntu.com; Tue, 04 Oct 2022 08:45:26 +0000
Received: from lenovo.Home (unknown [39.45.148.204])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AAF186602294;
 Tue,  4 Oct 2022 09:45:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664873125;
 bh=DDe39PfAYSVpLkDZAiTg9JOc4VmntwqihIfPrL/dtsE=;
 h=From:To:Cc:Subject:Date:From;
 b=iqud63xj3L9NEwYkQSdqmyuuhYoiWK7t9kIVINO06950UrVH/UdZSvc5c/6aeTDHI
 npwvlS4ueiA2+FBzGnCfV0LWnZYzWwkwFp6bwSAM4UQLCoi6jeD8kQmVf4sRWEzQ/k
 y0+zbEoyBi31N3RxX19Y2d96qGOhkMjOebWE5WpMuLr42l+ctQyIi1r6AhWOZtLdTN
 gH8B7MkYZw8lS1ruSB8UDRAxRnsfuJDcl6yoqqZmTESMzGUyb2neEYovX3av4u7Tey
 HtjHuwLGOIExwjZHGA1MG172ZnFIbpMPcavlKH9z6aafh6QHvA0tYBpP+hST07A+pT
 bqlgNGiTgK/Lg==
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Tue,  4 Oct 2022 13:45:15 +0500
Message-Id: <20221004084515.659441-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Oct 2022 10:52:24 +0000
Subject: [apparmor] [PATCH] apparmor: store return value of
	unpack_perms_table() to signed variable
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
Cc: kernel-janitors@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@collabora.com>,
 linux-security-module@vger.kernel.org, kernel@collabora.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The unpack_perms_table() can return error which is negative value. Store
the return value to a signed variable. policy->size is unsigned
variable. It shouldn't be used to store the return status.

Fixes: 2d6b2dea7f3c ("apparmor: add the ability for policy to specify a permission table")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 security/apparmor/policy_unpack.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 45c9dfdc8e0d..09f316943951 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -734,14 +734,18 @@ static int unpack_pdb(struct aa_ext *e, struct aa_policydb *policy,
 {
 	void *pos = e->pos;
 	int i, flags, error = -EPROTO;
+	ssize_t size;
 
-	policy->size = unpack_perms_table(e, &policy->perms);
-	if (policy->size < 0) {
-		error = policy->size;
+	size = unpack_perms_table(e, &policy->perms);
+	if (size < 0) {
+		error = size;
 		policy->perms = NULL;
 		*info = "failed to unpack - perms";
 		goto fail;
-	} else if (policy->perms) {
+	}
+	policy->size = size;
+
+	if (policy->perms) {
 		/* perms table present accept is index */
 		flags = TO_ACCEPT1_FLAG(YYTD_DATA32);
 	} else {
-- 
2.30.2


