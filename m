Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE97F69D7
	for <lists+apparmor@lfdr.de>; Fri, 24 Nov 2023 01:32:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1r6K7c-0008WH-1L; Fri, 24 Nov 2023 00:32:40 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <srv_ts003@codethink.com>)
 id 1r5lq2-0000T4-6v
 for apparmor@lists.ubuntu.com; Wed, 22 Nov 2023 11:56:14 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1r5lq0-003nX6-8U; Wed, 22 Nov 2023 11:56:13 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
 (envelope-from <ben@rainbowdash>) id 1r5lq0-00000001CJ4-36MO;
 Wed, 22 Nov 2023 11:56:12 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: apparmor@lists.ubuntu.com
Date: Wed, 22 Nov 2023 11:56:11 +0000
Message-Id: <20231122115611.285625-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Nov 2023 00:32:39 +0000
Subject: [apparmor] [PATCH] apparmor: make stack_msg static
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
Cc: linux-security-module@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The stack_msg is not exported out of security/apparmor/domain.c so
make it static to avoid the following sparse warning:

security/apparmor/domain.c:1314:12: warning: symbol 'stack_msg' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 security/apparmor/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 89fbeab4b33b..571158ec6188 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -1311,7 +1311,7 @@ static int change_profile_perms_wrapper(const char *op, const char *name,
 	return error;
 }
 
-const char *stack_msg = "change_profile unprivileged unconfined converted to stacking";
+static const char *stack_msg = "change_profile unprivileged unconfined converted to stacking";
 
 /**
  * aa_change_profile - perform a one-way profile transition
-- 
2.37.2.352.g3c44437643


