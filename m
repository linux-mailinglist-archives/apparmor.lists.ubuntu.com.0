Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBZpLj7uhWnSIQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 14:35:58 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A0FE361
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 14:35:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1voLzn-0006u7-4i; Fri, 06 Feb 2026 13:35:39 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1voLzl-0006tv-Vu
 for apparmor@lists.ubuntu.com; Fri, 06 Feb 2026 13:35:38 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb94ff5so2775555a12.2
 for <apparmor@lists.ubuntu.com>; Fri, 06 Feb 2026 05:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770384937; cv=none;
 d=google.com; s=arc-20240605;
 b=C5Sg5aGqqCpsX6MeOWRb9xqZsfkFnhPZyOc0sAdbwGNNNBTjOPw6c9xLPt4a2O9fgb
 TmrIW+zr5p2mV9m45/fPR4HHvJ+68oo4SkZ2142C4CUGD4mdQp1qHtq2SsWgXoCOt9tm
 MRgjtvoAIT7i3YGmCEYRizfcHhRfh5YYr6Fj6OCjDv7owo5cJmy0VMpoqHbr5aAi32SU
 1JEvvI3FGwSteXGXpGY/TFnuLluKb0zAIkLHZl/yg+QgPBqpzsGVO4q1/CglWrajTUZf
 PdUpyhxenOkYKUqOlBrG5gs4yL0ZK72k2nuiAL3/xAp2ztm/Idc0qEkJEFGDuh7WLBVB
 eU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EpmWnKuQAvcxfN2n9Aws3fxLD/5TLycZ+iQI8ZhYj4E=;
 fh=BAR+e5m2Q8iL0htcvqm4bE/9+pouoxqJP86s/R+5g28=;
 b=dCBBcy7Cex260/WG+6WOvnUfQpYwhoIlbZ4d/ATyKms+rbbIEaNf/K4W00TSSG1QNH
 H+aJzxL8J5BYeN09lkg7CcDssYYBvF3/6WjD1e00RA+KObKSCvO8ALfkP7qqU4F/cz2i
 O2ZYaaWYO6bHL6kwLfEbeDKKFY3OMcus0VCi4e272tFMdYruXdREvucV9FEbJYvxUwql
 J8CFLmdxfPvW9UhkTzbmmWwD3EXRt0q57tyAXEwMuClrq5eFBl1fSbBCMh4TcuhyDXif
 zGq/le9FiICfRJf4eXvzqkdKLsnWiZhU+0eFbrkSLhDE421qV7Aavgk5RmhoFsz8qO5f
 v7Ow==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770384937; x=1770989737; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpmWnKuQAvcxfN2n9Aws3fxLD/5TLycZ+iQI8ZhYj4E=;
 b=SWG5rrS/FQcY1FWNlolhRZl5McCLkeUYkww1uHrPdOOSJMrdDn9ua3E2rQ5T1ZjnKZ
 kJycb2VpGdKzjI9z3y5Zkq3bFwLIxidl9aa5Yzm9cOI2xeg/xaohnzOGP+6ZM2/WYkW4
 vsjWmIKF009g0vtn23O5QKUNTQCD89S+1Mo6mCGY6DI8ZwCC7q6hOaQzNJ7zUM/riVEL
 x8BGBQjW44KowsED9qr3jmK6XDFV84vZ2qO7oa1Ld0a7fBlzIBvvXP0LSexikfF/Qvx4
 WZrMhRjA+UTon6+fBcm7fk3/Gunwb52VvddVhNsIl5pt4+vyBdzseyt80qhBbzqVtEuh
 vGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770384937; x=1770989737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EpmWnKuQAvcxfN2n9Aws3fxLD/5TLycZ+iQI8ZhYj4E=;
 b=ptgt+Wbqb6hvqTNr1ObFRnYNAwvYr3mQP74TaQukGlPodpF6Knoi8dzOJ0td6RYQxy
 47OagGnjoRAiojJ+h27JpOrn9BypkoAbnGHuie7X2X/goTf84rB7JX23Z19pyGX25oZe
 hY1w9zk055WgAOsYIb5oTNk9UKyuhP82Pv5QMIKcg4QxZNDRxcEj32H5v1nGjTJBk1RY
 HCdzdh2P6MkIeAuxFXOeG/tP5z96M3S6NhiqrWPlI3X6SH5HLFU5eim7bNmxETA4tAc+
 C6VTjk2CKV+3oGv7Md+EmSqzPBZatPRaKEe7jlGJ55tExeNV2XkJLn3KQGhaFPq8YcMx
 Eh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkl0pIfDubcGIVdn3iizo8rofPV8NZ5Yboep5G7F0jdNy1fcte3ku4IERf9iAAZJ682L9W1XwgTg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yyq2Gj2bArGPI9V/oRX487ORl1sWy5ty3/Tbanw1eMJGhXo+Q+a
 SK8KyFevcMfVrvAMU3Fenp2G/q4Pf4KHhrHVeUm2pYnCN1/55ZewZKcOGaNSY8IG6WOa36XWqH1
 b1vjUdMWtFTK1v8DEdv/+i/KheHWQ9Tc=
