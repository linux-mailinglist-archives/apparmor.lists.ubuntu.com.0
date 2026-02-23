Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP4YJSOPnGmdJQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 18:32:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913717ADEE
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 18:32:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuZmp-0005T9-0Y; Mon, 23 Feb 2026 17:31:59 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1vuZmm-0005Sz-Lx
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 17:31:56 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-824c9da9928so2272758b3a.3
 for <apparmor@lists.ubuntu.com>; Mon, 23 Feb 2026 09:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771867915; cv=none;
 d=google.com; s=arc-20240605;
 b=YAL0Tf6uaIXyvbM7PtGTHU62/WvkeXixQDuL4//uqHH9w7QDcjlnZ5XZeSGenpLt3i
 ihSMWXzue6JXgs3mbOC6PQA1JH/o6pOKg7Lumg57SywjbeOTY8qEDqEqfGM2e4Kx4iL/
 yGsZkeBNE3AQXzOgkBqvtQxvdEAQubticiFx2CdV8O6kt6qJYqUN4jdQk1Px2wL+iINt
 FWUot0EHXJDRuUhHtrIFUe0WnEorok9s89PyoBu8BIf6MjqFbV6dwba+aoHewqu3BCiW
 gv++JorzyjagrYHdcTIIpwzX9DzlhoiSKqhuIf7wHGmDD8nehvCgGsbh2PMXyebV/RWk
 hc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6UKo5s8UZQoKFDeeGaREA8NHzO9NWVOgEQkt9hAvBaw=;
 fh=L7ueVR2fMZ1ENKuwLHN61eVgewASfF8/ywF1ZbvrRW8=;
 b=AWSRziUhRLRPcExZSrMgbsrUkEImQshs8R0Ku4jECOLsdnvi7LCJFeV6FoDhSWxuR2
 iKghHImfmUKkgwVo37hI0FEGS5dVWdv/x0I0xNvuP1JdheRB2mtX05Mf1xYYWbGsoMGo
 xE/bHDUCTR3duLt1DUXMfAdEZjF5YDw0X1r+bYAwyUqaPI0IZoyY0TEw+hbhcFf8rq4k
 LGkPiuxPnZ5515vVn/O6YqnqwXJUj7M8dg/uYBGv+O6/UwgjFWblyTdrIsywiP6mcEQW
 5te46O2E75ejmrT6PBDTTHxPRxhjrntdC8Jf1x0zSHKQkdVJctplsBR/0nBJGwxEmHxY
 4m5w==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1771867915; x=1772472715; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UKo5s8UZQoKFDeeGaREA8NHzO9NWVOgEQkt9hAvBaw=;
 b=JNW+mwdQ2suMou/N1WvKV32/ydd7x77/2yIzg2v7MOo3IO6lHP4dgFjynLCKe3+0qQ
 HjfQuMukcMvHPoaiNCN+znx/jBvGWxpPZSAGiIRhsnZawk9ZutvZswNdmqA4owXlCO6w
 vHpvN08LtOja5MeAUOlcudtfarocRi6wlaWiZLk+v9zcg6SgUOpfVSmqYnHfbkjwtd6K
 XENuQlvDhbXZbaXgrI7gz6BV23RXe/tP1kPwLb3ns9uOM6FgMycEpww5tVFQAr6tW/sy
 8e28b3oO5D5ZNMeO15IIrzSHo5psVzFB9gBVB8XLN6tz4U88L5anCdYWzN+JOpRNA3RQ
 iJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771867915; x=1772472715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6UKo5s8UZQoKFDeeGaREA8NHzO9NWVOgEQkt9hAvBaw=;
 b=D1H+g0vqYAoUEro9AhVSar3bO6oARFB1gXf1k/FXCSdx56sPdMsgMfDmz71ML4onMM
 va5+cvNBmEftbIH+H9FmN5vqU4QWBnBDKh826bxAcZ7orZb+qDDCR0gzG7lypRBwAgGO
 NJRRJIj0XMzMYoH/XpiDguxAj0513RXMWtp25n9LbYqt7bJzxTxew2BrbvLrr+qMeQF2
 rzXrrkJts5ZBVHKBBfqyvhGEss5u0wpt4gy6jPdhT0sTeDRWlrd+7baLnNLbrQLcd983
 XzaG8pvg4IVn/LorSX1IZc1otNNzvlAaGZMpT9u4rghrbCmF0SRcyelQo3ztVYwSpedE
 UvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz2+9E8gvV5i86wOk2imH20+bQ8jBVEumLaBdMrmHYvIN8NeiCzBhIVrBlMxFqG722AHByaumqhA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yycz7swd4GIaq57KLmrAKlWx6ZykNkNoWCSGX6mTrCjA5TqsffW
 ja0yP/kn8kW6Y/hbINaUPYImhquxSeaCS+Bk6V8BZRQJuD3jcRyHk3BzzDKyBYo2jK1SlNhs7te
 t/H14AOT+3GcQkmGE3/eR7fKUsyabC2/IzQypu4np
