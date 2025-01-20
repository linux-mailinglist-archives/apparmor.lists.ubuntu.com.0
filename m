Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1EA16D10
	for <lists+apparmor@lfdr.de>; Mon, 20 Jan 2025 14:12:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tZrZf-0005Np-LB; Mon, 20 Jan 2025 13:12:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tZrZe-0005NZ-19
 for apparmor@lists.ubuntu.com; Mon, 20 Jan 2025 13:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4600BA40182;
 Mon, 20 Jan 2025 13:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D7CC4CEDD;
 Mon, 20 Jan 2025 13:12:10 +0000 (UTC)
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 20 Jan 2025 06:12:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-apparmor-pointer-bool-conversion-label-v1-1-5957d28ffde6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKBLjmcC/x2NQQqDMBAAvyJ77kIS2gb7ldJDTFddiNmwESmIf
 zf2OIeZ2aGSMlV4dTsobVxZcgN76yDOIU+E/G0MzriHsc5gKCXoIopFOK+kOIgkjJI30kvGFAZ
 K6KM1zvfPe/QjtFhRGvn3H70/x3ECY9RvaXgAAAA=
X-Change-ID: 20250120-apparmor-pointer-bool-conversion-label-7c1027964c7f
To: John Johansen <john.johansen@canonical.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1dM/JqbDi9bds19lZgDDhhu34d2sR2mWDItkErvDMWo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOl93qt23nyjYiLt/9PE5fau2xzTclu1F1VsWffeLS321
 XGRyBN7O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEorcx/K8Imn5F3/WUSoLF
 C70py8UdT209v2HH2d8ZaR12+m374lsY/lf9yF/Is9peutJk9YGr5ez2vwJ2PfuZwyBmb/3t2N+
 +DRwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Received-SPF: pass client-ip=147.75.193.91; envelope-from=nathan@kernel.org;
 helo=nyc.source.kernel.org
Subject: [apparmor] [PATCH] apparmor: Fix checking address of an array in
 accum_label_info()
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

clang warns:

  security/apparmor/label.c:206:15: error: address of array 'new->vec' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
    206 |         AA_BUG(!new->vec);
        |                ~~~~~~^~~

The address of this array can never be NULL because it is not at the
beginning of a structure. Convert the assertion to check that the new
pointer is not NULL.

Fixes: de4754c801f4 ("apparmor: carry mediation check on label")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501191802.bDp2voTJ-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 security/apparmor/label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index afded9996f61..79be2d3d604b 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -203,7 +203,7 @@ static void accum_label_info(struct aa_label *new)
 	long u = FLAG_UNCONFINED;
 	int i;
 
-	AA_BUG(!new->vec);
+	AA_BUG(!new);
 
 	/* size == 1 is a profile and flags must be set as part of creation */
 	if (new->size == 1)

---
base-commit: e6b087676954e36a7b1ed51249362bb499f8c1c2
change-id: 20250120-apparmor-pointer-bool-conversion-label-7c1027964c7f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


