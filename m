Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5YBOJKrooWmSxAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 19:55:38 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD01BC35B
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 19:55:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2q4-0005a1-Vx; Fri, 27 Feb 2026 18:45:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vvdrr-0001Gh-Nu
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 16:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CA5260103;
 Thu, 26 Feb 2026 15:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E582DC19423;
 Thu, 26 Feb 2026 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121389;
 bh=kqyt5CklUcx3SkNzffqb+SP2F4CBWvRae/HkP27yv/M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mIddKBM1XrVR3dLlPcSb0SzyD8tWLh5Lf6oSzm6BRCDz17mcjOiZhnQ+qQOBwwomf
 ExtmebvGYCHgYem9DeN8g8VYpFY/LC7Yifr6OG9OIMjAcpJy+azMBfheRhVWnwxtuh
 HrzoGPdExxO26fMdqSOjfBmr6HjAbcR9DVT/dXQ1eSCb399e/h1QVktqrUsZ0ynu6b
 Mx01BY4S00YiQsquUUBuXdEOJ/qDczdU6y0ESmH1QWEgWe0bRgQtRpOvREvqoRCsHj
 tIsCl2JNh8Ia6eQlB/TwSG30hC9aP7EpqnLYMuWGx8qctykeBvD7QxRbXV5pVp16F0
 9v2bf0tfiOBaA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:03 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-iino-u64-v1-1-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, 
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11878; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kqyt5CklUcx3SkNzffqb+SP2F4CBWvRae/HkP27yv/M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0EBBcYmv1G5cCKfo2KCIxJusjNjE3iSeqU8
 ZJnXhKztg+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBAAKCRAADmhBGVaC
 FXBCD/0fi3a6rxKspBHO06sGtcv25p+qnxMpOWntFE57YxJvYQrXSORyNdKiZpz0qr6XsiSVvKn
 gZ3TcTP5Fr1hqwI/TynEHJjaFjOUbr1zHSQ3OW2jAl2W5tSIsz1s6Nu4GaDr2As3S98IdP2V+R4
 gyyX1q/9H/8necwLN9rdjlwSv3euhg5ZoFknw1aVgvVsWH3urSMf06sm3CuPMJHSVmpPR0AUwHZ
 CqZyrrx3E9uJHbqrxI56QeZhEAplY5jmFgu00qXHY9Tb+ahUL7Zfhqy3MlbqCZyCVNDsEKNh+K0
 HkkBT+GV2G4cpd/vFbwHUPjUvRTbJp9OxTgBMh7oEumvPFvdgG8MD0l+o5DAo5fuJGoGSpTBALI
 9OzP+MrHxQLHxq+jeu4Oue/PrKWscMG0+HaAvE7JkKEj6eRQ0pU2AtrLRl7Ou2nVjSHwQ5rKQSS
 clOkG0rjpbU+lNOh/JdzIAhvUVbiPC8SLW8G7QBZofvxaVBbm8QP+qd0C2EO7ET7sjPqAngcz/B
 chhtxOKLE79PjehJw2dkwP27JXPT7z6OpLIY0cH+nyrNvW3aCvsQxsBv8aerUDYtdv2oftXBn3c
 KzoiPFyEp7ssNRV3Y9vsv1ky1czAJCKZqU7IoeUhsNIJ6i553sM1SmEqWAomzSe2LA9JxXeyz1F
 R+o5dlTMD1TYfGg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.105.4.254; envelope-from=jlayton@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:52 +0000
