Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEGIAjTqoWnbxAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:02:12 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAD1BC41A
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:02:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2q5-0005d9-TE; Fri, 27 Feb 2026 18:45:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vvdwK-0002dW-3c
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 16:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D59BF441C3;
 Thu, 26 Feb 2026 16:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0E9C2BC86;
 Thu, 26 Feb 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121816;
 bh=Mm9/OP1Us2ZjMqs5yAJOCtSY+KcTrwpYMhIt9vayw6Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N/wtq9Yq1v9LjJEvOJcB4GqjdG6FyOkiqDeKIjlIp1hJXZG2nttGDsAuWI3sa/hUN
 XTxIAFPfrbTTj9ShQOTTox1X2bHJOkY9NB2iEz93vj4GrIzNlux88w8z407qzForZH
 1a87Kim/akMpwP6GwC22lGad82iCSV/DBT28s5v0xnEAMLmbQpLZawhGzqr5oRDcXP
 OKZtqGXtDlq7wrOjIb7ynIOkMKne58O0jsE7Tk6RIfAbw3oCLieGp+GfH8auZnKYuC
 RcyVvVHgkZo0bZrDNq0DsihqpKZkBUrLzrhhCr5gnCdOKGGzszV4WTirWYtIE/0mu9
 tFRgaJMbr07zw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Feb 2026 10:55:37 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-iino-u64-v1-35-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Mm9/OP1Us2ZjMqs5yAJOCtSY+KcTrwpYMhIt9vayw6Q=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0N7kdaYrUk/5+PhJXM2cVD9G1tsSNaaeQNq
 x2+GLQgWSiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDQAKCRAADmhBGVaC
 FZC/D/0e/0AVhKBe5ozYYOnbgiAtc1nrTMnGaFW8Rdg/h1dux1f37tU+G8wakXQcfRJ+LTzQ9R3
 41/wptHxxGiF2TF7NuBK4AJoFJ2K/vthItVl9PKqGT3znPVGctxHrJd3/TqAUVA2HD2RnH8vZY9
 HDofY52XzY9t0Y7ozbRmq07Voi3EokGoVvYNHhU/SWRgNrp+uRfmloaN5Dd4vp4Eiei4rsblfco
 Pk3r3cTXLszGokDkB56olfZy9coVhY2zlD1E73gh1tivftXDQdZx2J0VLfslN/EXiCEcqW66stW
 PiTLj3Tl2SBExh7Wbd7PCSQHFeYWjGY5QblzfySOeHk4Qn6naqktDjXrjudaJHbIeP6VBbXVRNn
 mhxIvVpYE2rhU2EfdFxrK6gSE7N09E6aosv6yw3AkkDoEGNhsa/pxYhbI8PXXM+v1EIP7bqiF1W
 9BJRu/Z+enOQfgFZlV8n3UTqD5LMiWSqVTD1hI6oTapARo5mp9FVgCTQ35t094RRkjp1MXgZt/Q
 2RIW0w85r2dct6IHBA6UcOcFW6xn0SjsehuFmzMvyzP1ccF/AVHC+Rtu7UPC6WU+1hjq3jGJ3aD
 MUGE2bCkZFuVsXb7vZQdaAGkWhfjgvIgiglP7fQJXuqhLQ/o1NXaaxiANsHkSdpmOO21vsnp/6M
 SdxP3CWDbZzdz7Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.234.252.31; envelope-from=jlayton@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:53 +0000
Subject: [apparmor] [PATCH 35/61] hpfs: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: D1FAD1BC41A
X-Rspamd-Action: no action

Update format strings and local variable types in hpfs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/hpfs/dir.c   | 4 ++--
 fs/hpfs/dnode.c | 4 ++--
 fs/hpfs/ea.c    | 4 ++--
 fs/hpfs/inode.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/hpfs/dir.c b/fs/hpfs/dir.c
index ceb50b2dc91a9da02997a40836d6543786d883d3..3398b3417a4966450e8e070ddb7a45a19c442d3c 100644
--- a/fs/hpfs/dir.c
+++ b/fs/hpfs/dir.c
@@ -96,8 +96,8 @@ static int hpfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 		if (!fnode_is_dir(fno)) {
 			e = 1;
-			hpfs_error(inode->i_sb, "not a directory, fnode %08lx",
-					(unsigned long)inode->i_ino);
+			hpfs_error(inode->i_sb, "not a directory, fnode %08llx",
+					(unsigned long long)inode->i_ino);
 		}
 		if (hpfs_inode->i_dno != le32_to_cpu(fno->u.external[0].disk_secno)) {
 			e = 1;
diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
index dde764ebe24673c339d4602172618dbf6ca0b5c9..a89c5b795c4bcee590bb9200296ce78c64211bef 100644
--- a/fs/hpfs/dnode.c
+++ b/fs/hpfs/dnode.c
@@ -550,9 +550,9 @@ static void delete_empty_dnode(struct inode *i, dnode_secno dno)
 			if (hpfs_sb(i->i_sb)->sb_chk)
 				if (up != i->i_ino) {
 					hpfs_error(i->i_sb,
-						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08lx",
+						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08llx",
 						   dno, up,
-						   (unsigned long)i->i_ino);
+						   (unsigned long long)i->i_ino);
 					return;
 				}
 			if ((d1 = hpfs_map_dnode(i->i_sb, down, &qbh1))) {
diff --git a/fs/hpfs/ea.c b/fs/hpfs/ea.c
index 2149d3ca530b6f635ff884988383bdde21be5e7a..7440d31d2821fabb3e2cf4327281c20d16773225 100644
--- a/fs/hpfs/ea.c
+++ b/fs/hpfs/ea.c
@@ -245,8 +245,8 @@ void hpfs_set_ea(struct inode *inode, struct fnode *fnode, const char *key,
 		fnode->ea_offs = cpu_to_le16(0xc4);
 	}
 	if (le16_to_cpu(fnode->ea_offs) < 0xc4 || le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) + le16_to_cpu(fnode->ea_size_s) > 0x200) {
-		hpfs_error(s, "fnode %08lx: ea_offs == %03x, ea_size_s == %03x",
-			(unsigned long)inode->i_ino,
+		hpfs_error(s, "fnode %08llx: ea_offs == %03x, ea_size_s == %03x",
+			(unsigned long long)inode->i_ino,
 			le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->ea_size_s));
 		return;
 	}
diff --git a/fs/hpfs/inode.c b/fs/hpfs/inode.c
index 93d528f4f4f28d5070162faacd65d3fc2341248a..cbde82a53066c5d467173b67b5e1c445fe3c9101 100644
--- a/fs/hpfs/inode.c
+++ b/fs/hpfs/inode.c
@@ -250,8 +250,8 @@ void hpfs_write_inode_nolock(struct inode *i)
 			hpfs_brelse4(&qbh);
 		} else
 			hpfs_error(i->i_sb,
-				"directory %08lx doesn't have '.' entry",
-				(unsigned long)i->i_ino);
+				"directory %08llx doesn't have '.' entry",
+				(unsigned long long)i->i_ino);
 	}
 	mark_buffer_dirty(bh);
 	brelse(bh);

-- 
2.53.0


