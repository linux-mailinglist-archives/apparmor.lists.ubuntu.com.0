Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CA7D1BBB
	for <lists+apparmor@lfdr.de>; Sat, 21 Oct 2023 10:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qu7Iw-0002hB-9i; Sat, 21 Oct 2023 08:25:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <arnd@kernel.org>) id 1qtpJP-0007TC-Af
 for apparmor@lists.ubuntu.com; Fri, 20 Oct 2023 13:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1519462179;
 Fri, 20 Oct 2023 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1A6C433C8;
 Fri, 20 Oct 2023 13:13:06 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
Date: Fri, 20 Oct 2023 15:12:57 +0200
Message-Id: <20231020131303.785906-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Oct 2023 08:24:47 +0000
Subject: [apparmor] [PATCH] apparmor: mark new functions static
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
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Khadija Kamran <kamrankhadijadj@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Arnd Bergmann <arnd@arndb.de>

Two new functions were introduced as global functions when they are
only called from inside the file that defines them and should have
been static:

security/apparmor/lsm.c:658:5: error: no previous prototype for 'apparmor_uring_override_creds' [-Werror=missing-prototypes]
security/apparmor/lsm.c:682:5: error: no previous prototype for 'apparmor_uring_sqpoll' [-Werror=missing-prototypes]

Fixes: c4371d90633b7 ("apparmor: add io_uring mediation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 91ff91cf1aaef..4981bdf029931 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -655,7 +655,7 @@ static int profile_uring(struct aa_profile *profile, u32 request,
  * Check to see if the current task is allowed to override it's credentials
  * to service an io_uring operation.
  */
-int apparmor_uring_override_creds(const struct cred *new)
+static int apparmor_uring_override_creds(const struct cred *new)
 {
 	struct aa_profile *profile;
 	struct aa_label *label;
@@ -679,7 +679,7 @@ int apparmor_uring_override_creds(const struct cred *new)
  * Check to see if the current task is allowed to create a new io_uring
  * kernel polling thread.
  */
-int apparmor_uring_sqpoll(void)
+static int apparmor_uring_sqpoll(void)
 {
 	struct aa_profile *profile;
 	struct aa_label *label;
-- 
2.39.2


