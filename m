Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEgSEpvuhGkU6wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:15 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D076CF6D23
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo4yL-0001LN-Hs; Thu, 05 Feb 2026 19:25:01 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vnz2U-0007q2-RM
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 13:04:54 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so680290f8f.0
 for <apparmor@lists.ubuntu.com>; Thu, 05 Feb 2026 05:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770296694; cv=none;
 d=google.com; s=arc-20240605;
 b=VKqY7yf6hH/5uA3uiqAm/zkEfdMkiuf1MjT5gReR6Kx8cJ29wL7XZ8iDZfe5HlgIIW
 KOKLYFh0ewL/MgFmPw9FCv8MXAn/lNS27JyWIw2eVMquh736XJMiM15BG6E0jV6W93dw
 j1AMG8JphKrbwcGDCjMTiheSd15tX4QzEG8BEsiQoRCk53jT6KYwP45CKLiiF5GccquF
 ayIHAlGQe7Tgb8FscSrf5G8WnGpATvdVPrc+wtj3ZS6oyWx3MknGo62KFEXRPK89XRaN
 XwIG1bAQIGgemLs699wlsTsVA7K/HE3VWGZyVZBSuk9gMiyE0GGmIhoTo4cmE+/KhEEU
 LBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5QIFMxkl9qDrU626LjrUWWxNqKmOaBddIPVVlA8pXoo=;
 fh=ns3yn5PlUUndBOl22aNORuK6PLLnkUIyX62FG5M5VsY=;
 b=H0xbxETaGoySesA/hlXCLAwXLnlaiMZhlISBnqrfPi/+gBkP2ZJPUbjiSGfDCENt+T
 NzTgPvhpbieGQgf6d/lnKEAZReuMx8zQOyxq2iJqdfq6qI807VKfIJTdo6eY2CKJYphC
 u07lyaKHtINhhWGXbqDtH31J9Xw8TzuRX2GaCwu3RNxuadQiPEWwJWcO4oAjH6t9weZq
 Cx9T5Ox3npl9KBVTvn5xa1VE0e7LkaI+ELUpSyBC/fkhh5xu3yFVCJLGwqX+BfNe4RtG
 eF1C589U7M6g0yMcx3UpDt5KAOt1KMzSfL7qQWDvMDFDgcUuNIMko9iqJN+pD0sXxVtH
 eFvw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770296694; x=1770901494; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QIFMxkl9qDrU626LjrUWWxNqKmOaBddIPVVlA8pXoo=;
 b=m8QFuv30IDfgFZM/9ViWHgbzRYdSyOzt6QKNdoJvCPQBbDU9tFchX1Puspq1cTiaaK
 cqjv3EvTi/Ys5dyTaou6wIaTnGTe349Mub4RKOkZR/18Q91ygtqi57q46NUX9MH4HhAa
 58ME/SAGTPVJiSxmexg7ol81rm9lrrhUTk0CNE87W6am/tcDECYM341UWXUY3Z5bJsC1
 5ajaVwfVnCZvfOgRJ+E2ol/S0ArfmKOaPIy5W6i2CdUwQtmmgHKDEnevUccsmn/ze4yw
 q5dkHpogsFbx6LJdJtbP6kev85MmrN/VZJ6v6/845LrszIu04sfwQEXqhUv3gOhge+IE
 3GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770296694; x=1770901494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5QIFMxkl9qDrU626LjrUWWxNqKmOaBddIPVVlA8pXoo=;
 b=aWtDYxVejOSW0F7W2KPerb+x/TRNryRH1aF+1HrcXoT27LN/wF5X595t4MAqN+wYuB
 CcB/CjLqOAvIBIneIO3JbWIfZcBZ/eBHpnVkDF4NP4PpLIqN3aT+0EHfOJKwq4U923gl
 pcVuEsbbTtIH8LhCMxB7ZQGM11PDuvYW5syu+IilDbHK/3r7X/a9yZOO1I8veKW8Qman
 IFVzOI08HD8DQUhN3y3LFKmgMXXvBUck9b9BiAzA9OF/Ti/7OPr8T2RzGe2lMqswrlS1
 eBpZpHa6ap1LMLQ+1HL+yFOm9VB4izgNGzFaagFiRX8NRBt/PedZG0ILZ7P0FOaVYPPS
 cwgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5nwXT8MJcqX8UJaFo07W3PIjWOZSnTBqmDJ+10Sk3qbw4dQ4SIr3GTwjSAvhiLrOwP+Pl7IE+HA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzRJdy7WARO/y7bo4d/1jKiWX10D3hF//X+O9si5G0oZ6K533ua
 pxorsNqAppqSAm4f9u/ZTulrA8kjdzdAlIsRui5Z4C1BQSR2grXGladlI7Of7M+qxVIj4XdhLjw
 9v64UiikqPlrRh0O6jSEb9w8+TaWwLxM=
