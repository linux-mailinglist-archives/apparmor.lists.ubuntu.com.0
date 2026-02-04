Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LxLNd1Lg2kulAMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDDE68D0
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5U-0001ij-JG; Wed, 04 Feb 2026 13:38:32 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV9A-0006Ag-LU
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:09:48 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id C45231380795;
 Wed,  4 Feb 2026 00:09:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 04 Feb 2026 00:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181787;
 x=1770188987; bh=FodiWxTGOrcO4kqPhH8V5J2d81hZRju7CaAdC0kBghU=; b=
 IA/OH9nBkl0L/V4jFP0mIYu5PuKIWyyOkTV1eMHW4QZ7laA9FwSl+rvwQD8LUZIp
 unDzrnaePoojghi7bR9bhXeZN06pX2dwTMqHCe9tI2g/fRs+DQIix/0+kn6nxe9T
 hsMLoe0UHc3+8Vy+XcMCdLkvasUKBJ7HwwMkdy8dFVFW/QTWdqwOtPjAe32LnlbH
 HQiWbqoxnPWmxAgTymOh89AME4UI3S9tm9r+x6bDau0zH6ZV8haZEJ0Xf2lZIOlU
 Gyp9nLt58dFVVQMHoXoGcNmfvQagYknwlVX8k7P9hbOdpFiGdxL6JXqayrorAjmG
 +L3C6kyZ83Yk/IpCvuiFGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181787; x=1770188987; bh=F
 odiWxTGOrcO4kqPhH8V5J2d81hZRju7CaAdC0kBghU=; b=VvpC2+sxldBw2tIOW
 77AL6W0NTYq6ye2ZXiZ6qd6fJui28cxi+I6rws1ykZaKi8AO5OrEWElgFhEZrjW0
 DNHvITXcnfTkgCsX6s6duFifX3jwG8J5XNp1iGHv0fFCAiLwqn3c7jmhrt+GhSZY
 cmh4lZmKT0BIAZBJqjxaYyuf53nTkzqLtPRTbnmxMDndi6K3W7OU9B6eHmueuARz
 7g5vX6ai8jIhDKtxb/CqwfxGxnNY2FNSxW0H0img3B+L8yvltu+hOkXcCHsIWzsI
 PPDD37WzgTyV7h/3LSwqo+hU6AcUKoUNXOVsA2Hv9E6PXTzKf4e7DrjTfKRASpSy
 NpyOg==
X-ME-Sender: <xms:m9SCaReHppifkN_Cf5pTv_545vMDS_sv_yJ9eBTKCHZ1YTNCXkRCIw>
 <xme:m9SCaazVi91ief2zLXDLLQWt7rXy2ZSNzJqjO4DnknaJU9H6B-uYqXxzL6ZYoJRue
 d2ihvs9jQk0PwqTuKHRvYPN5oQAPii3NDr8dYRArtqGlE9I2A>
X-ME-Received: <xmr:m9SCaageDee_ewTZdEfo4v5irqih55Q_MG6RsNlHJ4hIyo3audOAfLi9JZMEfZMB_hVGeOQApdLuRPyEuHvlgNNt9VgK56EXDH5euRUdiBYt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedukeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhr
 tghpthhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:m9SCaf7wUR-6rC9qxE37Pn-XLmXMIJbY-YfMMuv6gX6Hfc4oF7ghwA>
 <xmx:m9SCafrgu7obCByNluMMGgzqCW9uKie2YIniIl8drQyqVYXq9fa8lA>
 <xmx:m9SCaVU2Oo14aWIcBSdLi7nwxx2H6Jjh6w-fdwFVHtOG6gTrp4vHPg>
 <xmx:m9SCaW7ZPddf_NbC6pITmfJZdwCMnXFE3qGdi2pLlgQhx_l0N3-XFQ>
 <xmx:m9SCaYGk926uEosUz1L3DRfHiJX2djLrvwovEuCTy8dCgWLI-yIwGImH>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:09:42 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:57 +1100
Message-ID: <20260204050726.177283-14-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 13/13] VFS: unexport lock_rename(),
	lock_rename_child(), unlock_rename()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto,brown.name:email];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.969];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: C3FDDE68D0
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

These three function are now only used in namei.c, so they don't need to
be exported.

Signed-off-by: NeilBrown <neil@brown.name>
---
 Documentation/filesystems/porting.rst | 7 +++++++
 fs/namei.c                            | 9 +++------
 include/linux/namei.h                 | 3 ---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index ed86c95d9d01..5f7008172f14 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1347,3 +1347,10 @@ implementation should set it to generic_setlease().
 
 lookup_one_qstr_excl() is no longer exported - use start_creating() or
 similar.
+---
+
+** mandatory**
+
+lock_rename(), lock_rename_child(), unlock_rename() are no
+longer available.  Use start_renaming() or similar.
+
diff --git a/fs/namei.c b/fs/namei.c
index 307b4d0866b8..0bc82bf90adc 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3713,7 +3713,7 @@ static struct dentry *lock_two_directories(struct dentry *p1, struct dentry *p2)
 /*
  * p1 and p2 should be directories on the same fs.
  */
-struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
+static struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
 {
 	if (p1 == p2) {
 		inode_lock_nested(p1->d_inode, I_MUTEX_PARENT);
@@ -3723,12 +3723,11 @@ struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
 	mutex_lock(&p1->d_sb->s_vfs_rename_mutex);
 	return lock_two_directories(p1, p2);
 }
-EXPORT_SYMBOL(lock_rename);
 
 /*
  * c1 and p2 should be on the same fs.
  */
-struct dentry *lock_rename_child(struct dentry *c1, struct dentry *p2)
+static struct dentry *lock_rename_child(struct dentry *c1, struct dentry *p2)
 {
 	if (READ_ONCE(c1->d_parent) == p2) {
 		/*
@@ -3765,9 +3764,8 @@ struct dentry *lock_rename_child(struct dentry *c1, struct dentry *p2)
 	mutex_unlock(&c1->d_sb->s_vfs_rename_mutex);
 	return NULL;
 }
-EXPORT_SYMBOL(lock_rename_child);
 
-void unlock_rename(struct dentry *p1, struct dentry *p2)
+static void unlock_rename(struct dentry *p1, struct dentry *p2)
 {
 	inode_unlock(p1->d_inode);
 	if (p1 != p2) {
@@ -3775,7 +3773,6 @@ void unlock_rename(struct dentry *p1, struct dentry *p2)
 		mutex_unlock(&p1->d_sb->s_vfs_rename_mutex);
 	}
 }
-EXPORT_SYMBOL(unlock_rename);
 
 /**
  * __start_renaming - lookup and lock names for rename
diff --git a/include/linux/namei.h b/include/linux/namei.h
index c7a7288cdd25..2ad6dd9987b9 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -165,9 +165,6 @@ extern int follow_down_one(struct path *);
 extern int follow_down(struct path *path, unsigned int flags);
 extern int follow_up(struct path *);
 
-extern struct dentry *lock_rename(struct dentry *, struct dentry *);
-extern struct dentry *lock_rename_child(struct dentry *, struct dentry *);
-extern void unlock_rename(struct dentry *, struct dentry *);
 int start_renaming(struct renamedata *rd, int lookup_flags,
 		   struct qstr *old_last, struct qstr *new_last);
 int start_renaming_dentry(struct renamedata *rd, int lookup_flags,
-- 
2.50.0.107.gf914562f5916.dirty