X-Gm-Gg: ATEYQzwkOqpYqBjg88k1M9jz7LDjO2cSktw1E/UAny26W8TMcjpRDbre9uDpnwIMauP
 0s437c6y3spRgdtJQZl3LpaKrB/M0Bg2tuFz+5CY2dlVnfJo6zxLKb7OTvegbOlFE0D3iFn3TL2
 vfW4LULqZja2kRPD7UC4QMQyYbvRfFmepKvEav743dTqF1RPa9KvblMtijAe+MJHm7haU3gA2Ro
 /Gl84sfSQOwYlayvw6Rlwh4uN3RfWLhH7CY0WeZw4Hkh0ZZNUOFQIYj7hfR/sKrwqDBe1fPTQmF
 PE1XSMM=
X-Received: by 2002:a17:90b:2543:b0:352:b674:2592 with SMTP id
 98e67ed59e1d1-358ae7c3605mr8357173a91.7.1771867914678; Mon, 23 Feb 2026
 09:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-7-neilb@ownmail.net>
 <20260223132533.136328-1-clm@meta.com>
In-Reply-To: <20260223132533.136328-1-clm@meta.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Feb 2026 12:31:40 -0500
X-Gm-Features: AaiRm52jwDH7iM8Njra-WDPg6xnZ2flvbCTBnLCHZ5MkdIrvbyo0z9crRKbktmQ
Message-ID: <CAHC9VhSVjLNeTdxHmwYsGX75Z4FOAP+26=PjVdFxpmEkTrPvxA@mail.gmail.com>
To: Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.181; envelope-from=paul@paul-moore.com;
 helo=mail-pf1-f181.google.com
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
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
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:neil@brown.name,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,szeredi.hu,namei.org,brown.name,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,ownmail.net:email,mail.gmail.com:mid,meta.com:email,paul-moore.com:url,paul-moore.com:email]
X-Rspamd-Queue-Id: 2913717ADEE
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 8:26=E2=80=AFAM Chris Mason <clm@meta.com> wrote:
> NeilBrown <neilb@ownmail.net> wrote:
> > From: NeilBrown <neil@brown.name>
> >
> > Instead of explicitly locking the parent and performing a lookup in
> > selinux, use simple_start_creating(), and then use
> > simple_done_creating() to unlock.
> >
>
> Hi everyone,
>
> Amir suggested I run these through, and this commit was flagged:
>
> commit bc981629767980bbaee2ca3c7348b5a648665a9d
> Author: NeilBrown <neil@brown.name>
>
> selinux: Use simple_start_creating() / simple_done_creating()
>
> Instead of explicitly locking the parent and performing a lookup in
> selinux, use simple_start_creating(), and then use
> simple_done_creating() to unlock.
>
> This extends the region that the directory is locked for, and also
> performs a lookup. The lock extension is of no real consequence.
> The lookup uses simple_lookup() and so always succeeds. Thus when
> d_make_persistent() is called the dentry will already be hashed.
> d_make_persistent() handles this case.
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Acked-by: Paul Moore <paul@paul-moore.com>
>
> > diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.=
c
> > index 3245cc531555b..7d4f90e5b12a0 100644
> > --- a/security/selinux/selinuxfs.c
> > +++ b/security/selinux/selinuxfs.c
> > @@ -1931,15 +1931,16 @@ static const struct inode_operations swapover_d=
ir_inode_operations =3D {
> >  static struct dentry *sel_make_swapover_dir(struct super_block *sb,
> >                                               unsigned long *ino)
> >  {
> > -     struct dentry *dentry =3D d_alloc_name(sb->s_root, ".swapover");
> > +     struct dentry *dentry;
> >       struct inode *inode;
> >
> > -     if (!dentry)
> > +     inode =3D sel_make_inode(sb, S_IFDIR);
> > +     if (!inode)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     inode =3D sel_make_inode(sb, S_IFDIR);
> > -     if (!inode) {
> > -             dput(dentry);
> > +     dentry =3D simple_start_creating(sb->s_root, ".swapover");
> > +     if (!dentry) {
> > +             iput(inode);
> >               return ERR_PTR(-ENOMEM);
> >       }
>
> Can this cause a kernel crash when simple_start_creating() fails?
>
> The function simple_start_creating() returns ERR_PTR on failure, not
> NULL. The check `if (!dentry)` only catches NULL values. When
> simple_start_creating() fails and returns an ERR_PTR value like
> ERR_PTR(-ENOMEM), this value is non-NULL and the error check is bypassed.
>
> Execution would continue to d_make_persistent(dentry, inode), which
> attempts to lock dentry->d_lock, dereferencing the ERR_PTR value and
> causing a kernel crash.
>
> The old code used d_alloc_name() which returns NULL on error. The new
> code uses simple_start_creating() which returns ERR_PTR on error, but
> the error checking pattern wasn't updated to match.
>
> Should the check be `if (IS_ERR(dentry))` instead, and return dentry
> rather than ERR_PTR(-ENOMEM) to preserve the actual error code?

Good catch Chris, yes, please change this Neil and feel free to preserve my=
 ACK.

--=20
paul-moore.com

