Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IEFKgzTnGkJLAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:22:04 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3917E3C7
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 23:22:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vueJL-0001oW-Sn; Mon, 23 Feb 2026 22:21:51 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vueJK-0001oH-3p
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 22:21:50 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id 27B3213805B8;
 Mon, 23 Feb 2026 17:21:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 23 Feb 2026 17:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1771885309; x=1771892509; bh=QscLC93BCn/K88HS4BcmEHkBzeHFa+prXXF
 RZ+3co+s=; b=TEIwR9nlLLMV+a+XHjbRROsUBUFvaWn70jzOTYE2XRa265wyOEY
 1rbgL0QDDpuda2vuAdDAZPH9f5+Kq4LZLdiM7kj1w5zdygzX8zkA7UCO6RcIcjoJ
 /3heBBGePEEore6u0lcs4UtP7l+tfbApYauxqUhZR6TulhKVKKnTCq6AMh9j2cBb
 Hd4zENKPxXTC/uRtvYOKWSwMCBuP7Y3HoVrmCHDUX7HcYLdyyojwrlse2ojhRmQk
 GGsvhtfHhdGnH936x5+IeiDBvs1DceF/T5s1TDt3Sgb85ZasmPNAnJxuSU7U9nZr
 TTczRqJilh8Rj6azBSAmgAQWWJRnLNggrYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771885309; x=
 1771892509; bh=QscLC93BCn/K88HS4BcmEHkBzeHFa+prXXFRZ+3co+s=; b=R
 yOg2bLr4RvOTTU69B+aGgK+C+dOAniXOCtg2ornrFxNiuvCQTddKrb21ux9az24W
 pBdSDY2ZSAXcZi7SabD8oRbO5/GN8QdiUiFe0rNjeb0ZRnUWio6njA+9KBrhmz/M
 gDFGRk30ISrl4YWh8k433WITg7J8MmDQcpQJYrlpNI+2RyCSmMchuNCRFabxm/0p
 QrvMztF9UFcbtOS6FpmnpMeQE7RZnYs9sX/iUd77Hn1D7OarZU/M8Qn3MbNHR9WG
 90v3uGmE5Nr7JTsittQ0aI1o6HnIz2DB/z2bpcenvrwqpcOjfT4lr40mUOJRv96N
 /PUeBH+/xvwPj9X3K5Yhw==
X-ME-Sender: <xms:_NKcaRt_XOTF-o-_5LjLDIrqYbEREM-Zl4DokEDYYYnME9GvDAVqxQ>
 <xme:_NKcaWmPGkUvLJaJbwEGgg4EevvAGRPvCOUjUKeeTAxkcRsVOQl5OH0E5FGj76H0x
 ltEvYhObscVTqef0cyE-RI3W781BP9H4BYUDEirx_cxLojrdg>
X-ME-Received: <xmr:_NKcaQmyPbTYgcEutw4lhHx6bPlo43rUcOxtVQ2Pn8rRqwrV2HikKa_FqJuEMFw7WjZN1wuTqCS-ZoXIr5sCX7yPikmOPg07T_b-e5XgGHuD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekgeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epieefhedthfefgfeigfefgeeujeetkefhleffkedvfeffieejudekueefheegtddtnecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhdpvhhfshdrmhgunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsgesohifnhhmrghilhdr
 nhgvthdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtth
 hopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepshgv
 lhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
 hunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
 thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
 rhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtohepjhgrtg
 hksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:_NKcaRh_4a1NmDcThYSlt8o_SSi7gFLj9gjFEXGrKcxWZ2ox9udfOg>
 <xmx:_NKcaSFeUZhSxrGOpi0bN5ef_NkRBr2Sf-JtVuhPIXeiTOBJVWYZZw>
 <xmx:_NKcacavEbPR0orVJuQ27EGmxygwZIRZKvsrOd8XroQehwPD9jaKxA>
 <xmx:_NKcaVMYaOWkqj7U9AIjEqMPtT1TkFOBUmnNbg5G684jXpoIdR_40A>
 <xmx:_dKcaYkCkSSTDZx1SUaAwVyI1claiFN0jBCTiIsXy7GgOwOyBJdkdsP9>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 17:21:41 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Amir Goldstein" <amir73il@gmail.com>
In-reply-to: <CAOQ4uxirM8dW9rOw4SvGtfH-s0Eg9LGuFk1aZooMvEDc=2tbyA@mail.gmail.com>
References: <20260223011210.3853517-1-neilb@ownmail.net>,
 <20260223011210.3853517-10-neilb@ownmail.net>,
 <20260223132027.4165509-1-clm@meta.com>,
 <CAOQ4uxirM8dW9rOw4SvGtfH-s0Eg9LGuFk1aZooMvEDc=2tbyA@mail.gmail.com>
