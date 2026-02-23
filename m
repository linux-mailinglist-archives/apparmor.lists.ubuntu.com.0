Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN0KMw7PnGllKQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:05:02 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49217DF60
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:05:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vue2l-0005cn-Dn; Mon, 23 Feb 2026 22:04:43 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vue2j-0005cJ-C5
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 22:04:42 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id 321D11380B23;
 Mon, 23 Feb 2026 17:04:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 23 Feb 2026 17:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1771884280; x=1771891480; bh=irJDLVX2qQd7f5zlPhvRXNbNOW59zFnQ/W/
 IgkKi5wQ=; b=Ws9UlC4rdriRa58ciza8b/c8892GSffjK4vkvwK954POlcz2OLd
 VocxQMBMIDIuYSfHzGqq1u5KvY1ucluTa8LIMX0UGJUqfwEePKk83cHtYriVfunu
 hDcEejJZw0ihKjkBsQifj50+BH2BTncg1WYH53Sa4hXmmgw+tvUfbL62iD5CIbLM
 e+bGRRQxJxafgNPvlM52xGDBrGl3uBBnwTRlbpJdBEycTqioZhsoEJobcQeWg/8b
 9+KNyq6UcQ/ckMD6PHGquMFUrOuo5l7JnPCdf4YKbzQ6Z1YWnnN0+AyDt/FQgf37
 V3RHM7FhB4x1u7gi8ODZn1J8lxdpWQ2Dwbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771884280; x=
 1771891480; bh=irJDLVX2qQd7f5zlPhvRXNbNOW59zFnQ/W/IgkKi5wQ=; b=g
 SfvEOQLw03OJS55vANdkI8ZK0mDTjV4rbPiMQP5hk6tPdiUTcgzHORJVzlnh5yhW
 MhpnHbAVh3lvmU1AOT+1Q4s4jALw3pvSXLsufb4tq8KacyUcoBx2R5WCgFxr4J+f
 LIs8YnOBRBhlbxePazNlKj4WmdTLL89NDXcQFYuYEA2O7XioXR6xuqEkAMnk8hXM
 +LEVTJAUGamZd6PHdG2P1yxTMEdJLbtMzbHLDNj0wOmIZ0WwBcw8jGxhAbpjVpgX
 9Tp5bK3mSBrg4VKtftuNK4jj9oz8BdO7KI6/Yp/0Y+w2KEttE+RiTcBS9oEr1xXs
 P/rN2/vGT8nSvuCIgPRIw==
X-ME-Sender: <xms:9s6caajI56O9imISxyOkzDSC_MpwrChoCCPHEQJo0aQxIfr3tWOa6w>
 <xme:9s6caXKOeQt2WKMFpfvQ0M6rtsLaOeE6RUgFu7T32IgxFtnf8nXYHcFqhYmtOvHR1
 O2GGx91cKWKeMEZxzbbl1myQDCyLQiY8X13fNZTGLITpedG8w>
X-ME-Received: <xmr:9s6cad5eHm4bz9KWixR0h9Yx4lOHceVBloWp1EP5PO2FzM3jijsihFMEheV0EkxjYQqbo-mPF6h1P8WQ8NOY6VIdP8n1_0ww6BJoDU_OgeVC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekfeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhr
 tghpthhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:9s6caclzLrgKfeDhlox16fw51GXG-3HrDff5GauOyjg85bKiL4YmNg>
 <xmx:9s6caX6TGDCjSAAqAFbyiuqfkVrSrwQwMHwy5d8W07K53q3z5lNFXw>
 <xmx:9s6caV_2kCQ1Lik20KddbFxgbSwKSj3rN2G2aUmuymGiRuDLfloUBA>
 <xmx:9s6caXidElUn8Kg0ersqdtpRNxuaxlxy_QnaPAYc7wp0BUi5SC4-8Q>
 <xmx:-M6caRagjaoVbqBcqtcqEGXNSfbjV9m04SvT9GVJMVNOcNe_crWGDOHL>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 17:04:32 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Chris Mason" <clm@meta.com>
In-reply-to: <20260223135517.1229434-1-clm@meta.com>
References: <20260223011210.3853517-1-neilb@ownmail.net>,
 <20260223011210.3853517-2-neilb@ownmail.net>,
 <20260223135517.1229434-1-clm@meta.com>
Date: Tue, 24 Feb 2026 09:04:27 +1100
Message-id: <177188426768.8396.6205782771317375008@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.138; envelope-from=neilb@ownmail.net;
 helo=flow-a3-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH v2 01/15] VFS: note error returns is
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 Miklos Szeredi <miklos@szeredi.hu>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm3,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[ownmail.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:email,brown.name:replyto,brown.name:email,noble.neil.brown.name:mid]
X-Rspamd-Queue-Id: 1A49217DF60
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, Chris Mason wrote:
> NeilBrown <neilb@ownmail.net> wrote:
> > From: NeilBrown <neil@brown.name>
> >=20
> > Darrick recently noted that try_lookup_noperm() is documented as
> > "Look up a dentry by name in the dcache, returning NULL if it does not
> > currently exist." but it can in fact return an error.
> >=20
> > So update the documentation for that and related function.
> >
>=20
> Hi everyone,
>=20
> I don't normally forward the typos, but since this is a documentation-y pat=
ch:

I'm certainly happy to receive them.  Thanks for these and the others

I also found ....
>=20
> commit 0254b9b974f23889898562aa94f6428bf30eb6b5
> Author: NeilBrown <neil@brown.name>
>=20
> VFS: note error returns is documentation for various lookup functions
>                        ^^^^^ in?
>=20
> Darrick recently noted that try_lookup_noperm() is documented as
> "Look up a dentry by name in the dcache, returning NULL if it does not
> currently exist." but it can in fact return an error. So update the
> documentation for that and related function.
                                     ^^functions=20

Thanks,
NeilBrown

