Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326A72DC41
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHV-00007R-Kx; Tue, 13 Jun 2023 08:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8f3C-0004K7-C0
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 10:45:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BF5062424;
 Mon, 12 Jun 2023 10:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95ECC433D2;
 Mon, 12 Jun 2023 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686566728;
 bh=gJ8OBMKp8a//Ju9x8kyPOKR1y9jleYMRtZlvKB2haqY=;
 h=From:To:Subject:Date:From;
 b=ajv43haiuJi4XPe/D7BlbV0d5Dfbz9Cvp3DS2g5UhWuVJbeHzWPJbD2tBEmIQv46y
 95VJd3njR2OYSMyYgff7Fg9K4B3yGgm0b3QUT6CPhPinqffou45tgfMkNvnlcGdctq
 IjMSVM3qFyKJF/wsJnqRzQpZzf4uPYT59IsXnYcVxT2sjEHkRs/Y5k7oya095he0P9
 wkpoSwiJHvhclSQFCxkLrYjL6/DW5YSIVuOqcblvOkrHlUFDDobgLRsjCb6BCiNuJK
 /wqfEqxBnDnbW8JjK/MATIKrKrqFTxQ415+OSVHUhZ9GfW508KlcGXnS52pAQbnxlV
 oLPD9erhPDPMA==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Suren Baghdasaryan <surenb@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Mon, 12 Jun 2023 06:45:16 -0400
Message-Id: <20230612104524.17058-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
Subject: [apparmor] [PATCH v2 0/8] fs: add some missing ctime updates
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

v2:
- drop gfs2 patch as it involved (hidden) quota inode
- clarify patch descriptions to satisfy checkpatch.pl

While working on a patch series to change how we handle the ctime, I
found a number of places that update the mtime without a corresponding
ctime update.

While it's not spelled out explicitly in the POSIX spec, all of the
operations that update the mtime must also update the ctime. I've not
been able to find any counterexamples, in any case. Some of these
patches involve operations not covered by POSIX, but it's still a good
idea to update the ctime when updating the mtime.

Note that these are largely untested other than for compilation, so
please review carefully. These are a preliminary set for the upcoming
rework of how we handle the ctime.

None of these seem to be very crucial, but it would be nice if various
maintainers could pick these up for v6.5. Please let me know if you do,
or would rather I shepherd the patch upstream.

Jeff Layton (8):
  ibmvmc: update ctime in conjunction with mtime on write
  usb: update the ctime as well when updating mtime after an ioctl
  autofs: set ctime as well when mtime changes on a dir
  bfs: update ctime in addition to mtime when adding entries
  efivarfs: update ctime when mtime changes on a write
  exfat: ensure that ctime is updated whenever the mtime is
  apparmor: update ctime whenever the mtime changes on an inode
  cifs: update the ctime on a partial page write

 drivers/misc/ibmvmc.c             |  2 +-
 drivers/usb/core/devio.c          | 16 ++++++++--------
 fs/autofs/root.c                  |  6 +++---
 fs/bfs/dir.c                      |  2 +-
 fs/efivarfs/file.c                |  2 +-
 fs/exfat/namei.c                  |  8 ++++----
 fs/smb/client/file.c              |  2 +-
 security/apparmor/apparmorfs.c    |  7 +++++--
 security/apparmor/policy_unpack.c | 11 +++++++----
 9 files changed, 31 insertions(+), 25 deletions(-)

-- 
2.40.1


