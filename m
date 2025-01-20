Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5FA16D4C
	for <lists+apparmor@lfdr.de>; Mon, 20 Jan 2025 14:21:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tZrii-0001eB-2O; Mon, 20 Jan 2025 13:21:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tZrig-0001dg-Sq
 for apparmor@lists.ubuntu.com; Mon, 20 Jan 2025 13:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA82F5C5AEE;
 Mon, 20 Jan 2025 13:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADE1C4CEE3;
 Mon, 20 Jan 2025 13:21:31 +0000 (UTC)
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 20 Jan 2025 06:21:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-apparmor-fix-unused-sock-__file_sock_perm-v1-1-8d17bd672c6a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMlNjmcC/x2N0QrCMBAEf6XcswdpqBb8FZGQphs9tEm4UBFK/
 73Rt5mH2d2oQgWVrt1Gio9UyalJf+ooPH16gGVuTtbYs+mtYV+K1yUrR/nymtaKmWsOL3Yuyhv
 ux65AFzYYLnacAuI0Utsritb8v273fT8AS3kMWXsAAAA=
X-Change-ID: 20250120-apparmor-fix-unused-sock-__file_sock_perm-0e4627bcefb7
To: John Johansen <john.johansen@canonical.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gC579WahATfW87vCukQ9zNWcta2vXe56nrlKbwqFpRs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOl9vrenr5XmPNRl71GfsOh6LPvTEIbyPScX8D6b1C8U4
 mDs6dPQUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACZSUM7wz559x0x+7wVdrTMS
 5BzSCqb4P1uW++dJ0HvThFmZha4vmRj+V/nYx062XfWEcynT8xz7QK04vrmewV2OoWY/DJZMry1
 gBAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Received-SPF: pass client-ip=139.178.84.217; envelope-from=nathan@kernel.org;
 helo=dfw.source.kernel.org
Subject: [apparmor] [PATCH] apparmor: Remove unused variable 'sock' in
 __file_sock_perm()
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

When CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS is disabled, there is a
warning that sock is unused:

  security/apparmor/file.c: In function '__file_sock_perm':
  security/apparmor/file.c:544:24: warning: unused variable 'sock' [-Wunused-variable]
    544 |         struct socket *sock = (struct socket *) file->private_data;
        |                        ^~~~

sock was moved into aa_sock_file_perm(), where the same check is
present, so remove sock and the assertion from __file_sock_perm() to fix
the warning.

Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501190757.myuLxLyL-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 security/apparmor/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 85f89814af1e..e3a858649942 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -541,11 +541,8 @@ static int __file_sock_perm(const char *op, const struct cred *subj_cred,
 			    struct aa_label *flabel, struct file *file,
 			    u32 request, u32 denied)
 {
-	struct socket *sock = (struct socket *) file->private_data;
 	int error;
 
-	AA_BUG(!sock);
-
 	/* revalidation due to label out of date. No revocation at this time */
 	if (!denied && aa_label_is_subset(flabel, label))
 		return 0;

---
base-commit: e6b087676954e36a7b1ed51249362bb499f8c1c2
change-id: 20250120-apparmor-fix-unused-sock-__file_sock_perm-0e4627bcefb7

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


