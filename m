Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALw/E27bqGnGxwAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Mar 2026 02:25:02 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C9209CB9
	for <lists+apparmor@lfdr.de>; Thu, 05 Mar 2026 02:25:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxxSO-0003oX-96; Thu, 05 Mar 2026 01:24:52 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vxxSM-0003nf-Fp
 for apparmor@lists.ubuntu.com; Thu, 05 Mar 2026 01:24:51 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailflow.phl.internal (Postfix) with ESMTP id 0F5ED1380E14;
 Wed,  4 Mar 2026 20:24:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Wed, 04 Mar 2026 20:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1772673889; x=1772681089; bh=pHow27CTfPDvgGL29iyDc6nQ4fjpzyYL5lv
 mt+hLriQ=; b=fS1CK1OAQhIegJ19aVS0NBBw14oXk8mzezIRJvAKaXQt6wZk1QN
 QyLs07K4449ND+SR7dhuFNaz+DkpMCENe9edX65fMOZE8vNIETM4ctq15oQJ1xAj
 IASPRLB3GuikAUa+P85jb1NzwDHQVSJaLr3PiCo5pjUpXgZMT6tUnaKsZPUpMoTB
 q4MuZ1PkwcVP0wuHrDCy1sq1os7WCw2al7Ao5rBGZjtk4WImMh25cAcGYH7IzMYt
 qUGQwsG1Gl/qRF+/hfqX5Go7tCF6J2Eg4mWLzByuGIWjbhm60CkTkyu3nsAFg5gh
 QsB62PwimFCALvZrNF8SuGoR2RASKF+9N9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772673889; x=
 1772681089; bh=pHow27CTfPDvgGL29iyDc6nQ4fjpzyYL5lvmt+hLriQ=; b=z
 UZbV8qF1pUA4oX+oEhgbjXEd6Qz84vUCLWVNrmELGTAt7XsjDqlWTNaFfPpHE3bJ
 kMNZTY8rLo9r5EDXJxEyZ3A1QJS87loj+JnftGi9XEKIpAJQVpo11yA5L0nVKBbb
 1UyY7juYTNfIaFa7hWHhHDfDhoXGb4g6P1eBDBFXNOWDwoTu5tDWOsMK+UfDlsJ3
 8BXfwlGl8fvuqlXSD6JbeESKC/r2tbA+X5Ib8Ao6050Wenr8ysEYn6SF1uPhd7m3
 oM4l2EDbDeEQoQmu734V1MTKW1dg57hrCOO9MPgWK0xcwEz5ZsIsMSk0rPkOz1nl
 C08mNGz1OuRmU4Mnj/mOQ==
X-ME-Sender: <xms:X9uoaZyO8jjwzvZMObvAu_oGj1IqHp_V3PfAvAnBAuUZkRw8xP3l4Q>
 <xme:X9uoadMnYbkMLjUd7fzbzl4AMAvZQ8WNnha6k3Czu0U52hyQQonXEZLS12MaLKN2C
 MfhzvgweCg0JiTEgSIDO8Vk741TqUiGR_ieVtepTGiwddvfEQ>
X-ME-Received: <xmr:X9uoab3GZjHMqCmmD6HykudsWGTS1J0FNhd6kvBf8XStgOYIntA2X2d8AdRjB-PjdvYSry1kxymqO-MTcopwZgHWFz-z3NynmgT-IKGCm4BC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieehtdeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
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
X-ME-Proxy: <xmx:X9uoaVF9aO2rFJfMo9ZYL-rjkjx-_hWBa1Y12rAj2w8CayyWtOGBWw>
 <xmx:X9uoaSh0iIkn877feRTUOzlbn3ySdhcr3gz3o8Kxm7eMSJUmXq0DRg>
 <xmx:X9uoaed2nuv1cxb9PBp9Rv7ou0Gkx-R2lM9ok6f10GCTojgs9qF02A>
 <xmx:X9uoaYxQMfDOzeYFQ4QFTCd42scQ48clntS8IR4tMTF1ZFP2AxKpCA>
 <xmx:YduoaeI_V-Uu4J5ku4xeQFzYsT6m2VzogBuSJbtMi1at18Dh4rQfWEYV>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Mar 2026 20:24:41 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "David Howells" <dhowells@redhat.com>, "Jan Kara" <jack@suse.cz>,
 "Chuck Lever" <chuck.lever@oracle.com>, "Jeff Layton" <jlayton@kernel.org>,
 "Miklos Szeredi" <miklos@szeredi.hu>, "Amir Goldstein" <amir73il@gmail.com>,
 "John Johansen" <john.johansen@canonical.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>
