Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0678F0BB
	for <lists+apparmor@lfdr.de>; Thu, 31 Aug 2023 17:56:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbk1o-0003BM-Fa; Thu, 31 Aug 2023 15:56:16 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1qb8m8-0007S5-PJ
 for apparmor@lists.ubuntu.com; Wed, 30 Aug 2023 00:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KPbzJvpAfmJnxRfz6vyXdTOuKHu0zGU5IcaLiuqidr0=; b=R5nzjv+Zq3LT9nshlafMmOel/V
 V9V15FrSV4M//ybfLydJkCutspaga94ytJEx9riJh1zL9kWGgjuuGRS3RGNQd6UTwUkizww5yCRXa
 65QMSK2fJSU4GVUhcmzwiC0Hq1HKwf7DGR4vmOTpwGMfQqlHke7T1R8K/2jSpp3mx40NSO3T4g2W/
 plks+ScqIJIQRzH6Fj1pBu+DVUhZ7fIoVLT08blX/7g4fVPc+bxoQXE8ePVX4WwsUQ6HaxLzBDWrJ
 7SC0zFm+4u87xlQbvEUtvlqkCX+4IE1iKrcHU8n3T8dKHajJ0gVzh2wyU+407y+rz29fwaL3T7RiK
 4HRq0m2Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qb8lD-001xRM-1m; Wed, 30 Aug 2023 00:08:39 +0000
Date: Wed, 30 Aug 2023 01:08:39 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230830000839.GB461907@ZenIV>
References: <20230612104524.17058-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612104524.17058-1-jlayton@kernel.org>
X-Mailman-Approved-At: Thu, 31 Aug 2023 15:56:14 +0000
Subject: Re: [apparmor] [PATCH v2 0/8] fs: add some missing ctime updates
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
Cc: linux-efi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jun 12, 2023 at 06:45:16AM -0400, Jeff Layton wrote:
> Jeff Layton (8):
>   ibmvmc: update ctime in conjunction with mtime on write
>   usb: update the ctime as well when updating mtime after an ioctl
>   autofs: set ctime as well when mtime changes on a dir
>   bfs: update ctime in addition to mtime when adding entries
>   efivarfs: update ctime when mtime changes on a write
>   exfat: ensure that ctime is updated whenever the mtime is
>   apparmor: update ctime whenever the mtime changes on an inode
>   cifs: update the ctime on a partial page write
> 
>  drivers/misc/ibmvmc.c             |  2 +-
>  drivers/usb/core/devio.c          | 16 ++++++++--------
>  fs/autofs/root.c                  |  6 +++---
>  fs/bfs/dir.c                      |  2 +-
>  fs/efivarfs/file.c                |  2 +-
>  fs/exfat/namei.c                  |  8 ++++----
>  fs/smb/client/file.c              |  2 +-
>  security/apparmor/apparmorfs.c    |  7 +++++--
>  security/apparmor/policy_unpack.c | 11 +++++++----
>  9 files changed, 31 insertions(+), 25 deletions(-)

As a possible followup (again, apologies for being MIA for months):
touch_cmtime(inode)...

