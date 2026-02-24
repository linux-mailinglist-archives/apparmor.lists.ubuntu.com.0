Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M6FFo8lnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:26:23 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 128CE18D215
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:26:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0r2-0005HS-CE; Tue, 24 Feb 2026 22:26:08 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0r1-0005Fz-8l
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:26:07 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 645B9138052C;
 Tue, 24 Feb 2026 17:26:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 17:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771971966;
 x=1771979166; bh=bc9azlh/VG6ae6PkDsWsI4XhYvmFw1STenuoUYZ/MBs=; b=
 SASpB0jnygHPumGAlWS91bgfQg5zVUOVMHKOq00zAYqspcXFZUx++8j5Hyoq/V9Q
 WNdWgMStsw9ANiYmzA7M3hNAS3fajikRG71Ds+45ffN+sPaj4NcnlwGzxEt10udz
 ns2nO1tlPzw4vFYEmZGJjelVSMf/Brv43bJZ/BxF2YzDBbfs9Wt7Z9rcraW4UaKU
 waRkVw8ZqH9j4XRXgPW+T/Xrw0kNsC1HgwMzato61qaky2k7CGGtgZIgZRiRZOmL
 b5geKeh9nRq1D94XwELilFtZKQtbPcv/VjmRR1ao3z+MUB/HjdO7mYBLgroHWNvI
 bHL1JyrEHpW5QIqszOvl+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771971966; x=1771979166; bh=b
 c9azlh/VG6ae6PkDsWsI4XhYvmFw1STenuoUYZ/MBs=; b=HkUvYZy25Jt1baGUe
 y+N7jaWMDyzl16a97dbnGlyoya0pq0RMyJWNFHRfeyGiahB1YCSgP2dZqyPBXnrj
 //JjdCMdIc1Gc80UI5/smG0EfUrXqxRxeIiGbpmdrQQu8kRhuf9vPWv5z47MKYf+
 GBfMklXEPmTX9loCgJ9bLF4te9SL+L93IgIRkLPh4SoNrU2zkEX88jRLrOxTKGzf
 xl+01llOci5Br22sgxJUNpKZmsjd+Lcvu0f8qiOR2opMbJ/6nJMaKdYlVvgb3XVP
 MOTvzrs2DuS4LMiIYDmhIzBLDaOJCeVP5eJlfsqvs6GW9OzNYa1/Ye2qBq3UqI1B
 YXCjg==
X-ME-Sender: <xms:fiWeaVvsfF-xHqqo3ZT9m5ybwhqP8j8L2nLlKeGn9OVurzfPnnjbKQ>
 <xme:fiWeaSasmIAJNymyu2js4bZRukDYsbTv_SxaEfJ4qNFj0MSRrkAwsWWOeDtvj0IJO
 FlmfN4VtolELg8PmO_xvp1_-L04of8NUDTOo5m8HPX3UIfI1Q>
X-ME-Received: <xmr:fiWeaRSwcNulcCAF78z6aWWOuEwDP_37RjeQnUtrHjQsVHTxcdkHc13qUAlT9BDfkGrGnUWyKPH4F9gJZrjIyqRNZda5mtenH7SE1Pvz3oS3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epgfevjeduvdeufeeileefteegudetheetffdtjeegvdfgtdetjeeihfeigeffffehnecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehnvghilhgssehofihnmhgrihhlrdhnvghtpdhnsggp
 rhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhhose
 iivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehsvghlihhnuhigsehv
 ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidquhhnihhonhhfsh
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsvggtuhhr
 ihhthidqmhhoughulhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 mhhikhhlohhssehsiigvrhgvughirdhhuhdprhgtphhtthhopehjrggtkhesshhushgvrd
 gtii
X-ME-Proxy: <xmx:fiWeaVwBeclayjunEON81xneBywxAcijxwNWzT2nxJm7prXC2je-Rg>
 <xmx:fiWeadeOVle6LoJcuB7GYIr4sdGubHipyUId2sGFvNtxwKy9baCr8g>
 <xmx:fiWeaWoNrRPg_DhKUrc0fjTq4SosmgdvMP3hyHG2HbbDhD8IyJBksg>
 <xmx:fiWeaVMYZXTSPlErtC7h9Ng2j8FrxFSq2lPawevy4o_1KQOshdEd-Q>
 <xmx:fiWeaX1Y6CT_dtMx4OtF1zm23cMrJswGeEQYFIrkC1o5joZJvixR0F9o>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:26:00 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:46 +1100