Date: Tue, 24 Feb 2026 09:21:40 +1100
Message-id: <177188530015.8396.7140929443922458208@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.138; envelope-from=neilb@ownmail.net;
 helo=flow-a3-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH v2 09/15] ovl: Simplify ovl_lookup_real_one()
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
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@meta.com>, Paul Moore <paul@paul-moore.com>,
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,vger.kernel.org,redhat.com,meta.com,paul-moore.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,gmail.com,oracle.com,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:amir73il@gmail.com,m:jack@suse.cz,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:clm@meta.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,brown.name:replyto,brown.name:email,noble.neil.brown.name:mid,meta.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 3DD3917E3C7
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, Amir Goldstein wrote:
> On Mon, Feb 23, 2026 at 2:20=E2=80=AFPM Chris Mason <clm@meta.com> wrote:
> >
> > NeilBrown <neilb@ownmail.net> wrote:
> > > From: NeilBrown <neil@brown.name>
> > >
> > > The primary purpose of this patch is to remove the locking from
> > > ovl_lookup_real_one() as part of centralising all locking of directories
> > > for name operations.
> > >
> > > The locking here isn't needed.  By performing consistency tests after
> > > the lookup we can be sure that the result of the lookup was valid at
> > > least for a moment, which is all the original code promised.
> > >
> > > lookup_noperm_unlocked() is used for the lookup and it will take the
> > > lock if needed only where it is needed.
> > >
> > > Also:
> > >  - don't take a reference to real->d_parent.  The parent is
> > >    only use for a pointer comparison, and no reference is needed for
> > >    that.
> > >  - Several "if" statements have a "goto" followed by "else" - the
> > >    else isn't needed: the following statement can directly follow
> > >    the "if" as a new statement
> > >  - Use a consistent pattern of setting "err" before performing a test
> > >    and possibly going to "fail".
> > >  - remove the "out" label (now that we don't need to dput(parent) or
> > >    unlock) and simply return from fail:.
> >
> > Hi everyone,
> >
> > Amir asked me to run these through, and this commit was flagged.  I recen=
tly
> > changed the prompts to include some vfs knowledge:
>=20
> Thanks Chris!
>=20
> >
> > https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/vfs.=
md
> >
> > And I also put in some words to make it prefer reporting problems that mi=
ght
> > not be bugs, but that do violate some rule in the .md files.  This might
> > be a false positive from that new shift toward blindly trusting the guide=
s,
> > but I'll let everyone here decide:
> >
> > commit d1bfcef048896cdc9e4c57e3249b6ad344d64c02
> > Author: NeilBrown <neil@brown.name>
> >
> > ovl: Simplify ovl_lookup_real_one()
> >
> > This patch removes locking from ovl_lookup_real_one() and reorganizes the
> > control flow. The function now uses lookup_noperm_unlocked() instead of
> > lookup_noperm() and performs consistency validation after the lookup rath=
er
> > than holding a lock during the operation.
> >
> > > diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> > > index 83f80fdb15674..b448fc9424b64 100644
> > > --- a/fs/overlayfs/export.c
> > > +++ b/fs/overlayfs/export.c
> > > @@ -349,69 +349,64 @@ static struct dentry *ovl_dentry_real_at(struct d=
entry *dentry, int idx)
> > >       return NULL;
> > >  }
> > >
> > > -/*
> > > - * Lookup a child overlay dentry to get a connected overlay dentry who=
se real
> > > - * dentry is @real. If @real is on upper layer, we lookup a child over=
lay
> > > - * dentry with the same name as the real dentry. Otherwise, we need to=
 consult
> > > - * index for lookup.
> > > +/**
> > > + * ovl_lookup_real_one -  Lookup a child overlay dentry to get an over=
lay dentry whose real dentry is given
> > > + * @connected: parent overlay dentry
> > > + * @real: given child real dentry
> > > + * @layer: layer in which @real exists
> > > + *
> > > + *
> > > + * Lookup a child overlay dentry in @connected with the same name as t=
he @real
> > > + * dentry.  Then check that the parent of the result is the real dentr=
y for
> > > + * @connected, and @real is the real dentry for the result.
> > > + *
> > > + * Returns:
> > > + *   %-ECHILD if the parent of @real is no longer the real dentry for =
@connected.
> > > + *   %-ESTALE if @real is no the real dentry of the found dentry.
> >                                        ^^
> > There's a typo here: "is no the" should be "is not the".
> >
> > > + *   Otherwise the found dentry is returned.
> > >   */
> > >  static struct dentry *ovl_lookup_real_one(struct dentry *connected,
> > >                                         struct dentry *real,
> > >                                         const struct ovl_layer *layer)
> > >  {
> > > -     struct inode *dir =3D d_inode(connected);
> > > -     struct dentry *this, *parent =3D NULL;
> > > +     struct dentry *this;
> > >       struct name_snapshot name;
> > >       int err;
> > >
> > >       /*
> > > -      * Lookup child overlay dentry by real name. The dir mutex protec=
ts us
> > > -      * from racing with overlay rename. If the overlay dentry that is=
 above
> > > -      * real has already been moved to a parent that is not under the
> > > -      * connected overlay dir, we return -ECHILD and restart the looku=
p of
> > > -      * connected real path from the top.
> > > -      */
> > > -     inode_lock_nested(dir, I_MUTEX_PARENT);
> > > -     err =3D -ECHILD;
> > > -     parent =3D dget_parent(real);
> > > -     if (ovl_dentry_real_at(connected, layer->idx) !=3D parent)
> > > -             goto fail;
> > > -
> > > -     /*
> > > -      * We also need to take a snapshot of real dentry name to protect=
 us
> > > +      * We need to take a snapshot of real dentry name to protect us
> > >        * from racing with underlying layer rename. In this case, we don=
't
> > >        * care about returning ESTALE, only from dereferencing a free na=
me
> > >        * pointer because we hold no lock on the real dentry.
> > >        */
> > >       take_dentry_name_snapshot(&name, real);
> > > -     /*
> > > -      * No idmap handling here: it's an internal lookup.
> > > -      */
> > > -     this =3D lookup_noperm(&name.name, connected);
> > > +     this =3D lookup_noperm_unlocked(&name.name, connected);
> > >       release_dentry_name_snapshot(&name);
> > > +
> > > +     err =3D -ECHILD;
> > > +     if (ovl_dentry_real_at(connected, layer->idx) !=3D real->d_parent)
> > > +             goto fail;
> > > +
> >
> > A subsystem pattern flags this as potentially concerning: the VFS subsyst=
em
> > guide indicates that TOCTOU validation checking d_parent should also check
> > d_unhashed() because a dentry can be unhashed (removed from dcache by
> > concurrent operations) while its d_parent pointer remains unchanged.
> >
> > The old code held inode_lock_nested(dir, I_MUTEX_PARENT) during the entire
> > lookup and validation, which serialized with operations that could unhash=
 the
> > dentry. The new lockless pattern creates a window where:
> >
> > 1. lookup_noperm_unlocked() completes and returns dentry `this`
> > 2. A concurrent unlink/remove operation unhashes `this`
> > 3. The d_parent validation passes (parent pointer unchanged)
> > 4. The function returns an unhashed dentry
> >
> > Other overlayfs code uses the complete pattern. For example, in
> > ovl_lock_rename_workdir() at fs/overlayfs/util.c:
> >
> >     if (work->d_parent !=3D workdir || d_unhashed(work)) {
> >         ...
> >     }
> >
> > Could this validation miss a race where the dentry is unhashed but d_pare=
nt
> > still matches? The subsequent checks (!this->d_inode for -ENOENT,
> > wrong real dentry for -ESTALE) might catch some cases, but is that
> > sufficient for all the scenarios where an unhashed dentry could cause
> > problems?
> >
>=20
> It's a very good comment and very important rule to check, since
> we have at least 3 fix commits on breaking this rule, but as this
> code is utterly confusing to most human I do not blame LLM for getting
> confused here.
>=20
> The lock not taken on 'dir' which is the overlayfs inode and the checked
> 'real' dentry is on the underlying fs.
>=20
> Therefore, the check of real->d_parent was not protected in old code as
> well as in new code - it is a mere best effort sanity check, so I think
> there is no added risk here.
>=20
> Neil, do you agree?

Yes, I agree.

The relevant part of Chris' prompt is:

 When a dentry reference is obtained without holding the parent inode
 lock (e.g., via lookup, creation, or cached reference), and the lock is
 acquired later, a TOCTOU window exists=20

"the lock is acquired later" is significant.  In this code the lock
hasn't been acquired so the rule doesn't apply.

In this code I don't think we are testing real->d_parent, we are testing
ovl_dentry_real_at(connected, layer->idx) and making sure it is
consistent.
It is true that "real" might have been renamed and that would cause a
failure too, but that isn't really interesting.  It could be renamed
just after the test just as easily (as we don't hold any locks).
In general overlayfs doesn't try to handle independent changes in the
underlying filesystems beyond "don't crash".

So it was a good comment to get, but I don't think there is any need to
change the code (though I have fixed the typo).

Thanks,
NeilBrown


>=20
> Thanks,
> Amir.
>=20