X-Gm-Gg: AZuq6aKE8l+XT5UajExTSvEABDdGVjJ+HeclymZR6K8RMjypTs3CUHLn3PWeFjh4Ubh
 XX85iRJtyunqotQhVdXiOf/XNmoUJWB8qfcUmkr38PuMYhC0gwNsiQ9VE0lhQEoNnvo6KHjBMCX
 PTlBoO+4aNAySdrGXKee5sYNmC9UbubJofWgmbrruKDZ0NzcE2uYLbcdoHi6sE4v2lDaCEDvCF/
 /bhacD4zeX9D+Ygn3WVkkJmw1pZpkNFvWCB7lQmSG4ENM81I7uEp084w5+GRtR+y0Vp5tVDZmnJ
 YyqM4PAhLYMGQNr5f/mWs8jC8akz5g==
X-Received: by 2002:a05:6000:1acb:b0:432:5bac:3915 with SMTP id
 ffacd0b85a97d-43618053bc4mr9962281f8f.39.1770296693827; Thu, 05 Feb 2026
 05:04:53 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-9-neilb@ownmail.net>
 <5d273a008fc51a2fded785efbe30e5bd2a89b985.camel@kernel.org>
In-Reply-To: <5d273a008fc51a2fded785efbe30e5bd2a89b985.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Feb 2026 14:04:42 +0100
X-Gm-Features: AZwV_QhEkTNuUX-zP-udJB3TTtiGdaNYEr11QFKjoqWXaHOUCtxdu5bQUZv0f1A
Message-ID: <CAOQ4uxh_Ugyy9=Vx_XOzWMTdhqVx6kAu43q+F+afhNF_Zv_9TA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.48; envelope-from=amir73il@gmail.com;
 helo=mail-wr1-f48.google.com
