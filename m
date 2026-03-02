Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNLnD/jypWkeIQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 02 Mar 2026 21:28:40 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC41DF702
	for <lists+apparmor@lfdr.de>; Mon, 02 Mar 2026 21:28:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vx9sV-0007JD-GN; Mon, 02 Mar 2026 20:28:31 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vx9sT-0007J5-7E
 for apparmor@lists.ubuntu.com; Mon, 02 Mar 2026 20:28:29 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id E2C371380BB2;
 Mon,  2 Mar 2026 15:28:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 02 Mar 2026 15:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
 1772483307; x=1772490507; bh=PGuwBdT/fi6I7xD4ofJxORaVZCjsED51iJF
 HAxPkzm0=; b=D0eLfEmafy1DHEs3ecfMGa9SYgwJ/9KAoySk2AcXFiBYwVuCHdf
 wlKN7gQsxxMEyi2M/XZl3H1JirKUUEak7rVSusoXBc2ExFGbWRl91PGNKrD7r1BM
 tcD38hugO/0ju6D9M0vKfWAOcUt7p8mYe66lGNZns/ZGAyreVjIXQUh0d7IYRzBn
 7fz9fCPr2TH0URqaOWQVc8IS+hIYdkKv9g3dutjoPYAI1ep+J0ZkN3yuU87vNknB
 x/BEgI5PjfQAcEhHecVTCUbpz5Q9w7fIuoFAyOjqeZPuB/9TlvrtqqZ7WjuGUbEb
 yhixnkuN7oO4S5hzKpfpVAkxmj0+Zo0kfZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772483307; x=
 1772490507; bh=PGuwBdT/fi6I7xD4ofJxORaVZCjsED51iJFHAxPkzm0=; b=t
 AFci6MJNoTqvVvOYewF6IF8CasVVsw5btRGe2wflqeQxnJDx0fVyyDgP9bCYWQOC
 XkQJLwoCcabHfiFDQFPGrWGhbWkedbI9MpNm2NwsniQOwZjk++fCBuyyvo/qDj+9
 MG16Gi+Q7RVWJG8g6pyCfVvl7oiIG0tsuDs/loDki67ozk2Zt0yXEIEG7yG68MeP
 iK8dMG+C7NhRKDN7/qafBXo9x0wl9ALtVHmTIcspuXVPHDCBp1Yimi0WYUWZAG7i
 epyZJDdyJwWX2QoUIqoRJyAZ+LcT13pTi8UgYKMpu0U/cVXHSrTFjZcjs+YL77AW
 sWqfDYU88mol9V/JLIfpA==
X-ME-Sender: <xms:6vKlac0S1uyHGmgu4rzTpxvRklQJfkHDrK5Uyumqmrz9mO-pjoT0hg>
 <xme:6vKlaS9vw48XTdwyNBw_TTWTzQIEYGPNg8PzgxEf9buMAqE3tP8eNglHs-0M4XKAD
 Z_W_4VqWLnoB4gyZnwcTpVoZ6vFSXlQzeHExnOqRzq0Ri99>
X-ME-Received: <xmr:6vKladuhSn88PEMre-baego0jqJRKjSAqNOwOZ7LHpVWr1uWxlJYa9iuWMaOW4dPkkRCgXGiQ_hTiEK18TQiOyZbiIyOTTYMvvSm1NAr2A_G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheekieegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epvdeuteelkeejkeevteetvedtkeegleduieeftdeftefgtddtleejgfelgfevffeinecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehnvghilhgssehofihnmhgrihhlrdhnvghtpdhnsggp
 rhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhhose
 iivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehsvghlihhnuhigsehv
 ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidquhhnihhonhhfsh
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsvggtuhhr
 ihhthidqmhhoughulhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 mhhikhhlohhssehsiigvrhgvughirdhhuhdprhgtphhtthhopehjrggtkhesshhushgvrd
 gtii
X-ME-Proxy: <xmx:6vKlaer-3S458tUTAG_YwUVW1B-PDTT6QrxdCqvTH81jAFwzgVLejg>
 <xmx:6vKlaYHXjFI95JvsJ5sDXR4EQsc_ezb6i2NBU-UThLKlWj5M797Viw>
 <xmx:6vKlaR7OcojddhkX0vMniSB_eYyPVO5IWHCHlGaDubNTm_k8Bs02aA>
 <xmx:6vKlabDlWp6tFwsOUnRBQ3BBJkpO3XfCb-O0DTSU0LsvYYhgguvrsw>
 <xmx:6_KlafqVeoDSAdo4Nz-SP4GdTUtKutApTdNYU344W0_DJ979o9abUHi->
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 15:28:20 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <df3a0c1d7c2aa4653725a20401264de2ca1645b3.camel@kernel.org>
References: <20260224222542.3458677-1-neilb@ownmail.net>,
 <20260224222542.3458677-2-neilb@ownmail.net>,
 <df3a0c1d7c2aa4653725a20401264de2ca1645b3.camel@kernel.org>
