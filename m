Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA3OITVEq2kKbwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 22:16:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CB227D5E
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 22:16:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vycX4-0007lH-CW; Fri, 06 Mar 2026 21:16:26 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vycX2-0007l3-Pj
 for apparmor@lists.ubuntu.com; Fri, 06 Mar 2026 21:16:24 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 7C033138098B;
 Fri,  6 Mar 2026 16:16:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 06 Mar 2026 16:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1772831783; x=1772838983; bh=Ab8MrdB2xn5ObAHYuc8S2EbzsQbqvnFcs2E
 SbOGqQKc=; b=UVAQhacPc5XIYM9fEieLMrbbP4mz7xOBtKxVB+jA3mYd94wd+dF
 jEXzQY3ONA0MGR3X5WwGY4b7q3XwxeFX3wq2coJUKuMI96TEIRRqFJ+/qNdjDNWv
 Gd5FHc2PbfPSrd9O+gW0JjxQfKgvbV98ORq6w0G9LV4Wz418LzdeNcly0jWOCgqw
 DJh1DbmjKcx/mEMpsLNvubkQonu2mWGxmt2mgSnuAgo9fz2MXyLLO/W6MXEP0/at
 ESNsMh7IlfoSXol1+A5Ex7PhnyysuWIqn1IOSLvDFQwWeCeRU3haz3CvAr9+ifa0
 23GiQZwCsMsd8eZnEJQjDWRuPrUvZsAxEyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772831783; x=
 1772838983; bh=Ab8MrdB2xn5ObAHYuc8S2EbzsQbqvnFcs2ESbOGqQKc=; b=V
 y0WAoWAK7T67vqma/jdF1OOgiymtNP7nJANg1VtrdE5A9t5fjGaHY1G5WZWPw9LC
 UiAKagfYVdA4frDZhs56+nrazJiwuxj32lU8pX1X9X8raFvHJcQA7VqpX9L1pPph
 NOk+XxSIeFJoj45+mUB9k4hl0A8dUFhMCEQpyvoNqSMl9wvELeh4PROXQ4y1vYP9
 t1sB23ze6OXSU0MomtZcUvcbNSAvI4nnZPa1UJNUBS+lc/dIJpOw9jUyJfLvHm9t
 TigJFbwN5k6U8BlRsbrrI7VJetauC4ewDNo/1G+5NqaJHVPNM4jcFUnnhMbeWtpM
 vSfsxGoaLrqC+Bk1bDwLA==
X-ME-Sender: <xms:JkSrafQhLITjPiq0amdhmpkUbxlxXCSbJ5MOMQyZYLD3hDiEgFk-Wg>
 <xme:JkSraUv0ZaCvsdoVLliqEx6OVARx3ampkfHw1dOYOSfQlp_cM2YYaswN8z9nHJG-6
 -wfvgocjC0P4YJaX0MLF8jyeqJjMQwnCjlNrvVA8VWKA0BF6g>
X-ME-Received: <xmr:JkSradWlxWyX1LDdEVNr_gqJIbQypMFQscxHyziJ5Y-602V3lU_PrZTKVRqTO72vRywD61jqdDZ4QyBqx02GFPQKvWWviVoq1djZkcQ1hR-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtfeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:JkSraYkKXev7nWHoUUKReSkmUFpmphxn6OD05b8LjrKgcrxUQ9_7JQ>
 <xmx:JkSraQDlKCGfhubivZyvPvLT40RSy0qS6U3eQy-tWOT86jED3JoiVQ>
 <xmx:JkSrad-ScPeN4sl-OA9v-z2Mxc4yIE6WEbDzhlshfakRoInVDU8fkQ>
 <xmx:JkSraSQJaJb6gkiuPjPftwxA1nSbRkeSmCnEylob_GFzeruPj3JPVA>
 <xmx:J0SraZprheB4umpetfSLW72QN1aB3Al_WZnhyU5Cvq7SVszou5SM_T0h>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Mar 2026 16:16:16 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>
In-reply-to: <20260306-wildfremd-wildfremd-43848a9e91cd@brauner>
References: <20260224222542.3458677-1-neilb@ownmail.net>,
 <177267387855.7472.13497219877141601891@noble.neil.brown.name>,
 <20260306-wildfremd-wildfremd-43848a9e91cd@brauner>
Date: Sat, 07 Mar 2026 08:16:14 +1100
Message-id: <177283177498.7472.3648884661239054468@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.140; envelope-from=neilb@ownmail.net;
 helo=flow-a5-smtp.messagingengine.com
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
X-Rspamd-Queue-Id: 552CB227D5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm1,messagingengine.com:s=fm1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
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
	NEURAL_SPAM(0.00)[0.077];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,brown.name:replyto,lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026, Christian Brauner wrote:
> On Thu, Mar 05, 2026 at 12:24:38PM +1100, NeilBrown wrote:
> > 
> > Hi Christian,
> >  do you have thoughts about this series?  Any idea when you might have
> >  time to review and (hopefully) apply them?
> 
> Sorry, for the delay I picked it up but have two minor comments.
> 

Thanks!  I'll take a little while to examine the cachefiles code.
Thanks for the thorough review!

NeilBrown

