Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CB105AEADB4
	for <lists+apparmor@lfdr.de>; Fri, 27 Jun 2025 06:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uV0Me-0006MB-R5; Fri, 27 Jun 2025 04:07:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1uV0Md-0006Ly-7t
 for apparmor@lists.ubuntu.com; Fri, 27 Jun 2025 04:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE699A5214A;
 Fri, 27 Jun 2025 03:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BD6C4CEEB;
 Fri, 27 Jun 2025 03:59:54 +0000 (UTC)
Date: Thu, 26 Jun 2025 20:59:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250627035918.GA15797@sol>
References: <20250428190430.850240-1-ebiggers@kernel.org>
 <20250514042147.GA2073@sol>
 <4f37c07c-3a39-4c98-b9c4-13356f5a10dc@canonical.com>
 <20250612191105.GE1283@sol>
 <c80d4e69-ef03-462c-9084-e6bb56f428e6@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80d4e69-ef03-462c-9084-e6bb56f428e6@canonical.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=ebiggers@kernel.org;
 helo=nyc.source.kernel.org
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

On Sun, Jun 22, 2025 at 02:16:07PM -0700, John Johansen wrote:
> On 6/12/25 12:11, Eric Biggers wrote:
> > On Sat, May 17, 2025 at 12:43:30AM -0700, John Johansen wrote:
> > > On 5/13/25 21:21, Eric Biggers wrote:
> > > > On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > 
> > > > > This user of SHA-256 does not support any other algorithm, so the
> > > > > crypto_shash abstraction provides no value.  Just use the SHA-256
> > > > > library API instead, which is much simpler and easier to use.
> > > > > 
> > > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > > ---
> > > > > 
> > > > > This patch is targeting the apparmor tree for 6.16.
> > > > > 
> > > > >    security/apparmor/Kconfig  |  3 +-
> > > > >    security/apparmor/crypto.c | 85 ++++++--------------------------------
> > > > >    2 files changed, 13 insertions(+), 75 deletions(-)
> > > > 
> > > > Any interest in taking this patch through the apparmor or security trees?
> > > > 
> > > I can take it through my tree
> > 
> > Thanks!  I notice this isn't in v6.16-rc1.  Do you have a pull request planned?
> > 
> 
> Hey Eric,
> 
> sorry I have been sick and didn't get a 6.16 pull request out. I am slowly trying
> to dig my way out of the backlog, which is several weeks deeo. I might get together
> a small PR of bug fixes before the 6.17 merge window but the bulk of what is in
> apparmor-next will be waiting to merge in 6.17 now.

Hope you're feeling better!  Actually, would you mind if instead I took this
patch (with your ack) through the libcrypto-next tree for 6.17?
Otherwise there will be a silent merge conflict after I apply
https://lore.kernel.org/r/20250625070819.1496119-11-ebiggers@kernel.org/

- Eric

