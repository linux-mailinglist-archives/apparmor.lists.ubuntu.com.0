Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 22128729E67
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000C7-9b; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1q7bsq-0008L6-Qn
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 13:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C81B764CFD;
 Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81ABC433D2;
 Fri,  9 Jun 2023 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1686316227;
 bh=UDgymT2rhCU6DESF/YCiKaWmfZRHvZQoUcAfEB8ZmWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zGZH+ZOjneapjQSK1IqmZBDuE4mFnyhlsRpqtjmsPzrNsJ4zy4akL4P0yciY2B45W
 5dUQzaTZDowoyRRkGVZBciT1Tf/1Vmlevn5D0LUceNtbonLCs5Xx++ggHHUerxifsG
 xjcNDDMMZzk3H58c+hjy6yFDwcg70muWawDFZ1nE=
Date: Fri, 9 Jun 2023 15:10:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <2023060903-headache-very-c029@gregkh>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-3-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609125023.399942-3-jlayton@kernel.org>
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: Re: [apparmor] [PATCH 2/9] usb: update the ctime as well when
 updating mtime after an ioctl
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
Cc: linux-efi@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Paul Moore <paul@paul-moore.com>,
 Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Bob Peterson <rpeterso@redhat.com>, Sungjong Seo <sj1557.seo@samsung.com>,
 Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Jun 09, 2023 at 08:50:16AM -0400, Jeff Layton wrote:
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Sorry, but I can't take commits without any changelog text at all (nor
would you want me to...)

thanks,

greg k-h

