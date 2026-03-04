Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMcrCdVYqGk5tgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Mar 2026 17:07:49 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5B203BED
	for <lists+apparmor@lfdr.de>; Wed, 04 Mar 2026 17:07:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxo4T-0000Ry-OB; Wed, 04 Mar 2026 15:23:33 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vxfi9-0005dX-6x
 for apparmor@lists.ubuntu.com; Wed, 04 Mar 2026 06:27:57 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id C99AF1380E87;
 Wed,  4 Mar 2026 01:27:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Wed, 04 Mar 2026 01:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1772605675; x=1772612875; bh=5+RTgashw6751XVNDWQdZH+Q/6MhJxiaQle
 0ycbNIPA=; b=QGqGuB1HfRnACei6sx6c+uNgMwLaYwouTEpFj2VP0mlDfEqPtRY
 hq1PRy4CBOv70+oVSYpqqZpM0oM/LMhJunekgV3eBzmsgcDG0OI2C4tzloWCpVvl
 4i3VE4LhXttp25s0ZK9pW3oyxGl321uWgHvjWqgL414piiUtcU8j/RBBg3lpxTfz
 hyOETJnm1GZ3Vny7khF6LstdjtjpNA05Sn0+69teOfVwM8bTgFFfpYoCWjZ2d4gj
 zJQVyFRZl/QUmgQAY8aclFxSMlCDdqzk+ns1JfsxU4GqHtILyAxxV1rlJifkZ7nV
 XCXCXCRkAeoUwFwEPnGvyan/ZZjUaQt5PAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772605675; x=
 1772612875; bh=5+RTgashw6751XVNDWQdZH+Q/6MhJxiaQle0ycbNIPA=; b=o
 yBs4Cidn0fowkiQNkfBBbpvMteFnmb6KK9N9BnOLF7DAXMw7rLEfq8O8XkeXs0++
 AItJEKwgOy6+J2k0jKmt5y/gjZkZygq6/z20y552PqK0SvgaS8EPmsW6WcRrV1pP
 Cka6lApHFX3ajwbAqxHOCPa0WJuwpyjOxVf4rBBc72uzD/6CW2235GcM//0i19W8
 7L5pQzsL0OaBqS4U5vUHJiQNiyzDfXHteA0Tj9OpC2tpQ91dxDiKNGlVpY+sXR+u
 F/1B+M7f+72ADS4w6cTGLYwsrCBQ9Ty53UNfXLWsSJmwJfMdphzrO6855O9pzOSm
 tL559XeFSYE02Ng/iW/iA==
X-ME-Sender: <xms:4tCnaSNbDrQ_gxgn-FDSHw2lZNLRjN-bQWFxNuyRrlsjf6GtgESQmg>
 <xme:4tCnacDbxasyEcYHsybPZFFbKL0qOs4hHCyDZ8PnwLz-6RsB4wLBwEgkGnXcsPOlZ
 vDBEl8eoy7hp-6BzaC204ogbJpjXhIDJYl7RZzbFer_2uIshg>
X-ME-Received: <xmr:4tCnaYoX3ksWGbwPjYXqqxsqc0TduUwk20wMvX7c0reLYwrKoLdGz80eJTir0A1PtkE58RYexQ3nSkgmperFT043a9PjJpOJNYr5279CEe3n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddviedvjeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepudejuddpmhhouggvpehsmhht
 phhouhhtpdhrtghpthhtohepvhhirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukh
 dprhgtphhtthhopehjrhgvuhhtvghrseihrghinhgrrdguvgdprhgtphhtthhopehnrgho
 hhhirhhordgrohhtrgesfigutgdrtghomhdprhgtphhtthhopehfrhgrnhhkrdhlihesvh
 hivhhordgtohhmpdhrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopehlihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
 thhtoheplhhinhhugidqgidvheesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4tCnaVnhO8CafOSbZVc9pJUxfys9OoZeY1Z5ndlwHjH7CSajOCGlDw>
 <xmx:4tCnafRh4kpYARpWLK-yCUUMUT7nS6ebAyXQDsGD0JLDF2Tv3K7JJQ>
 <xmx:4tCnac5DU4GRJRJMC10qjpWx3MESrDXeWNEaJqiwQejNUX5p7MDMMw>
 <xmx:4tCnaZg3__L3okNus_55Ab1m3xjLlY3uKakknX-vQwxPKM6XDQv_Ng>
 <xmx:69CnafTUulKHVEiWHbvsFlAmyCSQisz6ZPFKNRFf-ai8k8007x9TdQYK>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Mar 2026 01:27:03 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>,
 <1787281.1772535332@warthog.procyon.org.uk>,
 <1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
