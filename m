Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COPGFuFzqmkfRwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 07:27:45 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56521C107
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 07:27:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vyO6t-0007yK-I1; Fri, 06 Mar 2026 05:52:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1vxoPa-0004Dn-Lf
 for apparmor@lists.ubuntu.com; Wed, 04 Mar 2026 15:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BCD4404D8;
 Wed,  4 Mar 2026 15:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CBEC2BCB2;
 Wed,  4 Mar 2026 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772638554;
 bh=HNYyRh7uJihRjIsYnqg9vR2rg+YDBytXVTWJLsChpBg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jJJZJuOWKhzm24HbRxXeYH/65v/yOXd3J5JeaPVpFEFHYCIk+4dI8RfwfOSUGeOWx
 1wp0BVEDUhdVwfxuISed9ev5wqFzfZBSXvHUDpSQDH7LdZQV8LqsoA3S7HSPWWSIOS
 q0zFPMue3eMREgGV2olfWoBJ85YhdTD+86QJA4JrqsDAypKCf/Fs0V5KoxG4qVZJty
 ZHH8tVkHlwp57wEI2ERBSF6F3702iYCYBykR+h4S0T4gaLEOpYVyy5DjwzbNP9mH+m
 8mdOGnCCkrpD5DzxE3NWsGzH9XNum7DQaX5HC6gb7/ZJs73mWVq/mG/j0amdjIFZjt
 SfBKgFBpfKv5Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 04 Mar 2026 10:32:41 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-iino-u64-v3-11-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, Eric Biggers <ebiggers@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=HNYyRh7uJihRjIsYnqg9vR2rg+YDBytXVTWJLsChpBg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpqFCpn4jHLr2TGESURidfEFiRx4u3yOkCGmevg
 z8yGIn0bm2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaahQqQAKCRAADmhBGVaC
 FY3fEADG2lZ27yB2I+X23lq+iIwhnlF7pXPPYkX0oxn/MGtoloSrlLv/JlUE0rFS7OLEDmEFh0v
 7Msy8JGrmfcwp1mYgS9BHGKB08wHoUO+/UBe39k6qMASDJIty5gEZjqBQBWvDq/CBQv2+zbPmja
 v/XxPZ6UwR1/kBugt2FWO2bsX4XYbtCV7/rKeVgXYeVOjSEHUhOidxAg0EliqhPo/X1GMHdDpVh
 hlxhOEt2rn82p4aiYJvdaGZJ+Cvvh8ZHZYedZtBPbh2XLdI+b4HRjxoriFnvYkreDBHrhJaFYQF
 mDP+BJqPcTuoiMXgpEyByaON06H+tY2i2mtFB1ZxI2eel7Kz8SQMKLK4cb8mK7Czlwq/SwLc1m4
 FOICYEN2snlvZbhqRz7dLB00X4MHWwwH50CiofjSP6O3VMhimuiWG/e8wg/4H1gm5sZYTKUCM6/
 hbEME9qYhPsCqNagzgowu9/Ly7cNebcIrg6NuudFPojMAQGNOux1bGLLEuM1D5mPZqi35+BQDqw
 c+9Oomp2LgByVNzze60tZa2PrkudTHPupcbq8j59Kr7wLKoNAwh9vorVNGFsm7R0rW4k8E6YePo
 Tc6AgYvtiUDzFDOeJAt06CCLgph2tznpvQejcnIWoU+6g2Fm9zEw+sUQ8b97rt1cqbxYg6uxck3
 fFrf+jQCmVJvCFQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
Received-SPF: pass client-ip=172.234.252.31; envelope-from=jlayton@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Fri, 06 Mar 2026 05:52:25 +0000
Subject: [apparmor] [PATCH v3 11/12] nilfs2: widen trace event i_ino fields
	to u64
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
X-Rspamd-Queue-Id: 0F56521C107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	DATE_IN_PAST(1.00)[38];
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
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,infradead.org,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:ebiggers@kernel.org,m:tytso@mit.edu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:dhowells@redhat.com,m:pc@manguebit.org,m:adilger.kernel@dilger.ca,m:jack@suse.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,m:Dai.Ngo@oracle.com,m:tom@talpey.com,m:sfrench@samba.org,m:ronniesahlberg@gmail.com,m:sprasad@microsoft.com,m:bharathsm@microsoft.com,m:alex.aring@gmail.com,m:konishi.ryusuke@gmail.com,m:slava@dubeyko.com,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:dsterba@suse.com,m:marc.dionne@auristor.com,m:raven@themaw.net,m:luisbg@kernel.org,m:salah.triki@gmail.com,m:aivazian.tigran@gmail.com,m:idryomov@gmail.com,m:amarkuze@redhat.com,m:j
 aharkes@cs.cmu.edu,m:coda@cs.cmu.edu,m:nico@fluxnic.net,m:code@tyhicks.com,m:amir73il@gmail.com,m:hch@infradead.org,m:glaubitz@physik.fu-berlin.de,m:frank.li@vivo.com,m:mikulas@artax.karlin.mff.cuni.cz,m:dwmw2@infradead.org,m:richard@nod.at,m:shaggy@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:mark@fasheh.com,m:jlbec@evilplan.org,m:joseph.qi@linux.alibaba.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:miklos@szeredi.hu,m:al@alarsen.net,m:chengzhihao1@huawei.com,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:wufan@kernel.org,m:stephen.smalley.work@gmail.com,m:omosnace@redhat.com,m:casey@schaufler-ca.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:edumazet@google.com,m:kuniyu@google.com,m
 :pabeni@redhat.com,m:willemb@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:horms@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[171];
	FROM_NEQ_ENVFROM(0.00)[jlayton@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Action: no action

In trace events, change __field(unsigned long, ...) to __field(u64, ...)
and update TP_PROTO parameters and TP_printk format strings to match
the widened field type.

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/nilfs2.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/trace/events/nilfs2.h b/include/trace/events/nilfs2.h
index 8880c11733dd307c223cc62ee34ebeff650ecb12..49efbd209585b294f363e950e8ab266f533a9eb6 100644
--- a/include/trace/events/nilfs2.h
+++ b/include/trace/events/nilfs2.h
@@ -165,14 +165,14 @@ TRACE_EVENT(nilfs2_segment_usage_freed,
 
 TRACE_EVENT(nilfs2_mdt_insert_new_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long block),
 
 	    TP_ARGS(inode, ino, block),
 
 	    TP_STRUCT__entry(
+		    __field(u64, ino)
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
 		    __field(unsigned long, block)
 	    ),
 
@@ -182,7 +182,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 		    __entry->block = block;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu block = %lu",
+	    TP_printk("inode = %p ino = %llu block = %lu",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->block)
@@ -190,15 +190,15 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 
 TRACE_EVENT(nilfs2_mdt_submit_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long blkoff,
 		     enum req_op mode),
 
 	    TP_ARGS(inode, ino, blkoff, mode),
 
 	    TP_STRUCT__entry(
+		    __field(u64, ino)
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
 		    __field(unsigned long, blkoff)
 		    /*
 		     * Use field_struct() to avoid is_signed_type() on the
@@ -214,7 +214,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
 		    __entry->mode = mode;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu blkoff = %lu mode = %x",
+	    TP_printk("inode = %p ino = %llu blkoff = %lu mode = %x",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->blkoff,

-- 
2.53.0


