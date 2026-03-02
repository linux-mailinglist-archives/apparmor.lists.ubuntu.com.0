Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPykOq1gpmlVOwAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 05:16:45 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6A1E8B1E
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 05:16:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxHBX-0000z2-TL; Tue, 03 Mar 2026 04:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vx9z5-0000gT-9I
 for apparmor@lists.ubuntu.com; Mon, 02 Mar 2026 20:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3289C423DD;
 Mon,  2 Mar 2026 20:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E821AC19425;
 Mon,  2 Mar 2026 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483388;
 bh=8R+tpWiGjDe+xDyyVkNhWfDz6BdmeMn5aKOhywEIznc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Dby9Dgm3UOiYE49pHDnOJpgExxCLknWI9d0RI9gSsNHqQwFObqzGeFCIMSEtmDUS+
 X2nRCtvwGXVvTDmxHK1H6I3a1BUqDkotAQqMJsjjNB05hl1SIw/r5Gpg6/et2t7obo
 jRGaBZN7RlOv1Q7YS7jJUH30hY25+MHsJquwZTgNkCa5wM1XYFSrzcY+E/iPMVaCah
 QiGaZVoR7T3S4iM140lDhJactcYjR9unuKhxOgdFoViO7+gAW72a3STL7BlM6R0eX+
 g51E/Nf3gUXmy1kOw3vCgFkVwHvALqdv8t9GOOAN48HkRzW6zbjCfMHfuIW0OriqI6
 bVXjKFws2zXZw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 02 Mar 2026 15:24:04 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-iino-u64-v2-20-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
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
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4100; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=8R+tpWiGjDe+xDyyVkNhWfDz6BdmeMn5aKOhywEIznc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH0g7s70j/Qt0Y0J0IJTO3BfuEQNEZbYximY
 oVEul2DEEWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx9AAKCRAADmhBGVaC
 FXmqD/4yA0oAZPPpmK3woMEmcPi2HCHFa+yCwsUZPxOKFLM6uIgzefxZhY+NFia1GQ3ssvcKHV1
 ZXnpRrRhNspdFH9/SYnnDjETDl1UPhXAwRqH5gpryFeqqY1YzRqG9a7sHMJS3NYj0DppfRZPujp
 AP5VKBo2vE+JBFqD9o7cjAz0nlyUIPSELaE4LX/14Cxpe8x3ZZg4nJZaNq3I1fStXFU4BODBd0o
 YkRQy3fs7ZD9oXRgPu8sXoZMXaNk2doKNzD+tg/SGNftYnlvSNfMcf+nnvey4+zBC/BNwf2ZiVO
 F4QQXPIBWOenSD2B/QAmHVGXBuqHJwesN4ewidmwqu9eBSVkVYaRCc4zfepQB6D9NjA4FeKDDN3
 7QRQ5vgx51GaOCR0UcT2usuJfwK9mEUCi/zzu1C5cuXoPgRFwLjiBy/6+QMhfSZwgCqE+y1Tx3y
 dfxw2kE3bM78dQHVg9fOj1lKq07nPTtW4eBLgrRtLBJdAjil+uTiYpuBFFnZ9MeQwolmTJr4M+n
 KvlA5nvejLX8tsV3bbImOKE9R6fbdLVvdJeavm0bdX6qOQ3anZReCi3ZEkhVEs2Pq4M3+54/sY1
 es6rg4KWDnDBFGYEIoxkBkAuqPhMh097ch4uqA98YWQEaJjZnFaNnDbjT4fUuRgh+p4EDvkXscy
 8G4BAXHGFp/r4sw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.234.252.31; envelope-from=jlayton@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Tue, 03 Mar 2026 04:16:26 +0000
Subject: [apparmor] [PATCH v2 020/110] befs: use PRIino format for i_ino
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
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: D6A6A1E8B1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:willy@infradead.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:dhowells@redhat.com,m:pc@manguebit.org,m:adilger.kernel@dilger.ca,m:jack@suse.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:sfrench@samba.org,m:ronniesahlberg@gmail.com,m:sprasad@microsoft.com,m:bharathsm@microsoft.com,m:alex.aring@gmail.com,m:konishi.ryusuke@gmail.com,m:slava@dubeyko.com,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:dsterba@suse.com,m:marc.dionne@auristor.com,m:raven@themaw.net,m:luisbg@kernel.org,m:salah.triki@gmail.com,m:aivazian.tigran@gmail.com,m:idryomov@gmail.com,m:a
 markuze@redhat.com,m:jaharkes@cs.cmu.edu,m:coda@cs.cmu.edu,m:nico@fluxnic.net,m:code@tyhicks.com,m:amir73il@gmail.com,m:hch@infradead.org,m:glaubitz@physik.fu-berlin.de,m:frank.li@vivo.com,m:mikulas@artax.karlin.mff.cuni.cz,m:dwmw2@infradead.org,m:richard@nod.at,m:shaggy@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:miklos@szeredi.hu,m:al@alarsen.net,m:chengzhihao1@huawei.com,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:wufan@kernel.org,m:stephen.smalley.work@gmail.com,m:omosnace@redhat.com,m:casey@schaufler-ca.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:edumazet@google.com
 ,m:kuniyu@google.com,m:pabeni@redhat.com,m:willemb@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:horms@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Action: no action

