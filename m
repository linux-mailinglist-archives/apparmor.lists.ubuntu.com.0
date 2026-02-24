Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF2xIb8lnmn5TgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:11 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A118D29C
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 23:27:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vv0rr-0005p8-S1; Tue, 24 Feb 2026 22:26:59 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vv0rp-0005np-Ot
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 22:26:57 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id C3727138052C;
 Tue, 24 Feb 2026 17:26:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Feb 2026 17:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to; s=fm3; t=1771972016;
 x=1771979216; bh=rVzESsgVzPWBQDwiGwCUvziOL/TfwILm1t61in7kI2M=; b=
 NtFrFE2QVE+2ipr34uM+dRqKe3r3yLSuEPRUk+aYDIljPIYgY7ZfqwUFuXqzCNJo
 tVXrahJnvkYjxPmVezqczcfaQYbpJhcyl04KBH+2H0E7QqUVchPu2hRjiWq7IxPi
 qkZDpnBPu95f/t5XllvkNWBvsN7JXzRieMeUXTwYOabIQcgkhtdy1CgxqlIIGury
 LnqOLWomEzWCkMmHxbLdDEWt/RGB0c5usWNRAGGsUzrXFAzKIOZPIztMP2GOEpW8
 hcqidRHW+zWmSepLdUYcRMUbEbfzBZ80bY8Zr5n+P/kpBw5S7zzNSV/Kp3rDEOhB
 m2VQONs9b+WZxEApQ+Dk8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1771972016; x=1771979216; bh=r
 VzESsgVzPWBQDwiGwCUvziOL/TfwILm1t61in7kI2M=; b=FPYcK4wAdpHOQpMy0
 MDzN3mz8EVFuGNUjJhfFtFZd7hs8sHCL2JfMdhQ/xvOGleGZNmojqwUwBmoicAEf
 IpsbcDoIyJGAD+O2yuLEYwZ8b0Xk5Lqir7PTlRPpFF+XHbB5m07n+BzYSWW0+cfQ
 +7OEjYAEFuHw3wEtaROVsFegYjCrMtEExbYuGopVGmTSfJN0MCaYTIk/1JrefPA/
 qUKJNwAN1+f2qwDSDUhhhpu1WwXmj75W2O7ZogP/vIdQaP6gkcRJdvWUTexZdHf/
 1ZcCoqE70b+ixg7cEwY4Z6fLOwPNoYL3XCbKl4yXdOil49B5Kk1KwB0xtssZCYpE
 6foog==
X-ME-Sender: <xms:sCWeaZTFH_Y80I17DlByEuYMy-IHTcHLXyrXMPhQ1NhYblwZsp7rzQ>
 <xme:sCWeaWtfpKGGMn3_tART1Il-Bb8_-Cosh9q7jLSvusRozjBB55_9Wvb-z8jJl2gWr
 XKt05jGgsSpaeA23VueCGoIMAl6YpfRskjGe22k36DxXMpTfQ>
X-ME-Received: <xmr:sCWeaXUCGIrLnLQgIyleRGHpxZGe7gPwHfSuLZ3QmfkIfQAc-rCr6_sH2ibP8hUr-s6J9DREIQQSWqMbeQqYSsr67W8dguufr6UKBePDczxX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedufeekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:sCWeaak6Jopqhxgu5kKCAls78STkCAlYPhIAxwyqrSIWqXGVGvxz1w>
 <xmx:sCWeaaAij5tANGUxSlzPfLZVviMyKWRe87exWnbEZ_HXD2Lr4dn8hQ>
 <xmx:sCWeaf-P1n-IkAXVBf674gwbfLcULkG-SONZZ0y2zi3tVGh8zi9mCQ>
 <xmx:sCWeacSPv2ToPTDLDPQonRD3vk-eJ8QuW1_D1jJ8i8yl5xBEPWvg9g>
 <xmx:sCWeabqRgMOKYecizgJ8UEDERgd9V4tISucStSlY0JDUIMuS1lxRMPpj>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 17:26:50 -0500 (EST)
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
Date: Wed, 25 Feb 2026 09:16:52 +1100
Message-ID: <20260224222542.3458677-8-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.137; envelope-from=neilb@ownmail.net;
 helo=flow-a2-smtp.messagingengine.com
Subject: [apparmor] [PATCH v3 07/15] nfsd: switch purge_old() to use
	start_removing_noperm()
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:mid,brown.name:replyto,brown.name:email,name.data:url];
	NEURAL_HAM(-0.00)[-0.794];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[neil@brown.name];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 349A118D29C
X-Rspamd-Action: no action

From: NeilBrown <neil@brown.name>

Rather than explicit locking, use the start_removing_noperm() and
end_removing() wrappers.
This was not done with other start_removing changes due to conflicting
in-flight patches.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfsd/nfs4recover.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index b4bf85f96f6e..b338473d6e52 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -352,16 +352,14 @@ purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
 	if (nfs4_has_reclaimed_state(name, nn))
 		goto out_free;
 
-	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
-	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
+	child = start_removing_noperm(parent, &QSTR(cname));
 	if (!IS_ERR(child)) {
 		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
 		if (status)
 			printk("failed to remove client recovery directory %pd\n",
 			       child);
-		dput(child);
 	}
-	inode_unlock(d_inode(parent));
+	end_removing(child);
 
 out_free:
 	kfree(name.data);
-- 
2.50.0.107.gf914562f5916.dirty


