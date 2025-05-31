Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83CAC9D18
	for <lists+apparmor@lfdr.de>; Sun,  1 Jun 2025 00:06:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uLUL9-00047a-8v; Sat, 31 May 2025 22:06:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <deller@kernel.org>) id 1uLNwM-0001nU-D5
 for apparmor@lists.ubuntu.com; Sat, 31 May 2025 15:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 85CC1A4EF13;
 Sat, 31 May 2025 15:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2FC4CEEE;
 Sat, 31 May 2025 15:08:24 +0000 (UTC)
From: deller@kernel.org
To: linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 John Johansen <john.johansen@canonical.com>,
 linux-security-module@vger.kernel.org
Date: Sat, 31 May 2025 17:08:20 +0200
Message-ID: <20250531150822.135803-1-deller@kernel.org>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91; envelope-from=deller@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Sat, 31 May 2025 22:06:06 +0000
Subject: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Helge Deller <deller@gmx.de>

Two patches which fix unaligned memory accesses in apparmor.
Both triggered on the parisc platform, which is much more
memory alignment sensitive and will report violations.
Please check and apply.

Helge

Helge Deller (2):
  apparmor: Fix 8-byte alignment for initial dfa blob streams
  apparmor: Fix unaligned memory accesses in KUnit test

 security/apparmor/lsm.c                | 4 ++--
 security/apparmor/policy_unpack_test.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.47.0


