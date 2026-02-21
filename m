Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB15GrsxmmkYZgMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 21 Feb 2026 23:29:15 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3C16E22E
	for <lists+apparmor@lfdr.de>; Sat, 21 Feb 2026 23:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vtvT5-0001Wx-Vj; Sat, 21 Feb 2026 22:28:55 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vtvT3-0001Wp-LM
 for apparmor@lists.ubuntu.com; Sat, 21 Feb 2026 22:28:54 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.stl.internal (Postfix) with ESMTP id 3048B1300B3C;
 Sat, 21 Feb 2026 17:28:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sat, 21 Feb 2026 17:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1771712930; x=1771720130; bh=u3IlZMQ9LJJjVeIG+OSF9uldPDxrJqlL/6T
 gOp7A6+M=; b=dXKMwkzgQvxdsO2+qDRd6JurM9O9n4YdVnuSxRcxiuHonOiWZku
 FN7bhs97x56nqC9Y/S+8JqD/7Z8hlvaZXOyYgCHOcFyqug+rIFqmetWCflqclEBX
 U3HKWGPO5h32qy3xhXThzfQv5Qmvjk6sqQ+l2bYFmOzkaHZseVOmMnA9GUYHvI5u
 dyLtpcEDbuy4rYC6EVLJUsFP6wKBC/unpIOYnIm809wqjJaMeOlBNZQ7ZLdyeXSJ
 zJVmPn4At3FpSqhrlnTbNumO+HI91+IPb8Ui65SSUPz4XAXz3srUrhFyIFXkftjB
 V13ML1s5ViszfmYutdJ3cdB/gMvqPZHi1+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771712930; x=
 1771720130; bh=u3IlZMQ9LJJjVeIG+OSF9uldPDxrJqlL/6TgOp7A6+M=; b=M
 W+TZctEkN64dRsKnUJ2lljeCcZA4454y4+Irt1eRk/5VOjqCZsAHyuTLGuN0j4oz
 RcWblC+Ipj0ocCW/fTrtDQe6nq3uxKn87vMUc0K0sQm3zyJQJb2srNnidc29149z
 1PsDnHmx1yay8c+cAf1zDvPxQfH1qO0Dxl4lIxeW5silcgAuDwW5ap/V/MhJmgtk
 LL8Q7nWAYhFOEPjoV9/eRAdNg2q/FCLoc5qdawWaTj0gr/Ju48lXLuOtgF3e0WCl
 yXzRsJnqT7BKx5Gclt/4NAYlR2bMeFWL+d0Qxfgugrv2cxEhOfXqleO/AYs8PoIA
 V5QD5ACw97tmr+ygXvQoQ==
X-ME-Sender: <xms:oTGaafTZIgFHrwcqEwX0OWhBiyLoiJ7dh8xpTjlhz4aVlN8Lifs3gw>
 <xme:oTGaacWrqRZ151uqCE_3yKT7CzRx7-cpPPsr0nje5pxFMek-3d3N1u3UCJR2JXj5Z
 VqoJaAKyhmwGiy2Qw_yOJCKxytL1944pcSZQPcOYlPLanr7lw>
X-ME-Received: <xmr:oTGaaU29JxR2PccULCpDzVvNImiuBdIko2ImjSRi3u1tEZkku4wBZzbrg6PUMXFkWs2eoVfDh9PrXfG2LUhKU37w2GZxxzKchJJERpDvIc4y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfedvheelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtkeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epvdfhgfehkeekiedtleefhefhkeevvdegfffhgfduffeiveelffehlefhfeehveetnecu
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
X-ME-Proxy: <xmx:oTGaaT-7S5TVfbgkA8pNolMe7t1LSNSmFnMs810TBs_8phCNTbtsfg>
 <xmx:oTGaaadkucZtu9j60AveUDWw1P1FsB1XpKkjA4cAbMhsgWu1zJ8hPg>
 <xmx:oTGaaf609NUb58_R29zQiJvEZktz-GpoZRxvyTKJ7AZOdVpdq9KhQQ>
 <xmx:oTGaaWOdPa7ew4My6ZRBV7ztWMi1j-Vg8G-HHDF9COUMqv_h8H1j6g>
 <xmx:ojGaaZZXxAWMUvbEvJlBxCZvbsP49ApNcz7t6xV9_SRXC0fKsuJNSiW3>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Feb 2026 17:28:43 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Paul Moore" <paul@paul-moore.com>
In-reply-to: <CAHC9VhThChVk1Dk+f-KANGj7Tu7zzHCiA==taeQ+=nQaH6a7sg@mail.gmail.com>
References: <20260204050726.177283-1-neilb@ownmail.net>,
 <20260204050726.177283-6-neilb@ownmail.net>,
 <CAHC9VhThChVk1Dk+f-KANGj7Tu7zzHCiA==taeQ+=nQaH6a7sg@mail.gmail.com>
Date: Sun, 22 Feb 2026 09:28:41 +1100
Message-id: <177171292163.8396.10671162503209732019@noble.neil.brown.name>
Received-SPF: pass client-ip=202.12.124.137; envelope-from=neilb@ownmail.net;
 helo=flow-b2-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH 05/13] selinux: Use simple_start_creating() /
 simple_done_creating()
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
 Miklos Szeredi <miklos@szeredi.hu>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
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
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:brauner@kernel.org,m:jack@suse.cz,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,noble.neil.brown.name:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 2CB3C16E22E
X-Rspamd-Action: no action

On Sat, 21 Feb 2026, Paul Moore wrote:
> On Wed, Feb 4, 2026 at 12:08 AM NeilBrown <neilb@ownmail.net> wrote:
> >
> > From: NeilBrown <neil@brown.name>
> >
> > Instead of explicitly locking the parent and performing a lookup in
> > selinux, use simple_start_creating(), and then use
> > simple_done_creating() to unlock.
> >
> > This extends the region that the directory is locked for, and also
> > performs a lookup.
> > The lock extension is of no real consequence.
> > The lookup uses simple_lookup() and so always succeeds.  Thus when
> > d_make_persistent() is called the dentry will already be hashed.
> > d_make_persistent() handles this case.
> >
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >  security/selinux/selinuxfs.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> Unless I'm missing something, there is no reason why I couldn't take
> just this patch into the SELinux tree once the merge window closes,
> yes?

Yes - but ...

Once this series lands (hopefully soon - I will resend after -rc1 is
out) I have another batch which depends on the new start_creating etc
API being used everywhere.  So for Christian to be able to apply that,
he will need to pull in this patch from the SELinux tree.

So if you could apply just this patch to some branch and merge that
branch with your other work however works best for you, and make the
branch available, then I think Christian will be happy to merge that
with whatever vfs branch he includes my work in, and all should be good.

Thanks
NeilBrown


> 
> -- 
> paul-moore.com
> 


