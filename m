Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KzTKN5Lg2kulAMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:38 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A7E68E2
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5R-0001hJ-A6; Wed, 04 Feb 2026 13:38:29 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV7n-0005kX-Ar
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:08:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.phl.internal (Postfix) with ESMTP id 863B21380781;
 Wed,  4 Feb 2026 00:08:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 04 Feb 2026 00:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181702;
 x=1770188902; bh=czLckKBE0Hyt9Dd+uhzinS1Ik9k72RW9/tiMvXjH9ZE=; b=
 KiIPM8T+9Qs7OMViXU2ryPo92F7MQmvanDSVUIjj5kC57ZcpVQaFnv4rQ1NMLi4B
 +0RV73AC3r13JN5qIK1EhD+Tu70qyQCgvG1EHuvV5EPBAXYRAVPdX8jol3tDjUl+
 xCuDDT+BHlg+nhgNj7Q16RBLeutN55zpthaytVCWQGcbSeQxYiM4BYvrGKScCx3J
 ZdcE5j4rU3uZZYWzLeOdqIF+ZKUo3CNqxDFnJaQTY3nVKvxowyR9+UkPlD+N5g+F
 NdWf52di24JGw/l9PriGoDD7z/vEmDmWIwFDlbPXl2AazB1bGjPw9gG2E3Nmypf4
 xBdB1ZxRbTl2gKxhSjEUjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181702; x=1770188902; bh=c
 zLckKBE0Hyt9Dd+uhzinS1Ik9k72RW9/tiMvXjH9ZE=; b=RvJkWztt3XeqOopzq
 Z3hLdDpnoBpjoznAYPP7N0yKlbOsq5EXH1Bszoir1vuBAX48a9NgeogyHQ73wHEo
 z/oizouEHIODIXBpnV33EA61RMDPTbwj+rAepzhBlc4VLCUYJ1uI7KRdrHOs6hw1
 JTLepBfzI+42m6l5+4R8v1tBuvf1ywnQauoadNBniqZM39DAExI68jtT1Qxyko5U
 d82AM3QiOyxyn/v9u3WQ4Tt8iHhnjHFIZKeWhGRK27Ns1sIjLIcma7JtZgJS/ygA
 pq5sgU4k8HHaFdrU4XtoAZdA37ixRm5dktHh7MMsltzrp/PAW5dkeo2C3XPrwUmw
 RwEZw==
X-ME-Sender: <xms:RtSCaSaTeFPpwZ9ad5ECOH79gWBgfv8Uw60jM-icIBHcn9J8GK85Rg>
 <xme:RtSCaQ9ypD_gg3ssbVAeszvRJFosEo9N69T_G15GjBZU5L-iwWmp6WBNYiaNyziD5
 YU7MBzgrQ8Qc4aCJOnqCWOTrAjUD2Kfsz7lprM5fmJFK3A>
X-ME-Received: <xmr:RtSCac-mTM3MPBtazCIE51UTNsCjLtw-TALLZJD84jeacmyiwAssCyXhRQdhS3MdhL4epXsdBpPj2_uW4QfaAGxWY_OTLVzmbTPjZqE5Q7T8>
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
X-ME-Proxy: <xmx:RtSCaZnzpZLunuK6z5TIO8Aj7lUMUd_Fy0B2rnFKFFVaYfWAJQyMpQ>
 <xmx:RtSCafk-vCA_IzafYYcNyxP39V2qQpHXVCREOmBpqllj7uWP2ErqUQ>
 <xmx:RtSCaehV6RiZ72St-j3GmlBEVQEJq95INHC71585LPTuTSPtdKqpFA>
 <xmx:RtSCaQVdsDxSUpYL_PlDqbsr5oWbrM8KhOJ9NixtxGdE520zekBqoQ>
 <xmx:RtSCaXhYhR2dry0tYUo7vtVGScp-vIyzxkT3enECCHJuTuKSjv22NqRf>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:16 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:46 +1100
Message-ID: <20260204050726.177283-3-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 02/13] VFS: move the start_dirop() kerndoc
	comment to before start_dirop()
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
X-Rspamd-Queue-Id: 8F4A7E68E2
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

This kerneldoc comment was always meant for start_dirop(), not for
__start_dirop() which is a static function and doesn't need
documentation.

It was in the wrong place and was then incorrectly renamed (instead of
moved) and useless "documentation" was added for "@state" was provided.

This patch reverts the name, removes the mention of @state, and moves
the comment to where it belongs.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/namei.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index b28ecb699f32..40af78ddfb1b 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2841,20 +2841,6 @@ static int filename_parentat(int dfd, struct filename *name,
 	return __filename_parentat(dfd, name, flags, parent, last, type, NULL);
 }
 
-/**
- * __start_dirop - begin a create or remove dirop, performing locking and lookup
- * @parent:       the dentry of the parent in which the operation will occur
- * @name:         a qstr holding the name within that parent
- * @lookup_flags: intent and other lookup flags.
- * @state:        task state bitmask
- *
- * The lookup is performed and necessary locks are taken so that, on success,
- * the returned dentry can be operated on safely.
- * The qstr must already have the hash value calculated.
- *
- * Returns: a locked dentry, or an error.
- *
- */
 static struct dentry *__start_dirop(struct dentry *parent, struct qstr *name,
 				    unsigned int lookup_flags,
 				    unsigned int state)
@@ -2876,6 +2862,19 @@ static struct dentry *__start_dirop(struct dentry *parent, struct qstr *name,
 	return dentry;
 }
 
+/**
+ * start_dirop - begin a create or remove dirop, performing locking and lookup
+ * @parent:       the dentry of the parent in which the operation will occur
+ * @name:         a qstr holding the name within that parent
+ * @lookup_flags: intent and other lookup flags.
+ *
+ * The lookup is performed and necessary locks are taken so that, on success,
+ * the returned dentry can be operated on safely.
+ * The qstr must already have the hash value calculated.
+ *
+ * Returns: a locked dentry, or an error.
+ *
+ */
 struct dentry *start_dirop(struct dentry *parent, struct qstr *name,
 			   unsigned int lookup_flags)
 {
-- 
2.50.0.107.gf914562f5916.dirty


