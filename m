Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CD729E61
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000CZ-Lt; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7c9W-0000yA-2C
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 13:27:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0242D60E74;
 Fri,  9 Jun 2023 13:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7BCC433EF;
 Fri,  9 Jun 2023 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686317260;
 bh=oSuiJiclTzvMA00+ishDDZSJ5F4CCgIPlxz3qberOkU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ctTfeKacHWo5l9K9DxzQOrtlTLoG85/EKA7MvHQ/F1/2q0zByBrbmyXzsM5xu9ZiB
 z9wHdsdfD4pFeRxFcqVecbJ+Otm388ULgG+bsoled+ga5itRm8LLiC22OcTX19F+j+
 6yIPcNN1B7m9Ur7wYkJS4IGiKr+2aBq5+dqDL6XT4Raq7b5xw0RxxqP1BRnkC/teoQ
 1BBAFxOID86v/atOu3NX+L9wnqyt+99xF7OTaMcfAz05y5B3IH3bJDB665QOEe/kU6
 AzdHw7nXRvFkJ5TMlrv7YVHd1aILHvSrpMhR/sNk7+XbKVcwqz4pHqjL+n9s6tGy8X
 915cASV+pKXDw==
Message-ID: <671ceeb2e019c11617a481739c2e17604456c48c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 09 Jun 2023 09:27:36 -0400
In-Reply-To: <2023060931-magazine-nickname-f386@gregkh>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <2023060931-magazine-nickname-f386@gregkh>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
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

On Fri, 2023-06-09 at 15:10 +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 09, 2023 at 08:50:14AM -0400, Jeff Layton wrote:
> > While working on a patch series to change how we handle the ctime, I
> > found a number of places that update the mtime without a corresponding
> > ctime update. POSIX requires that when the mtime is updated that the
> > ctime also be updated.
> >=20
> > Note that these are largely untested other than for compilation, so
> > please review carefully. These are a preliminary set for the upcoming
> > rework of how we handle the ctime.
> >=20
> > None of these seem to be very crucial, but it would be nice if
> > various maintainers could pick these up for v6.5. Please let me know if
> > you do.
> >=20
> > Jeff Layton (9):
> >   ibmvmc: update ctime in conjunction with mtime on write
> >   usb: update the ctime as well when updating mtime after an ioctl
> >   autofs: set ctime as well when mtime changes on a dir
> >   bfs: update ctime in addition to mtime when adding entries
> >   efivarfs: update ctime when mtime changes on a write
> >   exfat: ensure that ctime is updated whenever the mtime is
> >   gfs2: update ctime when quota is updated
> >   apparmor: update ctime whenever the mtime changes on an inode
> >   cifs: update the ctime on a partial page write
> >=20
> >  drivers/misc/ibmvmc.c             |  2 +-
> >  drivers/usb/core/devio.c          | 16 ++++++++--------
> >  fs/autofs/root.c                  |  6 +++---
> >  fs/bfs/dir.c                      |  2 +-
> >  fs/efivarfs/file.c                |  2 +-
> >  fs/exfat/namei.c                  |  8 ++++----
> >  fs/gfs2/quota.c                   |  2 +-
> >  fs/smb/client/file.c              |  2 +-
> >  security/apparmor/apparmorfs.c    |  7 +++++--
> >  security/apparmor/policy_unpack.c | 11 +++++++----
> >  10 files changed, 32 insertions(+), 26 deletions(-)
> >=20
> > --=20
> > 2.40.1
> >=20
>=20
> All of these need commit log messages, didn't checkpatch warn you about
> that?

It did, once I ran it. ;)

I'll repost the set with more elaborate changelogs.
--=20
Jeff Layton <jlayton@kernel.org>

