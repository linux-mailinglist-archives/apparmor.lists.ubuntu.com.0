Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCEZOIslnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:26:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9D18D206
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:26:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0qw-0005Ff-02; Tue, 24 Feb 2026 22:26:02 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0qt-0005FB-IX
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:26:00 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 3CA271380B87;
 Tue, 24 Feb 2026 17:25:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 17:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to; s=fm3; t=1771971958; x=1771979158; bh=h1rNXkHkcZ
 4cMhepaUBJCHY4sMt0fLPm1jE4sfNdLx8=; b=Bm41EYvDY3wWjoKO9Dg4GQs+K7
 cZ+9rkdCqW4DWg2/n02Xxhll8WET1UKRv2xjVnyISv5eTeXPxw9lMuqv5LWlj2/l
 YzC39szJXiGzqhHmPIW5unvAljd9AINf44jC46QUbSkxJC4Uzj5S8g9wTyymc5eK
 6umAKASGZ5SNoXvX4WYCPTmKnbviVxKOlaNXi81+nMH7HsX3Dwh2OQCaVce5MXUm
 TOefBGwt4W4JhCs2+rPA2w1fHcgyz/0nJrkPoTgnTm7f1ragqA5M49ZsUqF41+Lz
 48FljGfvzG8iuI1HHzhizGeeqEg7uEPgx68xfh1Fw0MLAPKTcktOG4vlSi/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1771971958; x=1771979158; bh=h1rNXkHkcZ4cMhepaUBJCHY4sMt0
 fLPm1jE4sfNdLx8=; b=YVWCZYztzFJEgw0/P15jwVo2Zq6mHpQLCPU8/3LKBLGh
 57MvUxA/kPjZOfEgwroCqeJIvAocpDonpTTzeO7VkSd0vdcYEgfAjfz1S+J27yPH
 ibp9xn/SlbXIOAANLTgfTdZ1VBtOVuFLNu74RzyUBZ2rzwFmi84V1lO1ee7nU5eU
 Swv0iwDFvsYUytGKwUXuWkuDN3ReejDJF50ww/Sv1JfeqxdlO97psVCMg5qpJdLN
 l5589hLjqQ/AdCfNnx6DH184ui/VMrHllibdRaU1oS7s4SUxTuLHTlhmeIUXIPmc
 3w/hA6dPTMTYuh/8a/5BjLr6Ydwxhtk1buo0GnixtA==
X-ME-Sender: <xms:dCWeaeN68INVWUP76lm6LSn_-KPn-BpbZV20agYBbf3-MRusda4nxg>
 <xme:dCWeaQ6MOi1M6jhBiz321-vu_icRM95I_6tTHrBS3kjPG6P4H7qv4MS40GFqlOXeL
 JWaPc9gZdbNSC717W5pWIYUDnEX-0yoZjFskhRJ0jAXvUrcsPs>
X-ME-Received: <xmr:dCWeadx1Z2VeucV0GVjerBQHJFbLfewF1ivvXIk7V7xM93rCDRjuVW8hJh3_pbP0Wvi7GoOlKRPxJbTKzbfoXXp4xdHx9RB-R1G_GBK_NM7c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheurhho
 fihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnhepge
 etfeegtddtvdeigfegueevfeelleelgfejueefueektdelieeikeevtdelveelnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsgesoh
 ifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtg
 hpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvghlrd
 horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnh
 gvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghp
 thhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:dCWeaYTnnAGgE05nS_GR7sZfZRuy59Y0zqIVusI9LOlQQpHGDIRuzA>
 <xmx:dCWead99R1zdBpDm82pTcMeZYBPKAx6sGnfp62gsSSCupDW5ykpRug>
 <xmx:dCWeadIDZPDRPdCUp43NByezinPatv8WUvR63xK4ud410k9ifxlfSw>
 <xmx:dCWeaZtyjSe5uARiEy6VurJ-WbKbb-zsEPhCG0-qX0zcrp0SUVBvMg>
 <xmx:diWeaSWS-R28POMt9UY8aq--iCqH1D9ZQByHSNfCqNcdrRW7UTOfk-tL>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:25:50 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Date: Wed, 25 Feb 2026 09:16:45 +1100
Message-ID: <20260224222542.3458677-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 00/15] Further centralising of directory
	locking for name ops.
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
Cc: linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm3,messagingengine.com:s=fm3];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:dhowells@redhat.com,m:jack@suse.cz,m:chuck.lever@oracle.com,m:jlayton@kernel.org,m:miklos@szeredi.hu,m:amir73il@gmail.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:djwong@kernel.org,m:linux-nfs@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FREEMAIL_TO(0.00)[kernel.org,zeniv.linux.org.uk,redhat.com,suse.cz,oracle.com,szeredi.hu,gmail.com,canonical.com,paul-moore.com,namei.org,hallyn.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto];
	NEURAL_HAM(-0.00)[-0.905];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: ADA9D18D206
X-Rspamd-Action: no action

Following Chris Mason's tool-based review, here is v3 with some fixes.
Particularly 06/15 mistakenly tested the result of start_creating for NULL
and 09/15 had some really messed up flow in error handling.
Also human-language typos fixed.

This code is in 
  github.com:neilbrown/linux.git
  branch pdirops

For anyone interested, my next batch is in branch pdirops-next

Original patch description below.

Thanks,
NeilBrown

I am working towards changing the locking rules for name-operations: locking
the name rather than the whole directory.

The current part of this process is centralising all the locking so that
it can be changed in one place.

Recently "start_creating", "start_removing", "start_renaming" and related
interaces were added which combine the locking and the lookup.  At that time
many callers were changed to use the new interfaces.  However there are still
an assortment of places out side of fs/namei.c where the directory is locked
explictly, whether with inode_lock() or lock_rename() or similar.  These were
missed in the first pass for an assortment of uninteresting reasons.

This series addresses the remaining places where explicit locking is
used, and changes them to use the new interfaces, or otherwise removes
the explicit locking.

The biggest changes are in overlayfs.  The other changes are quite
simple, though maybe the cachefiles changes is the least simple of those.

I'm running the --overlay tests in xfstests and nothing has popped yet.
I'll continue with this and run some NFS tests too.

Thanks for your review of these patches!

NeilBrown

 [PATCH v3 01/15] VFS: note error returns in documentation for various
 [PATCH v3 02/15] fs/proc: Don't lock root inode when creating "self"
 [PATCH v3 03/15] VFS: move the start_dirop() kerndoc comment to
 [PATCH v3 04/15] libfs: change simple_done_creating() to use
 [PATCH v3 05/15] Apparmor: Use simple_start_creating() /
 [PATCH v3 06/15] selinux: Use simple_start_creating() /
 [PATCH v3 07/15] nfsd: switch purge_old() to use
 [PATCH v3 08/15] VFS: make lookup_one_qstr_excl() static.
 [PATCH v3 09/15] ovl: Simplify ovl_lookup_real_one()
 [PATCH v3 10/15] cachefiles: change cachefiles_bury_object to use
 [PATCH v3 11/15] ovl: pass name buffer to ovl_start_creating_temp()
 [PATCH v3 12/15] ovl: change ovl_create_real() to get a new lock when
 [PATCH v3 13/15] ovl: use is_subdir() for testing if one thing is a
 [PATCH v3 14/15] ovl: remove ovl_lock_rename_workdir()
 [PATCH v3 15/15] VFS: unexport lock_rename(), lock_rename_child(),

