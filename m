Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHZeBjfmoWmUwwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 19:45:11 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF631BC203
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 19:45:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2pe-00046i-3J; Fri, 27 Feb 2026 18:44:58 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1vvieK-0002nw-4Z
 for apparmor@lists.ubuntu.com; Thu, 26 Feb 2026 21:11:56 +0000
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c70378ddaafso860416a12.3
 for <apparmor@lists.ubuntu.com>; Thu, 26 Feb 2026 13:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772140314; cv=none;
 d=google.com; s=arc-20240605;
 b=ifFmYoEbftu0fJrxj//6u4qFF86Z9V4xCTOcZLjs8AbJ/Gkqpdzza/izjqXWQWDWXO
 m/00D55MKwYMUNdO1LRXNqaZyCLU90LT4yQ8u280jLFv+9CBP5GBv868WuNZs6rvz5ub
 L8esYjJTe+YAfwaP+rAp8X/S5xrIScRPBK0vjSVmiyMpTLtYcU6prV1EfM2qyF5da7oV
 pZ5cMOAfYTQnY8NdizWINlniGNBcs1obvcrFPVyCvWNIDHRzIhR3MEIXxZR/LdaUgTjJ
 NSAT5XNP48SX95I4A0TDaRodQDvZAG9li3v2SGX4D/2sRACtodMYIfC9D4Dl4CEwMqtF
 6DHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
 fh=EpStG66Cixj+WCiwZD/QzBltNq+APemrbiwg71FNThs=;
 b=Qe6i86XDS9goo6EOrximphBXy5khp37RoqlOnldVoUVqCg9Fd9h0pZB/wXJ2L8/i0p
 4K+IVaJpBxNHl/B2iAaKOMh3Kic3PFzPmtOjenYhiQbJpIdv00tyrRL1chBNQHWBr+Mj
 yuBfHbFq+mJm5UiufNAejC9rJq7IkPyrn0SJJEZQrykJbhKF6c57PSuOln8k8BXh82lQ
 r0brtgQvwVOOjXlRCEK4bJLuBjU8clOrfVqTBiZluIpZDrOG0H/H9hqSJd0K5Vkqohgg
 A+M/uFr90eBSN0tNXDdCWYb7dy0nl6lX2t9NJSJ6cqAegKLj76C+Zz/geZeVdFA9K9dO
 LKnw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1772140314; x=1772745114; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
 b=Jx1n523bsqXqPwUEiRcSdiOuLHkJEsiBMWBsHzZBBgOmRx3frqdZk484zuYVhlDea9
 3gAVjO+S6VU75jIML/6r1fFME0QfyMLbN0FTm0OjA39ZcqHjeuMCXYW/IqxKlpMoLqAL
 QOYj0y6+1GR5Bl2IJkHn3kaD2ixeHstaBVt+Xwy1WJNWxiDTOR0bAUjorPbIbgKaHDrN
 FCdiDb6a8VMq0BPHwv7xqgc4NsRsb/bIb867UshaJ5nEw8/owcitz6fW+M402DlC0gyM
 XMdiGXLVduPzIkg+Ww02CgO3JiYS6SsCRN83JVRcWupbbf8GpF6OS1lDiJN1nsFct0JE
 XI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772140314; x=1772745114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
 b=YiznSso8kIjat2ZcE7U/i0m2rUbCtJnQ0aqxnN+xzGyISyvLPKv6uP7sSXnGPwuFdE
 Clu2D6lJ7cBpgbKwJ70QIm7bJTxniFO/idITw7UuprW9Sqxz5qp/mqSSodzGyg+MATk9
 U3oQFUUXM1xtFC6s5YkZ7SG+JZFo5mX7n2qCUf5FW2zCbtqgTzSZHox2g+xEcaZQPjA5
 s3sR4UiAUqb9yKveHiinYDUcB7xFDvOiXMRBcuWPxffQr+3pPHy3Q7+BvrvCyU/ffymC
 l25U8cYFEUq3RRVf4zz/pImX5ZN2VDlgI2J0U967lZN5TIJnmPmC0932qitWzvemOXqG
 5EFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUWDMqv8S3r60E55skdjAqwheoLfZ+k78NT60TiGNxgxe3tFqDq8hYl0O/Pfz867NJdIRuPt6v5Q==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz2bLhGh+4OIZTjTIJH8+s81o53gvFwmArgBfMbBpEfR73p+dTq
 tqIvS2o+VB2sL6Pzb+qQ40DShBQW6StFCVoySG8m+2B2GqsQ+DwVxbusPIErHrpp2yLzkR+84S6
 ys5xh5EMCmBozenjzne3coOI8RVK7uXiQke8/Br9O
