Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPH/EF5ZnGmzEgQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 14:42:54 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5117725B
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 14:42:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuWCo-0005q7-By; Mon, 23 Feb 2026 13:42:34 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vuWCm-0005pt-PR
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 13:42:32 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-65c01595276so6507605a12.1
 for <apparmor@lists.ubuntu.com>; Mon, 23 Feb 2026 05:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771854152; cv=none;
 d=google.com; s=arc-20240605;
 b=MooJTlTZeRMsbpjhbwGq9qAv9POdtecueZVX+0U0+76PDghj43gnJHapSDSO/5Clti
 fHeXMdXQ+bZ5EPFOSRhLkJSDMPWN/pR0zBsqf3/Q4Unc3uw4Ve260lbYzkd3NLOLe+/V
 ohgculL1iv/W7NY02VOu82/HcMyBIJoQv3jGxS9tOK649D9zrvUXs9Qz70BabXiy75cb
 /4mQKz/71szXm1N3vctX3KvK08J5xPmGUX6OCtFHgrNdVUDjmQ3qZsjRJ2a6LkFuzAio
 zylpvU6ulWYYoY+VgBcyWUW17GRLX19mLzVdRV9VWIETQjkBWje/ljsvRo+izEUY8/d7
 yy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RYqIR5a+IIRIL9B6CcCBN1lSzoy1pmPgI7+7PRVLxeU=;
 fh=Il8oPsmolL3JgIIhYg8f9tnN8nkFShFOLaH0Brnm400=;
 b=E/DsYZnRp5/0bqm5aW0cFcyeW8l2apmh+Rb5lYOockIg6g+tSTj72KnAlXjRwL/bxJ
 OLHrB2DDnSbOLQ9OkQsMPW5jXSPQwNXAGU7yw4LjBEIqLr65WzdLbe06lYff2/+UgE8A
 ICFKNsh8BfGmuEzDRtNWVa3Im/3b9t65xkQ1TUUjtKpQgB3kesl+8FyN5HKhhCoI9jA6
 xC5ua5EMA1aLaUop7d8+drxxjPMGExwkO42RSUdpmCwzWtqURDlQlB1w7ZCjZawc8YD+
 o6wtseCX5gmebLzk5aG/NI6wEEnHc8uNg+64PEbczhoB4X2ZD7XEEC9JuGmLYP6I0NpU
 MgWw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771854152; x=1772458952; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYqIR5a+IIRIL9B6CcCBN1lSzoy1pmPgI7+7PRVLxeU=;
 b=aNXrPoaD3iQiQQUU8FbyFqqaPxF9qtIkTVm78Jbq6tvJrYYAm1GIBtzEhAylWgSE49
 CH0fOP4+1HYnXk4LcAbnHirRu2Iabfwjh2H6VTdC3FSOoa/dlVZxPx1/v9Tzrdonn2jK
 gfJ96Cgm5qFGULBgbDqWTFOEwMF4SKlOBVym2UPJbQoHwXoqYXShr0piaa73ZEjc9Go3
 QITU9FjeMhShmQJzGs6Wfq8bdJR2GpQf/6uzZ/HT8LH0iaTGwd7cttxGq3LNeNKDYXNI
 76+52GpupL8lZE5QxDP1fMsyMMJiWyvoZjHDIizfJ5VVOOcT5qsHcom3qLnmOgSMbT4Y
 ECvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771854152; x=1772458952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RYqIR5a+IIRIL9B6CcCBN1lSzoy1pmPgI7+7PRVLxeU=;
 b=HjXvCbvtaSbk60y0ykh/JdzmMLxaCZh1nD8dbprReQIX97nqnoM92kh2VRkVw1gB2w
 N0FWPABSTteUJd42Mn5GwaRzYgTLK6ejmTNE4MtugGmWbw+rhbaIEDwDrMdG9jDPP2eM
 XMEMvXtweG38Ah1AX+E5SxtRkoInZP+NazsDHECCqbxdk1r8VVZPSwoOwvakycjyg72l
 Q9GHH2MXXRVOlobDoL6Jedq2j9pE3gH7RmM7DszS5QfrPwqhm1CuHTp1grvedMRBHnBf
 HZKUy6uUJpa9zpPbUtyYJmKTUO0p9Tj3Q/oWNSejZmJ+vMaARu70oL9MYQ0i9MH63oIw
 76lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxGx09HwF4i6VdxsCVpYh9KWSgexLBUNULG9+8PSPYwMsOUimibhm0M+Qjhaz7NTVnpvg53yDuYg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwOr+Iy01+4GQREyJTY5+5tZELnp6Xpxqd4co+S8qgcHbP+nwZ3
 SWBbT9jmtibAQAohJ5TlQHcgPZypNIfOm46yHL9MTbulm2bN9awBBYcdezk9dzomJZH++fr2by2
 OvjYeJcdwe8+mJIz/ITsiMjTtM65Wwug=
