Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6FAC9D1A
	for <lists+apparmor@lfdr.de>; Sun,  1 Jun 2025 00:06:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uLUL9-00047o-FE; Sat, 31 May 2025 22:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <deller@kernel.org>) id 1uLNxM-0001vx-K6
 for apparmor@lists.ubuntu.com; Sat, 31 May 2025 15:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EB1B61120;
 Sat, 31 May 2025 15:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4180C4CEE3;
 Sat, 31 May 2025 15:08:26 +0000 (UTC)
From: deller@kernel.org
To: linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 John Johansen <john.johansen@canonical.com>,
 linux-security-module@vger.kernel.org
Date: Sat, 31 May 2025 17:08:21 +0200
Message-ID: <20250531150822.135803-2-deller@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250531150822.135803-1-deller@kernel.org>
References: <20250531150822.135803-1-deller@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=deller@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Sat, 31 May 2025 22:06:06 +0000
Subject: [apparmor] [PATCH 1/2] apparmor: Fix 8-byte alignment for initial
	dfa blob streams
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
Cc: Helge Deller <deller@gmx.de>, stable@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Helge Deller <deller@gmx.de>

The dfa blob stream for the aa_dfa_unpack() function is expected to be aligned
on a 8 byte boundary.

The static nulldfa_src[] and stacksplitdfa_src[] arrays store the inital
apparmor dfa blob streams, but since they are declared as an array-of-chars
the compiler and linker will only ensure a "char" (1-byte) alignment.

Add an __aligned(8) annotation to the arrays to tell the linker to always
align them on a 8-byte boundary. This avoids runtime warnings at startup on
alignment-sensitive platforms like parisc such as:

 Kernel: unaligned access to 0x7f2a584a in aa_dfa_unpack+0x124/0x788 (iir 0xca0109f)
 Kernel: unaligned access to 0x7f2a584e in aa_dfa_unpack+0x210/0x788 (iir 0xca8109c)
 Kernel: unaligned access to 0x7f2a586a in aa_dfa_unpack+0x278/0x788 (iir 0xcb01090)

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b6c2f157f83..531bde29cccb 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2149,12 +2149,12 @@ static int __init apparmor_nf_ip_init(void)
 __initcall(apparmor_nf_ip_init);
 #endif
 
-static char nulldfa_src[] = {
+static char nulldfa_src[] __aligned(8) = {
 	#include "nulldfa.in"
 };
 static struct aa_dfa *nulldfa;
 
-static char stacksplitdfa_src[] = {
+static char stacksplitdfa_src[] __aligned(8) = {
 	#include "stacksplitdfa.in"
 };
 struct aa_dfa *stacksplitdfa;
-- 
2.47.0


