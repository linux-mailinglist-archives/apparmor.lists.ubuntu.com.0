Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLiHC4FDq2nJbgEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 22:13:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B47227C6D
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 22:13:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vycTq-0007T0-5m; Fri, 06 Mar 2026 21:13:06 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vycTn-0007Sf-Bq
 for apparmor@lists.ubuntu.com; Fri, 06 Mar 2026 21:13:04 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 079EF1380802;
 Fri,  6 Mar 2026 16:13:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 06 Mar 2026 16:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1772831582; x=1772838782; bh=SUz8M1egzctlh1WXyoTdVp/oTcO7/zgWIgK
 98brzsm4=; b=HlxTIAzeLS2uNNVP+RhNxfBe+oZpDrCU4n70ZiojrnYqFeFbIM7
 uAz2lCKYh1dAymJFvhnBTsBgyEt+dmuY41WMv8rp7n0lDXIt+7r4NxFcn/tPz833
 QG0yH8lHIFYL3mhBfIAy72GQlEO33gH0pjqlR2D8mgBti69354Pp7B73Vmw7XWa4
 Zp3LdOKao48M2COj5V5ffdNHBKxXnvMUZvcgMdb/c6nZkA8hDiwy9DnqsJnoIf9a
 HgRT5JB6VIqIUWVEMIJblkbADV7CLltVMf0e22zae31NU0zlq6RsTdMH1XEszwMK
 3rcPPF2t0dgeYbG4mxDdStPempiEi0PLn5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772831582; x=
 1772838782; bh=SUz8M1egzctlh1WXyoTdVp/oTcO7/zgWIgK98brzsm4=; b=T
 a2Ad3ig3nQaJ45wPtCUpa0DzgXbM3NSNcxG/j9dA2aOzd1ybn6RvWA3lhj6rdaK2
 ilp9E6GRTPZDvfarKILUN341YIMkCy5f2ASgf49qPW1Uw7YVoF6GtOjW7tTOr0sl
 us7U4Ekty5uwdZAcvFe0uW8FT0EX8dqJgmhvgjOusmrlz9RVpzOL8vB8QuJTzi13
 bDBlokf2tdXv9RCgVUvSz33n8s1N489VTANDALSXFaT1amXae1LMlh17bhePcsSV
 Vq2/x9zwasamvDKfLWEWq97XQPXuZUJfYv1bICYbcCLlJqpgwKYCpSy1NgFLoMma
 y2zapZ3xdmM7S+DTAS8GQ==
X-ME-Sender: <xms:XUOraZKmAHFhOFLXtoq1DnCXSe4kN_oyU5asJsD7r8s_WLkFo5yLtg>
 <xme:XUOraZFfsKsS5Bm-1qYg7nTzBwR__oF37VwH6npkTm08xdxkcSrEbzrDvJpbEB8i7
 2ztHcrpTcfe-f4DImJcbPTyRoYb8eqMyqcazsUQWIrmGlP3Zg>
X-ME-Received: <xmr:XUOraaM2XrAU1gJY5t1PIsX89jcVHFJfEXO_Ok2AbUIhVYVbw_bctxxLSQH8UBSb6Qzje2l_AcE3nQ4pDhuO_XKgOjpMqFxfx0_KrO6tJKxt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtfeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
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
X-ME-Proxy: <xmx:XUOraT_GU-eRpH9KjbQUxaeFH3Ik-X2YnIknIPEpYLe3LAAFu5cuMg>
 <xmx:XUOraX5VpPUBfROPEJ8o3FBE6KmlXfSQKgogNn2tecZhXCtQc5cxEA>
 <xmx:XUOraYWsOE9k6kp7pvWeY0jS8GZtsY7Dxvg3Yw3BK7Mbj8qd82IZvg>
 <xmx:XUOradIYrlYpCmTlBrPeFiMRjUCjvZcXllQ0Dos_cDuzwpR0fIUA1Q>
 <xmx:XkOraXAuoiNIIXbw0nIirtgzAtoSS2j1NQ5_WUd18Tl9iwt-WLLSABX7>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Mar 2026 16:12:55 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>
In-reply-to: <20260306-fastnacht-kernig-3b350bd2fab0@brauner>
References: <20260224222542.3458677-1-neilb@ownmail.net>,
 <20260224222542.3458677-6-neilb@ownmail.net>,
 <20260306-fastnacht-kernig-3b350bd2fab0@brauner>
Date: Sat, 07 Mar 2026 08:12:50 +1100
Message-id: <177283157032.7472.10017547355182129224@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.140; envelope-from=neilb@ownmail.net;
 helo=flow-a5-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH v3 05/15] Apparmor: Use
 simple_start_creating() / simple_done_creating()
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
X-Rspamd-Queue-Id: C8B47227C6D
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
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.149];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto,brown.name:email,noble.neil.brown.name:mid]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026, Christian Brauner wrote:
> On Wed, Feb 25, 2026 at 09:16:50AM +1100, NeilBrown wrote:
> > From: NeilBrown <neil@brown.name>
> > 
> > Instead of explicitly locking the parent and performing a look up in
> > apparmor, use simple_start_creating(), and then simple_done_creating()
> > to unlock and drop the dentry.
> > 
> > This removes the need to check for an existing entry (as
> > simple_start_creating() acts like an exclusive create and can return
> > -EEXIST), simplifies error paths, and keeps dir locking code
> > centralised.
> > 
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> 
> Fwiw, I think this fixes a reference count leak:
> 
> The old aafs_create returned dentries with refcount=2 (one from
> lookup_noperm, one from dget in __aafs_setup_d_inode). The cleanup path
> aafs_remove puts one reference leaving one reference that didn't get
> cleaned up.
> 
> After your changes this is now correct as simple_done_creating() puts
> the lookup reference.
> 

Yes, I think you are correct.  I remember reviewing how ->dents was used
to confirm that the new refcounting was correct.  I didn't notice at the
time that the old was wrong.

Thanks,
NeilBrown

