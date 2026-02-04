Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JFhA+FLg2kulAMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C15E68F8
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5Q-0001gy-H0; Wed, 04 Feb 2026 13:38:28 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV7Y-0005gp-3q
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:08:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id 033571380778;
 Wed,  4 Feb 2026 00:08:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 04 Feb 2026 00:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to; s=fm3; t=1770181686; x=1770188886; bh=XrOETrfLvn
 IX9izHaz3N3kjXjvH1wtHjpHJBz8OfYz8=; b=CiEJ6HuaYbyBncQK0Lqj0/lNF8
 DhAmxjQyJmxvozS5jXPzzY+XP7IqzDOshTUQIx5F8q3jdVkAJYIqxAnNmTKZc1Gc
 Rz6Gaz9g7gPNDWVQt/eBmoyqW1ED0k4S51L6PgC88F91vhkAkANrbidvxi4Ft6kn
 Z2QnDJeyZyYC7DOrS8xQ4bely67rhZsZ1nPcgZbLnLAfZTV0geZRruUBh41QxYNj
 RMHAnpZjEY2jeseKrnxpnBqyZa169DbRKrWWyH1qV5TRi5qaQv0Q/gzB/4Frw3Sj
 gqXeBzBZPeZAkYNF4LZQWDkWzdvk596wFMvuBn/FtrqS50DqnP9FXdCRp3DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1770181686; x=1770188886; bh=XrOETrfLvnIX9izHaz3N3kjXjvH1
 wtHjpHJBz8OfYz8=; b=pgfRNb3GFaNvHPggUPmqU3BzhV1DYsxFsfCeubzJ34Z2
 IAXUcDPPY6B4jFTc/sHFd+FFVWOCN61ZY1n4FSp/lZ/Gm8OL3IoxKdmtGG4mwtRB
 0cvuLMaVwfbCkuk6RJ2Z63jD94vV4qNep/luiPmUR+3LvEv6P8s37xlYrISuSGuK
 wEYDRQ498aJsPgxTcI5zvZ6ka/ASQo1kuhn1czQJTHfYm1VOYKS8UMSqyacqcxV7
 WNLo000OpWyqHhPs34vOA0xlHoFgXDDUMaUZybJyVpOdqP0l7sYl91BeFNKbwqHN
 X25D7DUOSE4gBsH5flU2yCWtokXqSMsawaOX095y/A==
X-ME-Sender: <xms:NdSCacyHAcWi0GB6-jJHZwbkg7Gp-Z8lim-4rJwYDEn4tUsEpVVp5A>
 <xme:NdSCaUi2sidAli4k4HESJm4YuHT-yfhGDUFNfA9wk6-Xew_E4Id6MUquzyDqQgKWj
 6oVs_Or_AOLCF3MayEIM7vc75zzFysDBEkNd25_ItQdv_Uc0w>
X-ME-Received: <xmr:NdSCaR5AjfPMw9UHtqMCUY3gZiF0HwOinEkXMxQrj_q1sM-SP-zb0drYuARdpjKpES6FgKhhf7urx73AS9dGuMBwFTAN-m-EErtLCvsusGkf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedukeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheurhho
 fihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnhepge
 etfeegtddtvdeigfegueevfeelleelgfejueefueektdelieeikeevtdelveelnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsgesoh
 ifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtg
 hpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvghlrd
 horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnh
 gvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghp
 thhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:NdSCaZpRkxJWPNmIpcpGeNAy50vMwvTXVXySj4QxXdsBDVBq8ly_5w>
 <xmx:NdSCaXXqpBY4J628Zt1MD0CWCDQFIjb_nD-zpyZCDCVuAS2xOS78Aw>
 <xmx:NdSCaQ5LAQWkq85YI4N5auTuRMssrLuYMh8Grxsq06CB1xQnOGG43A>
 <xmx:NdSCaV3QDW52SEeAdjmfBcdJhYLQR-XjBl5pKwa3C3AKajI2bStWiA>
 <xmx:NtSCaTz-dtrlfjILOYM9GTMXnZa_VQglEYUC71RT6cu45HHOJ53g7HKW>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:00 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed,  4 Feb 2026 15:57:44 +1100
Message-ID: <20260204050726.177283-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 00/13] Further centralising of directory locking
	for name ops.
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
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,zeniv.linux.org.uk,redhat.com,suse.cz,oracle.com,szeredi.hu,gmail.com,canonical.com,paul-moore.com,namei.org,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:dhowells@redhat.com,m:jack@suse.cz,m:chuck.lever@oracle.com,m:jlayton@kernel.org,m:miklos@szeredi.hu,m:amir73il@gmail.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:linux-nfs@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[ownmail.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.968];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: E5C15E68F8
X-Rspamd-Action: no action

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


 [PATCH 01/13] fs/proc: Don't lock root inode when creating "self" and
 [PATCH 02/13] VFS: move the start_dirop() kerndoc comment to before
 [PATCH 03/13] libfs: change simple_done_creating() to use
 [PATCH 04/13] Apparmor: Use simple_start_creating() /
 [PATCH 05/13] selinux: Use simple_start_creating() /
 [PATCH 06/13] nfsd: switch purge_old() to use start_removing_noperm()
 [PATCH 07/13] VFS: make lookup_one_qstr_excl() static.
 [PATCH 08/13] ovl: Simplify ovl_lookup_real_one()
 [PATCH 09/13] cachefiles: change cachefiles_bury_object to use
 [PATCH 10/13] ovl: change ovl_create_real() to get a new lock when
 [PATCH 11/13] ovl: use is_subdir() for testing if one thing is a
 [PATCH 12/13] ovl: remove ovl_lock_rename_workdir()
 [PATCH 13/13] VFS: unexport lock_rename(), lock_rename_child(),

