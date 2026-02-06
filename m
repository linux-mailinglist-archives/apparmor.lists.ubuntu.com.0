Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP7JD1k5hWmS+QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 01:44:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D9708F8C09
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 01:44:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo9wx-0002zf-UR; Fri, 06 Feb 2026 00:43:55 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vo9wv-0002z2-Fo
 for apparmor@lists.ubuntu.com; Fri, 06 Feb 2026 00:43:53 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 5999E1380A43;
 Thu,  5 Feb 2026 19:43:52 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 05 Feb 2026 19:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1770338632; x=1770345832; bh=cmlvY2WVMaI2/0++B9slQhcJiXu+2rbDUBq
 lXijKh2o=; b=VXOpK8fHiqa+cOMT5uGBQeQStYUmKYIgtE67aKsnwHpfqlajOMZ
 HlqXd4DtRG86gLyzfWDkupTjHVEYT256ADDb93Uco2RSrJwwrg0P+uAfoDKdD3F7
 ZZ3j0BDB3la6nQ3YqN2eg+Qlf9xg7RIv6xQ8QRZtTNLB1/Vq3syi85GrdRVaT57e
 WlCJqWtprfJLSHpcU+kcF36GvQF5mSDd28z59jxyfT6rvNh9M58OmzFmmwDDkOlv
 3Nd7bdzdNR2t/vSsrdrDTk574fFETBnw/1ETPC0ShZqCTawX2Kps/arerxTLhR/K
 CHsMDtlfW2qgkLdee0PfPtgsSE6Gn8m0+zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770338632; x=
 1770345832; bh=cmlvY2WVMaI2/0++B9slQhcJiXu+2rbDUBqlXijKh2o=; b=d
 n6V78+jp32a1vd2V7DpZi13ve6QYYDl0sm0mhTTGtpDsMnxL1bzYvCbOoEK/zAta
 c2wTPHtgwt2mGaAwtYRM/amfRXW6/SuCZ7RKwO/aJxypJBdF32yCS6BJb4X9MRch
 VRfIPWztOancM5RgYFmyFMcmhxRLGT2h9GIPIWfhS1kSTNDT4cMayfrlqfDb3Itg
 Hp66L3tM8l+oeJEeBqw8MrJsnjtUvIsAY5iRVn15wIBwvtN+1MQ84x8Ft+/OmR48
 hxV+Qeu9qX/YXMMLHiHnz8ZY+G6KbE51MdKGANypIUB8e6UAzEnYypGslblTggfd
 o1woO0iBaVwE/aF3NnBDQ==
X-ME-Sender: <xms:RzmFaboaV45VBlKHNyrkIFVvgPmo3eMvMSLpIOP_r74BkBXCqCXW2w>
 <xme:RzmFaRMko5Lhw6n--W_wxlLIJvg-T1OdP-uqkWLnh_Zcfn8QS6l_koZ7FoYTy5Gd8
 oodJNe3NouGyNRzoRwq_bcp6sItGNIo-q39edIZ9caQFJlOiw>
X-ME-Received: <xmr:RzmFaYMKXouTvPMzZuUiQfpY_BvLqtYOT_rlz7GlIvM78oPct_YBUkLBy-__NJTGitLcQr4ZqMU7KVo9ydW5ItQgljdgsiU7CPuzsE_cfWTl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeijeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
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
X-ME-Proxy: <xmx:RzmFaT0fkSFhIKkBeQfaQ3YG3bIYRAYGxDHkLA_fskBCLtx_OS7NIQ>
 <xmx:RzmFac0rQ7f0x5AXuvVQ7DW-cvVqkZgipPPkLp78hDk59buK8hVrzQ>
 <xmx:RzmFaSykkpQ1kwEeQU_BS8DrKPCXzZQck55M5-oJvvRGNmeCUHGQ6A>
 <xmx:RzmFafnHxx7KLGr-uBlwntHItcoYTv4_HeKg1pcU0UhYJHFRXWCCtg>
 <xmx:SDmFaewzj9eVyj5u1DsJGWltseq4K-d6SY0j8fEggkV4iXFHaRYSROq8>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 19:43:45 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Amir Goldstein" <amir73il@gmail.com>
In-reply-to: <CAOQ4uxh_Ugyy9=Vx_XOzWMTdhqVx6kAu43q+F+afhNF_Zv_9TA@mail.gmail.com>
References: <20260204050726.177283-1-neilb@ownmail.net>,
 <20260204050726.177283-9-neilb@ownmail.net>,
 <5d273a008fc51a2fded785efbe30e5bd2a89b985.camel@kernel.org>,
 <CAOQ4uxh_Ugyy9=Vx_XOzWMTdhqVx6kAu43q+F+afhNF_Zv_9TA@mail.gmail.com>
