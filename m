Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EXQKHLuoWlDxQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:20:18 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0131BC99A
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:20:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2pf-0004DY-Hr; Fri, 27 Feb 2026 18:44:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vvdwM-0002hS-Nx
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 16:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BF274180E;
 Thu, 26 Feb 2026 16:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AE2C2BCB4;
 Thu, 26 Feb 2026 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121679;
 bh=MwavyxIYlS9bWn9ErxsqoDmGcaV0lMqgZ3OvxFOJWq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ivmk1v7V3CJiICUlcp+XecxQ8lV8EsvWNHo7eR+YxOQbmYtedtALPPtlvxelp6hjh
 en8jABiMzMb/OrtCHXYcM4ik86k8b/NdKS6iQNsceskhDSrUAGrthU+Mluo9Y3k5OY
 hLGGzCNMcAx+HcJMRHPgHxCwW6zWxH6VTPO2mshnW9Ta5etwpt94k3KwJKKWDvu9ZO
 wzvN5qcZ0hcx3Fb9eoFa+y7vAEMv+EMzEtIsC5mu61EwaXjr9g30suDQA0zhULrwLi
 r1tYEXKRj5sFs5LaOuPmEij4Gg2A3MbYdnp+GKNGqW6icNTxudYs2jchlG7ZcVlSJW
 TlOBjKksVvQ6A==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:26 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-iino-u64-v1-24-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4391; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=MwavyxIYlS9bWn9ErxsqoDmGcaV0lMqgZ3OvxFOJWq0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0KNFRsbW5kG/p9PtFPpXWeEzWzPxJtHpHVp
 a6torUfDXmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCgAKCRAADmhBGVaC
 FbHIEACZSDMJAqAwQ0UXgiwJ0jC+ChGbMCd/Sa5yBvlpCfjSmkn4n6HEjHw/4s1+fMmd0m/LwmE
 8jH1uSEVla1iJBWmZN4Xmpo5/oGmeKxuCJiBT+T//EpjIq1eV366Wwlq7KQ+yOwNIpAewI1OK4N
 PRlmobIu63prMJmjcVGhaMWtjg/olAgXr+44X79kcORF1excabF2OOgoAE237OZrMV/pXS/EyUw
 cRh+8Bqx0o/fII34tA4kAWOou4JBmxxBQGz7pB1yGKxbzrM/hUf1apOp6sY1tIB/EHW+XUJ1135
 UimmosoXllhYTYz7gsjIEu9frAYnYwXkrfuEUag+2PAjWfNTIqHI8PxPEuTcmY6erOvzxw88LzW
 jsGnRh3iUm7XUez/cpw0Ara59XzP/RWYuRYzwSLHWaub8hRyUrvdC/6X6DMrvMmABzLvFNoXMum
 U+NXn/y/d8sMb1KpWcJZtq8Fh4VtPJi9afupJhGnOXq+JGgNjjpUhCxAd3M1JBxNo/ueFIhhIbb
 wwcyV7LsjMJhwseMYJqWooz6vpkd/aGCbLkFfbdVky/iO7E0YpZ10MzPRZpsqsOpn9pAxtkPhh+
 EucWjJg2UwqxM6ydVT7EBx2NgQD6V+NpF2Mg83BX551O6BuZMAl01ktREHrwHp3YwbqnlZsQdVI
 BaUUCgERHQ6vaqA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.234.252.31; envelope-from=jlayton@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:53 +0000
Subject: [apparmor] [PATCH 24/61] cachefiles: update format strings for u64
	i_ino
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
X-Rspamd-Queue-Id: 3E0131BC99A
X-Rspamd-Action: no action

Update format strings and local variable types in cachefiles for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cachefiles/io.c    |  6 +++---
 fs/cachefiles/namei.c | 12 ++++++------
 fs/cachefiles/xattr.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index eaf47851c65f4736a7a27f13c498028c7c8dd1b4..d879b80a0bedc95533ce05361ed8cb79c7ed3826 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -93,7 +93,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 	object = cachefiles_cres_object(cres);
 	file = cachefiles_cres_file(cres);
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
@@ -214,7 +214,7 @@ static int cachefiles_query_occupancy(struct netfs_cache_resources *cres,
 	file = cachefiles_cres_file(cres);
 	granularity = max_t(size_t, object->volume->cache->bsize, granularity);
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start, len,
 	       i_size_read(file_inode(file)));
 
@@ -294,7 +294,7 @@ int __cachefiles_write(struct cachefiles_object *object,
 	fscache_count_write();
 	cache = object->volume->cache;
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index e5ec90dccc27f71dc19219f7632f3e48eaf51545..4fdf7687aacb8285ae38d9b5d7e5129897b3ca03 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -147,7 +147,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		}
 		ASSERT(d_backing_inode(subdir));
 
-		_debug("mkdir -> %pd{ino=%lu}",
+		_debug("mkdir -> %pd{ino=%llu}",
 		       subdir, d_backing_inode(subdir)->i_ino);
 		if (_is_new)
 			*_is_new = true;
@@ -158,7 +158,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	end_creating_keep(subdir);
 
 	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
-		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
+		pr_notice("cachefiles: Inode already in use: %pd (B=%llx)\n",
 			  subdir, d_inode(subdir)->i_ino);
 		goto mark_error;
 	}
@@ -183,7 +183,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	    !d_backing_inode(subdir)->i_op->unlink)
 		goto check_error;
 
-	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
+	_leave(" = [%llu]", d_backing_inode(subdir)->i_ino);
 	return subdir;
 
 check_error:
@@ -529,7 +529,7 @@ static bool cachefiles_create_file(struct cachefiles_object *object)
 
 	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
 	set_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags);
-	_debug("create -> %pD{ino=%lu}", file, file_inode(file)->i_ino);
+	_debug("create -> %pD{ino=%llu}", file, file_inode(file)->i_ino);
 	object->file = file;
 	return true;
 }
@@ -549,7 +549,7 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 	_enter("%pd", dentry);
 
 	if (!cachefiles_mark_inode_in_use(object, d_inode(dentry))) {
-		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
+		pr_notice("cachefiles: Inode already in use: %pd (B=%llx)\n",
 			  dentry, d_inode(dentry)->i_ino);
 		return false;
 	}
@@ -657,7 +657,7 @@ bool cachefiles_look_up_object(struct cachefiles_object *object)
 	if (!ret)
 		return false;
 
-	_leave(" = t [%lu]", file_inode(object->file)->i_ino);
+	_leave(" = t [%llu]", file_inode(object->file)->i_ino);
 	return true;
 
 new_file:
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 52383b1d0ba63d4a09413177d8c0d841b5b5b43c..f8ae78b3f7b6d368526a86b454bf0febd1ccc509 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -179,7 +179,7 @@ int cachefiles_remove_object_xattr(struct cachefiles_cache *cache,
 			ret = 0;
 		else if (ret != -ENOMEM)
 			cachefiles_io_error(cache,
-					    "Can't remove xattr from %lu"
+					    "Can't remove xattr from %llu"
 					    " (error %d)",
 					    d_backing_inode(dentry)->i_ino, -ret);
 	}

-- 
2.53.0