X-Gm-Gg: AZuq6aIDK9C8T6pZfgbj6krZrRuqxRQ9vzWBRILJ6utd2+fujbPOr3Q5gjzI2J0lGw6
 yhmNXmCHd/6so4rQ224WSi+xzWHQ+C0YcoCW1uvq3oT/AXUQhYSHDD0k6YglQoHm3jxHmv/Da21
 wcqchzKHYVqoFv8h9kCnG6+hrVWEDmKBHP43mjPnzGD7XxPlkrFb6DOx2KU/T67gh+D1dHmOsM+
 kSkemzo9nsIeb8neQzfW4XZW5MzSX/K9gBgkuroEGa/2ogPBlRwokIae8nBDeTqTu6soCkcn5Mc
 eOcptYFEBOTtLLWvwN8WNCW4uvo7MQ9wYjCW5lNp
X-Received: by 2002:a05:6402:518f:b0:658:bd60:43e2 with SMTP id
 4fb4d7f45d1cf-659841692cdmr1419837a12.17.1770384937041; Fri, 06 Feb 2026
 05:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-11-neilb@ownmail.net>
 <CAOQ4uxh-MLgwZCstwr6HyPXHVRmtj2F_=xS8pE3FN6Ex-wex4w@mail.gmail.com>
 <177034031005.16766.246184445940612287@noble.neil.brown.name>
