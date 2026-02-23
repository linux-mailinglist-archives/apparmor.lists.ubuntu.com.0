Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mExDHqjPnGllKQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:07:36 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14817DFCD
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:07:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vue5K-0006R2-7o; Mon, 23 Feb 2026 22:07:22 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vue5H-0006Qm-JU
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 22:07:19 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id 910E3138081D;
 Mon, 23 Feb 2026 17:07:18 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 23 Feb 2026 17:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1771884438; x=1771891638; bh=IvH/eJ4ocSmIdY1FI1qjFEaateUGrvnzlWL
 P9KMWXTU=; b=hheE9HEjV/GBe1gIRJNMHiqKIAbuZUfXjcr9KIMBlmxOsAnUObO
 Mz7BEZnmUlZ+wwvxFfHVuNDaoS5ig52AcrwgOVbm0YODN+zy60YdNp71wWK8su1R
 +EP2YQM9iAv/jkYX8Y0bnF1G1gv6WYXMGHMRAMzM7Nu2LSkuZuve+GrKMcgA/6ZP
 IGVzt12hiMUSEB+k0XQSMcsG8heNki5F4KuWHgOj0OssaztL3jvEu4uSycnYTxIK
 ibLeHdBEpc6i3ww49Nz43ZnqluRAScqWxsq7yinC5dSEbkWrnzFkXdz9lef8u1Im
 SvQfAiHzR3ZQaoIHoZHgny3RMIgHp3ykOTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771884438; x=
 1771891638; bh=IvH/eJ4ocSmIdY1FI1qjFEaateUGrvnzlWLP9KMWXTU=; b=B
 o/3oKgVvfVRqnVuqvCt0I5mCXbDKNRzXWAS2uJwut7zCslauzwRW5jLMPnuTdJv+
 MEtNc0I8B3s90dEsfeYmVkB7HCnmD+Wj+zUufl24ln2bbVb4e747B7W/unL37DrF
 rCoKGWcxCtXEkVyj5bWDNdk1ndeCmEntY7iHqQyUTZhdudrC1qfFhecJdbuf85LE
 VjdF+OyIiDElkmTvSiW90w+zapO/WdwuIuwwnGri9XXN/mTBFv2sFK+Rql9gaJgb
 WJzcad6ZH+LJJ91BSf8IVAk8DZrSP84gtu4t3+LPI+JNa3tWs9H+AMOM87QwCv7T
 iamZ6ViXjnFK4RlKl2mVQ==
X-ME-Sender: <xms:ls-caTEKWsUxo9hjf6J27bn7L2VhuwVtcxR92kU4r2M7nuf0nv-QuA>
 <xme:ls-caceLTChAcWjjLKw7nzbADS3G4gJ4nCgWhWG5E9sIxTq8gIPHRu8Y7Hz71xmUk
 6YFUtfzT_w1bML5pUcD9picmf-fWUnMInPZODXTN3husqI2aQ>
X-ME-Received: <xmr:ls-caQ-a6oM7NG8oZXUql3u7aajKpH0P8uZ43CjKmxDugF5inffPqAuoRbR7MWRJ-5r8qPOOpxSquT6njW4GaOWLMuFR9CNiN5Mc8mSh-sAZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekfeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:ls-caaatfYxrQ_E0FRkpYvsS-gwt-kyAaDNwkDUy51xh-eQiA95Xgw>
 <xmx:ls-caZfEjMEqUnXOEMABstt4ts1Ri64V_EXuIkL8u0-_NkWtkkgzwg>
 <xmx:ls-caQRUMmgVFW2oMDiRqtRr5bQKrAhnNW1drbPltoysubfaXjFRKw>
 <xmx:ls-cabm6BYUxKnNf1rmkR9MkpTXyBWyKYIs1lYofrgCBc6WdcWTlRA>
 <xmx:ls-caaKJmMLy-SO-z0aP3_X5JDf1rR5HkE6MG3PRgQWzkQbOsqz0tDMK>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 17:07:11 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Paul Moore" <paul@paul-moore.com>
In-reply-to: <CAHC9VhSVjLNeTdxHmwYsGX75Z4FOAP+26=PjVdFxpmEkTrPvxA@mail.gmail.com>
References: <20260223011210.3853517-1-neilb@ownmail.net>,
 <20260223011210.3853517-7-neilb@ownmail.net>,
 <20260223132533.136328-1-clm@meta.com>,
 <CAHC9VhSVjLNeTdxHmwYsGX75Z4FOAP+26=PjVdFxpmEkTrPvxA@mail.gmail.com>
