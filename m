Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOUJGVamm2kc4QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 01:59:02 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2D1710AA
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 01:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuKHY-0006Ay-G6; Mon, 23 Feb 2026 00:58:40 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vuKHW-0006Ao-Hb
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 00:58:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id D387C138079F;
 Sun, 22 Feb 2026 19:58:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 22 Feb 2026 19:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1771808316; x=1771815516; bh=DklJ7QaNzY60ouXBE3vQgD59/j0C7qR0HGo
 OpNRhNRE=; b=WS36JgZLzCNCvf7u83w8D1akUAwRHAGGPZOPYLwmAZtetVSEavh
 /M8aA+bnpsZY3MbOFx8Qk5u1xQW+1yTsGXfBEKmrLRLH7f44vPC5vuhAkwtLxWLd
 ViECmvy6XA+2YpMaEIWyIBI00/zRX1X0+4fqINg0ILv+ZLW4BPPAy7gOBT63f8kk
 vFUwZ33xzHDc9t+iBbt/IVLp9cYJ8hz3ux69CqjJD551O81BEB44sXpDf6fYZPRf
 C7+/KaZHPsZYkb7buH6/xLG61Bf2DfMo+ZM0A8XMGSzpYGyxeI9qdEn3W/AHOfiM
 XAoPgJ4BwUxA8xm5n0JfFaw+LIIdQaNST9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771808316; x=
 1771815516; bh=DklJ7QaNzY60ouXBE3vQgD59/j0C7qR0HGoOpNRhNRE=; b=Y
 emWHJ7X4KG9K7xx4srB5xchCIFGHRAKQswO67rUymDVKOY9IKyx0v+LnZXNSMER0
 j7iNxVaXpR/KLl1G1b4CCsUmBbghyYjBCAveRRz+qghTzfKL1VA5Oov7I7Xop/7n
 PweHe/k6XO1hS8xOnYMe2RcbZqorao//4m6zemr7Ik+mfLRaLt4Lajl0cdE6YKmS
 IDyoDz7a18U5Pf6jijhrpmAELV8HbFiHqX4cAsx9o1qO3rQZanDLhrlK6d3feWO3
 lGO7alOYhyqdifL71CIa6FJ/e+WROUJW827+jVrTjd1uGkmRT+Rx7QjtaC10uAXl
 RQ/m74qWowKUroX3xz6jA==
X-ME-Sender: <xms:OqabaQs3xGjeOu7AXcUNleF5_Y8iRBzijPW_ZaeUkYQqeg9Emhqolw>
 <xme:OqabaZD4NPOosHvf41NHVUW3Z3awp9auUwVA_XupvQ5p3vVninFP4qmPAMXIiDS58
 TLwJuL0gQcRPfbjhsZaAlRwRFZzUkQHJJl0Rtvser53x7FoRw>
X-ME-Received: <xmr:OqababzRmffLRzqdvW2p80u8-uEnrmftH0zXIK9cBSm0y9V4lswgcCUqslNuPjtI5T84LYpY1RfNF9WhgYlJ6BbqKcNswQO5ogy4UiWsiGAy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeehkeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:OqabaYIojgLIp2j8qPFkfsns7llliXUf95aJkPdy-HRC_hWJtOfffw>
 <xmx:O6abaS4c8DrJ0klm8azSCh0JAdPfi6zGgDwVJTJgUElF-nSPAf4FrA>
 <xmx:O6abaXkjmLxkwBpheH-MiJTvcuS5e8O8wfGIHRHvVW80qHpe6ZgQXQ>
 <xmx:O6abacIpejrj6FmGLnsy0_hswmNu0CibhEG46r9c4nUZCK0MVZXjhA>
 <xmx:PKabaVUBny8QxSSIbfK1LvZkUX2fxVVzGlpN_ICcTX_0cB6WcVMy3PoG>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 19:58:29 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Paul Moore" <paul@paul-moore.com>
In-reply-to: <CAHC9VhTv+K44q7+5d17jS8h9fJY_JfQVUw5NPNvPzjkHDpqp=g@mail.gmail.com>
References: <20260204050726.177283-1-neilb@ownmail.net>,
 <20260204050726.177283-6-neilb@ownmail.net>,
 <CAHC9VhThChVk1Dk+f-KANGj7Tu7zzHCiA==taeQ+=nQaH6a7sg@mail.gmail.com>,
 <177171292163.8396.10671162503209732019@noble.neil.brown.name>,
 <CAHC9VhTv+K44q7+5d17jS8h9fJY_JfQVUw5NPNvPzjkHDpqp=g@mail.gmail.com>
Date: Mon, 23 Feb 2026 11:58:26 +1100
Message-id: <177180830631.8396.10805264856218061422@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.136; envelope-from=neilb@ownmail.net;
 helo=flow-a1-smtp.messagingengine.com
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,paul-moore.com:email,brown.name:replyto,brown.name:email,noble.neil.brown.name:mid]
X-Rspamd-Queue-Id: 18D2D1710AA
X-Rspamd-Action: no action

On Mon, 23 Feb 2026, Paul Moore wrote:
> On Sat, Feb 21, 2026 at 5:28 PM NeilBrown <neilb@ownmail.net> wrote:
> > On Sat, 21 Feb 2026, Paul Moore wrote:
> > > On Wed, Feb 4, 2026 at 12:08 AM NeilBrown <neilb@ownmail.net> wrote:
> > > >
> > > > From: NeilBrown <neil@brown.name>
> > > >
> > > > Instead of explicitly locking the parent and performing a lookup in
> > > > selinux, use simple_start_creating(), and then use
> > > > simple_done_creating() to unlock.
> > > >
> > > > This extends the region that the directory is locked for, and also
> > > > performs a lookup.
> > > > The lock extension is of no real consequence.
> > > > The lookup uses simple_lookup() and so always succeeds.  Thus when
> > > > d_make_persistent() is called the dentry will already be hashed.
> > > > d_make_persistent() handles this case.
> > > >
> > > > Signed-off-by: NeilBrown <neil@brown.name>
> > > > ---
> > > >  security/selinux/selinuxfs.c | 15 +++++++--------
> > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > >
> > > Unless I'm missing something, there is no reason why I couldn't take
> > > just this patch into the SELinux tree once the merge window closes,
> > > yes?
> >
> > Yes - but ...
> >
> > Once this series lands (hopefully soon - I will resend after -rc1 is
> > out) I have another batch which depends on the new start_creating etc
> > API being used everywhere ...
> 
> Okay, thanks for letting me know.  I was curious about something like
> that based on the cover letter, but the timing wasn't clear.
> 
> Acked-by: Paul Moore <paul@paul-moore.com>

Thank!

NeilBrown

