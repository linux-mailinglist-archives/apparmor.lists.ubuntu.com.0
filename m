Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKYBGwGqm2mb4QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:14:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E870171265
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 02:14:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuKWq-0001Kq-Q3; Mon, 23 Feb 2026 01:14:28 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vuKWp-0001K9-Ml
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 01:14:27 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailflow.phl.internal (Postfix) with ESMTP id CDA1613807AC;
 Sun, 22 Feb 2026 20:14:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Sun, 22 Feb 2026 20:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771809266;
 x=1771816466; bh=zoLaKvUIcq0LBSrvSvYdTrZyLAsLuraYZU3vedQYf7U=; b=
 LWHP7ipA7aoxVkSx9/ga8otxxNysTI6aOYkGNEY04VquVUsQdL65GdEMLquBgjbZ
 Lr8i/u0BGtb1t6IwNhqP7exD6BPfLP7wOcLnaPYlJe8AYLMb3djsfeXmlmnQXgqR
 m5fOuCcwEkZ81jfjDofMviu6E11NOKdzmC6sRqFl31fewivFnd1HkXB6LIWkZNBV
 8SHmgLPM4R631GIDyLkNAOc2HIy3gELd5qrSbcufgEsMGtLC8fNoYh2BhMyJajHt
 T/LhYaWxh7fq7B6XSe1WerWhvVPxxwFf0KIwY1VL600hPvih6hlqkoahk0ikvx2o
 IhLZg4urw3l1X/P2TTeH+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771809266; x=1771816466; bh=z
 oLaKvUIcq0LBSrvSvYdTrZyLAsLuraYZU3vedQYf7U=; b=kdCcOrz8Yn/o4tF0f
 sbl8LyztUevhsY2RtxugWwQBkBDYnyMSJCL3NbqZ0cJKfoXvBCfWZ+TuuJCix6sC
 ZPytJbsN2r5tcKbN8EuDGriAKSh6016FUy1OzKdvUMPES0+4zbvV9ADQEq/wVQE1
 BgyJ/mc8kXUmUSg66Fwgqc0UjdOwKvu2rIbeM0RljrxKWIYCyAphfme+DTv3GdR2
 NIGv3UxpCWiINzVTHO+Q7WYLlvPB6DsSEleQf3f1sA9mA/JCzcd6pPs2v4W+p/yE
 iy0hzmtHnqQRRdkDAHd5v1bFFcAlugAe3bLHWEm+41OK6FuSCOpR208r7G3obceN
 MP1YQ==
X-ME-Sender: <xms:8qmbacADZNbiO7Y2yIE08fxAyvwUHfkg_-04X2zEz1vSicm2I3xVXg>
 <xme:8qmbaSdgHufXnzQxWb6P8_rnlWtJh7zJF_UOtqR_tt89ck2yWF7oZd_E6xpQx0Rwq
 UADQLNNrdxaCZxI2DZLox2ReHKwSDz5aQ99ahLPjMp1rEFu>
X-ME-Received: <xmr:8qmbaYE6A3Gd6wY0XwFNHfR7LHL3jrHbt7vbwFOdNEz3lKDmKp9Oq9e4oVBdboYok-WT7sks_Xg34PonNqzghGvv1HdStY7inyDC5If4Nhec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeehkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:8qmbacXft0N6vFCMJRRO3JFF1tgfoBgBuBSGxO7FpgDDnr4RhTh_ZA>
 <xmx:8qmbaYyXufaQuBEji0UAT97vnJu7AtccRAEotXycK0rVy2G4T9x3vg>
 <xmx:8qmbaXtghudcr7SgVvBvTSV91YQL5jAUELoefQC2nAc3_-DcvZ9fag>
 <xmx:8qmbaZC8OjpTPIcn_vuQl8PPezayir7kAU5ELilPpCGyFOVxJfHtuA>
 <xmx:8qmbaTLp79yJqv9Vm99DgQaPUcZs8koOXi7thBtUmohPh_LzpUspFXtp>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 20:14:20 -0500 (EST)
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
Date: Mon, 23 Feb 2026 12:06:28 +1100
Message-ID: <20260223011210.3853517-14-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260223011210.3853517-1-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.136; envelope-from=neilb@ownmail.net;
 helo=flow-a1-smtp.messagingengine.com
Subject: [apparmor] [PATCH v2 13/15] ovl: use is_subdir() for testing if one
	thing is a subdir of another
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
X-Rspamd-Queue-Id: 5E870171265
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Rather than using lock_rename(), use the more obvious is_subdir() for
ensuring that neither upper nor workdir contain the other.
Also be explicit in the comment that the two directories cannot be the
same.

As this is a point-it-time sanity check and does not provide any
on-going guarantees, the removal of locking does not introduce any
interesting races.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/overlayfs/super.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 109643930b9f..58adefb1c5b8 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -451,18 +451,13 @@ static int ovl_lower_dir(const char *name, const struct path *path,
 	return 0;
 }
 
-/* Workdir should not be subdir of upperdir and vice versa */
+/*
+ * Workdir should not be subdir of upperdir and vice versa, and
+ * they should not be the same.
+ */
 static bool ovl_workdir_ok(struct dentry *workdir, struct dentry *upperdir)
 {
-	bool ok = false;
-
-	if (workdir != upperdir) {
-		struct dentry *trap = lock_rename(workdir, upperdir);
-		if (!IS_ERR(trap))
-			unlock_rename(workdir, upperdir);
-		ok = (trap == NULL);
-	}
-	return ok;
+	return !is_subdir(workdir, upperdir) && !is_subdir(upperdir, workdir);
 }
 
 static int ovl_setup_trap(struct super_block *sb, struct dentry *dir,
-- 
2.50.0.107.gf914562f5916.dirty


