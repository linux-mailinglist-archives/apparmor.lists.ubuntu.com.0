Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5172F81A
	for <lists+apparmor@lfdr.de>; Wed, 14 Jun 2023 10:43:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q9M5o-0004Zv-8o; Wed, 14 Jun 2023 08:43:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1q9Ltm-0003bq-Eo
 for apparmor@lists.ubuntu.com; Wed, 14 Jun 2023 08:30:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4301D60C5B;
 Wed, 14 Jun 2023 08:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3A5C433C8;
 Wed, 14 Jun 2023 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686731436;
 bh=5sOkTNkkHBdbRw2JX2dJi2tKIH7ENjxXYhVFqEgiEpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IRZqPUqU0BwUN9jHEoglWuy0xEgoYyag/Ebn+rb0Vkv1pU4YIEbzbp79ipCyUrtxh
 uu5SSmyKUoI1KIaFNYpCGmYHIXb2asmRHSE1NzBkLRpCt3Lk6SOguRjQnw2e7R7/RE
 3jA20kzbdthCOfDkyHAr2RIu4FsSLyLI6XH8DA2HcU29jUMoC2mD9jrm9rg2mkUfCC
 fiHIUATN1wcmkhYcliwSeMfAeYVI8hK2mr8m3NIMM3pMKtWaDqvzxe5VRX3IwZIRDp
 k6p3K+ytT5NuIM6/QXPL9ncD1YxYtMcfr5ZIYEUleDDbnRtoLwM75vc9NwENqU3Y1d
 e+ig0BIIgMwMg==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Wed, 14 Jun 2023 10:30:13 +0200
Message-Id: <20230614-marmeladen-blechnapf-873c26e176cb@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612104524.17058-4-jlayton@kernel.org>
References: <20230612104524.17058-1-jlayton@kernel.org>
 <20230612104524.17058-4-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5sOkTNkkHBdbRw2JX2dJi2tKIH7ENjxXYhVFqEgiEpg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaR0VvWrXuWb1qASt//kd4FHqU18By+ppS/RFud89ejpqjjT
 Z+/1O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACby5Bgjw7qZ1+/qxD5ZFinJah7vuf
 6TQM5RjfV3nHf+b3iWcMttHxfDb9bHk9/X5L+18DmgM//eoU3cO9eIMDluPBbqbjtNMHa/Fg8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Jun 2023 08:43:02 +0000
Subject: Re: [apparmor] (subset) [PATCH v2 3/8] autofs: set ctime as well
	when mtime changes on a dir
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
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Alan Stern <stern@rowland.harvard.edu>, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
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

On Mon, 12 Jun 2023 06:45:19 -0400, Jeff Layton wrote:
> When adding entries to a directory, POSIX generally requires that the
> ctime also be updated alongside the mtime.
> 
> 

Can't find a tree for this patch, so picking this patch up unless told otherwise.

---

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[3/8] autofs: set ctime as well when mtime changes on a dir
      https://git.kernel.org/vfs/vfs/c/9b37b3342a98

