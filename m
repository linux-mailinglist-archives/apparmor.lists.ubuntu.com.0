Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C260C5B1
	for <lists+apparmor@lfdr.de>; Tue, 25 Oct 2022 09:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1onEc0-00030g-95; Tue, 25 Oct 2022 07:44:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1onEby-00030Y-NH
 for apparmor@lists.ubuntu.com; Tue, 25 Oct 2022 07:44:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76B06617BF;
 Tue, 25 Oct 2022 07:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40166C433D7;
 Tue, 25 Oct 2022 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666683872;
 bh=rHoY/Tl9Qne1p1wNu2ctKbsvImria0CAmbK4GApF91U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gg+DIZwOPyhPkDw1t81bsbl1BbOo6vtijUA83mdsdOeOcEiEWxSjubQVNFA4WPIQk
 faDhkuf/Lo0IE3pG1hM+Ca6++Pk3ZhmHCoQd24PbJyFCiWIcYCh9eBH1rtKV0B8oyG
 sGTLY1iPbmTtah1YfOZSt0Qd/znILNaNLiFWNvm7Acz5MCJ0SPB+DOcTP7RYvjpdU3
 0r/vf56z4SZ92IyNzSOMILlvRzj9s/AYGKDLuN8ds6ajuMntW2oOtpAhNlQYhQlsde
 b212HOy8r0ZaaqfE6z8xl8NbFVM6P9oy1NEUiSpZP5A1RNc4HvZ7UtHlsTJRhpwT6J
 OJhaPiewQrw+g==
Date: Tue, 25 Oct 2022 09:44:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20221025074427.jjfx4sa2kl7w5ua5@wittgenstein>
References: <20221024111249.477648-1-brauner@kernel.org>
 <20221024111249.477648-5-brauner@kernel.org>
 <5ae36c94-18dd-2f7a-b5f4-3c2122415dc7@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ae36c94-18dd-2f7a-b5f4-3c2122415dc7@canonical.com>
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

On Tue, Oct 25, 2022 at 12:16:02AM -0700, John Johansen wrote:
> On 10/24/22 04:12, Christian Brauner wrote:
> > We already ported most parts and filesystems over for v6.0 to the new
> > vfs{g,u}id_t type and associated helpers for v6.0. Convert the remaining
> > places so we can remove all the old helpers.
> > This is a non-functional change.
> > 
> > Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> 
> Acked-by: John Johansen <john.johansen@canonical.com>

Would you mind if I carry this patch together with the other conversion
patches in my tree? This would make the whole conversion a lot simpler
because we're removing a bunch of old helpers at the end.