X-Gm-Gg: AZuq6aLfRfBCH7O8SdztfVat6EOoO2+4pRjnaSn4QRjeGG85bnRfVj7NQCP6RuX1UtE
 MYF/P+FXGqpx7ukDR8iQmJIatpVR41rDIFYq3XMLu2X5Obxksx9H/8QcEbeFtVQPZbdHgekNT3C
 n/UIdCFsUA02MFbBv51Pv5inGzlcjgN2ZVoUBVe6Y4KvQ8Lct4Yh7ifpSu7znzAMs0LPbkyz+wW
 VWNgyFhVyv2cMf1KhkNt8zXB/MjSosBRk/ElhjkK2/Z++0Lquz4c5PIpk2YapA0tqaW8oyZyVsc
 S53j0X5LhoHNhCGPAazJ8pNiFSfGawU/NHGnP5TQIQ==
X-Received: by 2002:a17:907:84b:b0:b90:bc06:2acc with SMTP id
 a640c23a62f3a-b90bc063e40mr41246666b.5.1771854151460; Mon, 23 Feb 2026
 05:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-10-neilb@ownmail.net>
 <20260223132027.4165509-1-clm@meta.com>
In-Reply-To: <20260223132027.4165509-1-clm@meta.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Feb 2026 15:42:19 +0200
X-Gm-Features: AaiRm52WUoDV9vuNNf_TRYKkff03CBHKSKX_6G_n5O_M7CVzPVA-lit5gSUxti8
Message-ID: <CAOQ4uxirM8dW9rOw4SvGtfH-s0Eg9LGuFk1aZooMvEDc=2tbyA@mail.gmail.com>
To: Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.49; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f49.google.com
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 James Morris <jmorris@namei.org>, NeilBrown <neil@brown.name>,
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
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:jack@suse.cz,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:neil@brown.name,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,brown.name,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,gmail.com,oracle.com,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,brown.name:email,ownmail.net:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D1D5117725B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 2:20=E2=80=AFPM Chris Mason <clm@meta.com> wrote:
>
> NeilBrown <neilb@ownmail.net> wrote:
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
>
> Hi everyone,
>
> Amir asked me to run these through, and this commit was flagged.  I recen=
tly
> changed the prompts to include some vfs knowledge:

Thanks Chris!