Message-ID: <20260224222542.3458677-2-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 01/15] VFS: note error returns in
	documentation for various lookup functions
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto,brown.name:email];
	NEURAL_HAM(-0.00)[-0.716];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 128CE18D215
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Darrick recently noted that try_lookup_noperm() is documented as
"Look up a dentry by name in the dcache, returning NULL if it does not
currently exist." but it can in fact return an error.

So update the documentation for that and related functions.

Link: https://lore.kernel.org/all/20260218234917.GA6490@frogsfrogsfrogs/
Cc: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/namei.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index 58f715f7657e..6f595f58acfe 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3124,7 +3124,8 @@ static int lookup_one_common(struct mnt_idmap *idmap,
  * @base:	base directory to lookup from
  *
  * Look up a dentry by name in the dcache, returning NULL if it does not
- * currently exist.  The function does not try to create a dentry and if one
+ * currently exist or an error if there is a problem with the name.
+ * The function does not try to create a dentry and if one
  * is found it doesn't try to revalidate it.
  *
  * Note that this routine is purely a helper for filesystem usage and should
@@ -3132,6 +3133,11 @@ static int lookup_one_common(struct mnt_idmap *idmap,
  *
  * No locks need be held - only a counted reference to @base is needed.
  *
+ * Returns:
+ *   - ref-counted dentry on success, or
+ *   - %NULL if name could not be found, or
+ *   - ERR_PTR(-EACCES) if name is dot or dotdot or contains a slash or nul, or
+ *   - ERR_PTR() if fs provide ->d_hash, and this returned an error.
  */
 struct dentry *try_lookup_noperm(struct qstr *name, struct dentry *base)
 {
@@ -3208,6 +3214,11 @@ EXPORT_SYMBOL(lookup_one);
  *
  * Unlike lookup_one, it should be called without the parent
  * i_rwsem held, and will take the i_rwsem itself if necessary.
+ *
+ * Returns: - A dentry, possibly negative, or
+ *	    - same errors as try_lookup_noperm() or
+ *	    - ERR_PTR(-ENOENT) if parent has been removed, or
+ *	    - ERR_PTR(-EACCES) if parent directory is not searchable.
  */
 struct dentry *lookup_one_unlocked(struct mnt_idmap *idmap, struct qstr *name,
 				   struct dentry *base)
@@ -3244,6 +3255,10 @@ EXPORT_SYMBOL(lookup_one_unlocked);
  * It should be called without the parent i_rwsem held, and will take
  * the i_rwsem itself if necessary.  If a fatal signal is pending or
  * delivered, it will return %-EINTR if the lock is needed.
+ *
+ * Returns: A dentry, possibly negative, or
+ *	   - same errors as lookup_one_unlocked() or
+ *	   - ERR_PTR(-EINTR) if a fatal signal is pending.
  */
 struct dentry *lookup_one_positive_killable(struct mnt_idmap *idmap,
 					    struct qstr *name,
@@ -3283,6 +3298,10 @@ EXPORT_SYMBOL(lookup_one_positive_killable);
  * This can be used for in-kernel filesystem clients such as file servers.
  *
  * The helper should be called without i_rwsem held.
+ *
+ * Returns: A positive dentry, or
+ *	   - ERR_PTR(-ENOENT) if the name could not be found, or
+ *	   - same errors as lookup_one_unlocked().
  */
 struct dentry *lookup_one_positive_unlocked(struct mnt_idmap *idmap,
 					    struct qstr *name,
@@ -3311,6 +3330,10 @@ EXPORT_SYMBOL(lookup_one_positive_unlocked);
  *
  * Unlike try_lookup_noperm() it *does* revalidate the dentry if it already
  * existed.
+ *
+ * Returns: A dentry, possibly negative, or
+ *	   - ERR_PTR(-ENOENT) if parent has been removed, or
+ *	   - same errors as try_lookup_noperm()
  */
 struct dentry *lookup_noperm_unlocked(struct qstr *name, struct dentry *base)
 {
@@ -3335,6 +3358,10 @@ EXPORT_SYMBOL(lookup_noperm_unlocked);
  * _can_ become positive at any time, so callers of lookup_noperm_unlocked()
  * need to be very careful; pinned positives have ->d_inode stable, so
  * this one avoids such problems.
+ *
+ * Returns: A positive dentry, or
+ *	   - ERR_PTR(-ENOENT) if name cannot be found or parent has been removed, or
+ *	   - same errors as try_lookup_noperm()
  */
 struct dentry *lookup_noperm_positive_unlocked(struct qstr *name,
 					       struct dentry *base)
-- 
2.50.0.107.gf914562f5916.dirty


