Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGPLMs0lnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:25 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B558A18D2E7
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0s8-00062I-EV; Tue, 24 Feb 2026 22:27:16 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0s6-0005z7-5u
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:27:14 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 42B0D138052C;
 Tue, 24 Feb 2026 17:27:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 17:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771972033;
 x=1771979233; bh=2jTTlW9RZgdA98OhmzS3Zb4kiDI7eopW2MuhMcIKiog=; b=
 E4VKyLrBtcvWb+ODOPq2rc6tFxLCMK8m26Ih5MitN6DWndAAHwui2T9PD+3sjVL/
 B3aJXBbn1RxehizMelPZSPiEGWA2FDGSPKfspQ+pQ1/pLQEY2CKcP1IXh8lYDfJP
 bLpqZ80kotSCmvWb0y8EkAInZrWx8NQ6sIEC6tzNVSvla/GCVbI8MlLH9e0OOFiL
 OKDTC7MfIQaXpsrvAP2Xbwgt0TtB4PzI+5fjNaOlq8lYKdKw3ZjmxYfCuG+V+QYT
 9bbVcddgBaCe280l282lSsl33IPfYKnUdZ7923+CM+hZYKISNy6WIJwr94jXCVmf
 aQ6vtGsnxRZn9MyQxb86kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771972033; x=1771979233; bh=2
 jTTlW9RZgdA98OhmzS3Zb4kiDI7eopW2MuhMcIKiog=; b=ninVMiSehwVBOUDCe
 zLwwgL9e+RdytBF5LKwUjdzgugEI93NT+RPXLtWlc/l1fWltKXxibgCKHsCD2qO9
 Ko3/Pj2bzdSXZGgb12i+/D7Pb7ga+5w9U8chL5R9bZ+q9ByRdKCcVpNR7FUYUAEA
 X7xwowMF7ZiwLXFMfo3m5gZRLpdJHGWuPgm9hQeRtpmvXFnO0PltsfcUoVo4jraq
 AsLc1SinKbM6hM55DqdvtiWfuBrXB9lsDAPKBMyBrkn+x3MfPr+GRpDO4fkqBDKK
 io5ROcckvfoQGJjEPPvfcsiyg4WZ9PS8T5qt4TcnG1T6yJZ7ozovR6GHbHEb2jAD
 X71rA==
X-ME-Sender: <xms:wSWeaaMRbf-7Hmk3BabcmrzJnDFb5KjZOxru3xIqrIauVe8xB9oBtQ>
 <xme:wSWeac47tymxyGIVR39pH6ZV2FX8IYJl-ru_nwvFUb6n_IJynJCUXuAr2e7PA7dqa
 PVrtPunmBU5yr0CM-sKC94Mc-JYUrohaXp22LALbGLSfmgYhA>
X-ME-Received: <xmr:wSWeaZzKZHFMhw9X81MVpEBIQwpLjNa2-OtYHfZnnOzcgsLA0ru0oIIMBjfNonQl1jWDNTdhg4oq929t1nLfcT8vXaPY23lPfXDX0ZgXg9jn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:wSWeaUR9nlcbx9KWqiYY2qctEd6WgGmihC6Cq83TdERuO1q7mIKTKw>
 <xmx:wSWeaZ_AfvSyJ9zFYGi4OJMS_wLCzSyCmxdbxKiS497m4mguhoYaLA>
 <xmx:wSWeaZLv425fP7x6fBAlKCy0VQrnYDY0r9KxVJ9sHvuJC4BY1lCIvg>
 <xmx:wSWeaVtT08b9lWVjL4X5rSrvNHGv7HBr60zMg4d8J4M0NfHIfL00xw>
 <xmx:wSWeaeVbCvA8597i9roEs4TWVTQIv02A7Qfx03l9lwPL4E5qXNeSSIur>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:27:07 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:54 +1100
Message-ID: <20260224222542.3458677-10-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 09/15] ovl: Simplify ovl_lookup_real_one()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,brown.name:replyto,brown.name:email,ownmail.net:mid];
	NEURAL_HAM(-0.00)[-0.882];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: B558A18D2E7
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

The primary purpose of this patch is to remove the locking from
ovl_lookup_real_one() as part of centralising all locking of directories
for name operations.

The locking here isn't needed.  By performing consistency tests after
the lookup we can be sure that the result of the lookup was valid at
least for a moment, which is all the original code promised.

lookup_noperm_unlocked() is used for the lookup and it will take the
lock if needed only where it is needed.