Date: Tue, 03 Mar 2026 07:28:15 +1100
Message-id: <177248329543.7472.6896694157211686467@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.138; envelope-from=neilb@ownmail.net;
 helo=flow-a3-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH v3 01/15] VFS: note error returns in
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 77FC41DF702
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm1,messagingengine.com:s=fm1];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[ownmail.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,gmail.com,lists.ubuntu.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.986];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,brown.name:replyto,brown.name:email]
X-Rspamd-Action: no action

On Tue, 03 Mar 2026, Jeff Layton wrote:
> On Wed, 2026-02-25 at 09:16 +1100, NeilBrown wrote:
> > From: NeilBrown <neil@brown.name>
> >=20
> > Darrick recently noted that try_lookup_noperm() is documented as
> > "Look up a dentry by name in the dcache, returning NULL if it does not
> > currently exist." but it can in fact return an error.
> >=20
> > So update the documentation for that and related functions.
> >=20
> > Link: https://lore.kernel.org/all/20260218234917.GA6490@frogsfrogsfrogs/
> > Cc: "Darrick J. Wong" <djwong@kernel.org>
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >  fs/namei.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/fs/namei.c b/fs/namei.c
> > index 58f715f7657e..6f595f58acfe 100644
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -3124,7 +3124,8 @@ static int lookup_one_common(struct mnt_idmap *idma=
p,
> >   * @base:	base directory to lookup from
> >   *
> >   * Look up a dentry by name in the dcache, returning NULL if it does not
> > - * currently exist.  The function does not try to create a dentry and if=
 one
> > + * currently exist or an error if there is a problem with the name.
> > + * The function does not try to create a dentry and if one
> >   * is found it doesn't try to revalidate it.
> >   *
> >   * Note that this routine is purely a helper for filesystem usage and sh=
ould
> > @@ -3132,6 +3133,11 @@ static int lookup_one_common(struct mnt_idmap *idm=
ap,
> >   *
> >   * No locks need be held - only a counted reference to @base is needed.
> >   *
> > + * Returns:
> > + *   - ref-counted dentry on success, or
> > + *   - %NULL if name could not be found, or
> > + *   - ERR_PTR(-EACCES) if name is dot or dotdot or contains a slash or =
nul, or
> > + *   - ERR_PTR() if fs provide ->d_hash, and this returned an error.
> >   */
> >  struct dentry *try_lookup_noperm(struct qstr *name, struct dentry *base)
> >  {
> > @@ -3208,6 +3214,11 @@ EXPORT_SYMBOL(lookup_one);
> >   *
> >   * Unlike lookup_one, it should be called without the parent
> >   * i_rwsem held, and will take the i_rwsem itself if necessary.
> > + *
> > + * Returns: - A dentry, possibly negative, or
> > + *	    - same errors as try_lookup_noperm() or
> > + *	    - ERR_PTR(-ENOENT) if parent has been removed, or
> > + *	    - ERR_PTR(-EACCES) if parent directory is not searchable.
> >   */
> >  struct dentry *lookup_one_unlocked(struct mnt_idmap *idmap, struct qstr =
*name,
> >  				   struct dentry *base)
> > @@ -3244,6 +3255,10 @@ EXPORT_SYMBOL(lookup_one_unlocked);
> >   * It should be called without the parent i_rwsem held, and will take
> >   * the i_rwsem itself if necessary.  If a fatal signal is pending or
> >   * delivered, it will return %-EINTR if the lock is needed.
> > + *
> > + * Returns: A dentry, possibly negative, or
> > + *	   - same errors as lookup_one_unlocked() or
> > + *	   - ERR_PTR(-EINTR) if a fatal signal is pending.
> >   */
> >  struct dentry *lookup_one_positive_killable(struct mnt_idmap *idmap,
> >  					    struct qstr *name,
>=20
> Claude says:
>=20
>   lookup_one_positive_killable() documentation says "A dentry, possibly neg=
ative" but the function
>   explicitly converts negative dentries to ERR_PTR(-ENOENT). It should say =
"A positive dentry" like
>   the companion functions lookup_one_positive_unlocked() and lookup_noperm_=
positive_unlocked().

Thanks.  The top patch in my next batch contains a bunch of similar
documentation cleanups.  I'll add this to that patch.

>=20
> ...but that seems to be the only "regression" it found.=20
>=20

Good to know!

Thanks,
NeilBrown

>=20
> Aside from that nit, this looks fine to me.
>=20
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
>=20


