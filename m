Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOJQD6PzoWkwxgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:42:27 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 009891BCF8A
	for <lists+apparmor@lfdr.de>; Fri, 27 Feb 2026 20:42:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vw2q2-0005Pe-D9; Fri, 27 Feb 2026 18:45:22 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vw0zi-0006Cm-Et
 for apparmor@lists.ubuntu.com; Fri, 27 Feb 2026 16:47:14 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E557402AD
 for <apparmor@lists.ubuntu.com>; Fri, 27 Feb 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772210833;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=g62khbgRpWzZ6oapqpH54HEvITHPseCVkUma3rQ9B8T2WgRybEyTq+6sfXuBx3Ltj
 7KBVjSc+0H8t+Au4qhaMxtxvbPxHdGF+u/G760BXANgWJDx8nqazhwF0leAiC5Q1h+
 NUhi+Er/YqGXNnpW+MxhihbYkB5OyUqmBrZvF44ortsnVtuJKYsm7SmPuhy+A8pymf
 963JuClel6Q/7RfqFkXRfp/vSyiUoRwzpAVvYzyEJ7TgykGt1o359enXfLtKWI4BYX
 spKGjenOKVJWai1UVtLsVBHkfX/lnmrJ998cvCSPPHcovG6XL00dPEg6/yKDP329YL
 ooKWQnSJXZxUkmeU+yNgAOhwBP1X93GJFfE/zo1egLVW8uPX6CnIhqtGg5FjPffA+Y
 A5+ohUCJD7mLb/shq1FzzFxx8U268W3mLMOwAr7sNqPPnSjmBLl1bsYYPBfKAySwyc
 NHJlCelbqG+N5vGNefy9ezDpb2Zjj09zGvt5pM3mq44wFJ8X+lXUiF3112VK+1aGIJ
 k3SYMDYAXxjf+7InJ3/InclUbDtDIyVdI88bzRswPzUw7Nny6mV5xk3PjBBwMP55jT
 3gqeJjhwZjl/NF71XbRQRUhQ2RZt6S2fX/E74VmqLLunIsSocV3b49YQwajn/zs8Aq
 ja63de/wXDR9n54Rtl93jpkU=
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7986f771f69so18490317b3.1
 for <apparmor@lists.ubuntu.com>; Fri, 27 Feb 2026 08:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772210831; cv=none;
 d=google.com; s=arc-20240605;
 b=lE/VBJy947fWLgwfI2FWUW9LyDtypDmXmW6Z8PzrFl5Pupz5/bVXhnddE4hqLq9JuS
 QcrnSWDx6zsZaw56rklIsaU3As4MAnEkrFRHD3kZfwcyQStDsHK55KxA1q0CMMg/0j3z
 3SAr++7OQ618iGtO5VNlGzgPOiwi3cHRmEws4NhziPa3GCFoBkOmJiy/uuGH52dA5FA3
 L1Hwyz62/hYtbmg61BJUKpZ+8R6rAZeJA7InFlxRd/XXZ2wZhe56vRMrk9tpGs8MqkxJ
 I3mdr7q1xmz/ur/rmyn4ZNKnkFaqxgmq95/goMtlNAHX9C21drAVM1Wn7tXRiIuvMaYN
 ySrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 fh=YgWmV4FLXwmon6CvLYJ9VmR/bKGj2Y5QVMSZDXPU0EE=;
 b=dgl+H0L3hH/wadWbSG7ttltNMfCroD2ZwmC0TTJjthRN6OjYFTpFkO6a4nVK3TgXBU
 +RLLMrbubZvrrzIehqIf4DaZSalV02Ot5jnSqDeGX+6g1rrUMHYLo5AzrvL9TCj+vv4K
 YGm6glj+/W+ocLSNiEtrbRPWOQ3xREaep7jt9LUwgHhD2FErGJk3bvUdXjnnXjmgWD58
 yJCCJ3nJ9kIBpM3e5dw7/MGySdoIhCIdEew0LWs05NaHhtyg5v2XhiEfqUqgFci3vkAn
 Z6wgTjRMhor9jfkzG+Dn5OCpFSBazs61G+8AcnG4sA43vaADlCRslSeAU96+3+poFpHm
 6Ekw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772210831; x=1772815631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 b=mFKpfZvNYxTA05KqrD9OyAun2Ea/mPZK3Fl6hCWdELtYob0Edb+oDgQ2F3kOSo971a
 TJRNCyZkrkAf594DzvYs3W0BhQmY3GLUo57ITbN9TL+Gna/ZkdZ1nnx5cFdk/MuSfl1Q
 oC/L9RmK/MI6m5oIXQQjetGkFDWQZo58NT1V14jTPTaqcB0Ezyt8FBLKfeKqtY9OfVLC
 pjuNzoQjGdqSqRyzi28c/pJaFj1/Sh20tNrvlDrE/KtiePbY9xJkRx3CcYPOy7QKWvDf
 QzuXkEFLaVdHGboAjWLKVYyz8nr0izxnbKNkYDJxumuzqLdDajqNGM4Jfl5ole8UO40W
 SNzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYkZHi2T3UiQclwZzTYPdoBwgqiT2oOJWhObpctBOKNlafRc4HOGWJMmrUUetL1P+j+dS6iGEVlw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzBB+xfCJeisbXR6hLDltw0GlRhUZSot8AWAsH19+s50vXFzAq4
 XSUNjW90gZ4d3aX9eW34295pKuzpK6K/wxUDz+6MGpAKUeYK2PT/xtjTRTd9Tf+QXKJh0p2C5AG
 /9GUsSt9o7icBP/9h6dixMd8yl1dLTZpxtJFpgOOrS8YH+g7u00bwpjETEUJ15Nv/kEO1YI3pW9
 cNkZSTargol9YGgfIJG5lJIUiZPwP538UgyJRlM7AYqnH+U4trpVeR
