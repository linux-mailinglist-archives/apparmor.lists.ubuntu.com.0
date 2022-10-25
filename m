Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B19DA60C69D
	for <lists+apparmor@lfdr.de>; Tue, 25 Oct 2022 10:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1onFQt-0000Dp-13; Tue, 25 Oct 2022 08:37:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1onFQq-0000Dh-W3
 for apparmor@lists.ubuntu.com; Tue, 25 Oct 2022 08:37:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21C16617C2;
 Tue, 25 Oct 2022 08:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7198C433D6;
 Tue, 25 Oct 2022 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666687026;
 bh=GB1TG7LkedEnHyYAdacEbVV7vQ0BzroKJsdE0caV5T4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2G8+X8hARXwlyd4RgHwed38XzjgBpYD0rsA+Z+AkScdipYSvsqxMmYYoIUQcAcSf
 W6xdxTT0a8gtnKK4situwHk2n9L8JVkwZBph2hIP5F5Z4qmtgYUCaGXxa91bIO+4K+
 PgJXFP4j24dhAWILSTWV4J7LRg6T0uQshuVlTs4fxL0OUm6DeoD5SMQ3SWk8brp/R3
 /PNmaIcGpStNt1RwQYLGqDDt3f4SGORyy9GGR/2EerQ26IgQOY5Y7UGfXvGrvL1WIt
 qLYr+GFA1VRQRhOEuwnPaahNILV2ar5FSd+z5L6rLEkOTl3YNMi5qDvg4aTXEzD45P
 4D8qhd/s4JG1w==
Date: Tue, 25 Oct 2022 10:37:01 +0200
From: Christian Brauner <brauner@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20221025083701.cgaqrcett4frvq3f@wittgenstein>
References: <20221024111249.477648-1-brauner@kernel.org>
 <20221024111249.477648-5-brauner@kernel.org>
 <5ae36c94-18dd-2f7a-b5f4-3c2122415dc7@canonical.com>
 <20221025074427.jjfx4sa2kl7w5ua5@wittgenstein>
 <bd085a0c-543a-c67d-b1a3-c9ee891893eb@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd085a0c-543a-c67d-b1a3-c9ee891893eb@canonical.com>
Subject: Re: [apparmor] [PATCH 4/8] apparmor: use type safe idmapping helpers
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
Cc: linux-fsdevel@vger.kernel.org, apparmor@lists.ubuntu.com,
 Seth Forshee <sforshee@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Oct 25, 2022 at 01:30:10AM -0700, John Johansen wrote:
> On 10/25/22 00:44, Christian Brauner wrote:
> > On Tue, Oct 25, 2022 at 12:16:02AM -0700, John Johansen wrote:
> > > On 10/24/22 04:12, Christian Brauner wrote:
> > > > We already ported most parts and filesystems over for v6.0 to the new
> > > > vfs{g,u}id_t type and associated helpers for v6.0. Convert the remaining
> > > > places so we can remove all the old helpers.
> > > > This is a non-functional change.
> > > > 
> > > > Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> > > 
> > > Acked-by: John Johansen <john.johansen@canonical.com>
> > 
> > Would you mind if I carry this patch together with the other conversion
> > patches in my tree? This would make the whole conversion a lot simpler
> > because we're removing a bunch of old helpers at the end.
> 
> Not at all. I almost asked which tree you wanted it in, and then got
> distracted and when I came back to it ...

Thank you! I appreciate it.

