Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHIwF/D6pmk7bgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 16:14:56 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2B1F241C
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 16:14:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxRS8-0002q6-Sd; Tue, 03 Mar 2026 15:14:28 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jack@suse.cz>) id 1vxO3D-0005RH-0d
 for apparmor@lists.ubuntu.com; Tue, 03 Mar 2026 11:36:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6717B5BE01;
 Tue,  3 Mar 2026 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkwgRCUqwHTg0BO7ZDmHD49cJ0cFspBc62hi3O91R1E=;
 b=UA0yQrci2FE0Wix8n/isWmsbi9Rp/ce43M1wmsE5Mvq3brVHpj5jbnSFZLxR3wW/4Wy5Hj
 bMyeNEnoP0ckEOOwi6wk7RPy6QuHOuKx0GbTaIwJtSCA8vL58Te3zZxCHDdhmTI/VKd5n/
 1G64XSVXFa20yNoXy75GU1+rkGerel0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkwgRCUqwHTg0BO7ZDmHD49cJ0cFspBc62hi3O91R1E=;
 b=H/d0D+APnG9mhuvDkLbn+vHx//ZT5bWKlKKivEPJd3jq74VW6GrUPUUkKJo8f5NuvfHEzP
 ND6+QfH0yfTKsvCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=UA0yQrci;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="H/d0D+AP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkwgRCUqwHTg0BO7ZDmHD49cJ0cFspBc62hi3O91R1E=;
 b=UA0yQrci2FE0Wix8n/isWmsbi9Rp/ce43M1wmsE5Mvq3brVHpj5jbnSFZLxR3wW/4Wy5Hj
 bMyeNEnoP0ckEOOwi6wk7RPy6QuHOuKx0GbTaIwJtSCA8vL58Te3zZxCHDdhmTI/VKd5n/
 1G64XSVXFa20yNoXy75GU1+rkGerel0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkwgRCUqwHTg0BO7ZDmHD49cJ0cFspBc62hi3O91R1E=;
 b=H/d0D+APnG9mhuvDkLbn+vHx//ZT5bWKlKKivEPJd3jq74VW6GrUPUUkKJo8f5NuvfHEzP
 ND6+QfH0yfTKsvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E6143EA6E;
 Tue,  3 Mar 2026 11:36:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V6gWE77HpmkJVwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 03 Mar 2026 11:36:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C696AA0A1B; Tue,  3 Mar 2026 12:36:14 +0100 (CET)
Date: Tue, 3 Mar 2026 12:36:14 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <a6ozjkkvf5daoegl3ephy3st5dsagr4vyo7jn53jdv7vubphwc@iyjiloqftbf3>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-98-e5388800dae0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-iino-u64-v2-98-e5388800dae0@kernel.org>
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Spam-Level: 
Received-SPF: pass client-ip=195.135.223.131; envelope-from=jack@suse.cz;
 helo=smtp-out2.suse.de
X-Mailman-Approved-At: Tue, 03 Mar 2026 15:14:25 +0000
Subject: Re: [apparmor] [PATCH v2 098/110] udf: replace PRIino with
 %llu/%llx format strings
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
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, jfs-discussion@lists.sourceforge.net,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 James Clark <james.clark@linaro.org>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
X-Rspamd-Queue-Id: 36A2B1F241C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-sctp@vger.kernel.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:lucien.xin@gmail.com,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:hawk@kernel.org,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:magnus.karlsson@intel.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:eparis@redhat.com,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhir
 amat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:johan.hedberg@gmail.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:john.fastabend@gmail.com,m:codalist@coda.cs.cmu.edu,m:courmisch@gmail.com,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:maciej.fijalkowski@intel.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:marcelo.leitner@gmail.com,m:luiz.dentz@gmail.com,m:amarkuze@redhat.com,m:martin@omnibon
 d.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:ast@kernel.org,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:ncardwell@google.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:daniel@iogearbox.net,m:miklos@szeredi.hu,m:willy@infradead.org,m:coda@cs.cmu.edu,m:sdf@fomichev.me,m:slava@dubeyko.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jack@suse.cz,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,gmail.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,physik.fu-berlin.de,huawei.com,intel.com,redhat.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.infradead.org,auristor.com,themaw.net,wdc.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,brown.name,lists.sourceforge.net,hallyn.com,goodmis.org,efficios.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,secunet.com,gondor.apana.org.au,nod.at,fasheh.com,holtmann.org,yaina.de,lists.ubuntu.com,talpey.com,pengutronix.de,hartkopp.net,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[170];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email]