X-Gm-Gg: ATEYQzzjiKOrxr1TzIwNqUY2n+KstGay1UtP0m9zeD2UOzaS02VFv7LLgtRsxJrkHzb
 A7EeGNoPPzZ1TEj6p7skqtJYZ+uF/QU77z8EhWDb0Ks5ybzbaD5+AHNyl56H2fr057GJ2VPgrlF
 3OaYpEmINhtS/mKISVUuiUxI1Ap77IfWAmg8MbdKQ1Rt1GeUC+U03tP/R0346DVSa+Dfwahy1LH
 abqGnRravYkDoH+h8wckPCGNs6/v8gHeweuRK3usMEIh/iJUXz2PlbbyKVp3i4ckq4=
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id
 956f58d0204a3-64cb6f438a9mr3821275d50.31.1772210830777; 
 Fri, 27 Feb 2026 08:47:10 -0800 (PST)
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id
 956f58d0204a3-64cb6f438a9mr3821130d50.31.1772210830102; Fri, 27 Feb 2026
 08:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 27 Feb 2026 08:46:58 -0800
X-Gm-Features: AaiRm50sr0j0-BwzNnmwGRvH8jyB1wNkHgZo3vdp3K_4YIT1mBOH-BzuS2c5S3A
Message-ID: <CAKCV-6ujQK3yj8sB2eHafaw4pvrJUeK18Hu4vzvNSjH48RVgYg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:chengzhihao1@huawei.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy
 @kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:codalist@coda.cs.cmu.edu,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:miklos@szeredi.hu,m:willy
 @infradead.org,m:coda@cs.cmu.edu,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:pabeni@redhat.com,m:serge@hallyn.com,m:amir73il@gmail.com,m:james.clark@linaro.org,m:autofs@vger.kernel.org,m:rostedt@goodmis.org,m:dlemoal@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:almaz.alexandrovich@paragon-software.com,m:linux-nfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,huawei.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCPT_COUNT_GT_50(0.00)[144];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid,canonical.com:email]