Also:
 - don't take a reference to real->d_parent.  The parent is
   only use for a pointer comparison, and no reference is needed for
   that.
 - Several "if" statements have a "goto" followed by "else" - the
   else isn't needed: the following statement can directly follow
   the "if" as a new statement
 - Use a consistent pattern of setting "err" before performing a test
   and possibly going to "fail".
 - remove the "out" label (now that we don't need to dput(parent) or
   unlock) and simply return from fail:.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/overlayfs/export.c | 71 ++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 83f80fdb1567..896f2e9af2e2 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -349,69 +349,64 @@ static struct dentry *ovl_dentry_real_at(struct dentry *dentry, int idx)
 	return NULL;
 }
 
-/*
- * Lookup a child overlay dentry to get a connected overlay dentry whose real
- * dentry is @real. If @real is on upper layer, we lookup a child overlay
- * dentry with the same name as the real dentry. Otherwise, we need to consult
- * index for lookup.
+/**
+ * ovl_lookup_real_one -  Lookup a child overlay dentry to get an overlay dentry whose real dentry is given
+ * @connected: parent overlay dentry
+ * @real: given child real dentry
+ * @layer: layer in which @real exists
+ *
+ *
+ * Lookup a child overlay dentry in @connected with the same name as the @real
+ * dentry.  Then check that the parent of the result is the real dentry for
+ * @connected, and @real is the real dentry for the result.
+ *
+ * Returns:
+ *   %-ECHILD if the parent of @real is no longer the real dentry for @connected.
+ *   %-ESTALE if @real is not the real dentry of the found dentry.
+ *   Otherwise the found dentry is returned.
  */
 static struct dentry *ovl_lookup_real_one(struct dentry *connected,
 					  struct dentry *real,
 					  const struct ovl_layer *layer)
 {
-	struct inode *dir = d_inode(connected);
-	struct dentry *this, *parent = NULL;
+	struct dentry *this;
 	struct name_snapshot name;
 	int err;
 
 	/*
-	 * Lookup child overlay dentry by real name. The dir mutex protects us
-	 * from racing with overlay rename. If the overlay dentry that is above
-	 * real has already been moved to a parent that is not under the
-	 * connected overlay dir, we return -ECHILD and restart the lookup of
-	 * connected real path from the top.
-	 */
-	inode_lock_nested(dir, I_MUTEX_PARENT);
-	err = -ECHILD;
-	parent = dget_parent(real);
-	if (ovl_dentry_real_at(connected, layer->idx) != parent)
-		goto fail;
-
-	/*
-	 * We also need to take a snapshot of real dentry name to protect us
+	 * We need to take a snapshot of real dentry name to protect us
 	 * from racing with underlying layer rename. In this case, we don't
 	 * care about returning ESTALE, only from dereferencing a free name
 	 * pointer because we hold no lock on the real dentry.
 	 */
 	take_dentry_name_snapshot(&name, real);
-	/*
-	 * No idmap handling here: it's an internal lookup.
-	 */
-	this = lookup_noperm(&name.name, connected);
+	this = lookup_noperm_unlocked(&name.name, connected);
 	release_dentry_name_snapshot(&name);
+
+	err = -ECHILD;
+	if (ovl_dentry_real_at(connected, layer->idx) != real->d_parent)
+		goto fail;
+
 	err = PTR_ERR(this);
-	if (IS_ERR(this)) {
+	if (IS_ERR(this))
 		goto fail;
-	} else if (!this || !this->d_inode) {
-		dput(this);
-		err = -ENOENT;
+
+	err = -ENOENT;
+	if (!this || !this->d_inode)
 		goto fail;
-	} else if (ovl_dentry_real_at(this, layer->idx) != real) {
-		dput(this);
-		err = -ESTALE;
+
+	err = -ESTALE;
+	if (ovl_dentry_real_at(this, layer->idx) != real)
 		goto fail;
-	}
 
-out:
-	dput(parent);
-	inode_unlock(dir);
 	return this;
 
 fail:
 	pr_warn_ratelimited("failed to lookup one by real (%pd2, layer=%d, connected=%pd2, err=%i)\n",
 			    real, layer->idx, connected, err);
-	this = ERR_PTR(err);
-	goto out;
+	if (!IS_ERR(this))
+		dput(this);
+	return ERR_PTR(err);
 }
 
 static struct dentry *ovl_lookup_real(struct super_block *sb,
-- 
2.50.0.107.gf914562f5916.dirty


