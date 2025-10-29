Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 59714C1F72C
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZL-0006dw-BP; Thu, 30 Oct 2025 10:07:47 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFqE-0004dH-11
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:44:34 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.stl.internal (Postfix) with ESMTP id 7E41A1300085;
 Wed, 29 Oct 2025 19:44:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 29 Oct 2025 19:44:32 -0400
X-ME-Sender: <xms:3aYCacW0EklVbBr52odzgwMIFadqVZiY_9E7tudg5vTOUlukGR89QQ>
 <xme:3aYCaTdYh1VR4XWnn3OEfjhVRMW9llb0r_xZdVgEPJBMwC0guDDC5CXJvsrDKgSU3
 O7sPHab5vsYfOwx2ifIrmOdATuza71bDXE5CgYxiEzhilZdiA>
X-ME-Received: <xmr:3aYCaROZCepQe3Hu21UI6QwqCD0nSkfSZsBAwHrWmKgYq6O-H3DBzXb5QvKORxj1yfDg4BDFbGwZ_wxSs6RKBleyvZEnJ0v1TFpLhCQQZgBx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheurhho
 fihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnhepge
 etfeegtddtvdeigfegueevfeelleelgfejueefueektdelieeikeevtdelveelnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsgesoh
 ifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepgedupdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtg
 hpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehlihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehlihhnuhigqdhsvggtuhhrihhthidqmhhoughulhgvsehvghgvrhdrkhgvrhhnvghlrd
 horhhgpdhrtghpthhtoheplhhinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
 hrghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheplhhinhhugidqtghifhhssehvghgvrhdrkhgvrhhnvghlrd
 horhhg
X-ME-Proxy: <xmx:3aYCadIU3g7PRNyg0QpRBi516BNZpWSYBI7wNvYksLhLN5HboYbfKg>
 <xmx:3aYCaUi8yMV9Wi329iHBU0ZD5tJV3Inub4fLYJfrLtuvM8baE8Z65g>
 <xmx:3aYCaTfdaKHZTaBO_Bu6_k6dJq0TTIMOZXGLZvFcx2pwEZqLY08rbw>
 <xmx:3aYCaU7RSF_CkX0ckxw-AONs1hAD9ap10WIuJvbkwYEEi3Piz-5pGg>
 <xmx:36YCaR9pl7VkHXdYi10atgXk7DONC_H6TEfCcxqFVlKz7Swud_TD-zUd>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:44:19 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:00 +1100
Message-ID: <20251029234353.1321957-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:43 +0000
Subject: [apparmor] [PATCH v4 00/14] Create and use APIs to centralise
	locking for directory ops.
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
Reply-To: NeilBrown <neil@brown.name>
Cc: Jan Kara <jack@suse.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, Steve French <smfrench@gmail.com>,
 linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Olga Kornievskaia <okorniev@redhat.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 Mateusz Guzik <mjguzik@gmail.com>, David Sterba <dsterba@suse.com>,
 linux-nfs@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi all,

 this series is the next part of my effort to change directory-op
 locking to allow multiple concurrent ops in a directory.  Ultimately we
 will (in my plan) lock the target dentry(s) rather than the whole
 parent directory.

 To help with changing the locking protocol, this series centralises
 locking and lookup in some helpers.  The various helpers are introduced
 and then used in the same patch - roughly one patch per helper though
 with various exceptions.

 I haven't introduced these helpers into the various filesystems that
 Al's tree-in-dcache series is changing.  That series introduces and
 uses similar helpers tuned to the specific needs of that set of
 filesystems.  Ultimately all the helpers will use the same backends
 which can then be adjusted when it is time to change the locking
 protocol.

 One change that deserves highlighting is in patch 13 where vfs_mkdir()
 is changed to unlock the parent on failure, as well as the current
 behaviour of dput()ing the dentry on failure.  Once this change is in
 place, the final step of both create and an remove sequences only
 requires the target dentry, not the parent.  So e.g.  end_creating() is
 only given the dentry (which may be IS_ERR() after vfs_mkdir()).  This
 helps establish the pattern that it is the dentry that is being locked
 and unlocked (the lock is currently held on dentry->d_parent->d_inode,
 but that can change).

 Please review the changes I've made to your respective code areas and
 let us know of any problems.

Thanks,
NeilBrown


 [PATCH v4 01/14] debugfs: rename end_creating() to
 [PATCH v4 02/14] VFS: introduce start_dirop() and end_dirop()
 [PATCH v4 03/14] VFS: tidy up do_unlinkat()
 [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and
 [PATCH v4 05/14] VFS/nfsd/cachefiles/ovl: introduce start_removing()
 [PATCH v4 06/14] VFS: introduce start_creating_noperm() and
 [PATCH v4 07/14] VFS: introduce start_removing_dentry()
 [PATCH v4 08/14] VFS: add start_creating_killable() and
 [PATCH v4 09/14] VFS/nfsd/ovl: introduce start_renaming() and
 [PATCH v4 10/14] VFS/ovl/smb: introduce start_renaming_dentry()
 [PATCH v4 11/14] Add start_renaming_two_dentries()
 [PATCH v4 12/14] ecryptfs: use new start_creating/start_removing APIs
 [PATCH v4 13/14] VFS: change vfs_mkdir() to unlock on failure.
 [PATCH v4 14/14] VFS: introduce end_creating_keep()