X-Gm-Gg: ATEYQzx6x+7WqmjgRAni0smxznV9fEMuZzr5kv/5blOWUGbFiAmcuWd+umcc7Oxi6nw
 s+jUpnTVCg9YT0DVcJcj//GxeTbmtfcHhnKTvrnDKIh5lN3Jn3CbfkNUjOyOVjOPdnLD++V5QUg
 IV/Dm75/py41ch2Q+qaQNSRBDqUaJH7yjYVuOgP+qIMCUjqJYTZOH+1NPU/VrDSbH1VyackFyq7
 LIK8zji2JWH+YDwExBlmZrJCdL3UjybPN7W2Yuc7INhelIkwe881uSSePfv1jepwiZSL76l0899
 WuYZr4s=
X-Received: by 2002:a17:90b:574f:b0:359:877:370f with SMTP id
 98e67ed59e1d1-35965ccf029mr498632a91.17.1772140313953; Thu, 26 Feb 2026
 13:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Feb 2026 16:11:41 -0500
X-Gm-Features: AaiRm51CHDvKlRV2Z04ZUK5c4lU9AiJhpRFTzD6a70HHA0FgEKDqsojtRqG1Wpw
Message-ID: <CAHC9VhTPutzjNfYoRJigC2AQS4wz1A3vTEYn2koeR0kKetYk0w@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.215.169; envelope-from=paul@paul-moore.com;
 helo=mail-pg1-f169.google.com
X-Mailman-Approved-At: Fri, 27 Feb 2026 18:44:52 +0000
Subject: Re: [apparmor] [PATCH 51/61] security: update audit format strings
	for u64 i_ino
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
 James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Martin Schiller <ms@dev.tdt.de>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Willem de Bruijn <willemb@google.com>,
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
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-trace-kernel@vger.kernel.org, Olga Kornievskaia <okorniev@redhat.com>,
 Yangtao Li <frank.li@vivo.com>, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, netfs@lists.linux.dev,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy
 @kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:codalist@coda.cs.cmu.edu,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:miklos@szeredi.hu,m:willy@infradead.org,m:coda@
 cs.cmu.edu,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:pabeni@redhat.com,m:serge@hallyn.com,m:amir73il@gmail.com,m:james.clark@linaro.org,m:autofs@vger.kernel.org,m:rostedt@goodmis.org,m:dlemoal@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:almaz.alexandrovich@paragon-software.com,m:linux-nfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-mm@kvack.org,m:samba-technical@lists.samba.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,huawei.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	RCPT_COUNT_GT_50(0.00)[143];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,paul-moore.com:url]
X-Rspamd-Queue-Id: ABF631BC203
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:06=E2=80=AFAM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> Update %lu/%ld to %llu/%lld in security audit logging functions that
> print inode->i_ino, since i_ino is now u64.
>
> Files updated: apparmor/apparmorfs.c, integrity/integrity_audit.c,
> ipe/audit.c, lsm_audit.c.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  security/apparmor/apparmorfs.c       |  4 ++--
>  security/integrity/integrity_audit.c |  2 +-
>  security/ipe/audit.c                 |  2 +-
>  security/lsm_audit.c                 | 10 +++++-----
>  security/selinux/hooks.c             |  4 ++--
>  security/smack/smack_lsm.c           | 12 ++++++------
>  6 files changed, 17 insertions(+), 17 deletions(-)

...

> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 7d623b00495c14b079e10e963c21a9f949c11f07..737f5a263a8f79416133315ed=
f363ece3d79c722 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c

Everything in security/lsm_audit.c looks okay.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index d8224ea113d1ac273aac1fb52324f00b3301ae75..150ea86ebc1f7c7f8391af410=
9a3da82b12d00d2 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -1400,7 +1400,7 @@ static int inode_doinit_use_xattr(struct inode *ino=
de, struct dentry *dentry,
>         if (rc < 0) {
>                 kfree(context);
>                 if (rc !=3D -ENODATA) {
> -                       pr_warn("SELinux: %s:  getxattr returned %d for d=
ev=3D%s ino=3D%ld\n",
> +                       pr_warn("SELinux: %s:  getxattr returned %d for d=
ev=3D%s ino=3D%lld\n",
>                                 __func__, -rc, inode->i_sb->s_id, inode->=
i_ino);
>                         return rc;
>                 }

Additionally, later in this function there are pr_notice_ratelimited()
and pr_warn() calls that print inode numbers and need to be updated.

--=20
paul-moore.com

