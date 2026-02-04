Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHwZCN9Lg2kulAMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:39 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 09560E68EA
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5R-0001hQ-TW; Wed, 04 Feb 2026 13:38:29 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV83-0005nc-38
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:08:39 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailflow.phl.internal (Postfix) with ESMTP id 26B801380785;
 Wed,  4 Feb 2026 00:08:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Wed, 04 Feb 2026 00:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181718;
 x=1770188918; bh=8wI2eoS5Ti0e8e9a5OXGf4ICfst25BignuwQVay1myA=; b=
 MXE/qyXAO0SlibBo/pe9gHtfQbldudp4yLTK4aISviPikND1RrYRXxvbI1j/RajE
 yJ+x8Y6R49TL9etkHnQLkdFi5B7eRU+tBZFHwfZhUmfJQ+2CBVyWg/elDu/RfJPv
 Wekfj7kHXKYQh5k0uYFczMMMYaSRdikAfeV7E4U0Q7l4BscWYDjA+0aWRoyaqEPa
 RXU2UKxtNIpC3AmNBTcoGO7eQvtttO4GPmfSa4YSbWagFkkPHObAMmjCR2fx2sYm
 TxWXSWke9uqBqM9A8zDle/FguWenrQs0whblpMFI0jao0xMeNY9DrLNKSR9bM3YI
 xUTyJp/H++0pCUMlwi4ZsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181718; x=1770188918; bh=8
 wI2eoS5Ti0e8e9a5OXGf4ICfst25BignuwQVay1myA=; b=fb6DeRDItfriYices
 U725N5r6W1CZEi9lKyh2eHtQ5QPZhuyxFRJklTnkZ/5p4ygYhmm32OwOmRsNzT9B
 xezOFIhjwBGHRR3HcienKwgx1r4+ri7pQ49HAeAjyuqBvpHJorToPTFdTIWkVXqs
 xCxyeaL8trBKh2wUnaCrf+gQkneQZd2Zj10wwwaS2ya2BwxfnfrlcZaRugr8BnkL
 WyASw4Y3xSsTcoPhVH9AdWOgmKForQPcyTnNyyj5MDJSrB5BHc9afYWV2ZmvRIDu
 P5vsrCUyTPCHv24TLe4Ob7bJ3tlrKc0RJ59sBZFg7bZhn26xTQl5gLZEiC3s2ErA
 tgyLw==
X-ME-Sender: <xms:VdSCadVP2MH30OR1h8dWkFax2GSKzTZKUzgb2lhJR4yyO5pB9p02sA>
 <xme:VdSCaZICQfWPk40Qj-9vYoXwyKN6HMaXg0stz9trcbFlcwOhX0S7PZOdls9CKYyyN
 cp8OlkzObgeYUKY9RJkYHLcHOfzQxfqyOuZEtJWDrXNUAMmPh8>
X-ME-Received: <xmr:VdSCaZbgj51ZaQMj8q2_ltLnUSB4VyOZvc1ufN-yZRuFb_hl1LvCJvuizA3XzTgNuTmUM8ga5vOBrFje9vhZ9Jla278DVurPEdg4Nhp3mlJV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedukeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:VdSCaVRXonrb6RplrVMiPA590J-M8hza80CYNBfxD0-ALcPQmLk-nQ>
 <xmx:VdSCaZi3MMO7_XbpxrPd3vKjaGax9sQLzBHI85Q2SlxOjE9ugsekHQ>
 <xmx:VdSCaZuLc_1UNVdCfQlMd7fuoY6MQiBEqZY6oHtD08zD0pGaQ_ZyLw>
 <xmx:VdSCaTwMzHJ76pqwzf3zAjInGkdIMMuCcoQNmZHbIwx53gTbJcxJhQ>
 <xmx:VtSCaZKE0Zkxx0LWDOG1ADgZwR4l3Dj0T0T6XZ9W5NYakgoGwbZ_oCDh>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:32 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:48 +1100
Message-ID: <20260204050726.177283-5-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 04/13] Apparmor: Use simple_start_creating() /
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
X-Rspamd-Queue-Id: 09560E68EA
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Instead of explicitly locking the parent and performing a look up in
apparmor, use simple_start_creating(), and then simple_done_creating()
to unlock and drop the dentry.

This removes the need to check for an existing entry (as
simple_start_creating() acts like an exclusive create and can return
-EEXIST), simplifies error paths, and keeps dir locking code
centralised.

Signed-off-by: NeilBrown <neil@brown.name>
---
 security/apparmor/apparmorfs.c | 38 ++++++++--------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 907bd2667e28..7f78c36e6e50 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -282,32 +282,19 @@ static struct dentry *aafs_create(const char *name, umode_t mode,
 
 	dir = d_inode(parent);
 
-	inode_lock(dir);
-	dentry = lookup_noperm(&QSTR(name), parent);
+	dentry = simple_start_creating(parent, name);
 	if (IS_ERR(dentry)) {
 		error = PTR_ERR(dentry);
-		goto fail_lock;
-	}
-
-	if (d_really_is_positive(dentry)) {
-		error = -EEXIST;
-		goto fail_dentry;
+		goto fail;
 	}
 
 	error = __aafs_setup_d_inode(dir, dentry, mode, data, link, fops, iops);
+	simple_done_creating(dentry);
 	if (error)
-		goto fail_dentry;
-	inode_unlock(dir);
-
-	return dentry;
-
-fail_dentry:
-	dput(dentry);
-
-fail_lock:
-	inode_unlock(dir);
+		goto fail;
+	return 0;
+fail:
 	simple_release_fs(&aafs_mnt, &aafs_count);
-
 	return ERR_PTR(error);
 }
 
@@ -2572,8 +2559,7 @@ static int aa_mk_null_file(struct dentry *parent)
 	if (error)
 		return error;
 
-	inode_lock(d_inode(parent));
-	dentry = lookup_noperm(&QSTR(NULL_FILE_NAME), parent);
+	dentry = simple_start_creating(parent, NULL_FILE_NAME);
 	if (IS_ERR(dentry)) {
 		error = PTR_ERR(dentry);
 		goto out;
@@ -2581,7 +2567,7 @@ static int aa_mk_null_file(struct dentry *parent)
 	inode = new_inode(parent->d_inode->i_sb);
 	if (!inode) {
 		error = -ENOMEM;
-		goto out1;
+		goto out;
 	}
 
 	inode->i_ino = get_next_ino();
@@ -2593,18 +2579,12 @@ static int aa_mk_null_file(struct dentry *parent)
 	aa_null.dentry = dget(dentry);
 	aa_null.mnt = mntget(mount);
 
-	error = 0;
-
-out1:
-	dput(dentry);
 out:
-	inode_unlock(d_inode(parent));
+	simple_done_creating(dentry);
 	simple_release_fs(&mount, &count);
 	return error;
 }
 
-
-
 static const char *policy_get_link(struct dentry *dentry,
 				   struct inode *inode,
 				   struct delayed_call *done)
-- 
2.50.0.107.gf914562f5916.dirty


