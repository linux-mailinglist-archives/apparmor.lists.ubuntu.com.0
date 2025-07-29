Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4388FB15955
	for <lists+apparmor@lfdr.de>; Wed, 30 Jul 2025 09:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uh0xZ-0003Ww-IS; Wed, 30 Jul 2025 07:10:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1ugYyX-0004gB-7A
 for apparmor@lists.ubuntu.com; Tue, 29 Jul 2025 01:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B74D5C6475;
 Tue, 29 Jul 2025 01:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE67AC4CEF6;
 Tue, 29 Jul 2025 01:12:02 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCFA383BF5F; Tue, 29 Jul 2025 01:12:20 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250727234542.GC1261@sol>
References: <20250727234542.GC1261@sol>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250727234542.GC1261@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 tags/libcrypto-conversions-for-linus
X-PR-Tracked-Commit-Id: 998646b3c1129188f1fdffac3779feb9708b4b4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b65b859f55b036649a4525f09fa7c5bbbab384e
Message-Id: <175375153939.918485.1163691169468282516.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 01:12:19 +0000
To: Eric Biggers <ebiggers@kernel.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=pr-tracker-bot@kernel.org; helo=dfw.source.kernel.org
X-Mailman-Approved-At: Wed, 30 Jul 2025 07:10:43 +0000
Subject: Re: [apparmor] [GIT PULL] Crypto library conversions for 6.17
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
 linux-crypto@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The pull request you sent on Sun, 27 Jul 2025 16:45:42 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-conversions-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b65b859f55b036649a4525f09fa7c5bbbab384e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