Convert befs i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Also correct signed format specifiers to unsigned, since inode
numbers are unsigned values.

Remove now-unnecessary (unsigned long) casts on i_ino.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/befs/linuxvfs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index cecbc92f959aa5098313050b515c9af38662c8e6..c36216e23eb3678645cbdece913cc260fd10f4f8 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -140,20 +140,20 @@ befs_get_block(struct inode *inode, sector_t block,
 	int res;
 	ulong disk_off;
 
-	befs_debug(sb, "---> befs_get_block() for inode %lu, block %ld",
-		   (unsigned long)inode->i_ino, (long)block);
+	befs_debug(sb, "---> befs_get_block() for inode %" PRIino "u, block %ld",
+		   inode->i_ino, (long)block);
 	if (create) {
 		befs_error(sb, "befs_get_block() was asked to write to "
-			   "block %ld in inode %lu", (long)block,
-			   (unsigned long)inode->i_ino);
+			   "block %ld in inode %" PRIino "u", (long)block,
+			   inode->i_ino);
 		return -EPERM;
 	}
 
 	res = befs_fblock2brun(sb, ds, block, &run);
 	if (res != BEFS_OK) {
 		befs_error(sb,
-			   "<--- %s for inode %lu, block %ld ERROR",
-			   __func__, (unsigned long)inode->i_ino,
+			   "<--- %s for inode %" PRIino "u, block %ld ERROR",
+			   __func__, inode->i_ino,
 			   (long)block);
 		return -EFBIG;
 	}
@@ -162,8 +162,8 @@ befs_get_block(struct inode *inode, sector_t block,
 
 	map_bh(bh_result, inode->i_sb, disk_off);
 
-	befs_debug(sb, "<--- %s for inode %lu, block %ld, disk address %lu",
-		  __func__, (unsigned long)inode->i_ino, (long)block,
+	befs_debug(sb, "<--- %s for inode %" PRIino "u, block %ld, disk address %lu",
+		  __func__, inode->i_ino, (long)block,
 		  (unsigned long)disk_off);
 
 	return 0;
@@ -181,7 +181,7 @@ befs_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
 	char *utfname;
 	const char *name = dentry->d_name.name;
 
-	befs_debug(sb, "---> %s name %pd inode %ld", __func__,
+	befs_debug(sb, "---> %s name %pd inode %" PRIino "u", __func__,
 		   dentry, dir->i_ino);
 
 	/* Convert to UTF-8 */
@@ -224,7 +224,7 @@ befs_readdir(struct file *file, struct dir_context *ctx)
 	size_t keysize;
 	char keybuf[BEFS_NAME_LEN + 1];
 
-	befs_debug(sb, "---> %s name %pD, inode %ld, ctx->pos %lld",
+	befs_debug(sb, "---> %s name %pD, inode %" PRIino "u, ctx->pos %lld",
 		  __func__, file, inode->i_ino, ctx->pos);
 
 	while (1) {
@@ -233,7 +233,7 @@ befs_readdir(struct file *file, struct dir_context *ctx)
 
 		if (result == BEFS_ERR) {
 			befs_debug(sb, "<--- %s ERROR", __func__);
-			befs_error(sb, "IO error reading %pD (inode %lu)",
+			befs_error(sb, "IO error reading %pD (inode %" PRIino "u)",
 				   file, inode->i_ino);
 			return -EIO;
 
@@ -324,7 +324,7 @@ static struct inode *befs_iget(struct super_block *sb, unsigned long ino)
 	bh = sb_bread(sb, inode->i_ino);
 	if (!bh) {
 		befs_error(sb, "unable to read inode block - "
-			   "inode = %lu", inode->i_ino);
+			   "inode = %" PRIino "u", inode->i_ino);
 		goto unacquire_none;
 	}
 
@@ -333,7 +333,7 @@ static struct inode *befs_iget(struct super_block *sb, unsigned long ino)
 	befs_dump_inode(sb, raw_inode);
 
 	if (befs_check_inode(sb, raw_inode, inode->i_ino) != BEFS_OK) {
-		befs_error(sb, "Bad inode: %lu", inode->i_ino);
+		befs_error(sb, "Bad inode: %" PRIino "u", inode->i_ino);
 		goto unacquire_bh;
 	}
 
@@ -407,7 +407,7 @@ static struct inode *befs_iget(struct super_block *sb, unsigned long ino)
 			inode->i_op = &simple_symlink_inode_operations;
 		}
 	} else {
-		befs_error(sb, "Inode %lu is not a regular file, "
+		befs_error(sb, "Inode %" PRIino "u is not a regular file, "
 			   "directory or symlink. THAT IS WRONG! BeFS has no "
 			   "on disk special files", inode->i_ino);
 		goto unacquire_bh;

-- 
2.53.0


