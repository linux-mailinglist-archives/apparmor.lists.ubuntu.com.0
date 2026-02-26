Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGhbMRHuoWlDxQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:18:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A66251BC95D
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:18:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2pc-000446-TG; Fri, 27 Feb 2026 18:44:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vvdrq-0001Fw-BI
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 16:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 011DE61332;
 Thu, 26 Feb 2026 16:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10356C2BCB3;
 Thu, 26 Feb 2026 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121603;
 bh=kIVFsmXtBE3YuzRB+strxcrcOEXNDR/4sXDdnMV6RAw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YDzbCEdIFAS3XGTFYeKhbBvMOHdk2GCv65NO1aAYs5h3azw9VRNLRJ9Fbn00BONBd
 XZ7Q5YtaGOLoNjN44S8s2loYRg9chGJoSdQqOQUCUSyyrTuMXpdER+QNm8x2gyF7L8
 ri1g5oeJ1OfZ/tOcgVd456us4+YacMZX/hr46U25NZBBgnaKDgHrOprTihC/bgFhA1
 RiYO1VO8vRpTLjdTKTu+uePcGEN6072PH5y/cukbIpk3bxRe2aKXlakKytXJdfNbg8
 CPNEVITwSY9we00NyTjK9lJzoNG5SDqRTyk7TCSii+0E3vkMGJPHWkJzKpDUpL4qH8
 o5DeOf1pEvh1Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:20 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-iino-u64-v1-18-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3755; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kIVFsmXtBE3YuzRB+strxcrcOEXNDR/4sXDdnMV6RAw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0If6psvaFLhG5GB3QWW9P7h7vG/pnb7lxXs
 CZ+gDM6mG2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCAAKCRAADmhBGVaC
 FdKIEADP6XMRuAe/OrAUfesmSxFdHao88/Flin1MLL7xtSytZJHGQ4CZFPmxHE0vn4cXVNtsXur
 4lOmKOvGEvRgPNsggDD5qBh1Arb0M9DX0QxIvm/EH79Z0ptVoVu8m7SpOj6e6IQ3y6SFjZBjicK
 dO+LW3XgSPLXjy9hxv+oS432GzeyPdrOlNQF4wKgxYtRUc0dPnzDFSC1CqjNRxP+T7l5aySDOoe
 S8oLG4YoEk63+3sJj5kjGMBIFveg23IW0jalUkrEIl0D1ZSUvoSKpsoHYU1Y4XuIHGW63gfJskj
 /jwpRMnzoio+x5aNIiRplu8qY5Jo/nAnwCKdqddKWLeo3pys8P4TKPmEQ7gL2MsuAQ8feiD3hht
 hOkyH1vUB4bT6NZe7njX6tr7A6vvrgITD2WiVwput54LNflG7A3WKXLtV/UTR3QEdRAxxeJUfvt
 ooybLC4A0ZpJDd0YYSP4zGcUmWDvmBSUmBEbP8sD2mQNLoJMuM9h8OySjaQ9NZtx2iCuCS4Rxoj
 RciUZM5QkBcyuBTeD4YDGohYKBN4wgy9Gg3GdJ8fDeRjJytnZnFAx/dyUY7PTGqG+UwgfU94Fwl
 h3fv5Myhfxhuy1PDazOm/qHMj9NpBQAZiaLTm5d1PxJL0ih+NNN95P4uEvVH+76atxLGWmN8zO6
 u/SWlnT7tELjwcA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.105.4.254; envelope-from=jlayton@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:52 +0000
Subject: [apparmor] [PATCH 18/61] 9p: update format strings for u64 i_ino
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:willy@infradead.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:dhowells@redhat.com,m:pc@manguebit.org,m:adilger.kernel@dilger.ca,m:jack@suse.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:sfrench@samba.org,m:ronniesahlberg@gmail.com,m:sprasad@microsoft.com,m:bharathsm@microsoft.com,m:alex.aring@gmail.com,m:konishi.ryusuke@gmail.com,m:slava@dubeyko.com,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:dsterba@suse.com,m:marc.dionne@auristor.com,m:raven@themaw.net,m:luisbg@kernel.org,m:salah.triki@gmail.com,m:aivazian.tigran@gmail.com,m:idryomov@gmail.com,m:a
 markuze@redhat.com,m:jaharkes@cs.cmu.edu,m:coda@cs.cmu.edu,m:nico@fluxnic.net,m:code@tyhicks.com,m:amir73il@gmail.com,m:hch@infradead.org,m:glaubitz@physik.fu-berlin.de,m:frank.li@vivo.com,m:mikulas@artax.karlin.mff.cuni.cz,m:dwmw2@infradead.org,m:richard@nod.at,m:shaggy@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:miklos@szeredi.hu,m:al@alarsen.net,m:chengzhihao1@huawei.com,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:wufan@kernel.org,m:stephen.smalley.work@gmail.com,m:omosnace@redhat.com,m:casey@schaufler-ca.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:edumazet@google.com
 ,m:kuniyu@google.com,m:pabeni@redhat.com,m:willemb@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:horms@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: A66251BC95D
