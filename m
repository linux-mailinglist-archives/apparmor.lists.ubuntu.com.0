Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3899CFC5E
	for <lists+apparmor@lfdr.de>; Sat, 16 Nov 2024 03:34:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tC8dm-0006Kd-Vc; Sat, 16 Nov 2024 02:34:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tC8dl-0006KN-6d
 for apparmor@lists.ubuntu.com; Sat, 16 Nov 2024 02:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27184A41DE6;
 Sat, 16 Nov 2024 02:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B19C4CECF;
 Sat, 16 Nov 2024 02:34:23 +0000 (UTC)
Date: Fri, 15 Nov 2024 19:34:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20241116023421.GA1215050@thelio-3990X>
References: <20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org>
 <7cc38d2d-5e4f-4b03-a1a8-e0b89f4005b8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cc38d2d-5e4f-4b03-a1a8-e0b89f4005b8@canonical.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=nathan@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] [PATCH] apparmor: Add empty statement between label
 and declaration in profile_transition(()
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
 linux-security-module@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Nov 15, 2024 at 06:17:11PM -0800, John Johansen wrote:
> thanks for the patch, but I went with an alternate version, that I did last Sunday
> (sorry I guess I forgot to push the tree). Since I hadn't pushed the tree I did
> consider replacing my patch with it but in the end decided to not go with
> the C99 variable declaration, moving the var to the top of the outer block (what
> my Sunday patch did).

Thanks for the information, I considered doing the same thing but went
with the minimal fix just for ease of acceptance. Appreciate you getting
this resolved now.

> The reason being that while I don't think the style guideline forbid them, I end
> up getting patches for them anyways, as some compiler flag sets will warn about
> them.

For what it's worth, commit b5ec6fd286df ("kbuild: Drop
-Wdeclaration-after-statement") dropped the option that warns about
that, so you should not have to worry about that anymore.

Cheers,
Nathan

