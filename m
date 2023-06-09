Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0B729E6A
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0V-0000Fk-Fx; Fri, 09 Jun 2023 15:26:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1q7btE-0008NA-BZ
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 13:10:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70705657D8;
 Fri,  9 Jun 2023 13:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD84C433EF;
 Fri,  9 Jun 2023 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1686316250;
 bh=20eZk8bTN2/b1Z3qUyGe3nCyzXZWXRuVMW5ABvA38Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uE6bq2E5O2sg28rWqjSlxmlOB4NMF5xAXptBceQzX69Dupew9yaCWvU3FCguEur8A
 +9NpupQoY7+wgD5fQs/q3fzwG4zdCv+Ez4rQxy/zB1FlNDwvGuaVF1/P8qTGmNz9ui
 aVOtYv8fJAKz6xJ0BKUIvbONldSV0Po6kvml4i54=
Date: Fri, 9 Jun 2023 15:10:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <2023060931-magazine-nickname-f386@gregkh>
References: <20230609125023.399942-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609125023.399942-1-jlayton@kernel.org>
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: Re: [apparmor] [PATCH 0/9] fs: add some missing ctime updates
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

On Fri, Jun 09, 2023 at 08:50:14AM -0400, Jeff Layton wrote:
> While working on a patch series to change how we handle the ctime, I
> found a number of places that update the mtime without a corresponding
> ctime update. POSIX requires that when the mtime is updated that the
> ctime also be updated.
> 
> Note that these are largely untested other than for compilation, so
> please review carefully. These are a preliminary set for the upcoming
> rework of how we handle the ctime.
> 
> None of these seem to be very crucial, but it would be nice if
> various maintainers could pick these up for v6.5. Please let me know if
> you do.
> 
> Jeff Layton (9):
>   ibmvmc: update ctime in conjunction with mtime on write
>   usb: update the ctime as well when updating mtime after an ioctl
>   autofs: set ctime as well when mtime changes on a dir
>   bfs: update ctime in addition to mtime when adding entries
>   efivarfs: update ctime when mtime changes on a write
>   exfat: ensure that ctime is updated whenever the mtime is
>   gfs2: update ctime when quota is updated
>   apparmor: update ctime whenever the mtime changes on an inode
>   cifs: update the ctime on a partial page write
> 
>  drivers/misc/ibmvmc.c             |  2 +-
>  drivers/usb/core/devio.c          | 16 ++++++++--------
>  fs/autofs/root.c                  |  6 +++---
>  fs/bfs/dir.c                      |  2 +-
>  fs/efivarfs/file.c                |  2 +-
>  fs/exfat/namei.c                  |  8 ++++----
>  fs/gfs2/quota.c                   |  2 +-
>  fs/smb/client/file.c              |  2 +-
>  security/apparmor/apparmorfs.c    |  7 +++++--
>  security/apparmor/policy_unpack.c | 11 +++++++----
>  10 files changed, 32 insertions(+), 26 deletions(-)
> 
> -- 
> 2.40.1
> 

All of these need commit log messages, didn't checkpatch warn you about
that?

thanks,

greg k-h

