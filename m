Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFPRKHY9p2kVgAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 20:58:46 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C91F6843
	for <lists+apparmor@lfdr.de>; Tue, 03 Mar 2026 20:58:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxVt4-0003I6-77; Tue, 03 Mar 2026 19:58:34 +0000
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1vxSDf-0003Ip-Ad
 for apparmor@lists.ubuntu.com; Tue, 03 Mar 2026 16:03:35 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c70f191313cso2309011a12.3
 for <apparmor@lists.ubuntu.com>; Tue, 03 Mar 2026 08:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553813; cv=none;
 d=google.com; s=arc-20240605;
 b=Y8fwBFYd3ISW67pZzIiRdoTH4Lj+15GgPVYdIQ7yTZ2Hod3Ne++s+Q5ip6bCMDSBGf
 FtLuMZoTGXoargFGJJRKSIQW6RGPQUkXw5s219Ii1Kvx5v2yMxXRhj/tVsmOBNhBp9M3
 XNW/HK3Q9YyE54tPK8NjcJjnP19G+Osy0V/A+Ntaj1Qpku8beZaTqijtHoe/hkSKF8Qo
 DLYHT9KD1dO8p5n9Qf1IWnlv1NyBbjl2IFVDU6pqluNzpSGQqrP1WSZfXSInKfVxeYUy
 WmSWvXM0RUY+Skf75opaApvg1s6GqWpAthVv6CWJecr6a0N+ZUVcDch1+hoIZa3h4bGt
 Rb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 fh=IiAbjOGyzoN/rpn3VQjFMtwgrEpIDCnnm30c5XR4ocA=;
 b=ZB9hrdphWpW86ctKaYwjpPOHyfW0XExA+Q+g6SmmnPnLyAl8lE4ekKWkgcbNKSTqLT
 WUMjFDTAn+XZAuFjDBiGk12QQsGXS3KyZ50fubXcV9K30VFnveaqjIWk8n4kZxQ/J4GW
 xV2DPu6JsqmZuaU22c+f3o4uymbn1qiksK9/LLmGtNjqlRhkerOBacKBuOzhG50Cy+/w
 i8VaIxYaP4D4eLqxOEWVE4sLfosWlKlg6EBdXUk6Fg5IPIYRoMoPGCGHaw6Jdlg8VtkB
 ft2X1cFvTBkTa427C1QWS5xbQcIYUUOiodZbKCMFzNM/byW3tn/N+RkeWi4/IkalnlQp
 Xwdw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1772553813; x=1773158613; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 b=N7iRDyZUsyKnvXibVW81A+6aoYRKx0vQ1c+UrMMjKLbfSCxgeanVutBs7RTFOsHtPm
 TpjL4Gkbz7jAYJZ+oqI94RhlifdMs8DXyVsGBXL+goRxymCdVr7jgehWDjrZK6c2suA7
 t3RwpxDjnLrAT7mfVsYhnZZHySQLM9VXV+8w6X5EroxTD823K/Pr6yTaz45svQFOGQYj
 KWKhIvs/hNvig/a5Zt/DMMSK8oJfms8Sfazw7QQqsLmZsxHsIk5iLYvmdcqNY+CN8u3O
 Q+mkHxfb60RS7esCzF/RiRzL5gHhJXdIH2J6vOIDI6I1Z5JJjvraQZ/FPFnbuezHjQBR
 Qs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772553813; x=1773158613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
 b=RUKTLKxXnbnVk21WOz72N/YCvz76nEZSA42WXDAQIv9jEWJvCjfgZZP6F/Qb3yFzly
 KVgCViUmvz0Aj4GxVqh+Iby9ZYSxHZAQFWjD9wQ4Lsc+Uq85Y2kKGjA+ZCemGbh3M2uE
 HQ2A+t1Ptota+dw3CufE6PCw8b0VFBk+Rsd1KNQkPbqN/MJbA2BXAETYZHYqDHbvy/AV
 DCxqIVSzhZe4DH5sYWzkL2tv7an2dBx9RGWVeRm+ZitV8bDgRs7KY8ewBtqpxNwz6dDS
 rfzU476kA4lPrrdOoqcjk1Co8KWZhJAe55DS5WSUH9fvfPUQol1wg8fM6O9t1ALVoX2w
 +uuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh1Ier23mj3XFl8RHa6qxQTAqycmOhxp28AqaDjWuPG84M+wct79gEKFFER4PNlGdjVg/ZWSQQSg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxBxwCmaiWSdGJgCUIA2cfoliHgNg050FY2RfNCKnfCr4r/W6vW
 EXWpql4VkgVJ9Xci6la4ADi0neOYlXQ2Tdr4QKek4TFyMGl5/WXDEm2frEsX0hvnXDWEfi8wSfz
 06T2irW1K9bPGM4/2YZuvOGsPxq2Jp6qS3hQ3RIK7
