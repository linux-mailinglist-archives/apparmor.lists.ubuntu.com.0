Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMwZOcQlnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:16 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D132718D2AB
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0rz-0005sF-2l; Tue, 24 Feb 2026 22:27:07 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0ry-0005rS-2F
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:27:06 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailflow.phl.internal (Postfix) with ESMTP id 1883D138052C;
 Tue, 24 Feb 2026 17:27:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Tue, 24 Feb 2026 17:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771972025;
 x=1771979225; bh=7mZv59/XBHyrbXM2e8385B3rlZeYZjJwl/wrmf7v+4o=; b=
 DHCrV62+FVQSKKY9oPA5I9UMEE9pC/8WEvW9kUHBtA3frmmP/cPBf0zd6bJbIqbC
 vN5knIKY45dLrV5XJHCjsfef/l9dWsv86b5HD6hgOTiUThfLND+2pic44c6BUycP
 jXtyYZfcm7lGlO64UbkAq2ExoRXoKUuQlEWQn0+ZMzy6eIXv5O8G5fQ5z1xyZIV7
 8uQLN9ckPvBNjC9O3XaYvG+R9Mfn/pPZ2eh/4nfsLBB0/xGbcH09yL3qW+uTTNFe
 k9DTNOyKWyS2VWdTrAIqNPKPwGhj5dNQi0vWyZ0rjK1xZuOZCnCWfEHMF0a0/yr4
 28g4CInm6Bzvmd4QsW7rJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771972025; x=1771979225; bh=7
 mZv59/XBHyrbXM2e8385B3rlZeYZjJwl/wrmf7v+4o=; b=S4SHo91XvY7j79cy/
 WD7j/EIok8aqeOa0BdQBWd3+PAk0+opZiEQ0fmdJ/s48/8lo6yX2834cVkUmQR7l
 ajXFnqoFYiOed1A6cXIDwMYnkUueynatL3IWxytkEqRWL8GixYl5+bkFhAohu42r
 g/5Yr/YbCPOUUyCb7OMB2znUuY6eFTLcT9mXNgtJZ93LMl73N1enpxu94/2f87U9
 yI5AXgorYVBZwJtgIuYDfX+zTelz5ydj/xW1HHRgU75QPK0m7elj2A27UDDGauT0
 K4iql0+Z59N7bNch+sMKIjepH5qgV12o9TlaBvg4J76NH41YOV+cH3YyBf5J/0eD
 P9UaQ==
X-ME-Sender: <xms:uCWeaXheA8vKdner4da0s7BnTNIb8PKGmMmtG1lD62cH8D7Tp8RdBg>
 <xme:uCWeaX9QGWwgJ54Q7QeP9Xz9HCTG3uqib8IHkHmIKz7kaJDRm3JWx8PyKor-pxn9y
 yF82_-AD0zqr6UUW01oPihplckDwdp-WDiHaJ2ZHT1cv37wU-s>
X-ME-Received: <xmr:uCWeafmf6mRLAvdJ_Uvcdqzvx0pb1O847OpiP0-0H5MkSIzrdbVPbeBuDui2jEazYX4jxlk9V5Cw5bL1MM5CmrAJLrkoiZbrFGvs4Z5N_Knt>
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
X-ME-Proxy: <xmx:uCWead3jB53TyJlqfFS71Lp4xP-NPd9bqX8EZF4s_hqe9-kAASjdGQ>
 <xmx:uCWeacTlmHfetoTdsHPd7CShZFuAPwpmZHMzJV57NgNSDBR2CTg3NQ>
 <xmx:uCWeaVP-gBKua4IdJsRwRu9akTPXjBjBlMoRDaUMDTuy1utex_JoWQ>
 <xmx:uCWeaYgB4IPPmkOycaAc71gfR7a2uZvl6PVYl38GI6ew8gZceTxMWA>
 <xmx:uSWeaa76MDi0L1OATF7Fsrq1l2CkRXKnqiOO8LN8hHYif0ZhXT-molBE>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:26:58 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:53 +1100
Message-ID: <20260224222542.3458677-9-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 08/15] VFS: make lookup_one_qstr_excl() static.
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
	NEURAL_HAM(-0.00)[-0.915];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: D132718D2AB
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
index 11c9a4a6c396..a5daa62399d7 100644
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


