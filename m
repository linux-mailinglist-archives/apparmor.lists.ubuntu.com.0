Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13E7B8C42
	for <lists+apparmor@lfdr.de>; Wed,  4 Oct 2023 21:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qo7Cr-0005Mi-9H; Wed, 04 Oct 2023 19:06:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jlayton@kernel.org>)
 id 1qo72R-0004UC-NI
 for apparmor@lists.ubuntu.com; Wed, 04 Oct 2023 18:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 431A661681;
 Wed,  4 Oct 2023 18:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C352C116A3;
 Wed,  4 Oct 2023 18:55:47 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Sterba <dsterba@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Theodore Ts'o <tytso@mit.edu>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Jeremy Kerr <jk@ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Mattia Dongili <malattia@linux.it>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Anders Larsen <al@alarsen.net>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Chandan Babu R <chandan.babu@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>
Date: Wed,  4 Oct 2023 14:55:29 -0400
Message-ID: <20231004185530.82088-2-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185530.82088-1-jlayton@kernel.org>
References: <20231004185530.82088-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Oct 2023 19:06:45 +0000
Subject: [apparmor] [PATCH v2 88/89] fs: switch timespec64 fields in inode
	to discrete integers
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
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-bcachefs@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com, autofs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This shaves 8 bytes off struct inode with a garden-variety Fedora
Kconfig.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/fs.h | 53 ++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 84fdaf399fbe..485b5e21c8e5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -671,9 +671,12 @@ struct inode {
 	};
 	dev_t			i_rdev;
 	loff_t			i_size;
-	struct timespec64	__i_atime;
-	struct timespec64	__i_mtime;
-	struct timespec64	__i_ctime; /* use inode_*_ctime accessors! */
+	time64_t		i_atime_sec;
+	time64_t		i_mtime_sec;
+	time64_t		i_ctime_sec;
+	u32			i_atime_nsec;
+	u32			i_mtime_nsec;
+	u32			i_ctime_nsec;
 	spinlock_t		i_lock;	/* i_blocks, i_bytes, maybe i_size */
 	unsigned short          i_bytes;
 	u8			i_blkbits;
@@ -1517,23 +1520,27 @@ struct timespec64 inode_set_ctime_current(struct inode *inode);
 
 static inline time64_t inode_get_atime_sec(const struct inode *inode)
 {
-	return inode->__i_atime.tv_sec;
+	return inode->i_atime_sec;
 }
 
 static inline long inode_get_atime_nsec(const struct inode *inode)
 {
-	return inode->__i_atime.tv_nsec;
+	return inode->i_atime_nsec;
 }
 
 static inline struct timespec64 inode_get_atime(const struct inode *inode)
 {
-	return inode->__i_atime;
+	struct timespec64 ts = { .tv_sec  = inode_get_atime_sec(inode),
+				 .tv_nsec = inode_get_atime_nsec(inode) };
+
+	return ts;
 }
 
 static inline struct timespec64 inode_set_atime_to_ts(struct inode *inode,
 						      struct timespec64 ts)
 {
-	inode->__i_atime = ts;
+	inode->i_atime_sec = ts.tv_sec;
+	inode->i_atime_nsec = ts.tv_nsec;
 	return ts;
 }
 
@@ -1542,28 +1549,32 @@ static inline struct timespec64 inode_set_atime(struct inode *inode,
 {
 	struct timespec64 ts = { .tv_sec  = sec,
 				 .tv_nsec = nsec };
+
 	return inode_set_atime_to_ts(inode, ts);
 }
 
 static inline time64_t inode_get_mtime_sec(const struct inode *inode)
 {
-	return inode->__i_mtime.tv_sec;
+	return inode->i_mtime_sec;
 }
 
 static inline long inode_get_mtime_nsec(const struct inode *inode)
 {
-	return inode->__i_mtime.tv_nsec;
+	return inode->i_mtime_nsec;
 }
 
 static inline struct timespec64 inode_get_mtime(const struct inode *inode)
 {
-	return inode->__i_mtime;
+	struct timespec64 ts = { .tv_sec  = inode_get_mtime_sec(inode),
+				 .tv_nsec = inode_get_mtime_nsec(inode) };
+	return ts;
 }
 
 static inline struct timespec64 inode_set_mtime_to_ts(struct inode *inode,
 						      struct timespec64 ts)
 {
-	inode->__i_mtime = ts;
+	inode->i_mtime_sec = ts.tv_sec;
+	inode->i_mtime_nsec = ts.tv_nsec;
 	return ts;
 }
 
@@ -1577,34 +1588,30 @@ static inline struct timespec64 inode_set_mtime(struct inode *inode,
 
 static inline time64_t inode_get_ctime_sec(const struct inode *inode)
 {
-	return inode->__i_ctime.tv_sec;
+	return inode->i_ctime_sec;
 }
 
 static inline long inode_get_ctime_nsec(const struct inode *inode)
 {
-	return inode->__i_ctime.tv_nsec;
+	return inode->i_ctime_nsec;
 }
 
 static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 {
-	return inode->__i_ctime;
+	struct timespec64 ts = { .tv_sec  = inode_get_ctime_sec(inode),
+				 .tv_nsec = inode_get_ctime_nsec(inode) };
+
+	return ts;
 }
 
 static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
 						      struct timespec64 ts)
 {
-	inode->__i_ctime = ts;
+	inode->i_ctime_sec = ts.tv_sec;
+	inode->i_ctime_nsec = ts.tv_nsec;
 	return ts;
 }
 
-/**
- * inode_set_ctime - set the ctime in the inode
- * @inode: inode in which to set the ctime
- * @sec: tv_sec value to set
- * @nsec: tv_nsec value to set
- *
- * Set the ctime in @inode to { @sec, @nsec }
- */
 static inline struct timespec64 inode_set_ctime(struct inode *inode,
 						time64_t sec, long nsec)
 {
-- 
2.41.0


