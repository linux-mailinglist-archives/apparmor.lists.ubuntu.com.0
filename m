Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C119CD653
	for <lists+apparmor@lfdr.de>; Fri, 15 Nov 2024 05:59:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tBoPw-0002GU-29; Fri, 15 Nov 2024 04:58:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tAVji-0000zz-Hp
 for apparmor@lists.ubuntu.com; Mon, 11 Nov 2024 14:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BFEB45C545A;
 Mon, 11 Nov 2024 14:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717EAC4CECF;
 Mon, 11 Nov 2024 14:49:48 +0000 (UTC)
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Nov 2024 07:49:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIYZMmcC/x2NQQrDMAwEvxJ0riA2hkC+EnpQbSUROLaRSxsI+
 XtF9zaHmb2gswp3mIcLlD/SpRYD9xgg7lQ2RknG4EcfnA2pNdKjKq5yYqYXZ0wcMym9TcUvaZG
 y4RqTD5F9CmECizVlE/5Hy/O+f49tURV4AAAA
X-Change-ID: 20241111-apparmor-fix-label-declaration-warning-fcd24ce2d447
To: John Johansen <john.johansen@canonical.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZZOkQZlepEFjStUosjL2ipFfpBBqpltZJPRQrLteQ7I=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlGkj1aedv2/Dkot0DL/lLXycubufgUeW5IXVDedMwn1
 bBdPmtmRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhI7AtGhj08lleXfD3rsvzp
 nDVNKa8z2C70rWkBGjrp0TIu9RzzKob/2cevRH8zUjWYeXvxvy/WRW+uytZPNtmko6RatXH91me
 vuAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Received-SPF: pass client-ip=139.178.84.217; envelope-from=nathan@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Fri, 15 Nov 2024 04:58:46 +0000
Subject: [apparmor] [PATCH] apparmor: Add empty statement between label and
 declaration in profile_transition(()
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, linux-security-module@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Clang 18 and newer warns (or errors with CONFIG_WERROR=y):

  security/apparmor/domain.c:695:3: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
    695 |                 struct aa_profile *new_profile = NULL;
        |                 ^

With Clang 17 and older, this is just an unconditional hard error:

  security/apparmor/domain.c:695:3: error: expected expression
    695 |                 struct aa_profile *new_profile = NULL;
        |                 ^
  security/apparmor/domain.c:697:3: error: use of undeclared identifier 'new_profile'
    697 |                 new_profile = aa_new_learning_profile(profile, false, name,
        |                 ^
  security/apparmor/domain.c:699:8: error: use of undeclared identifier 'new_profile'
    699 |                 if (!new_profile) {
        |                      ^
  security/apparmor/domain.c:704:11: error: use of undeclared identifier 'new_profile'
    704 |                         new = &new_profile->label;
        |                                ^

Add a semicolon directly after the label to create an empty statement,
which keeps the original intent of the code while clearing up the
warning/error on all clang versions.

Fixes: ee650b3820f3 ("apparmor: properly handle cx/px lookup failure for complain")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411101808.AI8YG6cs-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 security/apparmor/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 602d7a1bb44823a9b81e34d270b03c5f3aff3a34..eb0f222aa29442686b0a6751001c879f5b366c59 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -691,7 +691,7 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 			error = -EACCES;
 		}
 	} else if (COMPLAIN_MODE(profile)) {
-create_learning_profile:
+create_learning_profile:;
 		/* no exec permission - learning mode */
 		struct aa_profile *new_profile = NULL;
 

---
base-commit: 8c4f7960ae8a7a03a43f814e4af471b8e6ea3391
change-id: 20241111-apparmor-fix-label-declaration-warning-fcd24ce2d447

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


