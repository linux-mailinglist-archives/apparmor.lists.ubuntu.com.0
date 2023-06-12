Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF172DC45
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHV-00007Y-O2; Tue, 13 Jun 2023 08:21:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8f3I-0004LG-NF
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 10:45:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A169C6244B;
 Mon, 12 Jun 2023 10:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB4FC433D2;
 Mon, 12 Jun 2023 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686566735;
 bh=f+sv9c83YeZdEFyBLfaVXVS9uGARTf71K6hxZfrcSr4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XNPqT5xCR/WjIlqL84s4wlNFJCgGYAqKwg9zWLKMlluT43pgIvq6UYpc7QjKUhuWL
 nVIrZgjKf9Le2yKWvchiJV4LBbC0ljP1qKKTZdnKa3LICWwFNHz7sMCYSAO1yPGWJc
 ixIaxMQwn51TByDyIFIJ4whm3OajAgo0a8S2bf51eFvXRyczHtk84FQpWxkDHAGszp
 9PgkQIWwHJTlHW8C02GLU7kZQHk3jA/g7J+XX7rjLsmWIk6SAhbZ3n7MsZXHbQi8fq
 1BN620+hBAnd5L8CGYKibFXxe0Hxle4OVCsDLjX9mMgrdf+RzkMkt3m7jsKCrQeUGe
 l++bREhCo36qQ==
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
Date: Mon, 12 Jun 2023 06:45:18 -0400
Message-Id: <20230612104524.17058-3-jlayton@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612104524.17058-1-jlayton@kernel.org>
References: <20230612104524.17058-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
Subject: [apparmor] [PATCH v2 2/8] usb: update the ctime as well when
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

In general, POSIX requires that when the mtime is updated that the ctime
be updated as well. Add the missing timestamp updates to the usb ioctls.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/usb/core/devio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fcf68818e999..1268d313a8df 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -2640,21 +2640,21 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 		snoop(&dev->dev, "%s: CONTROL\n", __func__);
 		ret = proc_control(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_BULK:
 		snoop(&dev->dev, "%s: BULK\n", __func__);
 		ret = proc_bulk(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_RESETEP:
 		snoop(&dev->dev, "%s: RESETEP\n", __func__);
 		ret = proc_resetep(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_RESET:
@@ -2666,7 +2666,7 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 		snoop(&dev->dev, "%s: CLEAR_HALT\n", __func__);
 		ret = proc_clearhalt(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_GETDRIVER:
@@ -2693,7 +2693,7 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 		snoop(&dev->dev, "%s: SUBMITURB\n", __func__);
 		ret = proc_submiturb(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 #ifdef CONFIG_COMPAT
@@ -2701,14 +2701,14 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 		snoop(&dev->dev, "%s: CONTROL32\n", __func__);
 		ret = proc_control_compat(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_BULK32:
 		snoop(&dev->dev, "%s: BULK32\n", __func__);
 		ret = proc_bulk_compat(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_DISCSIGNAL32:
@@ -2720,7 +2720,7 @@ static long usbdev_do_ioctl(struct file *file, unsigned int cmd,
 		snoop(&dev->dev, "%s: SUBMITURB32\n", __func__);
 		ret = proc_submiturb_compat(ps, p);
 		if (ret >= 0)
-			inode->i_mtime = current_time(inode);
+			inode->i_mtime = inode->i_ctime = current_time(inode);
 		break;
 
 	case USBDEVFS_IOCTL32:
-- 
2.40.1