Subject: [apparmor] [PATCH 01/61] vfs: widen inode hash/lookup functions to
	u64
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
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 codalist@coda.cs.cmu.edu, linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, linux-fscrypt@vger.kernel.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	DATE_IN_PAST(1.00)[27];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:willy@infradead.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:dhowells@redhat.com,m:pc@manguebit.org,m:adilger.kernel@dilger.ca,m:jack@suse.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:sfrench@samba.org,m:ronniesahlberg@gmail.com,m:sprasad@microsoft.com,m:bharathsm@microsoft.com,m:alex.aring@gmail.com,m:konishi.ryusuke@gmail.com,m:slava@dubeyko.com,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:dsterba@suse.com,m:marc.dionne@auristor.com,m:raven@themaw.net,m:luisbg@kernel.org,m:salah.triki@gmail.com,m:aivazian.tigran@gmail.com,m:idryomov@gmail.com,m:a
 markuze@redhat.com,m:jaharkes@cs.cmu.edu,m:coda@cs.cmu.edu,m:nico@fluxnic.net,m:code@tyhicks.com,m:amir73il@gmail.com,m:hch@infradead.org,m:glaubitz@physik.fu-berlin.de,m:frank.li@vivo.com,m:mikulas@artax.karlin.mff.cuni.cz,m:dwmw2@infradead.org,m:richard@nod.at,m:shaggy@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:miklos@szeredi.hu,m:al@alarsen.net,m:chengzhihao1@huawei.com,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:wufan@kernel.org,m:stephen.smalley.work@gmail.com,m:omosnace@redhat.com,m:casey@schaufler-ca.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:edumazet@google.com
 ,m:kuniyu@google.com,m:pabeni@redhat.com,m:willemb@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:horms@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[146];
	FROM_NEQ_ENVFROM(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 4FCD01BC35B
X-Rspamd-Action: no action

Change the inode hash/lookup VFS API functions to accept u64 parameters
instead of unsigned long for inode numbers and hash values. This is
preparation for widening i_ino itself to u64, which will allow
filesystems to store full 64-bit inode numbers on 32-bit architectures.

Since unsigned long implicitly widens to u64 on all architectures, this
change is backward-compatible with all existing callers.

Functions updated:
  - hash(), find_inode_fast(), find_inode_by_ino_rcu(), test_inode_iunique()
  - __insert_inode_hash(), iget_locked(), iget5_locked(), iget5_locked_rcu()
  - ilookup(), ilookup5(), ilookup5_nowait()
  - find_inode_nowait(), find_inode_rcu()
  - inode_insert5(), insert_inode_locked4()
  - insert_inode_locked() (local variable)
  - dump_mapping() (local variable and format string)

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 46 +++++++++++++++++++++++-----------------------
 include/linux/fs.h | 26 +++++++++++++-------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index cc12b68e021b2c97cc88a46ddc736334ecb8edfa..2cabec9043e8176d20aecc5ce7e0f276c114f122 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -672,7 +672,7 @@ static inline void inode_sb_list_del(struct inode *inode)
 	}
 }
 
