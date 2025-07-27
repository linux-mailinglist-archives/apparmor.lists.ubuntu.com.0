Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF1B1328A
	for <lists+apparmor@lfdr.de>; Mon, 28 Jul 2025 01:53:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ugBAk-00042w-Vv; Sun, 27 Jul 2025 23:52:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1ugBAi-00042k-OC
 for apparmor@lists.ubuntu.com; Sun, 27 Jul 2025 23:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 887E75C585B;
 Sun, 27 Jul 2025 23:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5958C4CEEB;
 Sun, 27 Jul 2025 23:46:32 +0000 (UTC)
Date: Sun, 27 Jul 2025 16:45:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20250727234542.GC1261@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ebiggers@kernel.org;
 helo=dfw.source.kernel.org
Subject: [apparmor] [GIT PULL] Crypto library conversions for 6.17
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
Cc: fsverity@lists.linux.dev, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Note: this depends on the "Crypto library updates" pull request and
should be merged after it.

The following changes since commit c76ed8790b3018fe36647d9aae96e0373f321184:

  crypto: sha1 - Remove sha1_base.h (2025-07-14 11:28:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-conversions-for-linus

for you to fetch changes up to 998646b3c1129188f1fdffac3779feb9708b4b4a:

  fsverity: Switch from crypto_shash to SHA-2 library (2025-07-14 11:29:32 -0700)

----------------------------------------------------------------

Convert fsverity and apparmor to use the SHA-2 library functions
instead of crypto_shash. This is simpler and also slightly faster.

----------------------------------------------------------------
Eric Biggers (3):
      apparmor: use SHA-256 library API instead of crypto_shash API
      fsverity: Explicitly include <linux/export.h>
      fsverity: Switch from crypto_shash to SHA-2 library

 Documentation/filesystems/fsverity.rst |   3 +-
 fs/verity/Kconfig                      |   6 +-
 fs/verity/enable.c                     |   9 +-
 fs/verity/fsverity_private.h           |  24 ++--
 fs/verity/hash_algs.c                  | 194 +++++++++++----------------------
 fs/verity/measure.c                    |   1 +
 fs/verity/open.c                       |  37 +++----
 fs/verity/read_metadata.c              |   1 +
 fs/verity/verify.c                     |   8 +-
 security/apparmor/Kconfig              |   3 +-
 security/apparmor/crypto.c             |  85 ++-------------
 11 files changed, 120 insertions(+), 251 deletions(-)

