Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF2dEtWpm2mb4QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:13:57 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 327971711DC
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:13:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuKWA-00011X-LK; Mon, 23 Feb 2026 01:13:46 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vuKW8-00010S-Fo
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 01:13:44 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id AC82D13807AC;
 Sun, 22 Feb 2026 20:13:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Sun, 22 Feb 2026 20:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771809223;
 x=1771816423; bh=9qb7AYrfdD92FyEqE76QFsyIp8jg5myPk00G7DY/ztw=; b=
 UQ0vrcAycye+eIGbIO7U/HSk8Ap1MoXb9rh2wvyHOHvQEuOyy19q4i0aocDkuj0q
 A38c23qED+u61oWRJ8CzhGk7jddbrnUZM/5PO4cugYr9N26PnMh4eXqK9edfbptH
 /FeNbey8g3ERk+bL4fRo95pRrUFwjQcQwTKRB7Y6MD/9yGencG60Q1xXfIpo4S5i
 GSiuir3MCRoTQVffE9MqFs90C9+ZO2mJ/+31QzCD80WqWIht1G6KCUsSUcTfQ+nt
 Qql1WPomMShII6ghtNo/+M8KOOBCX7bV20ARXT0uHpdNWujaxSrILSkviEIuXI6D
 7ybV9G7BsaJB9ydv2RB52g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771809223; x=1771816423; bh=9
 qb7AYrfdD92FyEqE76QFsyIp8jg5myPk00G7DY/ztw=; b=itE9hFGZPBKHFfPuw
 gzsX5H8d2kMJUrtqhVNpugQn2JUBh9RXlCI0thCKKQxUw30m1NYVjd8Wd0JCQ6r2
 yF0zPYKSgqWbD2gPF1R9iBLxb8yqkYQS0keIE7XVAE8ZVulk5cGeLC3Zul8sMVwA
 bUoEWvOqeWmLhBzVsK2MQFSskXyjwcRPLWTlR8nz8oja9lnaC0HzYcBRfDNStrtk
 cgo21HIHwC4a/jo5Mvx+/seOLlgfkIap+t2ow+tQruICKneAL3JimcYz68z0t5a3
 9/ye3WA8ov2VzFNEaRnxWRQ1ERzP4jX7h0ZeGhk/VWt34qXbZFWHv5x/QONgaqnz
 2gReQ==
X-ME-Sender: <xms:x6mbaV2CH8w8Hh1FPAce93fMpVXrLAd8XX6n9MPRl11EoWoiKJQhEA>
 <xme:x6mbaQBXcNqMl-FD_tjHrV_9biZJr6L_2Sux6iY2zodgXi5LNmGQaL1thKXSKqzQ5
 F074pLkHd0bK8xJ52OFsXlhpVOi1yDM25PFOxRohVdclTtd>
X-ME-Received: <xmr:x6mbaeZKvGw_tW6kha7YD51Hl7UVnP0LBxBYtoNziSxSO8pEOunFUvRG53gVrWYTS2J3DvAFMF7kwibbl90_V7AaBcF3CFrbv3eQQn_Itzv->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeehkeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhr
 tghpthhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:x6mbacaYWml2WI823QoQb7gSbFW5vpSQq1Q6u887DNhu4tz93sg_yQ>
 <xmx:x6mbaflCJZo52YbOypxz0UB1phLXB-wtJePjukAPNRO54cGGzHzuDA>
 <xmx:x6mbaeRL3sZsB6exq2C7l5qElIcTu9gpJCbPa-nGqyJzt0y1-Un3lg>
 <xmx:x6mbaUVO9mLNOI_31U2ZjK8JgtpsbcUg8swnx4B8UTCtvT0CfmNohg>
 <xmx:x6mbacfuslt09nXS9q09h51HEmF0Y3PzNfo6ElknGlznwgSa7rjVzeS0>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 20:13:37 -0500 (EST)
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
Date: Mon, 23 Feb 2026 12:06:23 +1100
Message-ID: <20260223011210.3853517-9-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260223011210.3853517-1-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.136; envelope-from=neilb@ownmail.net;
 helo=flow-a1-smtp.messagingengine.com
Subject: [apparmor] [PATCH v2 08/15] VFS: make lookup_one_qstr_excl() static.
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
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
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:mid,brown.name:replyto,brown.name:email];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 327971711DC
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

lookup_one_qstr_excl() is no longer used outside of namei.c, so
make it static.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 Documentation/filesystems/porting.rst | 7 +++++++
 fs/namei.c                            | 5 ++---
 include/linux/namei.h                 | 3 ---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 52ff1d19405b..1dd31ab417a2 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1361,3 +1361,10 @@ to match what strlen() would return if it was ran on the string.
 
 However, if the string is freely accessible for the duration of inode's
 lifetime, consider using inode_set_cached_link() instead.
+
+---
+
+**mandatory**
+
+lookup_one_qstr_excl() is no longer exported - use start_creating() or
+similar.
diff --git a/fs/namei.c b/fs/namei.c
index d80b81a1f06a..e6a3717d7065 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1782,8 +1782,8 @@ static struct dentry *lookup_dcache(const struct qstr *name,
  * Will return -ENOENT if name isn't found and LOOKUP_CREATE wasn't passed.
  * Will return -EEXIST if name is found and LOOKUP_EXCL was passed.
  */
-struct dentry *lookup_one_qstr_excl(const struct qstr *name,
-				    struct dentry *base, unsigned int flags)
+static struct dentry *lookup_one_qstr_excl(const struct qstr *name,
+					   struct dentry *base, unsigned int flags)
 {
 	struct dentry *dentry;
 	struct dentry *old;
@@ -1820,7 +1820,6 @@ struct dentry *lookup_one_qstr_excl(const struct qstr *name,
 	}
 	return dentry;
 }
-EXPORT_SYMBOL(lookup_one_qstr_excl);
 
 /**
  * lookup_fast - do fast lockless (but racy) lookup of a dentry
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 58600cf234bc..c7a7288cdd25 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -54,9 +54,6 @@ extern int path_pts(struct path *path);
 
 extern int user_path_at(int, const char __user *, unsigned, struct path *);
 
-struct dentry *lookup_one_qstr_excl(const struct qstr *name,
-				    struct dentry *base,
-				    unsigned int flags);
 extern int kern_path(const char *, unsigned, struct path *);
 struct dentry *kern_path_parent(const char *name, struct path *parent);
 
-- 
2.50.0.107.gf914562f5916.dirty