Date: Tue, 24 Feb 2026 09:07:10 +1100
Message-id: <177188443018.8396.8813038272679664939@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.138; envelope-from=neilb@ownmail.net;
 helo=flow-a3-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH v2 06/15] selinux: Use
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@meta.com>,
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,meta.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:clm@meta.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,brown.name:replyto,brown.name:email,noble.neil.brown.name:mid,meta.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,paul-moore.com:email]
X-Rspamd-Queue-Id: 1A14817DFCD
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, Paul Moore wrote:
> On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Chris Mason <clm@meta.com> wrote:
> > NeilBrown <neilb@ownmail.net> wrote:
> > > From: NeilBrown <neil@brown.name>
> > >
> > > Instead of explicitly locking the parent and performing a lookup in
> > > selinux, use simple_start_creating(), and then use
> > > simple_done_creating() to unlock.
> > >
> >
> > Hi everyone,
> >
> > Amir suggested I run these through, and this commit was flagged:
> >
> > commit bc981629767980bbaee2ca3c7348b5a648665a9d
> > Author: NeilBrown <neil@brown.name>
> >
> > selinux: Use simple_start_creating() / simple_done_creating()
> >
> > Instead of explicitly locking the parent and performing a lookup in
> > selinux, use simple_start_creating(), and then use
> > simple_done_creating() to unlock.
> >
> > This extends the region that the directory is locked for, and also
> > performs a lookup. The lock extension is of no real consequence.
> > The lookup uses simple_lookup() and so always succeeds. Thus when
> > d_make_persistent() is called the dentry will already be hashed.
> > d_make_persistent() handles this case.
> >
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Acked-by: Paul Moore <paul@paul-moore.com>
> >
> > > diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> > > index 3245cc531555b..7d4f90e5b12a0 100644
> > > --- a/security/selinux/selinuxfs.c
> > > +++ b/security/selinux/selinuxfs.c
> > > @@ -1931,15 +1931,16 @@ static const struct inode_operations swapover_d=
ir_inode_operations =3D {
> > >  static struct dentry *sel_make_swapover_dir(struct super_block *sb,
> > >                                               unsigned long *ino)
> > >  {
> > > -     struct dentry *dentry =3D d_alloc_name(sb->s_root, ".swapover");
> > > +     struct dentry *dentry;
> > >       struct inode *inode;
> > >
> > > -     if (!dentry)
> > > +     inode =3D sel_make_inode(sb, S_IFDIR);
> > > +     if (!inode)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > -     inode =3D sel_make_inode(sb, S_IFDIR);
> > > -     if (!inode) {
> > > -             dput(dentry);
> > > +     dentry =3D simple_start_creating(sb->s_root, ".swapover");
> > > +     if (!dentry) {
> > > +             iput(inode);
> > >               return ERR_PTR(-ENOMEM);
> > >       }
> >
> > Can this cause a kernel crash when simple_start_creating() fails?
> >
> > The function simple_start_creating() returns ERR_PTR on failure, not
> > NULL. The check `if (!dentry)` only catches NULL values. When
> > simple_start_creating() fails and returns an ERR_PTR value like
> > ERR_PTR(-ENOMEM), this value is non-NULL and the error check is bypassed.
> >
> > Execution would continue to d_make_persistent(dentry, inode), which
> > attempts to lock dentry->d_lock, dereferencing the ERR_PTR value and
> > causing a kernel crash.
> >
> > The old code used d_alloc_name() which returns NULL on error. The new
> > code uses simple_start_creating() which returns ERR_PTR on error, but
> > the error checking pattern wasn't updated to match.
> >
> > Should the check be `if (IS_ERR(dentry))` instead, and return dentry
> > rather than ERR_PTR(-ENOMEM) to preserve the actual error code?
>=20
> Good catch Chris, yes, please change this Neil and feel free to
> preserve my ACK.

Thanks.
I've made it

	dentry =3D simple_start_creating(sb->s_root, ".swapover");
	if (IS_ERR(dentry)) {
		iput(inode);
		return dentry;
	}

NeilBrown

