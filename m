Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCzQE5LqoWnbxAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:03:46 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EE1BC500
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:03:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2qI-0006S5-MS; Fri, 27 Feb 2026 18:45:38 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <code@tyhicks.com>) id 1vvfzn-0007t2-WB
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 18:21:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id 743B91300D33;
 Thu, 26 Feb 2026 13:21:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 26 Feb 2026 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1772130108; x=1772137308; bh=Sb7TIp4SU4
 BPQBIvJrSXRMea2RP/1RRExQbDg2XxtlI=; b=mY7eiJfttavlrkoyTDwNdr3mxW
 Yya+Iw3UKA4pbqGLZDUfmlhGyawYCSUPSi+nDDwafb7FT9h6EPhkxS7vBUT895gL
 CnDmfTUJfgc1oaVWjG3Y1iau6+oI+/JO27lXnzxzEYRhz4YfNoox8740SEVZ++4s
 BBTZTkPZOp6HQ9AJfG5KwlTBpXiDSLAB3cve5cgBUIaFbLdz5uyQXSTiIahSPotH
 m1N2lXzy8Iihxh74XQQXYRnr/Dwi8vB0M0bhR+h5i6uX0KteqwydeufZ3dU4SftV
 SzNqqk6Em9aj+vgVUl6JrqNPESwI3T+GdW42gdEHfAduc4Ok2Dp3hiDxwYFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1772130108; x=1772137308; bh=Sb7TIp4SU4BPQBIvJrSXRMea2RP/1RRExQb
 Dg2XxtlI=; b=Wbr6CQoQTXhnL6un9p2QFSFiL0/WjAPgN3Hqu5CGgGnwO4FxUJa
 OmvY30abalkecNj7B20MZ1bpuJh+TEmGBZXYxqyJBkz3A4BfqsOu+C7rioY1Oizq
 Zd2fddNNaIjiw0VbTKEdT9In9NdBg15SPjbI57hQH+5YxYbOH79Eol9nG56xFPk1
 eiKeasIRabf/jG3UfgdumG0CyMN461bE3X6VsQJiOYaNYLPiKx2aS2bwVBQ9AEPA
 IAaqkD2V3JIkfoU0YEHqQLNSdvaJg641+JWTYSnTaSpqnNns0x7Gw5Y6xRmo3qP/
 n4w0XGk8yMxS7HR7c9eOuMmrQsuoDk98T6Q==
X-ME-Sender: <xms:N4-gaUgmHgN8QUT5uqZyoAILKIllC9CSpHs_aa5ApMJdy4TRUZaqng>
 <xme:N4-gaavxRR5FxKAhShwOptBTutlMZMQyOs7VM80awROwu53qi0gUMWnPhMfDsNHbW
 wOQnAjHtKRdhR389hAuinaNTgyNuKGoXkHHRO-W1GYDHnN4n7xWmWg>
X-ME-Received: <xmr:N4-gadynJhJmTysctuxAEb_rcwrEQCCAUTRr_O7lniLd8LGwb0bZ3JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeeijeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
 jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
 epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
 hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopedugeehpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehjlhgrhihtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghr
 rghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghksehsuhhsvgdrtg
 iipdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthho
 pehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhhihgvuh
 druggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpdhrtghpthhtohepuggrnhdr
 jhdrfihilhhlihgrmhhssehinhhtvghlrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
 hnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:N4-gaUiDHufb7QDBXtv8zwbIb83B1pheshVwg5ywjfQJEiEhKoV6BA>
 <xmx:N4-gaTYOst36ecB1dZaU-vU3382-pFYnRZALOnlpLPnbipXYkF9QHQ>
 <xmx:N4-gaRZQeIr-umcwUpLlYQH9oqvsne-oBW6cY0EOLVeaTmU3aOAHdA>
 <xmx:N4-gaXWU9S8BXIqIGWB3xu1aNy8XbCWoZVjyGjttFvAIRGT1xRapxw>
 <xmx:PI-gaZ752oPELps33je3r6u6yggqAG8mNBxGDV8jZFYtOdWW7-_mYAVV>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Feb 2026 13:21:33 -0500 (EST)
