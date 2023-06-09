Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A1729E65
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 17:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7e0Q-0000Bt-2n; Fri, 09 Jun 2023 15:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q7bZV-00078F-Sd
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 12:50:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CD826164C;
 Fri,  9 Jun 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CB9C433EF;
 Fri,  9 Jun 2023 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686315028;
 bh=gIZwlLvY4sTdkvZELuapNhoOFzzZExwAnWiPWsxbXHo=;
 h=From:To:Subject:Date:From;
 b=dcwqOrVfEIufAkx9HYctn0bCPuNyn/IoA3qeRLEf0QBZaM2ZxNK4fITHocjWjP+BS
 ArXA2HvHcNMCbQoCJLgk3YNktWjq5smDP0btfPqHdZkDkaNlMvMKacJZXz5oGbyybS
 Seh3kB1aYVkF1EaQIzj0KMYE2IM8/UE/RnW4K8gKxJc+5U/2OtM1xACvDi/T8P0Pdc
 Xkm13/IgUo3Vr5PsmuoEohjK9wBWC2RLrPIKKbIGloomJhioPPXWTe43kEqN5X837K
 nGxIOrekLqpwpPCILVczWkex/Sm2OoMe1QXBZj99WR32Ho0RhbyqroHBCWw41oCA3r
 Vj6GOBo2c2fNw==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Suren Baghdasaryan <surenb@google.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
Date: Fri,  9 Jun 2023 08:50:14 -0400
Message-Id: <20230609125023.399942-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 15:26:25 +0000
Subject: [apparmor] [PATCH 0/9] fs: add some missing ctime updates
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

While working on a patch series to change how we handle the ctime, I
found a number of places that update the mtime without a corresponding
ctime update. POSIX requires that when the mtime is updated that the
ctime also be updated.

Note that these are largely untested other than for compilation, so
please review carefully. These are a preliminary set for the upcoming
rework of how we handle the ctime.

None of these seem to be very crucial, but it would be nice if
various maintainers could pick these up for v6.5. Please let me know if
you do.

Jeff Layton (9):
  ibmvmc: update ctime in conjunction with mtime on write
  usb: update the ctime as well when updating mtime after an ioctl
  autofs: set ctime as well when mtime changes on a dir
  bfs: update ctime in addition to mtime when adding entries
  efivarfs: update ctime when mtime changes on a write
  exfat: ensure that ctime is updated whenever the mtime is
  gfs2: update ctime when quota is updated
  apparmor: update ctime whenever the mtime changes on an inode
  cifs: update the ctime on a partial page write

 drivers/misc/ibmvmc.c             |  2 +-
 drivers/usb/core/devio.c          | 16 ++++++++--------
 fs/autofs/root.c                  |  6 +++---
 fs/bfs/dir.c                      |  2 +-
 fs/efivarfs/file.c                |  2 +-
 fs/exfat/namei.c                  |  8 ++++----
 fs/gfs2/quota.c                   |  2 +-
 fs/smb/client/file.c              |  2 +-
 security/apparmor/apparmorfs.c    |  7 +++++--
 security/apparmor/policy_unpack.c | 11 +++++++----
 10 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.40.1


