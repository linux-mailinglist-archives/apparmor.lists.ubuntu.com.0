Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLOsLlhOhWn5/gMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 03:13:44 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC5F9281
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 03:13:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1voBLc-0004LU-VC; Fri, 06 Feb 2026 02:13:29 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1voBLa-0004LJ-SZ
 for apparmor@lists.ubuntu.com; Fri, 06 Feb 2026 02:13:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id 9F2031380A31;
 Thu,  5 Feb 2026 21:13:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 05 Feb 2026 21:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1770344005; x=1770351205; bh=Der/iBPz0bTAQUrlq6AggVf+YeGtgy0yYRy
 VCtjT39s=; b=gnx2XQOXx3FWpUVdJtFMUJc0wa/drpccuhBehgg6EDAAdpuB7WN
 P7tbOc2DW2OmsOy1yLdrH0G3FUdlcqaVtqhn/I4SyHOUNUEwa5ItaTdvTW3kG/vz
 gsJ8vQJT5k5rAGnicKq7gfF0psrYi/t7emVgJCs12citQ3qC32hg1inln0NFyfGR
 EQyiDaljWjjrKsj8JVIxL3W6ABLwPwo681gX3DIkhPVbUqR1I48vEO44037tlklc
 PTls3r2Ifdo4VYOMVmVzp9GT6nN5miqiF6MRzexJVQ0Gzxn7uz7a3oEZL+ueRa4x
 lLsJDXFYypQ502WLzNd0th0zu6b3BMEX6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770344005; x=
 1770351205; bh=Der/iBPz0bTAQUrlq6AggVf+YeGtgy0yYRyVCtjT39s=; b=a
 5qpou8za+to0Pc5x5+DqWPyj2/p6RAlzAeQrnp+DiZ6Xii8WXUa/73culdncsa8u
 CrCe1x+xZ9ZlBYyKP74s/fdhkpziwSoPjPkKzGJnR36hdAB7mKW8d4t0j5GrDoa9
 aO6f4gZsYnSKx2H6tYshBDal90FLo+PaBrHHkEBFwnRoN96b7B5lxXM4B487H9b7
 8/y2rHogNRwbyjjmz9N9i0B43CcG+sD9T+ObV2GWZxkL9tBA6DMqDha/x+c9fLj3
 v7qnVU4hY6pCUjipvsxWbYv/1aHnIO/0ByrO68NAuSbPy9rSAU9Z04PL3kiEl9k7
 VPBsG77erltlEtN1/x/zQ==
X-ME-Sender: <xms:RE6FaeKNVFsteuxAUkvtyFuCENf7kE9iXUBEReSZUnY--ClX0rxTYw>
 <xme:RE6FaRsc42jKTPIvbiDFp3QDAR7RWAFR3sJcfBTFokh9MniNs3qp9__kf2-oMTE4G
 mIv4n09q8J_2fTnLoYexaIrBWSdjtp7Hn8ofLD8vShz0NRjoqk>
X-ME-Received: <xmr:RE6FaevV0dRzkEv2wFyjw3sZHxjl4D4IPZmRjjd8IbEVTWu_oRIpperSAVDtO54iGhVrFTd9kQp35ulk2cztl3XYiOVYpY6Ky4Ds5MsBrp1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeileehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
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
X-ME-Proxy: <xmx:RE6FaYUqfiTVjjc7uwD6Khuvzq1MbTs-uagr7sQG5pRzMrabxb3N9w>
 <xmx:RE6FaXWps8SOb03BNmdBtieIicQx0iChTDZxTPLB5iUe8ssHFqk0fw>
 <xmx:RE6FabQUPeUtbog8Fjomd9qRAGywmOmFd2-rhHdJ-UfbrEtzF9T6aA>
 <xmx:RE6FaeHh00XhYvRBT-OUwFZOuUYaUwQrvjdY5duX25DzeUveJeJNLA>
 <xmx:RU6FaXNgedOJkBgZWdDwnTA47kNbV-41uUKDbG4vGUQlusLf99f3Le7f>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 21:13:18 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <8d907c67ccab1db0e7bcabe0c34c66722a2970e2.camel@kernel.org>
References: <20260204050726.177283-1-neilb@ownmail.net>,
 <20260204050726.177283-4-neilb@ownmail.net>,
 <8d907c67ccab1db0e7bcabe0c34c66722a2970e2.camel@kernel.org>
Date: Fri, 06 Feb 2026 13:13:16 +1100
Message-id: <177034399605.16766.3111281029834170576@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.143; envelope-from=neilb@ownmail.net;
 helo=flow-a8-smtp.messagingengine.com
Subject: [apparmor] Re: [PATCH 03/13] libfs: change simple_done_creating()
	to use end_creating()
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm3,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,gmail.com,lists.ubuntu.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,brown.name:replyto,brown.name:email]
X-Rspamd-Queue-Id: 66CC5F9281
X-Rspamd-Action: no action

On Thu, 05 Feb 2026, Jeff Layton wrote:
> On Wed, 2026-02-04 at 15:57 +1100, NeilBrown wrote:
> > From: NeilBrown <neil@brown.name>
> > 
> > simple_done_creating() and end_creating() are identical.
> > So change the former to use the latter.  This further centralises
> > unlocking of directories.
> > 
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >  fs/libfs.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/libfs.c b/fs/libfs.c
> > index f1860dff86f2..db18b53fc189 100644
> > --- a/fs/libfs.c
> > +++ b/fs/libfs.c
> > @@ -2318,7 +2318,6 @@ EXPORT_SYMBOL(simple_start_creating);
> >  /* parent must have been held exclusive since simple_start_creating() */
> >  void simple_done_creating(struct dentry *child)
> >  {
> > -	inode_unlock(child->d_parent->d_inode);
> > -	dput(child);
> > +	end_creating(child);
> >  }
> >  EXPORT_SYMBOL(simple_done_creating);
> 
> nit: seems like it would be better to turn this into a static inline

True ... but then it could have been a static inline anyway.
I'd rather not change it without good reason, or knowing what it was
written that way.

Al: do you have an opinion on this?

Thanks,
NeilBrown

