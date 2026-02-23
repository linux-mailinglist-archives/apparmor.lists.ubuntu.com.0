Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EsLEQ2qm2mb4QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:14:53 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446B17128A
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:14:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuKX7-0001St-4Q; Mon, 23 Feb 2026 01:14:45 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vuKX6-0001S1-Ao
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 01:14:44 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailflow.phl.internal (Postfix) with ESMTP id 6A41013807AC;
 Sun, 22 Feb 2026 20:14:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Sun, 22 Feb 2026 20:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771809283;
 x=1771816483; bh=9JVzNxT6kiATvBNU36XHsusPIDRZh6GsFbpCz+D3u+w=; b=
 UznpjAVpOBZUSAox2zQH5APdkCm0TKU7fptBaatjmXKVi4DDnyQXw6ckxpy01sYI
 6QOeZ5MXohvtwUYK8B9YIGLFscXZnBBS/DSyQ4LP7pxWCkGZRN6Tf3mfyFDFg1FE
 fli/A0VPEi8BoKJyVzWgmwo8BCVSMdtW5Bnhis5fOG4gIc2wkwzi/4Iql7OCj2GP
 LEPclS9LECSzzit3R7ZFB9zq6q4geSm5sZJEZOUPt6VpHgPKbaxMKe7z0vHjXlHK
 Rren+sFpH1dmHGX9qw2ctN/8ppnI7rR8sr9B3cRF9S5NsPtEeMHZZSP+syQoOMkP
 xSeHvZ2PI3uueIdX79WnsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771809283; x=1771816483; bh=9
 JVzNxT6kiATvBNU36XHsusPIDRZh6GsFbpCz+D3u+w=; b=w1SGuZn0605fv1q3w
 yzpxKUkn4RNdPtlCwSmBYUUdJ45429x3KTsk+NV5pw+CWfKxX5q0YJ9hVv4JXZAI
 g5ZndlNJnAWD3YscJxttt7chx42J2Z7qW098iXuMw+gthKAK3YF7WZxl6Gx8b2RF
 EOJY3OlbqFwuvb1OvXCmFPJT9P0LTAB8GdSraCdKWNImgZa0blrVKnj53iEZCoEb
 Odq6lGNRYBu/Q/Ng3NOfZLseagnGgpZTbJxjP5Trc5E/eiyVc4mM34qcgVkMVXvP
 XV5+0vQUpaeABFG/uPM+QvbGmpqtOluIaGxXAiKOMcEONxk+FNm975k9az/Dlims
 7Hfkw==
X-ME-Sender: <xms:A6qbaUrYDi95LMuWiaQg1tfpPHmfCvCsNXCNVnwSXLJpwKjsN1g3_w>
 <xme:A6qbaenaBr5j4V9G7hirkM8x4tJQ_FE-Ys9t5TZoT6_jmUeV_Kztl11cUEQ-R5VMi
 EcyhCG2vPfNELHhD36jqWy-rLuitXN5xNcUCtCAhXDQhJvO>
X-ME-Received: <xmr:A6qbaRvLITdZNH6tzTSmMq2BszNl0qYxjNt7OLuFVETOuuu3GDvIUvkk1JMu8RHWh3Zr0QxlLIdoUsZFetr23tKakiu8LVtPZ4bjgtESaBtf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeehkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:A6qbaVfNne5kz3F0bBBSsUjpvfLGHE8Vodz2-5pSZWTyN4RURgTPVw>
 <xmx:A6qbabbqqOwYPeE7IYjfe8PRxGhz1s0ec8Tj2n_726AIQtc0FKfYpA>
 <xmx:A6qbaV2F3LkKoqFvjsmfPYQ43q0XHWVVXvRVJVlGm16S4iBvr_myPg>
 <xmx:A6qbacp8YyrjOajri9zoaE-AfzAk-TdLPbxUqNvOrDd3eZTBn4mRGA>
 <xmx:A6qbaQi-rpxiaLayoUEtGSqnfltMKKZ0h1_81yuOIkYVc8X2W4_VMRkH>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 20:14:37 -0500 (EST)
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
Date: Mon, 23 Feb 2026 12:06:30 +1100
Message-ID: <20260223011210.3853517-16-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260223011210.3853517-1-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.136; envelope-from=neilb@ownmail.net;
 helo=flow-a1-smtp.messagingengine.com
Subject: [apparmor] [PATCH v2 15/15] VFS: unexport lock_rename(),
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
X-Rspamd-Queue-Id: 3446B17128A
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

These three function are now only used in namei.c, so they don't need to
be exported.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 Documentation/filesystems/porting.rst | 7 +++++++
 fs/namei.c                            | 9 +++------
 include/linux/namei.h                 | 3 ---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 1dd31ab417a2..d02aa57e4477 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1368,3 +1368,10 @@ lifetime, consider using inode_set_cached_link() instead.
 
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
index e6a3717d7065..3547a2a1bfd1 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3775,7 +3775,7 @@ static struct dentry *lock_two_directories(struct dentry *p1, struct dentry *p2)
 /*
  * p1 and p2 should be directories on the same fs.
  */
-struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
+static struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
 {
 	if (p1 == p2) {
 		inode_lock_nested(p1->d_inode, I_MUTEX_PARENT);
@@ -3785,12 +3785,11 @@ struct dentry *lock_rename(struct dentry *p1, struct dentry *p2)
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
@@ -3827,9 +3826,8 @@ struct dentry *lock_rename_child(struct dentry *c1, struct dentry *p2)
 	mutex_unlock(&c1->d_sb->s_vfs_rename_mutex);
 	return NULL;
 }
-EXPORT_SYMBOL(lock_rename_child);
 
-void unlock_rename(struct dentry *p1, struct dentry *p2)
+static void unlock_rename(struct dentry *p1, struct dentry *p2)
 {
 	inode_unlock(p1->d_inode);
 	if (p1 != p2) {
@@ -3837,7 +3835,6 @@ void unlock_rename(struct dentry *p1, struct dentry *p2)
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