In-Reply-To: <177034031005.16766.246184445940612287@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 6 Feb 2026 14:35:25 +0100
X-Gm-Features: AZwV_QjjYiogfyc5arz_rTitKV8bnytIdEM4CjRfI_5mGtvMvwFYoZk4un_zak4
Message-ID: <CAOQ4uxiWE5eVTrL-2EWVHGQEpEX7HSstj_+kEp-b7xZrnfoXMA@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.46; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f46.google.com
Subject: Re: [apparmor] [PATCH 10/13] ovl: change ovl_create_real() to get a
 new lock when re-opening created file.
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
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.944];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ownmail.net:email,brown.name:email]
X-Rspamd-Queue-Id: 5E8A0FE361
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 2:11=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:
>
> On Thu, 05 Feb 2026, Amir Goldstein wrote:
> > On Wed, Feb 4, 2026 at 6:09=E2=80=AFAM NeilBrown <neilb@ownmail.net> wr=
ote:
> > >
> > > From: NeilBrown <neil@brown.name>
> > >
> > > When ovl_create_real() is used to create a file on the upper filesyst=
em
> > > it needs to return the resulting dentry - positive and hashed.
> > > It is usually the case the that dentry passed to the create function
> > > (e.g.  vfs_create()) will be suitable but this is not guaranteed.  Th=
e
> > > filesystem may unhash that dentry forcing a repeat lookup next time t=
he
> > > name is wanted.
> > >
> > > So ovl_create_real() must be (and is) aware of this and prepared to
> > > perform that lookup to get a hash positive dentry.
> > >
> > > This is currently done under that same directory lock that provided
> > > exclusion for the create.  Proposed changes to locking will make this
> > > not possible - as the name, rather than the directory, will be locked=
.
> > > The new APIs provided for lookup and locking do not and cannot suppor=
t
> > > this pattern.
> > >
> > > The lock isn't needed.  ovl_create_real() can drop the lock and then =
get
> > > a new lock for the lookup - then check that the lookup returned the
> > > correct inode.  In a well-behaved configuration where the upper
> > > filesystem is not being modified by a third party, this will always w=
ork
> > > reliably, and if there are separate modification it will fail cleanly=
.
> > >
> > > So change ovl_create_real() to drop the lock and call
> > > ovl_start_creating_upper() to find the correct dentry.  Note that
> > > start_creating doesn't fail if the name already exists.
> > >
> > > This removes the only remaining use of ovl_lookup_upper, so it is
> > > removed.
> > >
> > > Signed-off-by: NeilBrown <neil@brown.name>
> > > ---
> > >  fs/overlayfs/dir.c       | 24 ++++++++++++++++++------
> > >  fs/overlayfs/overlayfs.h |  7 -------
> > >  2 files changed, 18 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> > > index ff3dbd1ca61f..ec08904d084d 100644
> > > --- a/fs/overlayfs/dir.c
> > > +++ b/fs/overlayfs/dir.c
> > > @@ -219,21 +219,33 @@ struct dentry *ovl_create_real(struct ovl_fs *o=
fs, struct dentry *parent,
> > >                 err =3D -EIO;
> > >         } else if (d_unhashed(newdentry)) {
> > >                 struct dentry *d;
> > > +               struct name_snapshot name;
> > >                 /*
> > >                  * Some filesystems (i.e. casefolded) may return an u=
nhashed
> > > -                * negative dentry from the ovl_lookup_upper() call b=
efore
> > > +                * negative dentry from the ovl_start_creating_upper(=
) call before
> > >                  * ovl_create_real().
> >
> >
> > According to the new locking rules, if the hashed dentry itself is
> > the synchronization object, is it going to be allowed to
> > filesystem to unhash the dentry while the dentry still in the
> > "creating" scope? It is hard for me to wrap my head around this.
>
> It can be confusing....
>
> It will be important for the name the remain locked (and hashed) until
> the operation (create, remove, rename) either succeeds or fails.  So
> leaving a dentry unhashed will be OK providing a subsequent lookup will
> also succeed or fail in the same way.  The caller must be able to use
> the dentry to access the object (i.e.  the inode) on success, but they
> is nothing in POSIX that requires that the object still has any
> particular name.
>
> >
> > Or do we need this here because some filesystems (casefold in
> > particular) are not going to support parallel creations?
>
> There is no reason that a casefolding filesystem would not support parall=
el
> ops. And it isn't just casefolding that acts like this.  At least one of
> the special filesystems (tracefs maybe) always unhashes on create.  You
> only ever get a hashed positive dentry as a result of lookup.
> (overlayfs would never see this case of course).
>
> >
> > >                  * In that case, lookup again after making the newden=
try
> > >                  * positive, so ovl_create_upper() always returns a h=
ashed
> > >                  * positive dentry.
> > > +                * As we have to drop the lock before the lookup a ra=
ce
> > > +                * could result in a lookup failure.  In that case we=
 return
> > > +                * an error.
> > >                  */
> > > -               d =3D ovl_lookup_upper(ofs, newdentry->d_name.name, p=
arent,
> > > -                                    newdentry->d_name.len);
> > > -               dput(newdentry);
> > > -               if (IS_ERR_OR_NULL(d))
> > > +               take_dentry_name_snapshot(&name, newdentry);
> > > +               end_creating_keep(newdentry);
> > > +               d =3D ovl_start_creating_upper(ofs, parent, &name.nam=
e);
> > > +               release_dentry_name_snapshot(&name);
> >
> > OK. not saying no to this (yet) but I have to admit that it is pretty
> > ugly that the callers of ovl_create_real() want to create a specific
> > stable name, which is could be passed in as const char *name
> > and yet we end up doing this weird dance here just to keep the name
> > from newdentry.
>
> There are three callers of ovl_create_real()
>
> ovl_lookup_or_create() does have a "const char *name".
> ovl_create_upper() has a stable dentry from which it can copy a QSTR
> ovl_create_temp() would need some sort of dance to keep hold of the
> temporary name that was allocated.
>
> If it weren't for ovl_create_temp() I would agree with you.
>
> Though we could have the three callers of ovl_start_creating_temp() pass =
a
> "char name[OVL_TEMPNAME_SIZE]" in, then ovl_create_temp() would have
> easy access.
> I could do that if you like.

Yes, considering that two of the callers are from the same function
(ovl_whiteout()) I think that would end up looking nicer.

Thanks,
Amir.

