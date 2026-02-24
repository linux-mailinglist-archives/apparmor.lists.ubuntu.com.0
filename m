Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPBWOd8lnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:43 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DB18D31A
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0sO-00068Y-3G; Tue, 24 Feb 2026 22:27:32 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0sM-00067Y-JX
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:27:30 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id B446513805A6;
 Tue, 24 Feb 2026 17:27:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 17:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771972049;
 x=1771979249; bh=vIMZKjfxmKkyu011y6KfL+N7g881UsmJU+U6+HLmMTM=; b=
 NebVhl4Uf0rQN6394D508zLVskPRA5kGJQqYtRAomfY3tJEG/4rasGHfTSOQlFW2
 WYW6BfxyHAvW/qQwxEumP0R5MCvRDhPpu9AQXj2AnNolzy3Ns4w3Qp4xuHt4rp8Q
 I06NaoDbmb7beCZ9P9gbf43WiOocoR91ywAFr4d6z/a2T71UrVG06faOxckf5MUE
 qsAxeIDt9S3qbq24h6OpAhKXm73qOHK6fW3hmyqPZ7aRN06ZuUJ6kegrpCuQQyjy
 1eFPRLI2Ipo+3CDUNp6upNbj/utD+G2SfrT48EEPjRhkeZnMwAa756C5B/8Nj1y2
 XJM81OYuELL69EX+3EAzFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771972049; x=1771979249; bh=v
 IMZKjfxmKkyu011y6KfL+N7g881UsmJU+U6+HLmMTM=; b=Fdd69+d/T013npC8h
 52Nt0SQ4HswdfJ5xjrIYiPjnQ2MDsau2C5CUT14zXzgT0dq8pXaGGo7Fhp17T7TB
 6yYDrW9oIFE0QRMnBsDBlea/pmF7yOrJ/VzKxmAAURgQafKsfdWaGuZ/CwWVfO97
 tHZewOpTmP0m9Ar0XChtj6RLLPf8GZEQ58EuHWdzZiIIqeY2E6k2NfyCdKVU4DHJ
 WfgxLcrxIU/nf0FvAcHwfexPQ0PTmrIX9LUb7Ldx/D4lFZGGORySIU8+6dYO1dfq
 2zpbyhjoFF5S5jsiEWBywRGPd74v8ISQr9eEeJC8nP/DmZtDPtO6xcHVU1DXIlwG
 J4ivw==
X-ME-Sender: <xms:0SWeaSe__UelJqauzvKjb8dBe2ssw74aa5xZm9gTEl7RVTWgNrfftg>
 <xme:0SWeaQK15XiUYwoW2R6B8cRwib_1BFxwlrfL9s3fDqyRPMpNUtoHHRJ5xBQpUvWof
 iuMsqg-8ZVGhDCj8Q8bnN70sufPPl66kHhLtFMy79JK7sQ3fg>
X-ME-Received: <xmr:0SWeacAdA716rIg0a6w0foGljLybvYaBk1u6IilFkiIuFOCnPVm8Tqr4bJrPmtyQ2PcdfVLe2iTacsebrv9WX57yPUpI_nfP6lzkFxAJlEeN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:0SWeaZg76qW1kadSC2zWUSznnvk-bRVH6IzXhORXNigu1_8mRgveDw>
 <xmx:0SWeaWNCLqVnHeuyRgytgouAXNnhtVcSoC3t6XWh6LAZDfJj8dsQhw>
 <xmx:0SWeaQZI5PDVRjMPFsTw2S-WgRNIGtqjm7gyQLZZCYCWRK-jx5SdBw>
 <xmx:0SWeab80YZP_XNxpfzgGFFPyuyWopzDNjkAPcOl5cptPOY5kkEhz_A>
 <xmx:0SWeadloxb2KJg35QewtDb4ElbVa5O-lhBjw_G2rPRq3SPVD-dBjlFEQ>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:27:23 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:56 +1100
Message-ID: <20260224222542.3458677-12-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 11/15] ovl: pass name buffer to
	ovl_start_creating_temp()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,brown.name:replyto,brown.name:email];
	NEURAL_HAM(-0.00)[-0.917];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: D19DB18D31A
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Now ovl_start_creating_temp() is passed a buffer in which to store the
temp name.  This will be useful in a future patch were ovl_create_real()
will need access to that name.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/overlayfs/dir.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index ff3dbd1ca61f..c4feb89ad1e3 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -66,10 +66,9 @@ void ovl_tempname(char name[OVL_TEMPNAME_SIZE])
 }
 
 static struct dentry *ovl_start_creating_temp(struct ovl_fs *ofs,
-					      struct dentry *workdir)
+					      struct dentry *workdir,
+					      char name[OVL_TEMPNAME_SIZE])
 {
-	char name[OVL_TEMPNAME_SIZE];
-
 	ovl_tempname(name);
 	return start_creating(ovl_upper_mnt_idmap(ofs), workdir,
 			      &QSTR(name));
@@ -81,11 +80,12 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
 	struct dentry *whiteout, *link;
 	struct dentry *workdir = ofs->workdir;
 	struct inode *wdir = workdir->d_inode;
+	char name[OVL_TEMPNAME_SIZE];
 
 	guard(mutex)(&ofs->whiteout_lock);
 
 	if (!ofs->whiteout) {
-		whiteout = ovl_start_creating_temp(ofs, workdir);
+		whiteout = ovl_start_creating_temp(ofs, workdir, name);
 		if (IS_ERR(whiteout))
 			return whiteout;
 		err = ovl_do_whiteout(ofs, wdir, whiteout);
@@ -97,7 +97,7 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
 	}
 
 	if (!ofs->no_shared_whiteout) {
-		link = ovl_start_creating_temp(ofs, workdir);
+		link = ovl_start_creating_temp(ofs, workdir, name);
 		if (IS_ERR(link))
 			return link;
 		err = ovl_do_link(ofs, ofs->whiteout, wdir, link);
@@ -247,7 +247,9 @@ struct dentry *ovl_create_temp(struct ovl_fs *ofs, struct dentry *workdir,
 			       struct ovl_cattr *attr)
 {
 	struct dentry *ret;
-	ret = ovl_start_creating_temp(ofs, workdir);
+	char name[OVL_TEMPNAME_SIZE];
+
+	ret = ovl_start_creating_temp(ofs, workdir, name);
 	if (IS_ERR(ret))
 		return ret;
 	ret = ovl_create_real(ofs, workdir, ret, attr);
-- 
2.50.0.107.gf914562f5916.dirty


