Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOTWCNQlnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:32 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03B18D2F2
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0sG-00065B-Q9; Tue, 24 Feb 2026 22:27:24 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0sE-000647-Du
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:27:22 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id 916FE138052C;
 Tue, 24 Feb 2026 17:27:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 24 Feb 2026 17:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771972041;
 x=1771979241; bh=Vj23dTx8hYfvjWUpL8KmWQGYvEI277aBCAy+9LFoa/c=; b=
 ac7NN+mS0EFDNPiwo8c907vK2y43OM8r/UqvyTneeok+wx5FRLRj5S5ME/gTb2q9
 rOgeRuvFPd/YBkvTtgtIN9g/YNVSthdjHTXH1CXV4m1hCjK2Ih0x5hr/wBQsri9D
 sv35ybqI2JJz9bjbVtyPYGgAfwZ0oLGDA/1bP2KBODyCemS4m3YiJtZc2t2RGjRc
 J95k8sMNiltNfqtINj6Yfv7ap9xGF2QpmDPtheE5p/9BArMglMMWU6GBq0loiVW/
 yp4K0D9rx9U4BAMPc79xwJUtT1SKg6jvviHif7GIVhdRyEBRcVEVoBOIhbTLDxN2
 ORt0tzWprp366sHlIq7m3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771972041; x=1771979241; bh=V
 j23dTx8hYfvjWUpL8KmWQGYvEI277aBCAy+9LFoa/c=; b=jypiJw/CZ95Rcl/y3
 0NqKjvCvJ5capr659QfzFe+Lx3zRg9R5LmtT22t1tLEbomCDyDfquLkNXSxHMr6+
 7GgORgvf4WHNEZN7WLZTE07hyB+GSX+/2kZyxzduA8zY9jh4l9QLDaeObtOTr/Ti
 XPWLoYkNG/q26UVRUxGUbVwEu3NZr3YIjsZE1Yyo58UJGjhVrp4d+3R6XhsrQOJC
 R86kYOmWCwp8xTD15fGfk53eYxGpnLHCcAELQPwWrGg2R9rN0RHFVkmhFHgPN3Ji
 XKZ9N5qE5kjzNcz4aIXyoVi12aoHadXqz0oCGd7V3sQhIc6FZt0Au3IRQX5NoCWI
 oKZDA==
X-ME-Sender: <xms:ySWeaWSDZskC3H-i4WasjYdZYUyzLMXw4AdGUkmUv9HELq22arUuYg>
 <xme:ySWeafsQDIE4csTEAvH_MK4zK7uN42mig0IlVhuF5OCkCw4dazc1PVi7pCCcUJvG6
 Athv-uN-zZ7tzBYvNxWdSTQJ4da7vrNFAW2LXyun1SVh-gHDFA>
X-ME-Received: <xmr:ySWeacX8hWODJd_kkiF2ZwEAR-BVuAapimlKFj-3DTqmgNvAse1yfjahtvRWEgePePdXLTQnXzAOytaCC-eXPju_oQTYhHYJQju18aZ0XRKS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ySWeabmunQ7h81DOgUqvNEEK9eXJ0RjDGhCV7HOOv2qI7voTMW2ZuQ>
 <xmx:ySWeaXDtcTMy3nn8uoPvcJYpic4sXlfOejDQlGbSrO0bKudTdz8AAw>
 <xmx:ySWeaY_KXUUNSOQT7puTdOP2sFEa83kdLUIXVcTyznUBNOp4DHZySA>
 <xmx:ySWeaRTfsNoDqnnc0JGxb3CNDJ_QeVfukpwOQFOVjO-npS0LQGK7CQ>
 <xmx:ySWeadaHXqw92pRRHGG_5eOw4dBPE3p-nzJOnVcwQ5l0TongogFZZTf4>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:27:15 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:55 +1100
Message-ID: <20260224222542.3458677-11-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 10/15] cachefiles: change
	cachefiles_bury_object to use start_renaming_dentry()
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
	NEURAL_HAM(-0.00)[-0.900];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 0B03B18D2F2
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Rather then using lock_rename() and lookup_one() etc we can use
the new start_renaming_dentry().  This is part of centralising dir
locking and lookup so that locking rules can be changed.

