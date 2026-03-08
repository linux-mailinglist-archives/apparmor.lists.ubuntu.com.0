Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO/tEf/irWks8wEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 08 Mar 2026 21:58:39 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B82323F3
	for <lists+apparmor@lfdr.de>; Sun, 08 Mar 2026 21:58:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzLCW-000590-IU; Sun, 08 Mar 2026 20:58:12 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vzLCV-00058o-5w
 for apparmor@lists.ubuntu.com; Sun, 08 Mar 2026 20:58:11 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.phl.internal (Postfix) with ESMTP id E5D3B13808ED;
 Sun,  8 Mar 2026 16:58:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sun, 08 Mar 2026 16:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1773003489; x=1773010689; bh=+iypvS0zaTSKL0sJFSGnV+90rJ7NwnakODh
 88UBVbxc=; b=Nyy1fGep1NAOdoC4ys0fihQQOAa4IL42zfq0IvtSw9HwYJLZAur
 Ps92XTBfup1MiJY2jk4/AQz2th5KZLEBqfMaYNhvwb99g0LBwKnM8xUEEKXdgKTn
 iEZgi2XRPUc5mOsju+U1SsZ0XuTk97e1G+TvaUs0UgEWuCEpGvKxHub7Fr8NzePQ
 F6jc70Xi+GLzG48D6AKuJRyzr/qNVEz6PSACk6zG7NyURmA+z9W+GYGQUz9Sequ0
 MDP8DWX9s7NcXZnQ17acBLw3uNCm42d4dV4qgFTfdT/1lWc1ZOIsJxzbxZXjIvWM
 uVaaeebTvdn1kw4vaeRvQyoQY4+vkAqWiiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773003489; x=
 1773010689; bh=+iypvS0zaTSKL0sJFSGnV+90rJ7NwnakODh88UBVbxc=; b=G
 HGSibMweZXfcFPVEa8qTAg1920mH8b3M5plTJQ4y5f96lM0ypf27HM4c/UAySBmm
 DZNhGy5ImsPGICRiTdhRP+TGXvBFmWPZY17dh7fXetsdhXCks4IMB/rP6iNp1iaU
 LK91YfzxM0GOGNH9+s3glVWI7DpuSJrqrRuxGMPR04EVCO/4tRv4OyVYYCSthsLo
 hVCdX/pAxOcMFN6CQkYecarwAp2sSGJQEDC2Nu+eqjJ5ZgA6455m7flLIqp54XFo
 jil7fvItfzmz1OnLWw0UW+svzSwXlPLSAQBfEev4w8rFBaDivkzKy7ULy0nxmm+M
 KgkBFxXdL2RO4I2Y5xVNQ==
X-ME-Sender: <xms:3-KtaSVctBSQ0SV_4hXsjWRkglm51vBgsco7eLnJzRkXOELG71FzoQ>
 <xme:3-KtaSjB2rGOr7OFkyfnq7Dp2t1nYH99sV9ZG2WLPsYFsLSdpnH6BKGWxcSwcl7o1
 oNTwtE7rLcKtqp-tzupFwXpCKt77cRv4Z4yxSfn4e5V4MeQvxs>
X-ME-Received: <xmr:3-Ktae5tS02XwBv-i39mfEyQVpaoQ-u3VFqQO8y4dRUul7KOwa5yqttp3ypt5BxZU3mf45hpnrzPGzLEU1_5oKoiZkHPceyr5LfUBLIaf1ix>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeeivddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epffetfedvgeevjeelhffhkefgffejvddtvefftdegueeiveffjeeukeffkeefkefhnecu
 ffhomhgrihhnpehmshhgihgurdhlihhnkhenucevlhhushhtvghrufhiiigvpedtnecurf
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
X-ME-Proxy: <xmx:3-KtaS6zJduiAbAHq99KcsXa77lpCopPadKmwp3x8ZIfGmkzNTCohA>
 <xmx:3-KtaUHxOA8u3U6E4eLAbRpC0yb57cCfAxRA4ha_pVtvmLiUgg9e7w>
 <xmx:3-KtaYwwNGnKGgahf3vu9ylTclTI_dSyC-frB-eGtBIC_WzxhkiWWA>
 <xmx:3-Ktac2Z1yfOcKeBZZnd8l7Su01udxDrDDt7_G5Nnt_T2jF2UNTW8g>
 <xmx:4eKtaa8I7VALp6o1nHvBb2BSlMCJyvLkZlfOMwwpOLNHk0sla81lLmFr>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Mar 2026 16:58:01 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>
In-reply-to: <20260306-stolz-verzichten-2ee626da4503@brauner>
References: <20260224222542.3458677-1-neilb@ownmail.net>,
 <20260224222542.3458677-11-neilb@ownmail.net>,
 <20260306-stolz-verzichten-2ee626da4503@brauner>
Date: Mon, 09 Mar 2026 07:57:58 +1100
Message-id: <177300347820.5556.314358492166337403@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.143; envelope-from=neilb@ownmail.net;
 helo=flow-a8-smtp.messagingengine.com
Subject: [apparmor] [PATCH] FIXUP: cachefiles: change cachefiles_bury_object
 to use start_renaming_dentry()
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
Cc: linux-nfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: E42B82323F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm1,messagingengine.com:s=fm1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.cz,paul-moore.com,szeredi.hu,kernel.org,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.ubuntu.com,lists.linux.dev,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:linux-nfs@vger.kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:apparmor@lists.ubuntu.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.149];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Action: no action


From: NeilBrown <neil@brown.name>

[[This fixup for f242581e611e in vfs/vfs-7.1.directory provides a new
commit description has preserves the error returns and log message, and
importantly calls cachefiles_io_error() in exactly the same
circumstances as the original - thanks]]

Rather then using lock_rename() and lookup_one() etc we can use
the new start_renaming_dentry().  This is part of centralising dir
locking and lookup so that locking rules can be changed.

Some error conditions are checked in start_renaming_dentry() but need to
be re-checked when an error is reported to ensure correct handling.
The check that ->graveyard is still d_can_lookup() is dropped as this
was checked when ->graveyard was assigned, and it cannot be changed.

Signed-off-by: NeilBrown <neil@brown.name>
Link: https://patch.msgid.link/20260224222542.3458677-11-neilb@ownmail.net
---
 fs/cachefiles/namei.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 3af42ec78411..c464c72a51cb 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -309,7 +309,26 @@ int cachefiles_bury_object(struct cachefiles_cache *cach=
e,
 	rd.flags =3D 0;
 	ret =3D start_renaming_dentry(&rd, 0, rep, &QSTR(nbuffer));
 	if (ret) {
-		cachefiles_io_error(cache, "Cannot lock/lookup in graveyard");
+		/* Some errors aren't fatal */
+		if (ret =3D=3D -EXDEV)
+			/* double-lock failed */
+			return ret;
+		if (d_unhashed(rep) || rep->d_parent !=3D dir || IS_DEADDIR(d_inode(rep)))=
 {
+			/* the entry was probably culled when we dropped the parent dir
+			 * lock */
+			_leave(" =3D 0 [culled?]");
+			return 0;
+		}
+		if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTEMPTY) {
+			cachefiles_io_error(cache, "May not make directory loop");
+			return -EIO;
+		}
+		if (ret =3D=3D -ENOMEM) {
+			_leave(" =3D -ENOMEM");
+			return -ENOMEM;
+		}
+
+		cachefiles_io_error(cache, "Lookup error %d", ret);
 		return -EIO;
 	}
=20
--=20
2.50.0.107.gf914562f5916.dirty