X-Rspamd-Queue-Id: 009891BCF8A
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 9:13=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
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
>
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorf=
s.c
> index 2f84bd23edb69e7e69cb097e554091df0132816d..7b645f40e71c956f216fa6a7d=
69c3ecd4e2a5ff4 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -149,7 +149,7 @@ static int aafs_count;
>
>  static int aafs_show_path(struct seq_file *seq, struct dentry *dentry)
>  {
> -       seq_printf(seq, "%s:[%lu]", AAFS_NAME, d_inode(dentry)->i_ino);
> +       seq_printf(seq, "%s:[%llu]", AAFS_NAME, d_inode(dentry)->i_ino);
>         return 0;
>  }
>
> @@ -2644,7 +2644,7 @@ static int policy_readlink(struct dentry *dentry, c=
har __user *buffer,
>         char name[32];

I have confirmed that the buffer is still big enough for a 64-bit inode num=
ber.

>         int res;
>
> -       res =3D snprintf(name, sizeof(name), "%s:[%lu]", AAFS_NAME,
> +       res =3D snprintf(name, sizeof(name), "%s:[%llu]", AAFS_NAME,
>                        d_inode(dentry)->i_ino);
>         if (res > 0 && res < sizeof(name))
>                 res =3D readlink_copy(buffer, buflen, name, strlen(name))=
;

For the AppArmor portion:

Reviewed-By: Ryan Lee <ryan.lee@canonical.com>

> diff --git a/security/integrity/integrity_audit.c b/security/integrity/in=
tegrity_audit.c
> index 0ec5e4c22cb2a1066c2b897776ead6d3db72635c..d8d9e5ff1cd22b091f462d1e8=
3d28d2d6bd983e9 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -62,7 +62,7 @@ void integrity_audit_message(int audit_msgno, struct in=
ode *inode,
>         if (inode) {
>                 audit_log_format(ab, " dev=3D");
>                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -               audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +               audit_log_format(ab, " ino=3D%llu", inode->i_ino);
>         }
>         audit_log_format(ab, " res=3D%d errno=3D%d", !result, errno);
>         audit_log_end(ab);
> diff --git a/security/ipe/audit.c b/security/ipe/audit.c
> index 3f0deeb54912730d9acf5e021a4a0cb29a34e982..93fb59fbddd60b56c0b22be2a=
38b809ef9e18b76 100644
> --- a/security/ipe/audit.c
> +++ b/security/ipe/audit.c
> @@ -153,7 +153,7 @@ void ipe_audit_match(const struct ipe_eval_ctx *const=
 ctx,
>                 if (inode) {
>                         audit_log_format(ab, " dev=3D");
>                         audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -                       audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +                       audit_log_format(ab, " ino=3D%llu", inode->i_ino)=
;
>                 } else {
>                         audit_log_format(ab, " dev=3D? ino=3D?");
>                 }
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 7d623b00495c14b079e10e963c21a9f949c11f07..737f5a263a8f79416133315ed=
f363ece3d79c722 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -202,7 +202,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>                 if (inode) {
>                         audit_log_format(ab, " dev=3D");
>                         audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -                       audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +                       audit_log_format(ab, " ino=3D%llu", inode->i_ino)=
;
>                 }
>                 break;
>         }
> @@ -215,7 +215,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>                 if (inode) {
>                         audit_log_format(ab, " dev=3D");
>                         audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -                       audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +                       audit_log_format(ab, " ino=3D%llu", inode->i_ino)=
;
>                 }
>                 break;
>         }
> @@ -228,7 +228,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>                 if (inode) {
>                         audit_log_format(ab, " dev=3D");
>                         audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -                       audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +                       audit_log_format(ab, " ino=3D%llu", inode->i_ino)=
;
>                 }
>
>                 audit_log_format(ab, " ioctlcmd=3D0x%hx", a->u.op->cmd);
> @@ -246,7 +246,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>                 if (inode) {
>                         audit_log_format(ab, " dev=3D");
>                         audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -                       audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +                       audit_log_format(ab, " ino=3D%llu", inode->i_ino)=
;
>                 }
>                 break;
>         }
> @@ -265,7 +265,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>                 }
>                 audit_log_format(ab, " dev=3D");
>                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
> -               audit_log_format(ab, " ino=3D%lu", inode->i_ino);
> +               audit_log_format(ab, " ino=3D%llu", inode->i_ino);
>                 rcu_read_unlock();
>                 break;
>         }
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
> @@ -3477,7 +3477,7 @@ static void selinux_inode_post_setxattr(struct dent=
ry *dentry, const char *name,
>                                            &newsid);
>         if (rc) {
>                 pr_err("SELinux:  unable to map context to SID"
> -                      "for (%s, %lu), rc=3D%d\n",
> +                      "for (%s, %llu), rc=3D%d\n",
>                        inode->i_sb->s_id, inode->i_ino, -rc);
>                 return;
>         }
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 98af9d7b943469d0ddd344fc78c0b87ca40c16c4..7e2f54c17a5d5c70740bbfa92=
ba4d4f1aca2cf22 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -182,7 +182,7 @@ static int smk_bu_inode(struct inode *inode, int mode=
, int rc)
>         char acc[SMK_NUM_ACCESS_TYPE + 1];
>
>         if (isp->smk_flags & SMK_INODE_IMPURE)
> -               pr_info("Smack Unconfined Corruption: inode=3D(%s %ld) %s=
\n",
> +               pr_info("Smack Unconfined Corruption: inode=3D(%s %lld) %=
s\n",
>                         inode->i_sb->s_id, inode->i_ino, current->comm);
>
>         if (rc <=3D 0)
> @@ -195,7 +195,7 @@ static int smk_bu_inode(struct inode *inode, int mode=
, int rc)
>
>         smk_bu_mode(mode, acc);
>
> -       pr_info("Smack %s: (%s %s %s) inode=3D(%s %ld) %s\n", smk_bu_mess=
[rc],
> +       pr_info("Smack %s: (%s %s %s) inode=3D(%s %lld) %s\n", smk_bu_mes=
s[rc],
>                 tsp->smk_task->smk_known, isp->smk_inode->smk_known, acc,
>                 inode->i_sb->s_id, inode->i_ino, current->comm);
>         return 0;
> @@ -214,7 +214,7 @@ static int smk_bu_file(struct file *file, int mode, i=
nt rc)
>         char acc[SMK_NUM_ACCESS_TYPE + 1];
>
>         if (isp->smk_flags & SMK_INODE_IMPURE)
> -               pr_info("Smack Unconfined Corruption: inode=3D(%s %ld) %s=
\n",
> +               pr_info("Smack Unconfined Corruption: inode=3D(%s %lld) %=
s\n",
>                         inode->i_sb->s_id, inode->i_ino, current->comm);
>
>         if (rc <=3D 0)
> @@ -223,7 +223,7 @@ static int smk_bu_file(struct file *file, int mode, i=
nt rc)
>                 rc =3D 0;
>
>         smk_bu_mode(mode, acc);
> -       pr_info("Smack %s: (%s %s %s) file=3D(%s %ld %pD) %s\n", smk_bu_m=
ess[rc],
> +       pr_info("Smack %s: (%s %s %s) file=3D(%s %lld %pD) %s\n", smk_bu_=
mess[rc],
>                 sskp->smk_known, smk_of_inode(inode)->smk_known, acc,
>                 inode->i_sb->s_id, inode->i_ino, file,
>                 current->comm);
> @@ -244,7 +244,7 @@ static int smk_bu_credfile(const struct cred *cred, s=
truct file *file,
>         char acc[SMK_NUM_ACCESS_TYPE + 1];
>
>         if (isp->smk_flags & SMK_INODE_IMPURE)
> -               pr_info("Smack Unconfined Corruption: inode=3D(%s %ld) %s=
\n",
> +               pr_info("Smack Unconfined Corruption: inode=3D(%s %lld) %=
s\n",
>                         inode->i_sb->s_id, inode->i_ino, current->comm);
>
>         if (rc <=3D 0)
> @@ -253,7 +253,7 @@ static int smk_bu_credfile(const struct cred *cred, s=
truct file *file,
>                 rc =3D 0;
>
>         smk_bu_mode(mode, acc);
> -       pr_info("Smack %s: (%s %s %s) file=3D(%s %ld %pD) %s\n", smk_bu_m=
ess[rc],
> +       pr_info("Smack %s: (%s %s %s) file=3D(%s %lld %pD) %s\n", smk_bu_=
mess[rc],
>                 sskp->smk_known, smk_of_inode(inode)->smk_known, acc,
>                 inode->i_sb->s_id, inode->i_ino, file,
>                 current->comm);
>
> --
> 2.53.0
>
>

