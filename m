Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Kg6H91Lg2n4kwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE5E68AC
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5S-0001hf-Ab; Wed, 04 Feb 2026 13:38:30 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV8Q-0005w6-TD
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:09:03 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 0596B1380791;
 Wed,  4 Feb 2026 00:09:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 04 Feb 2026 00:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181742;
 x=1770188942; bh=1n4lIAxtUgYajLCifkhNHQVF/GnsaAGGAoPUyk9Rs5w=; b=
 PfzG4VfUoa4kqnybFWiRirIn8E+3tUu2xcunk30foo2e06HIR48ujZB8b3xxusgm
 WVSM0gMq9sTgfuG3YaZVBrji7gcfCV35aznQOyzvdfUO7hRo9/cj5uXa2WWBKE8M
 HT1TxjSqBPOtlgke9WjuSUhuqTDK0WsjpXm8BERnV4C+LkNKrpACwAm0u/7blDQ8
 AlQPu5DSJk+OLJ4UNsVDg+cE4bIbEmQwPj2VUu6ZUEk30mI9k7HIkcQoOwOIyAZw
 qkaXLSDZC/49EtfMmNKrMuQw8F5ql63HYMn8/w9Obblbi4GpXok73xz/1ftFOzaZ
 7MBxMYrPzWzkse+wJgk90Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181742; x=1770188942; bh=1
 n4lIAxtUgYajLCifkhNHQVF/GnsaAGGAoPUyk9Rs5w=; b=vI1bsTE0ScZ4pS5tu
 ze1uWD8qTwq+UFYud0AFiKMwMUfHP0HFyyQEY5bG7tZrySF5/f2E0HX1Xw2t3t7v
 hA6en9hIxsCU+xJ1GmqAw2rRvw1DhJ42LRkph6rd7h7wUZOGMvIA89hmA8xz02NO
 juE/pmHjikSChuPMt2koSlhPlCChASZ41Wx5yJsTLl9KrQ24RvB8L5ca8nz+mqr+
 +zp7A05Wp38hlZSAFyivv2FvSaXO7YhAC3gbAV5ltP5MR0k6cqyenDDAQlZtkRW/
 kjF5JievC7DbFWZIp5mGy3dKMjxG1unQaf4A5nrue6+1h5pPnj2GZnxYOtI3Qk0k
 aUgtw==
X-ME-Sender: <xms:bdSCaZajut9P0mv6SRPb5AKgXkFI1wtlRBOXv9o-5CxpQc1WyHW1QQ>
 <xme:bdSCab8Rypm_QZWj3HM0plElx9sWGV-HF7OPyKpw-gYdkHROaSEBtfJ4YmxSgdDN9
 ftnJaNNPiUar4U-wCmqk1RbMMbJNe-oH-zNI07JHik8Fpi9kuY>
X-ME-Received: <xmr:bdSCab_ECdN75wefMdIYBc_svaUmmoWVLC3d1ueeGDWGc0ZOouWvXjq7RlXXwJjkbo4aUP94M6lW5aEcQnnUkBHMbmzEDjMTZBStRaaCkxRf>
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
X-ME-Proxy: <xmx:bdSCaclSUaYdZdcl_HuB5Gi44brVVDJkvhdM3W-bZ6Z6OghhUNz27w>
 <xmx:bdSCaWnmeNhNf9NGnlryVtvfEpwJ3EhiRJu4G032YgkRtneFh4nqNg>
 <xmx:bdSCaZhA603sM_N5pByFe7XMuPlm0PR041pbodRDTTsgeWA-CLefUQ>
 <xmx:bdSCafVpm4Ha7-DcZ_-AMmxDN4vq93H_huln7RT-kPWoSsnS8NQ8mQ>
 <xmx:btSCaWibUNdm9CX7JCYqBP378_jdso1AUwPNGAvpRGGXVVnLX-fzkjKN>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:56 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:51 +1100
Message-ID: <20260204050726.177283-8-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 07/13] VFS: make lookup_one_qstr_excl() static.
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,zeniv.linux.org.uk,redhat.com,suse.cz,oracle.com,szeredi.hu,gmail.com,canonical.com,paul-moore.com,namei.org,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:dhowells@redhat.com,m:jack@suse.cz,m:chuck.lever@oracle.com,m:jlayton@kernel.org,m:miklos@szeredi.hu,m:amir73il@gmail.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:linux-nfs@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 12DE5E68AC
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

lookup_one_qstr_excl() is no longer used outside of namei.c, so
make it static.

Signed-off-by: NeilBrown <neil@brown.name>
---
 Documentation/filesystems/porting.rst | 7 +++++++
 fs/namei.c                            | 5 ++---
 include/linux/namei.h                 | 3 ---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index ed3ac56e3c76..ed86c95d9d01 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1340,3 +1340,10 @@ The ->setlease() file_operation must now be explicitly set in order to provide
 support for leases. When set to NULL, the kernel will now return -EINVAL to
 attempts to set a lease. Filesystems that wish to use the kernel-internal lease
 implementation should set it to generic_setlease().
+
+---
+
+**mandatory**
+
+lookup_one_qstr_excl() is no longer exported - use start_creating() or
+similar.
diff --git a/fs/namei.c b/fs/namei.c
index 40af78ddfb1b..307b4d0866b8 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1730,8 +1730,8 @@ static struct dentry *lookup_dcache(const struct qstr *name,
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
@@ -1768,7 +1768,6 @@ struct dentry *lookup_one_qstr_excl(const struct qstr *name,
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