Some error check are removed as not necessary.  Checks for rep being a
non-dir or IS_DEADDIR and the check that ->graveyard is still a
directory only provide slightly more informative errors and have been
dropped.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/cachefiles/namei.c | 76 ++++++++-----------------------------------
 1 file changed, 14 insertions(+), 62 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index e5ec90dccc27..3af42ec78411 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -270,7 +270,8 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 			   struct dentry *rep,
 			   enum fscache_why_object_killed why)
 {
-	struct dentry *grave, *trap;
+	struct dentry *grave;
+	struct renamedata rd = {};
 	struct path path, path_to_graveyard;
 	char nbuffer[8 + 8 + 1];
 	int ret;
@@ -302,77 +303,36 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 		(uint32_t) ktime_get_real_seconds(),
 		(uint32_t) atomic_inc_return(&cache->gravecounter));
 
-	/* do the multiway lock magic */
-	trap = lock_rename(cache->graveyard, dir);
-	if (IS_ERR(trap))
-		return PTR_ERR(trap);
-
-	/* do some checks before getting the grave dentry */
-	if (rep->d_parent != dir || IS_DEADDIR(d_inode(rep))) {
-		/* the entry was probably culled when we dropped the parent dir
-		 * lock */
-		unlock_rename(cache->graveyard, dir);
-		_leave(" = 0 [culled?]");
-		return 0;
-	}
-
-	if (!d_can_lookup(cache->graveyard)) {
-		unlock_rename(cache->graveyard, dir);
-		cachefiles_io_error(cache, "Graveyard no longer a directory");
-		return -EIO;
-	}
-
-	if (trap == rep) {
-		unlock_rename(cache->graveyard, dir);
-		cachefiles_io_error(cache, "May not make directory loop");
+	rd.mnt_idmap = &nop_mnt_idmap;
+	rd.old_parent = dir;
+	rd.new_parent = cache->graveyard;
+	rd.flags = 0;
+	ret = start_renaming_dentry(&rd, 0, rep, &QSTR(nbuffer));
+	if (ret) {
+		cachefiles_io_error(cache, "Cannot lock/lookup in graveyard");
 		return -EIO;
 	}
 
 	if (d_mountpoint(rep)) {
-		unlock_rename(cache->graveyard, dir);
+		end_renaming(&rd);
 		cachefiles_io_error(cache, "Mountpoint in cache");
 		return -EIO;
 	}
 
-	grave = lookup_one(&nop_mnt_idmap, &QSTR(nbuffer), cache->graveyard);
-	if (IS_ERR(grave)) {
-		unlock_rename(cache->graveyard, dir);
-		trace_cachefiles_vfs_error(object, d_inode(cache->graveyard),
-					   PTR_ERR(grave),
-					   cachefiles_trace_lookup_error);
-
-		if (PTR_ERR(grave) == -ENOMEM) {
-			_leave(" = -ENOMEM");
-			return -ENOMEM;
-		}
-
-		cachefiles_io_error(cache, "Lookup error %ld", PTR_ERR(grave));
-		return -EIO;
-	}
-
+	grave = rd.new_dentry;
 	if (d_is_positive(grave)) {
-		unlock_rename(cache->graveyard, dir);
-		dput(grave);
+		end_renaming(&rd);
 		grave = NULL;
 		cond_resched();
 		goto try_again;
 	}
 
 	if (d_mountpoint(grave)) {
-		unlock_rename(cache->graveyard, dir);
-		dput(grave);
+		end_renaming(&rd);
 		cachefiles_io_error(cache, "Mountpoint in graveyard");
 		return -EIO;
 	}
 
-	/* target should not be an ancestor of source */
-	if (trap == grave) {
-		unlock_rename(cache->graveyard, dir);
-		dput(grave);
-		cachefiles_io_error(cache, "May not make directory loop");
-		return -EIO;
-	}
-
 	/* attempt the rename */
 	path.mnt = cache->mnt;
 	path.dentry = dir;
@@ -382,13 +342,6 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 	if (ret < 0) {
 		cachefiles_io_error(cache, "Rename security error %d", ret);
 	} else {
-		struct renamedata rd = {
-			.mnt_idmap	= &nop_mnt_idmap,
-			.old_parent	= dir,
-			.old_dentry	= rep,
-			.new_parent	= cache->graveyard,
-			.new_dentry	= grave,
-		};
 		trace_cachefiles_rename(object, d_inode(rep)->i_ino, why);
 		ret = cachefiles_inject_read_error();
 		if (ret == 0)
@@ -402,8 +355,7 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 	}
 
 	__cachefiles_unmark_inode_in_use(object, d_inode(rep));
-	unlock_rename(cache->graveyard, dir);
-	dput(grave);
+	end_renaming(&rd);
 	_leave(" = 0");
 	return 0;
 }
-- 
2.50.0.107.gf914562f5916.dirty


