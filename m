Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLFWFeFLg2ktlAMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516FE68FF
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5S-0001hY-3j; Wed, 04 Feb 2026 13:38:30 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV8A-0005pZ-Gq
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:08:46 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id A26ED1380787;
 Wed,  4 Feb 2026 00:08:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Wed, 04 Feb 2026 00:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181725;
 x=1770188925; bh=Xtl8I0VkwBbZNObKLjoeIAfJSZzFqP3UknI7fOZwH+Q=; b=
 OSIwwhCEIjbM7LfTzPSJhSef5BBZmE0JkVyVx8l1KZYiVpsDnn8K8qnCgjCtUOaJ
 1Pnh+pZiP/QcXciClhvqrLQFzLMPKbeoBnE3g5YQbQwerqhiws1FDQ4chBNhkbN/
 2lDaZNN6gNBt+MnpXZYJWqkAyYNq7lNd83ZjcUASBD+tA3wS1rkcfhkbO0+GAfh0
 lhE3cvfuuWY5eNpY2Le9uVITGvStkAYDSKcBLNSIaIcyiwdWUK+ayeJPisbkvXcC
 PiZhs0+4jHUpt5g0NJZDcHizH/NsBlNAlDfdgwt9HyUSXWMC2u5fRthtBesiYAGo
 bd5WKG+KnYWB8PKlEkgc2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181725; x=1770188925; bh=X
 tl8I0VkwBbZNObKLjoeIAfJSZzFqP3UknI7fOZwH+Q=; b=IckxQb5eQ1teD/JC2
 2C6z4aLlWpOTXy+n37BxxAqbOsLUj5xcRzP18ybcP3MRqFT/MLZNgdepc46XyL73
 g85vy9/StufIHnLyOqaq/camuvYgVNST4xUFhb4+pEifAy6L/rxaifEfcctnW+iA
 dHgmFs1KGK7kMNPQRh3YS6wAFPj+7xYatkzBkd/MRhHvS1P71IULuYQs3HzkwOBb
 dT0PwfrWQleQdyKJOBwHM/6OnoX8ohPLx8/L4haPzwFCp33oEByj49+nyRpymIZu
 erYAXlHSL9+fnRNWKOPb336GZdqXNLeureCB1uQyQs1e277cOfDhM9rMJ+4YB1qb
 u07iQ==
X-ME-Sender: <xms:XdSCaWsfh2d-ioUmeNlRIDMj8rwlBG4jcTV5wl3rDs9Q1MzOh_1LaQ>
 <xme:XdSCafseYQkm6EX2rJn4Ud5eKs0MI05TmsSDaCR-Gk_OKpUk45GZcGXVpvXNLGc4x
 UxmaW6m6j7UZvQQ2plA_XKilTAcnzHYDNguYzDFl_Wkb3pq7K4>
X-ME-Received: <xmr:XdSCaVWm5HvaISOhWExU6yJRWs1YLPHaIho4mJwuAD8yVE9SbjiJJKkqbdeiuhs4NmE8uiIz0u8kWaucuvXhuMPUZmNpToftJzlTK4_8Ve_B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedukeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:XdSCaQVBU5IFoGFzV_wMu4KhZOjgRt10-YzzGZGXeMJabUhaGOQqYA>
 <xmx:XdSCaQT9G21T-9mjN0ptcYqmG_IOgMV4OlmhxXqmuBD4vVIljXISew>
 <xmx:XdSCafGrNO6uLKF4PoVFr0wvgJReoWMkuxqvjyapMBDqmIfjy-Ktsw>
 <xmx:XdSCaQQDPg2A9xmYsrnIw2GPGz1OOTaLAapSLpyryM3UmhtVEi5LZQ>
 <xmx:XdSCaUOrX_qr5Y4DPfFCLAWZvu_7P23WIOE4jqM2FyFvWuPH8wJDcVPA>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:40 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:49 +1100
Message-ID: <20260204050726.177283-6-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 05/13] selinux: Use simple_start_creating() /
	simple_done_creating()
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
	NEURAL_SPAM(0.00)[0.965];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 4516FE68FF
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Instead of explicitly locking the parent and performing a lookup in
selinux, use simple_start_creating(), and then use
simple_done_creating() to unlock.

This extends the region that the directory is locked for, and also
performs a lookup.
The lock extension is of no real consequence.
The lookup uses simple_lookup() and so always succeeds.  Thus when
d_make_persistent() is called the dentry will already be hashed.
d_make_persistent() handles this case.

Signed-off-by: NeilBrown <neil@brown.name>
---
 security/selinux/selinuxfs.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 896acad1f5f7..97e02cd5a9dc 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -1930,15 +1930,16 @@ static const struct inode_operations swapover_dir_inode_operations = {
 static struct dentry *sel_make_swapover_dir(struct super_block *sb,
 						unsigned long *ino)
 {
-	struct dentry *dentry = d_alloc_name(sb->s_root, ".swapover");
+	struct dentry *dentry;
 	struct inode *inode;
 
-	if (!dentry)
+	inode = sel_make_inode(sb, S_IFDIR);
+	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
-	inode = sel_make_inode(sb, S_IFDIR);
-	if (!inode) {
-		dput(dentry);
+	dentry = simple_start_creating(sb->s_root, ".swapover");
+	if (!dentry) {
+		iput(inode);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1946,11 +1947,9 @@ static struct dentry *sel_make_swapover_dir(struct super_block *sb,
 	inode->i_ino = ++(*ino);
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	inode_lock(sb->s_root->d_inode);
 	d_make_persistent(dentry, inode);
 	inc_nlink(sb->s_root->d_inode);
-	inode_unlock(sb->s_root->d_inode);
-	dput(dentry);
+	simple_done_creating(dentry);
 	return dentry;	// borrowed
 }
 
-- 
2.50.0.107.gf914562f5916.dirty