>
> https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/vfs.=
md
>
> And I also put in some words to make it prefer reporting problems that mi=
ght
> not be bugs, but that do violate some rule in the .md files.  This might
> be a false positive from that new shift toward blindly trusting the guide=
s,
> but I'll let everyone here decide:
>
> commit d1bfcef048896cdc9e4c57e3249b6ad344d64c02
> Author: NeilBrown <neil@brown.name>
>
> ovl: Simplify ovl_lookup_real_one()
>
> This patch removes locking from ovl_lookup_real_one() and reorganizes the
> control flow. The function now uses lookup_noperm_unlocked() instead of
> lookup_noperm() and performs consistency validation after the lookup rath=
er
> than holding a lock during the operation.
>
> > diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> > index 83f80fdb15674..b448fc9424b64 100644
> > --- a/fs/overlayfs/export.c
> > +++ b/fs/overlayfs/export.c
> > @@ -349,69 +349,64 @@ static struct dentry *ovl_dentry_real_at(struct d=
entry *dentry, int idx)
> >       return NULL;
> >  }
> >
> > -/*
> > - * Lookup a child overlay dentry to get a connected overlay dentry who=
se real
> > - * dentry is @real. If @real is on upper layer, we lookup a child over=
lay
> > - * dentry with the same name as the real dentry. Otherwise, we need to=
 consult
> > - * index for lookup.
> > +/**
> > + * ovl_lookup_real_one -  Lookup a child overlay dentry to get an over=
lay dentry whose real dentry is given
> > + * @connected: parent overlay dentry
> > + * @real: given child real dentry
> > + * @layer: layer in which @real exists
> > + *
> > + *
> > + * Lookup a child overlay dentry in @connected with the same name as t=
he @real
> > + * dentry.  Then check that the parent of the result is the real dentr=
y for
> > + * @connected, and @real is the real dentry for the result.
> > + *
> > + * Returns:
> > + *   %-ECHILD if the parent of @real is no longer the real dentry for =
@connected.
> > + *   %-ESTALE if @real is no the real dentry of the found dentry.
>                                        ^^
> There's a typo here: "is no the" should be "is not the".
>
> > + *   Otherwise the found dentry is returned.
> >   */
> >  static struct dentry *ovl_lookup_real_one(struct dentry *connected,
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
> > -      */
> > -     inode_lock_nested(dir, I_MUTEX_PARENT);
> > -     err =3D -ECHILD;
> > -     parent =3D dget_parent(real);
> > -     if (ovl_dentry_real_at(connected, layer->idx) !=3D parent)
> > -             goto fail;
> > -
> > -     /*
> > -      * We also need to take a snapshot of real dentry name to protect=
 us
> > +      * We need to take a snapshot of real dentry name to protect us
> >        * from racing with underlying layer rename. In this case, we don=
't
> >        * care about returning ESTALE, only from dereferencing a free na=
me
> >        * pointer because we hold no lock on the real dentry.
> >        */
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
>
> A subsystem pattern flags this as potentially concerning: the VFS subsyst=
em
> guide indicates that TOCTOU validation checking d_parent should also chec=
k
> d_unhashed() because a dentry can be unhashed (removed from dcache by
> concurrent operations) while its d_parent pointer remains unchanged.
>
> The old code held inode_lock_nested(dir, I_MUTEX_PARENT) during the entir=
e
> lookup and validation, which serialized with operations that could unhash=
 the
> dentry. The new lockless pattern creates a window where:
>
> 1. lookup_noperm_unlocked() completes and returns dentry `this`
> 2. A concurrent unlink/remove operation unhashes `this`
> 3. The d_parent validation passes (parent pointer unchanged)
> 4. The function returns an unhashed dentry
>
> Other overlayfs code uses the complete pattern. For example, in
> ovl_lock_rename_workdir() at fs/overlayfs/util.c:
>
>     if (work->d_parent !=3D workdir || d_unhashed(work)) {
>         ...
>     }
>
> Could this validation miss a race where the dentry is unhashed but d_pare=
nt
> still matches? The subsequent checks (!this->d_inode for -ENOENT,
> wrong real dentry for -ESTALE) might catch some cases, but is that
> sufficient for all the scenarios where an unhashed dentry could cause
> problems?
>

It's a very good comment and very important rule to check, since
we have at least 3 fix commits on breaking this rule, but as this
code is utterly confusing to most human I do not blame LLM for getting
confused here.

The lock not taken on 'dir' which is the overlayfs inode and the checked
'real' dentry is on the underlying fs.

Therefore, the check of real->d_parent was not protected in old code as
well as in new code - it is a mere best effort sanity check, so I think
there is no added risk here.

Neil, do you agree?

Thanks,
Amir.