X-Gm-Gg: ATEYQzzF2ywTq+hHvp69zFmHdWMUsOPsRGja6IC+tJUhPdalCUgfSkGE0+9R3abOjMn
 iJ1yu0IOP+rWNQk7Cvtnn9x+ChMNwGHDTodrNVCke19+0rF4LLG+TIgRVWMhpI0dzqIdA4y4X0D
 nE1ex8gOSpw8FJ7Yfmgj2kLLVOzUOq6bgZUlHZMv7F+U+sSfv6BtdHLjPvKlpDb7eoMKxPEi0bB
 pM5LAM/13LkiY8oWGhVV81xYxVbD1bgJW7bdYsWiALDxNaRtOSSgp7A96v0bVeLNDb2MqtVWuMy
 a5v0U0s=
X-Received: by 2002:a17:902:f60d:b0:2ae:6457:30b4 with SMTP id
 d9443c01a7336-2ae645735cdmr15498765ad.36.1772553812817; Tue, 03 Mar 2026
 08:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-3-e5388800dae0@kernel.org>
 <CAHC9VhRnmBuXEKkUPQhJ_LDzcksjoAJL-ne6mFoJdR1hnDdzsg@mail.gmail.com>
 <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
In-Reply-To: <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Mar 2026 11:03:20 -0500
X-Gm-Features: AaiRm51FwCY5Sd0470l_ykVC0rIb7qnpGdc7B1bNvF1bAK1vXw1y1CZQ64VgwhQ
Message-ID: <CAHC9VhTyhnG7-ojnTnVdh_m1x=rKxw9YEH9g7Xp9m4F78aA5cA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.215.178; envelope-from=paul@paul-moore.com;
 helo=mail-pg1-f178.google.com
X-Mailman-Approved-At: Tue, 03 Mar 2026 19:58:32 +0000
Subject: Re: [apparmor] [PATCH v2 003/110] audit: widen ino fields to u64
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
 linux-nilfs@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 codalist@coda.cs.cmu.edu, Remi Denis-Courmont <courmisch@gmail.com>,
 linux-trace-kernel@vger.kernel.org, Olga Kornievskaia <okorniev@redhat.com>,
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
X-Rspamd-Queue-Id: 954C91F6843
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-sctp@vger.kernel.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:lucien.xin@gmail.com,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:hawk@kernel.org,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:magnus.karlsson@intel.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:eparis@redhat.com,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhir
 amat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:johan.hedberg@gmail.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:john.fastabend@gmail.com,m:codalist@coda.cs.cmu.edu,m:courmisch@gmail.com,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:maciej.fijalkowski@intel.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:marcelo.leitner@gmail.com,m:luiz.dentz@gmail.com,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shis
 hkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:ast@kernel.org,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:ncardwell@google.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:daniel@iogearbox.net,m:miklos@szeredi.hu,m:willy@infradead.org,m:coda@cs.cmu.edu,m:sdf@fomichev.me,m:slava@dubeyko.com,m:neil@brown.name,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,gmail.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,physik.fu-berlin.de,huawei.com,intel.com,redhat.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,ffwll.ch,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.infradead.org,auristor.com,themaw.net,wdc.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,brown.name,lists.sourceforge.net,hallyn.com,goodmis.org,efficios.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,secunet.com,gondor.apana.org.au,nod.at,fasheh.com,holtmann.org,yaina.de,lists.ubuntu.com,talpey.com,pengutronix.de,hartkopp.net,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	RCPT_COUNT_GT_50(0.00)[169];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:05=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wro=
te:
> On Mon, 2026-03-02 at 18:44 -0500, Paul Moore wrote:
> > On Mon, Mar 2, 2026 at 3:25=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > >
> > > inode->i_ino is being widened from unsigned long to u64. The audit
> > > subsystem uses unsigned long ino in struct fields, function parameter=
s,
> > > and local variables that store inode numbers from arbitrary filesyste=
ms.
> > > On 32-bit platforms this truncates inode numbers that exceed 32 bits,
> > > which will cause incorrect audit log entries and broken watch/mark
> > > comparisons.
> > >
> > > Widen all audit ino fields, parameters, and locals to u64, and update
> > > the inode format string from %lu to %llu to match.
> > >
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  include/linux/audit.h   | 2 +-
> > >  kernel/audit.h          | 9 ++++-----
> > >  kernel/audit_fsnotify.c | 4 ++--
> > >  kernel/audit_watch.c    | 8 ++++----
> > >  kernel/auditsc.c        | 2 +-
> > >  5 files changed, 12 insertions(+), 13 deletions(-)
> >
> > We should also update audit_hash_ino() in kernel/audit.h.  It is a
> > *very* basic hash function, so I think leaving the function as-is and
> > just changing the inode parameter from u32 to u64 should be fine.

...

> It doesn't look like changing the argument type will make any material
> difference. Given that it should still work without that change, can we
> leave this cleanup for you to do in a follow-on patchset?

I would prefer if you made the change as part of the patch, mainly to
keep a patch record of this being related.

Ideally I'd really like to see kino_t used in the audit code instead
of u64, but perhaps that is done in a later patch that I didn't see.

--=20
paul-moore.com

