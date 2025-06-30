Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 688ADAEE4C8
	for <lists+apparmor@lfdr.de>; Mon, 30 Jun 2025 18:38:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uWHWm-00005C-By; Mon, 30 Jun 2025 16:38:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1uWHWk-00004z-J4
 for apparmor@lists.ubuntu.com; Mon, 30 Jun 2025 16:38:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDB315C58AE;
 Mon, 30 Jun 2025 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5552EC4CEE3;
 Mon, 30 Jun 2025 16:30:27 +0000 (UTC)
Date: Mon, 30 Jun 2025 09:29:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250630162948.GA1220@sol>
References: <20250428190430.850240-1-ebiggers@kernel.org>
 <20250514042147.GA2073@sol>
 <4f37c07c-3a39-4c98-b9c4-13356f5a10dc@canonical.com>
 <20250612191105.GE1283@sol>
 <c80d4e69-ef03-462c-9084-e6bb56f428e6@canonical.com>
 <20250627035918.GA15797@sol>
 <540b7f72-58fa-4ee3-9b5b-6cd81c5959a7@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <540b7f72-58fa-4ee3-9b5b-6cd81c5959a7@canonical.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ebiggers@kernel.org;
 helo=dfw.source.kernel.org
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

On Thu, Jun 26, 2025 at 11:14:50PM -0700, John Johansen wrote:
> On 6/26/25 20:59, Eric Biggers wrote:
> > On Sun, Jun 22, 2025 at 02:16:07PM -0700, John Johansen wrote:
> > > On 6/12/25 12:11, Eric Biggers wrote:
> > > > On Sat, May 17, 2025 at 12:43:30AM -0700, John Johansen wrote:
> > > > > On 5/13/25 21:21, Eric Biggers wrote:
> > > > > > On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> > > > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > > > 
> > > > > > > This user of SHA-256 does not support any other algorithm, so the
> > > > > > > crypto_shash abstraction provides no value.  Just use the SHA-256
> > > > > > > library API instead, which is much simpler and easier to use.
> > > > > > > 
> > > > > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > This patch is targeting the apparmor tree for 6.16.
> > > > > > > 
> > > > > > >     security/apparmor/Kconfig  |  3 +-
> > > > > > >     security/apparmor/crypto.c | 85 ++++++--------------------------------
> > > > > > >     2 files changed, 13 insertions(+), 75 deletions(-)
> > > > > > 
> > > > > > Any interest in taking this patch through the apparmor or security trees?
> > > > > > 
> > > > > I can take it through my tree
> > > > 
> > > > Thanks!  I notice this isn't in v6.16-rc1.  Do you have a pull request planned?
> > > > 
> > > 
> > > Hey Eric,
> > > 
> > > sorry I have been sick and didn't get a 6.16 pull request out. I am slowly trying
> > > to dig my way out of the backlog, which is several weeks deeo. I might get together
> > > a small PR of bug fixes before the 6.17 merge window but the bulk of what is in
> > > apparmor-next will be waiting to merge in 6.17 now.
> > 
> > Hope you're feeling better!  Actually, would you mind if instead I took this
> I lot, though still generally tired/low on energy
> 
> > patch (with your ack) through the libcrypto-next tree for 6.17?
> > Otherwise there will be a silent merge conflict after I apply
> > https://lore.kernel.org/r/20250625070819.1496119-11-ebiggers@kernel.org/
> > 
> Avoiding a merge conflict? You have my ACK and blessing I will pull it out of
> the apparmor tree asap

Thanks, let me know once you've dropped it.

- Eric