X-Rspamd-Action: no action

Update format strings and local variable types in 9p for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/9p/vfs_addr.c       | 4 ++--
 fs/9p/vfs_inode.c      | 6 +++---
 fs/9p/vfs_inode_dotl.c | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 862164181baca1e88ecf8859c55868bb01525ce1..c21d33830f5f021904f490ab6185db5fd40f736d 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -36,7 +36,7 @@ static void v9fs_begin_writeback(struct netfs_io_request *wreq)
 
 	fid = v9fs_fid_find_inode(wreq->inode, true, INVALID_UID, true);
 	if (!fid) {
-		WARN_ONCE(1, "folio expected an open fid inode->i_ino=%lx\n",
+		WARN_ONCE(1, "folio expected an open fid inode->i_ino=%llx\n",
 			  wreq->inode->i_ino);
 		return;
 	}
@@ -133,7 +133,7 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 	return 0;
 
 no_fid:
-	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%lx\n",
+	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%llx\n",
 		  rreq->inode->i_ino);
 	return -EINVAL;
 }
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 97abe65bf7c1f00e94e431fc69dc5ce647d1742b..d1508b1fe10929d8d847af313f7661d693167d96 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -1245,7 +1245,7 @@ static int
 v9fs_vfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 		 struct dentry *dentry, const char *symname)
 {
-	p9_debug(P9_DEBUG_VFS, " %lu,%pd,%s\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd,%s\n",
 		 dir->i_ino, dentry, symname);
 
 	return v9fs_vfs_mkspecial(dir, dentry, P9_DMSYMLINK, symname);
@@ -1269,7 +1269,7 @@ v9fs_vfs_link(struct dentry *old_dentry, struct inode *dir,
 	char name[1 + U32_MAX_DIGITS + 2]; /* sign + number + \n + \0 */
 	struct p9_fid *oldfid;
 
-	p9_debug(P9_DEBUG_VFS, " %lu,%pd,%pd\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd,%pd\n",
 		 dir->i_ino, dentry, old_dentry);
 
 	oldfid = v9fs_fid_clone(old_dentry);
@@ -1305,7 +1305,7 @@ v9fs_vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	char name[2 + U32_MAX_DIGITS + 1 + U32_MAX_DIGITS + 1];
 	u32 perm;
 
-	p9_debug(P9_DEBUG_VFS, " %lu,%pd mode: %x MAJOR: %u MINOR: %u\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd mode: %x MAJOR: %u MINOR: %u\n",
 		 dir->i_ino, dentry, mode,
 		 MAJOR(rdev), MINOR(rdev));
 
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 643e759eacb2a46855c7db6187fe6b29b7534c9a..71796a89bcf4745363b59af1047ecfd7e3f4d956 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -691,7 +691,7 @@ v9fs_vfs_symlink_dotl(struct mnt_idmap *idmap, struct inode *dir,
 	struct p9_fid *fid = NULL;
 
 	name = dentry->d_name.name;
-	p9_debug(P9_DEBUG_VFS, "%lu,%s,%s\n", dir->i_ino, name, symname);
+	p9_debug(P9_DEBUG_VFS, "%llu,%s,%s\n", dir->i_ino, name, symname);
 
 	dfid = v9fs_parent_fid(dentry);
 	if (IS_ERR(dfid)) {
@@ -734,7 +734,7 @@ v9fs_vfs_link_dotl(struct dentry *old_dentry, struct inode *dir,
 	struct p9_fid *dfid, *oldfid;
 	struct v9fs_session_info *v9ses;
 
-	p9_debug(P9_DEBUG_VFS, "dir ino: %lu, old_name: %pd, new_name: %pd\n",
+	p9_debug(P9_DEBUG_VFS, "dir ino: %llu, old_name: %pd, new_name: %pd\n",
 		 dir->i_ino, old_dentry, dentry);
 
 	v9ses = v9fs_inode2v9ses(dir);
@@ -798,7 +798,7 @@ v9fs_vfs_mknod_dotl(struct mnt_idmap *idmap, struct inode *dir,
 	struct p9_qid qid;
 	struct posix_acl *dacl = NULL, *pacl = NULL;
 
-	p9_debug(P9_DEBUG_VFS, " %lu,%pd mode: %x MAJOR: %u MINOR: %u\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd mode: %x MAJOR: %u MINOR: %u\n",
 		 dir->i_ino, dentry, omode,
 		 MAJOR(rdev), MINOR(rdev));
 

-- 
2.53.0