Date: Fri, 06 Feb 2026 11:43:43 +1100
Message-id: <177033862352.16766.1800645278281300265@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.142; envelope-from=neilb@ownmail.net;
 helo=flow-a7-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH 08/13] ovl: Simplify ovl_lookup_real_one()
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
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
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
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:amir73il@gmail.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,brown.name:replyto,brown.name:email]
X-Rspamd-Queue-Id: D9708F8C09
X-Rspamd-Action: no action

On Fri, 06 Feb 2026, Amir Goldstein wrote:
> On Thu, Feb 5, 2026 at 1:38=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
> >
> > On Wed, 2026-02-04 at 15:57 +1100, NeilBrown wrote:
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
> > >
> > > Signed-off-by: NeilBrown <neil@brown.name>
> > > ---
> > >  fs/overlayfs/export.c | 61 ++++++++++++++++++-------------------------
> > >  1 file changed, 26 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> > > index 83f80fdb1567..dcd28ffc4705 100644
> > > --- a/fs/overlayfs/export.c
> > > +++ b/fs/overlayfs/export.c
> > > @@ -359,59 +359,50 @@ static struct dentry *ovl_lookup_real_one(struct =
dentry *connected,
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
> > > +      * @connected is a directory in the overlay and @real is an object
> > > +      * on @layer which is expected to be a child of @connected.
> > > +      * The goal is to return a dentry from the overlay which correspo=
nds
>=20
> As the header comment already says:
> "...return a connected overlay dentry whose real dentry is @real"
>=20
> The wording "corresponds to @real" reduces clarity IMO.

Ok, I'll rephrase.


>=20
> > > +      * to @real.  This is done by looking up the name from @real in
> > > +      * @connected and checking that the result meets expectations.
> > > +      *
> > > +      * Return %-ECHILD if the parent of @real no-longer corresponds to
> > > +      * @connected, and %-ESTALE if the dentry found by lookup doesn't
> > > +      * correspond to @real.
> > >        */
>=20
> I dislike kernel-doc inside code comments.
> I think this is actively discouraged and I haven't found a single example
> of this style in fs code.
>=20
> If you want to keep this format, please lift the comment to function
> header comment - it is anyway a very generic comment that explains the
> function in general.

OK, I'll remove the formatting or move it - not sure which.
I find that with parameter names like "connected" and "real", some sort
of syntax helps.


>=20
> > > -     inode_lock_nested(dir, I_MUTEX_PARENT);
> > > -     err =3D -ECHILD;
> > > -     parent =3D dget_parent(real);
> > > -     if (ovl_dentry_real_at(connected, layer->idx) !=3D parent)
> > > -             goto fail;
> > >
> > > -     /*
> > > -      * We also need to take a snapshot of real dentry name to protect=
 us
> > > -      * from racing with underlying layer rename. In this case, we don=
't
> > > -      * care about returning ESTALE, only from dereferencing a free na=
me
> > > -      * pointer because we hold no lock on the real dentry.
> > > -      */
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
> > >       err =3D PTR_ERR(this);
> > > -     if (IS_ERR(this)) {
> > > +     if (IS_ERR(this))
> > >               goto fail;
> > > -     } else if (!this || !this->d_inode) {
> > > -             dput(this);
> > > -             err =3D -ENOENT;
> > > +
> > > +     err =3D -ENOENT;
> > > +     if (!this || !this->d_inode)
> > >               goto fail;
> > > -     } else if (ovl_dentry_real_at(this, layer->idx) !=3D real) {
> > > -             dput(this);
> > > -             err =3D -ESTALE;
> > > +
> > > +     err =3D -ESTALE;
> > > +     if (ovl_dentry_real_at(this, layer->idx) !=3D real)
> > >               goto fail;
> > > -     }
> > >
> > > -out:
> > > -     dput(parent);
> > > -     inode_unlock(dir);
> > >       return this;
> > >
> > >  fail:
> > >       pr_warn_ratelimited("failed to lookup one by real (%pd2, layer=3D=
%d, connected=3D%pd2, err=3D%i)\n",
> > >                           real, layer->idx, connected, err);
> > > -     this =3D ERR_PTR(err);
> > > -     goto out;
> > > +     if (!IS_ERR(this))
> > > +             dput(this);
> > > +     return ERR_PTR(err);
> > >  }
> > >
> > >  static struct dentry *ovl_lookup_real(struct super_block *sb,
> >
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
>=20
> Otherwise, it looks fine.

Thanks,
NeilBrown


>=20
> Thanks,
> Amir.
>=20