Date: Wed, 04 Mar 2026 17:26:59 +1100
Message-id: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:23:30 +0000
Subject: [apparmor] Re: [PATCH v2 000/110] vfs: change inode->i_ino from
	unsigned long to u64
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, linux-hams@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Fan Wu <wufan@kernel.org>,
 Xin Long <lucien.xin@gmail.com>, ceph-devel@vger.kernel.org,
 James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Martin Schiller <ms@dev.tdt.de>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-perf-users@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Dave Kleikamp <shaggy@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 John Fastabend <john.fastabend@gmail.com>, codalist@coda.cs.cmu.edu,
 Remi Denis-Courmont <courmisch@gmail.com>, linux-trace-kernel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Yangtao Li <frank.li@vivo.com>, selinux@vger.kernel.org, v9fs@lists.linux.dev,
 linux-can@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 netfs@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 fsverity@lists.linux.dev, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, Muchun Song <muchun.song@linux.dev>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Alex Markuze <amarkuze@redhat.com>, Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Marc Dionne <marc.dionne@auristor.com>, Neal Cardwell <ncardwell@google.com>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Eric Biggers <ebiggers@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, coda@cs.cmu.edu,
 Stanislav Fomichev <sdf@fomichev.me>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 jfs-discussion@lists.sourceforge.net, "Serge E. Hallyn" <serge@hallyn.com>,
 Amir Goldstein <amir73il@gmail.com>, James Clark <james.clark@linaro.org>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, Alexander Aring <alex.aring@gmail.com>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-f2fs-devel@lists.sourceforge.net, David Airlie <airlied@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-x25@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Joerg Reuter <jreuter@yaina.de>, Simon Horman <horms@kernel.org>,
 Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Oliver Hartkopp <socketcan@hartkopp.net>, David Ahern <dsahern@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: BCC5B203BED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-sctp@vger.kernel.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:lucien.xin@gmail.com,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:hawk@kernel.org,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:magnus.karlsson@intel.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:eparis@redhat.com,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhir
 amat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:johan.hedberg@gmail.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:john.fastabend@gmail.com,m:codalist@coda.cs.cmu.edu,m:courmisch@gmail.com,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:maciej.fijalkowski@intel.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:marcelo.leitner@gmail.com,m:luiz.dentz@gmail.com,m:amarkuze@redhat.com,m:martin@omnibon
 d.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:ast@kernel.org,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:ncardwell@google.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:daniel@iogearbox.net,m:miklos@szeredi.hu,m:willy@infradead.org,m:coda@cs.cmu.edu,m:sdf@fomichev.me,m:slava@dubeyko.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[ownmail.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,gmail.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,physik.fu-berlin.de,huawei.com,intel.com,redhat.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.infradead.org,auristor.com,themaw.net,wdc.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,lists.sourceforge.net,hallyn.com,goodmis.org,efficios.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,secunet.com,gondor.apana.org.au,nod.at,fasheh.com,holtmann.org,yaina.de,lists.ubuntu.com,talpey.com,pengutronix.de,hartkopp.net,evilplan.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[169];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.605];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,noble.neil.brown.name:mid]
X-Rspamd-Action: no action

On Tue, 03 Mar 2026, Jeff Layton wrote:
> On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:
> > Jeff Layton <jlayton@kernel.org> wrote:
> > 
> > > This version splits the change up to be more bisectable. It first adds a
> > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > for format strings. The conversion is done, and then everything is
> > > changed to remove the new macro and typedef.
> > 
> > Why remove the typedef?  It might be better to keep it.
> > 
> 
> Why? After this change, internel kernel inodes will be u64's -- full
> stop. I don't see what the macro or typedef will buy us at that point.

Implicit documentation?
ktime_t is (now) always s64, but we still keep the typedef;

It would be cool if we could teach vsprintf to understand some new
specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
gcc warnings.

NeilBrown