In-reply-to: <20260224222542.3458677-1-neilb@ownmail.net>
References: <20260224222542.3458677-1-neilb@ownmail.net>
Date: Thu, 05 Mar 2026 12:24:38 +1100
Message-id: <177267387855.7472.13497219877141601891@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.142; envelope-from=neilb@ownmail.net;
 helo=flow-a7-smtp.messagingengine.com
Subject: [apparmor] Re: [PATCH v3 00/15] Further centralising of directory
	locking for name ops.
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
X-Rspamd-Queue-Id: E52C9209CB9
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
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:dhowells@redhat.com,m:jack@suse.cz,m:chuck.lever@oracle.com,m:jlayton@kernel.org,m:miklos@szeredi.hu,m:amir73il@gmail.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:djwong@kernel.org,m:linux-nfs@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,zeniv.linux.org.uk,redhat.com,suse.cz,oracle.com,szeredi.hu,gmail.com,canonical.com,paul-moore.com,namei.org,hallyn.com];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.814];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid]
X-Rspamd-Action: no action


Hi Christian,
 do you have thoughts about this series?  Any idea when you might have
 time to review and (hopefully) apply them?

Thanks,
NeilBrown


On Wed, 25 Feb 2026, NeilBrown wrote:
> Following Chris Mason's tool-based review, here is v3 with some fixes.
> Particularly 06/15 mistakenly tested the result of start_creating for NULL
> and 09/15 had some really messed up flow in error handling.
> Also human-language typos fixed.
>=20
> This code is in=20
>   github.com:neilbrown/linux.git
>   branch pdirops
>=20
> For anyone interested, my next batch is in branch pdirops-next
>=20
> Original patch description below.
>=20
> Thanks,
> NeilBrown
>=20
> I am working towards changing the locking rules for name-operations: locking
> the name rather than the whole directory.
>=20
> The current part of this process is centralising all the locking so that
> it can be changed in one place.
>=20
> Recently "start_creating", "start_removing", "start_renaming" and related
> interaces were added which combine the locking and the lookup.  At that time
> many callers were changed to use the new interfaces.  However there are sti=
ll
> an assortment of places out side of fs/namei.c where the directory is locked
> explictly, whether with inode_lock() or lock_rename() or similar.  These we=
re
> missed in the first pass for an assortment of uninteresting reasons.
>=20
> This series addresses the remaining places where explicit locking is
> used, and changes them to use the new interfaces, or otherwise removes
> the explicit locking.
>=20
> The biggest changes are in overlayfs.  The other changes are quite
> simple, though maybe the cachefiles changes is the least simple of those.
>=20
> I'm running the --overlay tests in xfstests and nothing has popped yet.
> I'll continue with this and run some NFS tests too.
>=20
> Thanks for your review of these patches!
>=20
> NeilBrown
>=20
>  [PATCH v3 01/15] VFS: note error returns in documentation for various
>  [PATCH v3 02/15] fs/proc: Don't lock root inode when creating "self"
>  [PATCH v3 03/15] VFS: move the start_dirop() kerndoc comment to
>  [PATCH v3 04/15] libfs: change simple_done_creating() to use
>  [PATCH v3 05/15] Apparmor: Use simple_start_creating() /
>  [PATCH v3 06/15] selinux: Use simple_start_creating() /
>  [PATCH v3 07/15] nfsd: switch purge_old() to use
>  [PATCH v3 08/15] VFS: make lookup_one_qstr_excl() static.
>  [PATCH v3 09/15] ovl: Simplify ovl_lookup_real_one()
>  [PATCH v3 10/15] cachefiles: change cachefiles_bury_object to use
>  [PATCH v3 11/15] ovl: pass name buffer to ovl_start_creating_temp()
>  [PATCH v3 12/15] ovl: change ovl_create_real() to get a new lock when
>  [PATCH v3 13/15] ovl: use is_subdir() for testing if one thing is a
>  [PATCH v3 14/15] ovl: remove ovl_lock_rename_workdir()
>  [PATCH v3 15/15] VFS: unexport lock_rename(), lock_rename_child(),
>=20
>=20


