Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC24AB617F
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 06:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF3l8-0000Lp-QS; Wed, 14 May 2025 04:30:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1uF3l6-0000Jo-0w
 for apparmor@lists.ubuntu.com; Wed, 14 May 2025 04:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4CF343F3E;
 Wed, 14 May 2025 04:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A01C4CEED;
 Wed, 14 May 2025 04:21:54 +0000 (UTC)
Date: Tue, 13 May 2025 21:21:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
Message-ID: <20250514042147.GA2073@sol>
References: <20250428190430.850240-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428190430.850240-1-ebiggers@kernel.org>
Received-SPF: pass client-ip=172.234.252.31; envelope-from=ebiggers@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH] apparmor: use SHA-256 library API instead of
 crypto_shash API
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
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This user of SHA-256 does not support any other algorithm, so the
> crypto_shash abstraction provides no value.  Just use the SHA-256
> library API instead, which is much simpler and easier to use.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> This patch is targeting the apparmor tree for 6.16.
> 
>  security/apparmor/Kconfig  |  3 +-
>  security/apparmor/crypto.c | 85 ++++++--------------------------------
>  2 files changed, 13 insertions(+), 75 deletions(-)

Any interest in taking this patch through the apparmor or security trees?

- Eric