-static unsigned long hash(struct super_block *sb, unsigned long hashval)
+static unsigned long hash(struct super_block *sb, u64 hashval)
 {
 	unsigned long tmp;
 
@@ -685,12 +685,12 @@ static unsigned long hash(struct super_block *sb, unsigned long hashval)
 /**
  *	__insert_inode_hash - hash an inode
  *	@inode: unhashed inode
- *	@hashval: unsigned long value used to locate this object in the
+ *	@hashval: u64 value used to locate this object in the
  *		inode_hashtable.
  *
  *	Add an inode to the inode hash for this superblock.
  */
-void __insert_inode_hash(struct inode *inode, unsigned long hashval)
+void __insert_inode_hash(struct inode *inode, u64 hashval)
 {
 	struct hlist_head *b = inode_hashtable + hash(inode->i_sb, hashval);
 
@@ -726,7 +726,7 @@ void dump_mapping(const struct address_space *mapping)
 	struct dentry *dentry_ptr;
 	struct dentry dentry;
 	char fname[64] = {};
-	unsigned long ino;
+	u64 ino;
 
 	/*
 	 * If mapping is an invalid pointer, we don't want to crash
@@ -750,14 +750,14 @@ void dump_mapping(const struct address_space *mapping)
 	}
 
 	if (!dentry_first) {
-		pr_warn("aops:%ps ino:%lx\n", a_ops, ino);
+		pr_warn("aops:%ps ino:%llx\n", a_ops, ino);
 		return;
 	}
 
 	dentry_ptr = container_of(dentry_first, struct dentry, d_u.d_alias);
 	if (get_kernel_nofault(dentry, dentry_ptr) ||
 	    !dentry.d_parent || !dentry.d_name.name) {
-		pr_warn("aops:%ps ino:%lx invalid dentry:%px\n",
+		pr_warn("aops:%ps ino:%llx invalid dentry:%px\n",
 				a_ops, ino, dentry_ptr);
 		return;
 	}
@@ -768,7 +768,7 @@ void dump_mapping(const struct address_space *mapping)
 	 * Even if strncpy_from_kernel_nofault() succeeded,
 	 * the fname could be unreliable
 	 */
-	pr_warn("aops:%ps ino:%lx dentry name(?):\"%s\"\n",
+	pr_warn("aops:%ps ino:%llx dentry name(?):\"%s\"\n",
 		a_ops, ino, fname);
 }
 
@@ -1087,7 +1087,7 @@ static struct inode *find_inode(struct super_block *sb,
  * iget_locked for details.
  */
 static struct inode *find_inode_fast(struct super_block *sb,
-				struct hlist_head *head, unsigned long ino,
+				struct hlist_head *head, u64 ino,
 				bool hash_locked, bool *isnew)
 {
 	struct inode *inode = NULL;
@@ -1301,7 +1301,7 @@ EXPORT_SYMBOL(unlock_two_nondirectories);
  * Note that both @test and @set are called with the inode_hash_lock held, so
  * they can't sleep.
  */
-struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
+struct inode *inode_insert5(struct inode *inode, u64 hashval,
 			    int (*test)(struct inode *, void *),
 			    int (*set)(struct inode *, void *), void *data)
 {
@@ -1378,7 +1378,7 @@ EXPORT_SYMBOL(inode_insert5);
  * Note that both @test and @set are called with the inode_hash_lock held, so
  * they can't sleep.
  */
-struct inode *iget5_locked(struct super_block *sb, unsigned long hashval,
+struct inode *iget5_locked(struct super_block *sb, u64 hashval,
 		int (*test)(struct inode *, void *),
 		int (*set)(struct inode *, void *), void *data)
 {
@@ -1408,7 +1408,7 @@ EXPORT_SYMBOL(iget5_locked);
  * This is equivalent to iget5_locked, except the @test callback must
  * tolerate the inode not being stable, including being mid-teardown.
  */
-struct inode *iget5_locked_rcu(struct super_block *sb, unsigned long hashval,
+struct inode *iget5_locked_rcu(struct super_block *sb, u64 hashval,
 		int (*test)(struct inode *, void *),
 		int (*set)(struct inode *, void *), void *data)
 {
@@ -1455,7 +1455,7 @@ EXPORT_SYMBOL_GPL(iget5_locked_rcu);
  * hashed, and with the I_NEW flag set.  The file system gets to fill it in
  * before unlocking it via unlock_new_inode().
  */
-struct inode *iget_locked(struct super_block *sb, unsigned long ino)
+struct inode *iget_locked(struct super_block *sb, u64 ino)
 {
 	struct hlist_head *head = inode_hashtable + hash(sb, ino);
 	struct inode *inode;
@@ -1527,7 +1527,7 @@ EXPORT_SYMBOL(iget_locked);
  *
  * Returns 1 if the inode number is unique, 0 if it is not.
  */
-static int test_inode_iunique(struct super_block *sb, unsigned long ino)
+static int test_inode_iunique(struct super_block *sb, u64 ino)
 {
 	struct hlist_head *b = inode_hashtable + hash(sb, ino);
 	struct inode *inode;
@@ -1616,7 +1616,7 @@ EXPORT_SYMBOL(igrab);
  *
  * Note2: @test is called with the inode_hash_lock held, so can't sleep.
  */
-struct inode *ilookup5_nowait(struct super_block *sb, unsigned long hashval,
+struct inode *ilookup5_nowait(struct super_block *sb, u64 hashval,
 		int (*test)(struct inode *, void *), void *data, bool *isnew)
 {
 	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
@@ -1647,7 +1647,7 @@ EXPORT_SYMBOL(ilookup5_nowait);
  *
  * Note: @test is called with the inode_hash_lock held, so can't sleep.
  */
-struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
+struct inode *ilookup5(struct super_block *sb, u64 hashval,
 		int (*test)(struct inode *, void *), void *data)
 {
 	struct inode *inode;
@@ -1677,7 +1677,7 @@ EXPORT_SYMBOL(ilookup5);
  * Search for the inode @ino in the inode cache, and if the inode is in the
  * cache, the inode is returned with an incremented reference count.
  */
-struct inode *ilookup(struct super_block *sb, unsigned long ino)
+struct inode *ilookup(struct super_block *sb, u64 ino)
 {
 	struct hlist_head *head = inode_hashtable + hash(sb, ino);
 	struct inode *inode;
@@ -1726,8 +1726,8 @@ EXPORT_SYMBOL(ilookup);
  * very carefully implemented.
  */
 struct inode *find_inode_nowait(struct super_block *sb,
-				unsigned long hashval,
-				int (*match)(struct inode *, unsigned long,
+				u64 hashval,
+				int (*match)(struct inode *, u64,
 					     void *),
 				void *data)
 {
@@ -1773,7 +1773,7 @@ EXPORT_SYMBOL(find_inode_nowait);
  *
  * The caller must hold the RCU read lock.
  */
-struct inode *find_inode_rcu(struct super_block *sb, unsigned long hashval,
+struct inode *find_inode_rcu(struct super_block *sb, u64 hashval,
 			     int (*test)(struct inode *, void *), void *data)
 {
 	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
@@ -1812,7 +1812,7 @@ EXPORT_SYMBOL(find_inode_rcu);
  * The caller must hold the RCU read lock.
  */
 struct inode *find_inode_by_ino_rcu(struct super_block *sb,
-				    unsigned long ino)
+				    u64 ino)
 {
 	struct hlist_head *head = inode_hashtable + hash(sb, ino);
 	struct inode *inode;
@@ -1833,7 +1833,7 @@ EXPORT_SYMBOL(find_inode_by_ino_rcu);
 int insert_inode_locked(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
-	ino_t ino = inode->i_ino;
+	u64 ino = inode->i_ino;
 	struct hlist_head *head = inode_hashtable + hash(sb, ino);
 	bool isnew;
 
@@ -1884,7 +1884,7 @@ int insert_inode_locked(struct inode *inode)
 }
 EXPORT_SYMBOL(insert_inode_locked);
 
-int insert_inode_locked4(struct inode *inode, unsigned long hashval,
+int insert_inode_locked4(struct inode *inode, u64 hashval,
 		int (*test)(struct inode *, void *), void *data)
 {
 	struct inode *old;
@@ -2642,7 +2642,7 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
 		break;
 	default:
 		printk(KERN_DEBUG "init_special_inode: bogus i_mode (%o) for"
-				  " inode %s:%lu\n", mode, inode->i_sb->s_id,
+				  " inode %s:%llu\n", mode, inode->i_sb->s_id,
 				  inode->i_ino);
 		break;
 	}
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8b3dd145b25ec12b00ac1df17a952d9116b88047..dfa1f475b1c480c503ab6f00e891aa9b051607fa 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2935,32 +2935,32 @@ static inline int inode_generic_drop(struct inode *inode)
 extern void d_mark_dontcache(struct inode *inode);
 
 extern struct inode *ilookup5_nowait(struct super_block *sb,
-		unsigned long hashval, int (*test)(struct inode *, void *),
+		u64 hashval, int (*test)(struct inode *, void *),
 		void *data, bool *isnew);
-extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
+extern struct inode *ilookup5(struct super_block *sb, u64 hashval,
 		int (*test)(struct inode *, void *), void *data);
-extern struct inode *ilookup(struct super_block *sb, unsigned long ino);
+extern struct inode *ilookup(struct super_block *sb, u64 ino);
 
-extern struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
+extern struct inode *inode_insert5(struct inode *inode, u64 hashval,
 		int (*test)(struct inode *, void *),
 		int (*set)(struct inode *, void *),
 		void *data);
-struct inode *iget5_locked(struct super_block *, unsigned long,
+struct inode *iget5_locked(struct super_block *, u64,
 			   int (*test)(struct inode *, void *),
 			   int (*set)(struct inode *, void *), void *);
-struct inode *iget5_locked_rcu(struct super_block *, unsigned long,
+struct inode *iget5_locked_rcu(struct super_block *, u64,
 			       int (*test)(struct inode *, void *),
 			       int (*set)(struct inode *, void *), void *);
-extern struct inode * iget_locked(struct super_block *, unsigned long);
+extern struct inode *iget_locked(struct super_block *, u64);
 extern struct inode *find_inode_nowait(struct super_block *,
-				       unsigned long,
+				       u64,
 				       int (*match)(struct inode *,
-						    unsigned long, void *),
+						    u64, void *),
 				       void *data);
-extern struct inode *find_inode_rcu(struct super_block *, unsigned long,
+extern struct inode *find_inode_rcu(struct super_block *, u64,
 				    int (*)(struct inode *, void *), void *);
-extern struct inode *find_inode_by_ino_rcu(struct super_block *, unsigned long);
-extern int insert_inode_locked4(struct inode *, unsigned long, int (*test)(struct inode *, void *), void *);
+extern struct inode *find_inode_by_ino_rcu(struct super_block *, u64);
+extern int insert_inode_locked4(struct inode *, u64, int (*test)(struct inode *, void *), void *);
 extern int insert_inode_locked(struct inode *);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 extern void lockdep_annotate_inode_mutex_key(struct inode *inode);
@@ -3015,7 +3015,7 @@ int setattr_should_drop_sgid(struct mnt_idmap *idmap,
  */
 #define alloc_inode_sb(_sb, _cache, _gfp) kmem_cache_alloc_lru(_cache, &_sb->s_inode_lru, _gfp)
 
-extern void __insert_inode_hash(struct inode *, unsigned long hashval);
+extern void __insert_inode_hash(struct inode *, u64 hashval);
 static inline void insert_inode_hash(struct inode *inode)
 {
 	__insert_inode_hash(inode, inode->i_ino);

-- 
2.53.0


