Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKy5JN1Lg2n4kwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820EE68AD
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 14:38:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnd5R-0001hC-4l; Wed, 04 Feb 2026 13:38:29 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vnV7f-0005iq-Qc
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 05:08:15 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id EA7B0138077B;
 Wed,  4 Feb 2026 00:08:14 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 04 Feb 2026 00:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1770181694;
 x=1770188894; bh=3vylP70Td4gLvBkKBkP+NDaQ107NjHxVZqjmkf4RPM4=; b=
 DhtD8bzCE/oNQIkGTTjyqSX4LQFUqFhjVSWKj/iXxrgRLl9NMJgIFm1xZ4/+udL+
 /9QWvwMQV6geJ18mtU4+cgzDERVj1ReQO2ExjsJaVPBAVXtasGRepSdMNCEs3Cen
 CSHYUma0vbM4ukuPPL8Z+pOn/nj6EBbbHKgw+8Uy+6hKfGk7XO7tQ6p6EyhH6c8C
 6p87VF0V5HVZ3l4zZJvwKWrqJ1tuJ4YK8Vb4OGfaZgK4ZEwkYmQGCwmBQcSAAb+W
 YTqNDXuE4QXcuT2g5nwtYr+JVfmjJkqqHAoAEzlxhbyx6v3JmJad53Gh8DcrsokT
 ZZ8ubTAUQbE5Utbhr9g6Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1770181694; x=1770188894; bh=3
 vylP70Td4gLvBkKBkP+NDaQ107NjHxVZqjmkf4RPM4=; b=w89hP2rEFqQl9e3q2
 g2FP5CWLzoLxvBPctBENFDxM58CxydFLvse3FHdP6d0+csiZVe2ZvqhGTbwvpjLN
 8RZExjMi7fsXAsrW2rNHsW8myHB3LnaOhRbyUB74IWtr8/qkS7dOTCDnbVKBtB1o
 TkoG0g9EuxvgI28XT+UnTGzKof8yNAjVTmIBkM2hvmtfEnwcacSmkVx000eCS3VM
 GKno6xlQSBDJjHWqV8Jzuvr5kjZ3q7qpw40XTCPMFdJu7SnRFt3E98DL/BqeNVEF
 P+RWyaXoyUXGMz2W7fIKHBAtXLUjLtTMg1lzqsBu+G8WvZ+9okCIlHHVcJNQBI95
 IeHAQ==
X-ME-Sender: <xms:PtSCaRWK9CbwYmtwwlh5aoV8Dyt096I5dx4dm5-UQ2ahT-mugdIwog>
 <xme:PtSCadJPm5HNUHC82q7naFpsh7T9mJ46Be5jIwHNl69dpLD-CxhuM2O2thJ8k_Ur8
 IaAnukIuBfqVdHk1DOtI5ax30L0AChNU-7_9TfKpwrWh3vwqg>
X-ME-Received: <xmr:PtSCadZEaggWHYq0wx4dK8BuY-9dGYzUuqF2q6qf-sxhwmMWZQ-R_uLTVUYkVeWcBDFKqwc2gTH0q1PsjPJRVRlloKGWvQXJOycNcA_OjKEG>
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
X-ME-Proxy: <xmx:PtSCaZSGsBqfYqbFFS8dtfzI2ivVNXNwDGaqiKOPBmwCVKJrs0LH5g>
 <xmx:PtSCadhVrra5MkiI8N6tG94c5mXG8tip-xJcKGrKu_bp0501UG2d7A>
 <xmx:PtSCadtsHemgaPVocEe53BqPbwoeWP6Fz8DlHNPTF7gvd3V3UWs00A>
 <xmx:PtSCaXx0gJHSWG2JkZc3PQb04rk9gpV4HtUVRHcN2h3onw-czQ39mA>
 <xmx:PtSCaU9Mqd1v6-21hkHMOFCVfaR5earMybe2t_lXznNPm_tYkXKs48Ir>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 00:08:09 -0500 (EST)
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
Date: Wed,  4 Feb 2026 15:57:45 +1100
Message-ID: <20260204050726.177283-2-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260204050726.177283-1-neilb@ownmail.net>
References: <20260204050726.177283-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.141; envelope-from=neilb@ownmail.net;
 helo=flow-a6-smtp.messagingengine.com
X-Mailman-Approved-At: Wed, 04 Feb 2026 13:38:26 +0000
Subject: [apparmor] [PATCH 01/13] fs/proc: Don't lock root inode when
	creating "self" and "thread-self"
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
	NEURAL_SPAM(0.00)[0.966];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 2820EE68AD
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

proc_setup_self() and proc_setup_thread_self() are only called from
proc_fill_super() which is before the filesystem is "live".  So there is
no need to lock the root directory when adding "self" and "thread-self".
This is clear from simple_fill_super() which provides similar
functionality for other filesystems and does not lock anything.

The locking is not harmful, except that it may be confusing to a reader.
As part of a an effort to centralise all locking for directories for
name-based operations (prior to changing some locking rules), it is
simplest to remove the locking here.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/proc/self.c        | 3 ---
 fs/proc/thread_self.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/fs/proc/self.c b/fs/proc/self.c
index 62d2c0cfe35c..56adf1c68f7a 100644
--- a/fs/proc/self.c
+++ b/fs/proc/self.c
@@ -35,11 +35,9 @@ unsigned self_inum __ro_after_init;
 
 int proc_setup_self(struct super_block *s)
 {
-	struct inode *root_inode = d_inode(s->s_root);
 	struct dentry *self;
 	int ret = -ENOMEM;
 
-	inode_lock(root_inode);
 	self = d_alloc_name(s->s_root, "self");
 	if (self) {
 		struct inode *inode = new_inode(s);
@@ -55,7 +53,6 @@ int proc_setup_self(struct super_block *s)
 		}
 		dput(self);
 	}
-	inode_unlock(root_inode);
 
 	if (ret)
 		pr_err("proc_fill_super: can't allocate /proc/self\n");
diff --git a/fs/proc/thread_self.c b/fs/proc/thread_self.c
index d6113dbe58e0..61ac62c3fd9f 100644
--- a/fs/proc/thread_self.c
+++ b/fs/proc/thread_self.c
@@ -35,11 +35,9 @@ unsigned thread_self_inum __ro_after_init;
 
 int proc_setup_thread_self(struct super_block *s)
 {
-	struct inode *root_inode = d_inode(s->s_root);
 	struct dentry *thread_self;
 	int ret = -ENOMEM;
 
-	inode_lock(root_inode);
 	thread_self = d_alloc_name(s->s_root, "thread-self");
 	if (thread_self) {
 		struct inode *inode = new_inode(s);
@@ -55,7 +53,6 @@ int proc_setup_thread_self(struct super_block *s)
 		}
 		dput(thread_self);
 	}
-	inode_unlock(root_inode);
 
 	if (ret)
 		pr_err("proc_fill_super: can't allocate /proc/thread-self\n");
-- 
2.50.0.107.gf914562f5916.dirty