X-Mailman-Approved-At: Thu, 05 Feb 2026 19:25:00 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 NeilBrown <neil@brown.name>, netfs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:neil@brown.name,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,gmail.com,lists.ubuntu.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,brown.name,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid,brown.name:email]
X-Rspamd-Queue-Id: D076CF6D23
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 1:38=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> On Wed, 2026-02-04 at 15:57 +1100, NeilBrown wrote:
> > From: NeilBrown <neil@brown.name>
> >
> > The primary purpose of this patch is to remove the locking from
> > ovl_lookup_real_one() as part of centralising all locking of directorie=
s
> > for name operations.
> >
> > The locking here isn't needed.  By performing consistency tests after
> > the lookup we can be sure that the result of the lookup was valid at
> > least for a moment, which is all the original code promised.
> >
> > lookup_noperm_unlocked() is used for the lookup and it will take the
> > lock if needed only where it is needed.
> >
> > Also:
> >  - don't take a reference to real->d_parent.  The parent is
> >    only use for a pointer comparison, and no reference is needed for
> >    that.
> >  - Several "if" statements have a "goto" followed by "else" - the
> >    else isn't needed: the following statement can directly follow
> >    the "if" as a new statement
> >  - Use a consistent pattern of setting "err" before performing a test
> >    and possibly going to "fail".
> >  - remove the "out" label (now that we don't need to dput(parent) or
> >    unlock) and simply return from fail:.
> >
> > Signed-off-by: NeilBrown <neil@brown.name>
> > ---
> >  fs/overlayfs/export.c | 61 ++++++++++++++++++-------------------------
> >  1 file changed, 26 insertions(+), 35 deletions(-)
> >
> > diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> > index 83f80fdb1567..dcd28ffc4705 100644
> > --- a/fs/overlayfs/export.c
> > +++ b/fs/overlayfs/export.c
> > @@ -359,59 +359,50 @@ static struct dentry *ovl_lookup_real_one(struct =
dentry *connected,
> >                                         struct dentry *real,
> >                                         const struct ovl_layer *layer)
> >  {
> > -     struct inode *dir =3D d_inode(connected);
> > -     struct dentry *this, *parent =3D NULL;
> > +     struct dentry *this;
> >       struct name_snapshot name;
> >       int err;
> >
> >       /*
> > -      * Lookup child overlay dentry by real name. The dir mutex protec=
ts us
> > -      * from racing with overlay rename. If the overlay dentry that is=
 above
> > -      * real has already been moved to a parent that is not under the
> > -      * connected overlay dir, we return -ECHILD and restart the looku=
p of
> > -      * connected real path from the top.
> > +      * @connected is a directory in the overlay and @real is an objec=
t
> > +      * on @layer which is expected to be a child of @connected.
> > +      * The goal is to return a dentry from the overlay which correspo=
nds

As the header comment already says:
"...return a connected overlay dentry whose real dentry is @real"

The wording "corresponds to @real" reduces clarity IMO.

> > +      * to @real.  This is done by looking up the name from @real in
> > +      * @connected and checking that the result meets expectations.
> > +      *
> > +      * Return %-ECHILD if the parent of @real no-longer corresponds t=
o
> > +      * @connected, and %-ESTALE if the dentry found by lookup doesn't
> > +      * correspond to @real.
> >        */

I dislike kernel-doc inside code comments.
I think this is actively discouraged and I haven't found a single example
of this style in fs code.

If you want to keep this format, please lift the comment to function
header comment - it is anyway a very generic comment that explains the
function in general.

> > -     inode_lock_nested(dir, I_MUTEX_PARENT);
> > -     err =3D -ECHILD;
> > -     parent =3D dget_parent(real);
> > -     if (ovl_dentry_real_at(connected, layer->idx) !=3D parent)
> > -             goto fail;
> >
> > -     /*
> > -      * We also need to take a snapshot of real dentry name to protect=
 us
> > -      * from racing with underlying layer rename. In this case, we don=
't
> > -      * care about returning ESTALE, only from dereferencing a free na=
me
> > -      * pointer because we hold no lock on the real dentry.
> > -      */
> >       take_dentry_name_snapshot(&name, real);
> > -     /*
> > -      * No idmap handling here: it's an internal lookup.
> > -      */
> > -     this =3D lookup_noperm(&name.name, connected);
> > +     this =3D lookup_noperm_unlocked(&name.name, connected);
> >       release_dentry_name_snapshot(&name);
> > +
> > +     err =3D -ECHILD;
> > +     if (ovl_dentry_real_at(connected, layer->idx) !=3D real->d_parent=
)
> > +             goto fail;
> > +
> >       err =3D PTR_ERR(this);
> > -     if (IS_ERR(this)) {
> > +     if (IS_ERR(this))
> >               goto fail;
> > -     } else if (!this || !this->d_inode) {
> > -             dput(this);
> > -             err =3D -ENOENT;
> > +
> > +     err =3D -ENOENT;
> > +     if (!this || !this->d_inode)
> >               goto fail;
> > -     } else if (ovl_dentry_real_at(this, layer->idx) !=3D real) {
> > -             dput(this);
> > -             err =3D -ESTALE;
> > +
> > +     err =3D -ESTALE;
> > +     if (ovl_dentry_real_at(this, layer->idx) !=3D real)
> >               goto fail;
> > -     }
> >
> > -out:
> > -     dput(parent);
> > -     inode_unlock(dir);
> >       return this;
> >
> >  fail:
> >       pr_warn_ratelimited("failed to lookup one by real (%pd2, layer=3D=
%d, connected=3D%pd2, err=3D%i)\n",
> >                           real, layer->idx, connected, err);
> > -     this =3D ERR_PTR(err);
> > -     goto out;
> > +     if (!IS_ERR(this))
> > +             dput(this);
> > +     return ERR_PTR(err);
> >  }
> >
> >  static struct dentry *ovl_lookup_real(struct super_block *sb,
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

Otherwise, it looks fine.

Thanks,
Amir.

