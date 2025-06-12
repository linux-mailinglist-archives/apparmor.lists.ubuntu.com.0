Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B478AD7AF8
	for <lists+apparmor@lfdr.de>; Thu, 12 Jun 2025 21:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uPnQT-0000On-Nf; Thu, 12 Jun 2025 19:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1uPnQR-0000Oa-L4
 for apparmor@lists.ubuntu.com; Thu, 12 Jun 2025 19:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49FD0629D1;
 Thu, 12 Jun 2025 19:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB64BC4CEEA;
 Thu, 12 Jun 2025 19:11:31 +0000 (UTC)
Date: Thu, 12 Jun 2025 12:11:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250612191105.GE1283@sol>
References: <20250428190430.850240-1-ebiggers@kernel.org>
 <20250514042147.GA2073@sol>
 <4f37c07c-3a39-4c98-b9c4-13356f5a10dc@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f37c07c-3a39-4c98-b9c4-13356f5a10dc@canonical.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=ebiggers@kernel.org;
 helo=tor.source.kernel.org
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat, May 17, 2025 at 12:43:30AM -0700, John Johansen wrote:
> On 5/13/25 21:21, Eric Biggers wrote:
> > On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > This user of SHA-256 does not support any other algorithm, so the
> > > crypto_shash abstraction provides no value.  Just use the SHA-256
> > > library API instead, which is much simpler and easier to use.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > > 
> > > This patch is targeting the apparmor tree for 6.16.
> > > 
> > >   security/apparmor/Kconfig  |  3 +-
> > >   security/apparmor/crypto.c | 85 ++++++--------------------------------
> > >   2 files changed, 13 insertions(+), 75 deletions(-)
> > 
> > Any interest in taking this patch through the apparmor or security trees?
> > 
> I can take it through my tree

Thanks!  I notice this isn't in v6.16-rc1.  Do you have a pull request planned?

- Eric