Date: Thu, 26 Feb 2026 12:21:22 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <aaCO9CdY1AP8SM2K@yaupon>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-28-ccceff366db9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-iino-u64-v1-28-ccceff366db9@kernel.org>
Received-SPF: pass client-ip=202.12.124.136; envelope-from=code@tyhicks.com;
 helo=flow-b1-smtp.messagingengine.com
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:52 +0000
Subject: Re: [apparmor] [PATCH 28/61] ecryptfs: update format strings for
	u64 i_ino
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 linux-hams@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Fan Wu <wufan@kernel.org>, ceph-devel@vger.kernel.org,
 James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Martin Schiller <ms@dev.tdt.de>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 codalist@coda.cs.cmu.edu, linux-trace-kernel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netfs@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org, Alex Markuze <amarkuze@redhat.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Eric Biggers <ebiggers@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, coda@cs.cmu.edu,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 James Clark <james.clark@linaro.org>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, Alexander Aring <alex.aring@gmail.com>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-f2fs-devel@lists.sourceforge.net, David Airlie <airlied@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, linux-x25@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Simon Horman <horms@kernel.org>, Chao Yu <chao@kernel.org>,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Luis de Bethencourt <luisbg@kernel.org>, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
 linux-security-module@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[24];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.
 rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:codalist@coda.cs.cmu.edu,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:miklos@szeredi.hu,m:willy@infradead.org,m:co
 da@cs.cmu.edu,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:pabeni@redhat.com,m:serge@hallyn.com,m:amir73il@gmail.com,m:james.clark@linaro.org,m:autofs@vger.kernel.org,m:rostedt@goodmis.org,m:dlemoal@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:almaz.alexandrovich@paragon-software.com,m:linux-nfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-mm@kvack.org,m:samba-technical@lists.samba.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[tyhicks.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,huawei.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,evilplan.org];
	FORGED_SENDER(0.00)[code@tyhicks.com,apparmor-bounces@lists.ubuntu.com];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[143];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_HAM(-0.00)[-0.925];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 206EE1BC500
X-Rspamd-Action: no action

On 2026-02-26 10:55:30, Jeff Layton wrote:
> Update format strings and local variable types in ecryptfs for the
> i_ino type change from unsigned long to u64.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  fs/ecryptfs/crypto.c | 6 +++---
>  fs/ecryptfs/file.c   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index 3b59346d68c594fcd7e27bae87849d3e19eff56e..f25c9a49e251a591695a143f64d1a81c5211ec18 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -1313,7 +1313,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  		rc = ecryptfs_read_xattr_region(page_virt, ecryptfs_inode);
>  		if (rc) {
>  			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
> -			       "file header region or xattr region, inode %lu\n",
> +			       "file header region or xattr region, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  			goto out;
> @@ -1323,7 +1323,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  						ECRYPTFS_DONT_VALIDATE_HEADER_SIZE);
>  		if (rc) {
>  			printk(KERN_DEBUG "Valid eCryptfs headers not found in "
> -			       "file xattr region either, inode %lu\n",
> +			       "file xattr region either, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  		}
> @@ -1335,7 +1335,7 @@ int ecryptfs_read_metadata(struct dentry *ecryptfs_dentry)
>  			       "crypto metadata only in the extended attribute "
>  			       "region, but eCryptfs was mounted without "
>  			       "xattr support enabled. eCryptfs will not treat "
> -			       "this like an encrypted file, inode %lu\n",
> +			       "this like an encrypted file, inode %llu\n",
>  				ecryptfs_inode->i_ino);
>  			rc = -EINVAL;
>  		}
> diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
> index 7929411837cf5b2e98e1d4288791d2e07c44a4eb..49b0fbe0428a2d202434ce4b5fd7d82d2a63cf58 100644
> --- a/fs/ecryptfs/file.c
> +++ b/fs/ecryptfs/file.c
> @@ -253,7 +253,7 @@ static int ecryptfs_open(struct inode *inode, struct file *file)
>  	if (rc)
>  		goto out_put;
>  	ecryptfs_printk(KERN_DEBUG, "inode w/ addr = [0x%p], i_ino = "
> -			"[0x%.16lx] size: [0x%.16llx]\n", inode, inode->i_ino,
> +			"[0x%.16llx] size: [0x%.16llx]\n", inode, inode->i_ino,
>  			(unsigned long long)i_size_read(inode));
>  	goto out;
>  out_put:
> 
> -- 
> 2.53.0
> 