X-Rspamd-Action: no action

On Mon 02-03-26 15:25:22, Jeff Layton wrote:
> Now that i_ino is u64 and the PRIino format macro has been removed,
> replace all uses in udf with the concrete format strings.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/udf/directory.c | 18 +++++++++---------
>  fs/udf/file.c      |  2 +-
>  fs/udf/inode.c     | 12 ++++++------
>  fs/udf/namei.c     |  8 ++++----
>  fs/udf/super.c     |  2 +-
>  5 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/udf/directory.c b/fs/udf/directory.c
> index c825e11c017f652500a3dfc83905679ef86ec570..f5c81e13eacb17f931d2df564ec4f2a6e9a5d7ab 100644
> --- a/fs/udf/directory.c
> +++ b/fs/udf/directory.c
> @@ -22,7 +22,7 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
>  
>  	if (iter->fi.descTag.tagIdent != cpu_to_le16(TAG_IDENT_FID)) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has entry at pos %llu with incorrect tag %x\n",
> +			"directory (ino %llu) has entry at pos %llu with incorrect tag %x\n",
>  			iter->dir->i_ino, (unsigned long long)iter->pos,
>  			le16_to_cpu(iter->fi.descTag.tagIdent));
>  		return -EFSCORRUPTED;
> @@ -30,7 +30,7 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
>  	len = udf_dir_entry_len(&iter->fi);
>  	if (le16_to_cpu(iter->fi.lengthOfImpUse) & 3) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has entry at pos %llu with unaligned length of impUse field\n",
> +			"directory (ino %llu) has entry at pos %llu with unaligned length of impUse field\n",
>  			iter->dir->i_ino, (unsigned long long)iter->pos);
>  		return -EFSCORRUPTED;
>  	}
> @@ -41,20 +41,20 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
>  	 */
>  	if (len > 1 << iter->dir->i_blkbits) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has too big (%u) entry at pos %llu\n",
> +			"directory (ino %llu) has too big (%u) entry at pos %llu\n",
>  			iter->dir->i_ino, len, (unsigned long long)iter->pos);
>  		return -EFSCORRUPTED;
>  	}
>  	if (iter->pos + len > iter->dir->i_size) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has entry past directory size at pos %llu\n",
> +			"directory (ino %llu) has entry past directory size at pos %llu\n",
>  			iter->dir->i_ino, (unsigned long long)iter->pos);
>  		return -EFSCORRUPTED;
>  	}
>  	if (udf_dir_entry_len(&iter->fi) !=
>  	    sizeof(struct tag) + le16_to_cpu(iter->fi.descTag.descCRCLength)) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has entry where CRC length (%u) does not match entry length (%u)\n",
> +			"directory (ino %llu) has entry where CRC length (%u) does not match entry length (%u)\n",
>  			iter->dir->i_ino,
>  			(unsigned)le16_to_cpu(iter->fi.descTag.descCRCLength),
>  			(unsigned)(udf_dir_entry_len(&iter->fi) -
> @@ -78,7 +78,7 @@ static int udf_copy_fi(struct udf_fileident_iter *iter)
>  	}
>  	if (iter->dir->i_size < iter->pos + sizeof(struct fileIdentDesc)) {
>  		udf_err(iter->dir->i_sb,
> -			"directory (ino %" PRIino "u) has entry straddling EOF\n",
> +			"directory (ino %llu) has entry straddling EOF\n",
>  			iter->dir->i_ino);
>  		return -EFSCORRUPTED;
>  	}
> @@ -184,7 +184,7 @@ static int udf_fiiter_advance_blk(struct udf_fileident_iter *iter)
>  			return 0;
>  		}
>  		udf_err(iter->dir->i_sb,
> -			"extent after position %llu not allocated in directory (ino %" PRIino "u)\n",
> +			"extent after position %llu not allocated in directory (ino %llu)\n",
>  			(unsigned long long)iter->pos, iter->dir->i_ino);
>  		return -EFSCORRUPTED;
>  	}
> @@ -272,7 +272,7 @@ int udf_fiiter_init(struct udf_fileident_iter *iter, struct inode *dir,
>  		if (pos == dir->i_size)
>  			return 0;
>  		udf_err(dir->i_sb,
> -			"position %llu not allocated in directory (ino %" PRIino "u)\n",
> +			"position %llu not allocated in directory (ino %llu)\n",
>  			(unsigned long long)pos, dir->i_ino);
>  		err = -EFSCORRUPTED;
>  		goto out;
> @@ -483,7 +483,7 @@ int udf_fiiter_append_blk(struct udf_fileident_iter *iter)
>  		   &iter->loffset, &etype);
>  	if (err <= 0 || etype != (EXT_RECORDED_ALLOCATED >> 30)) {
>  		udf_err(iter->dir->i_sb,
> -			"block %llu not allocated in directory (ino %" PRIino "u)\n",
> +			"block %llu not allocated in directory (ino %llu)\n",
>  			(unsigned long long)block, iter->dir->i_ino);
>  		return -EFSCORRUPTED;
>  	}
> diff --git a/fs/udf/file.c b/fs/udf/file.c
> index ab8093b87dc8f21ce8af6a72621e2868fb4b9a82..b043fe10e5d605b62988512bbda65bd357fb649a 100644
> --- a/fs/udf/file.c
> +++ b/fs/udf/file.c
> @@ -133,7 +133,7 @@ long udf_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	int result;
>  
>  	if (file_permission(filp, MAY_READ) != 0) {
> -		udf_debug("no permission to access inode %" PRIino "u\n", inode->i_ino);
> +		udf_debug("no permission to access inode %llu\n", inode->i_ino);
>  		return -EPERM;
>  	}
>  
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index ecc22aded0d287ccdfb34b42a0d82e392054f585..902f81729bd886a534c9da644771c7c04c067cbf 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -147,7 +147,7 @@ void udf_evict_inode(struct inode *inode)
>  		if (iinfo->i_alloc_type != ICBTAG_FLAG_AD_IN_ICB &&
>  		    inode->i_size != iinfo->i_lenExtents) {
>  			udf_warn(inode->i_sb,
> -				 "Inode %" PRIino "u (mode %o) has inode size %llu different from extent length %llu. Filesystem need not be standards compliant.\n",
> +				 "Inode %llu (mode %o) has inode size %llu different from extent length %llu. Filesystem need not be standards compliant.\n",
>  				 inode->i_ino, inode->i_mode,
>  				 (unsigned long long)inode->i_size,
>  				 (unsigned long long)iinfo->i_lenExtents);
> @@ -1386,13 +1386,13 @@ static int udf_read_inode(struct inode *inode, bool hidden_inode)
>  	 */
>  	bh = udf_read_ptagged(inode->i_sb, iloc, 0, &ident);
>  	if (!bh) {
> -		udf_err(inode->i_sb, "(ino %" PRIino "u) failed !bh\n", inode->i_ino);
> +		udf_err(inode->i_sb, "(ino %llu) failed !bh\n", inode->i_ino);
>  		return -EIO;
>  	}
>  
>  	if (ident != TAG_IDENT_FE && ident != TAG_IDENT_EFE &&
>  	    ident != TAG_IDENT_USE) {
> -		udf_err(inode->i_sb, "(ino %" PRIino "u) failed ident=%u\n",
> +		udf_err(inode->i_sb, "(ino %llu) failed ident=%u\n",
>  			inode->i_ino, ident);
>  		goto out;
>  	}
> @@ -1641,7 +1641,7 @@ static int udf_read_inode(struct inode *inode, bool hidden_inode)
>  		udf_debug("METADATA BITMAP FILE-----\n");
>  		break;
>  	default:
> -		udf_err(inode->i_sb, "(ino %" PRIino "u) failed unknown file type=%u\n",
> +		udf_err(inode->i_sb, "(ino %llu) failed unknown file type=%u\n",
>  			inode->i_ino, fe->icbTag.fileType);
>  		goto out;
>  	}
> @@ -1942,7 +1942,7 @@ static int udf_update_inode(struct inode *inode, int do_sync)
>  	if (do_sync) {
>  		sync_dirty_buffer(bh);
>  		if (buffer_write_io_error(bh)) {
> -			udf_warn(inode->i_sb, "IO error syncing udf inode [%08" PRIino "x]\n",
> +			udf_warn(inode->i_sb, "IO error syncing udf inode [%08llx]\n",
>  				 inode->i_ino);
>  			err = -EIO;
>  		}
> @@ -2224,7 +2224,7 @@ int udf_next_aext(struct inode *inode, struct extent_position *epos,
>  
>  		if (++indirections > UDF_MAX_INDIR_EXTS) {
>  			udf_err(inode->i_sb,
> -				"too many indirect extents in inode %" PRIino "u\n",
> +				"too many indirect extents in inode %llu\n",
>  				inode->i_ino);
>  			return -EFSCORRUPTED;
>  		}
> diff --git a/fs/udf/namei.c b/fs/udf/namei.c
> index 32209549a31f451a486918e673a41497bef42e89..ccafcaa9680982decaabc180833b67ace5c92973 100644
> --- a/fs/udf/namei.c
> +++ b/fs/udf/namei.c
> @@ -550,7 +550,7 @@ static int udf_unlink(struct inode *dir, struct dentry *dentry)
>  		goto end_unlink;
>  
>  	if (!inode->i_nlink) {
> -		udf_debug("Deleting nonexistent file (%" PRIino "u), %u\n",
> +		udf_debug("Deleting nonexistent file (%llu), %u\n",
>  			  inode->i_ino, inode->i_nlink);
>  		set_nlink(inode, 1);
>  	}
> @@ -809,7 +809,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  					       &diriter);
>  		if (retval == -ENOENT) {
>  			udf_err(old_inode->i_sb,
> -				"directory (ino %" PRIino "u) has no '..' entry\n",
> +				"directory (ino %llu) has no '..' entry\n",
>  				old_inode->i_ino);
>  			retval = -EFSCORRUPTED;
>  		}
> @@ -821,7 +821,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  				old_dir->i_ino) {
>  			retval = -EFSCORRUPTED;
>  			udf_err(old_inode->i_sb,
> -				"directory (ino %" PRIino "u) has parent entry pointing to another inode (%" PRIino "u != %u)\n",
> +				"directory (ino %llu) has parent entry pointing to another inode (%llu != %u)\n",
>  				old_inode->i_ino, old_dir->i_ino,
>  				udf_get_lb_pblock(old_inode->i_sb, &tloc, 0));
>  			goto out_oiter;
> @@ -869,7 +869,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  	retval = udf_fiiter_find_entry(old_dir, &old_dentry->d_name, &oiter);
>  	if (retval) {
>  		udf_err(old_dir->i_sb,
> -			"failed to find renamed entry again in directory (ino %" PRIino "u)\n",
> +			"failed to find renamed entry again in directory (ino %llu)\n",
>  			old_dir->i_ino);
>  	} else {
>  		udf_fiiter_delete_entry(&oiter);
> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index c6e372d573885742745d3ff4b3b017facf228a32..3a2d66c7e856383cc5c8a605180a9582396ba805 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -1166,7 +1166,7 @@ static int udf_fill_partdesc_info(struct super_block *sb,
>  		}
>  		map->s_uspace.s_table = inode;
>  		map->s_partition_flags |= UDF_PART_FLAG_UNALLOC_TABLE;
> -		udf_debug("unallocSpaceTable (part %d) @ %" PRIino "u\n",
> +		udf_debug("unallocSpaceTable (part %d) @ %llu\n",
>  			  p_index, map->s_uspace.s_table->i_ino);
>  	}
>  
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

