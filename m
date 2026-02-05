Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHucH57uhGkU6wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:18 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D80F6D31
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo4yL-0001LH-Cf; Thu, 05 Feb 2026 19:25:01 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vnyRR-0007ZR-4Z
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 12:26:37 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-65808d08423so1398374a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 05 Feb 2026 04:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770294396; cv=none;
 d=google.com; s=arc-20240605;
 b=PA4N3f2LNtdOLjRu6MTMm+BO0X2CtmfGb8YHBQ+GyL9A3hmpCu1zj6ZTpjCFDv1Oo5
 Ew2WaHlqoE0Z+jofezzjlDcwtttsuLWqLMsL8SvxasvMKspXdunFz261lficC3u/p3wa
 AmFb0Ub2QrUmd5lA60yInx/n3jf5T6DdqWf2EPltuBwQ1ct3TaGAbjwCV4iHUyujSvOn
 +d25SzK95u2ebuEg0j+QjE1Vou1l6qfBg6XYVFLlM33u6Tfgvqm/FJl3EZei2og/BLgz
 Rz6mgg8nlBd0modHLhQYWP4UIrqDCxzlNjMqOCyTRTd0KnC2sHVC3hFayZqInraZ/E54
 6knQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UfB0UXxHCYVgd7CIr3QzJ56G7ROPE9D9qGfdOM8KDP8=;
 fh=6AvIqM8duTOpMcZ0Wy8CcFtYBsBQq2D+hlcntC4v1PE=;
 b=WOXjCzXeQuv8Mp4zHR3R+y2pFJYFI3i7BZn1d5lbNXVEWTQEn2tI2TyN5kk8wFzWkF
 xhqv2xeQarWRD5na9+Cgmafn/Zb7hqjsIgVL/Esc5U5Lx8xXQceKUokMxdZFBb5ioW71
 vKKbECcumKMOcMU8+mvfAk4FrpT+wnJMuK+LhSr+3B80Dz/pf4/C148RqOtD+0btWKFo
 32R00N17vRg7LOhB79WprFdh1Rq4hgLCHLHenuF3Zb3mgY/uOZZRfFAI8w4RcYmRq4DO
 JRL0qdet1KbEz7VFrf3q4V9wjLrgzwqX4ia7X3zM27jx8gOdn5XWyoLIUt6o0MiCMUpb
 F36Q==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770294396; x=1770899196; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfB0UXxHCYVgd7CIr3QzJ56G7ROPE9D9qGfdOM8KDP8=;
 b=GlojQqusWZ079d95je1mk0s2vv/aB1PzRWpprC5eqfGBAObfM8Fg1vU9HcoCYZsR6n
 EvjFO9yZk2kM/I76oXbnXFsFGaP/JcObAKOe3VSBIQdMU1aiYxO5ke0cxlAeNc8e9zlV
 HpO/h0sgLXjTIMapLze0TFGGTwvRh8sw6S2UJoaaOkOk6QhSnKJFIMKC//G+olR3QpSE
 7fS41NkNRyOpiVFR1+SP9dOpxiw+waHJxTk/kAADNLUGn63H6RF4eCxgkYOaRYBJSXX+
 XtYewDia1J3U8AjD1aJeFPV21F/pnfScIT/r4537o+EgBU/ZQ4+imGT37QRmRrvGQmYe
 ia9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770294396; x=1770899196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UfB0UXxHCYVgd7CIr3QzJ56G7ROPE9D9qGfdOM8KDP8=;
 b=UNV0rUdHy72e4jFG/O2ycP4Ax+xvznOv2YZg2bixCHbHFpjA3MyVvAhAQgsyUvl+wK
 0dFH6gkztIUztaTVU5tVrbZZ68+I4bU5gBInJc/TLISVW6yrt5mRRnS3z4kMmhtilmR3
 57ldgJiuhux0EpHOMOL03eBIqtMu+qdRWt0y/TpmU7qd9hIbPyxZwE1g80dRqKzcOEaj
 tYLc0p2XPKODHWL9fZAot2KVnOHvPDl+G2gpiF9n0sJ8+Lh7hcmPBcbO9z7cu6Sji/l6
 qcBPINNcSSOGbEtuVIVwYSL38JF1F2vRI+cK/zAT6/1SUfwJvUBaz9mPkZqpCt6MRmkE
 CNDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2dl5V7JOAr2mYLwZW+YDv4NNNMfuYVJHUoW7MZKJhrDDaJW+qr2Vdhr/T4xmSQMS9TiYxEKTqjw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywkml3W8z1dG+2T6GRVMJbB5DqPZoDiDJnuRsbM+JJ3yBZo7pWd
 YPgKTj5QOQfm1n3hQzLqzpbkFwlsJJTwbJjwtWHZQF/aqRfLU/+6zGWXFWt7lH4SMR2KdQj9kTC
 Ne1pFsWpuf6mgUPxy/dcOF8HSoTKY0Jk=
X-Gm-Gg: AZuq6aJQweBGuxFN3pTO4GG3DrYGkz2jmPRQqI5Y5fuKNnrYShx0ZYXvziO88slHEvU
 2Rn4QntNmB35UDeM2qY/xzlppysNOyEv9AcHwBO8H712YQ29H4ZH5k7q8mU6n0QjBbH9Xku1pXu
 Nyra7xQbv955omxLKi7L2kyeHQ29Dc8YV4SEV7JaQikQ+a5eWDm7TNXs7H4QRK+tnEisDPb/fl/
 1mF9Ltdsig/WQri+2suKIFeeGKHISHh1AjsH8bPHLPKtqG46cvT0QqQdeN1qBaCwveH5RbX/lPi
 +ZU43JJjbjMUpzFF8U+G0DWdxhYEuw==
X-Received: by 2002:a05:6402:2711:b0:658:da9:787d with SMTP id
 4fb4d7f45d1cf-65949dc2762mr3243637a12.21.1770294396096; Thu, 05 Feb 2026
 04:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-11-neilb@ownmail.net>
In-Reply-To: <20260204050726.177283-11-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Feb 2026 13:26:24 +0100
X-Gm-Features: AZwV_QhSomAYq3e-9LVlkwiUvLVwnQqEgYbdyasP4aBJdb_z_a8NyX57euMmGhk
Message-ID: <CAOQ4uxh-MLgwZCstwr6HyPXHVRmtj2F_=xS8pE3FN6Ex-wex4w@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.42; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f42.google.com
X-Mailman-Approved-At: Thu, 05 Feb 2026 19:25:00 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
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
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 68D80F6D31
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 6:09=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:
>
> From: NeilBrown <neil@brown.name>
>
> When ovl_create_real() is used to create a file on the upper filesystem
> it needs to return the resulting dentry - positive and hashed.
> It is usually the case the that dentry passed to the create function
> (e.g.  vfs_create()) will be suitable but this is not guaranteed.  The
> filesystem may unhash that dentry forcing a repeat lookup next time the
> name is wanted.
>
> So ovl_create_real() must be (and is) aware of this and prepared to
> perform that lookup to get a hash positive dentry.
>
> This is currently done under that same directory lock that provided
> exclusion for the create.  Proposed changes to locking will make this
> not possible - as the name, rather than the directory, will be locked.
> The new APIs provided for lookup and locking do not and cannot support
> this pattern.
>
> The lock isn't needed.  ovl_create_real() can drop the lock and then get
> a new lock for the lookup - then check that the lookup returned the
> correct inode.  In a well-behaved configuration where the upper
> filesystem is not being modified by a third party, this will always work
> reliably, and if there are separate modification it will fail cleanly.
>
> So change ovl_create_real() to drop the lock and call
> ovl_start_creating_upper() to find the correct dentry.  Note that
> start_creating doesn't fail if the name already exists.
>
> This removes the only remaining use of ovl_lookup_upper, so it is
> removed.
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/overlayfs/dir.c       | 24 ++++++++++++++++++------
>  fs/overlayfs/overlayfs.h |  7 -------
>  2 files changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index ff3dbd1ca61f..ec08904d084d 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -219,21 +219,33 @@ struct dentry *ovl_create_real(struct ovl_fs *ofs, =
struct dentry *parent,
>                 err =3D -EIO;
>         } else if (d_unhashed(newdentry)) {
>                 struct dentry *d;
> +               struct name_snapshot name;
>                 /*
>                  * Some filesystems (i.e. casefolded) may return an unhas=
hed
> -                * negative dentry from the ovl_lookup_upper() call befor=
e
> +                * negative dentry from the ovl_start_creating_upper() ca=
ll before
>                  * ovl_create_real().


According to the new locking rules, if the hashed dentry itself is
the synchronization object, is it going to be allowed to
filesystem to unhash the dentry while the dentry still in the
"creating" scope? It is hard for me to wrap my head around this.

Or do we need this here because some filesystems (casefold in
particular) are not going to support parallel creations?

>                  * In that case, lookup again after making the newdentry
>                  * positive, so ovl_create_upper() always returns a hashe=
d
>                  * positive dentry.
> +                * As we have to drop the lock before the lookup a race
> +                * could result in a lookup failure.  In that case we ret=
urn
> +                * an error.
>                  */
> -               d =3D ovl_lookup_upper(ofs, newdentry->d_name.name, paren=
t,
> -                                    newdentry->d_name.len);
> -               dput(newdentry);
> -               if (IS_ERR_OR_NULL(d))
> +               take_dentry_name_snapshot(&name, newdentry);
> +               end_creating_keep(newdentry);
> +               d =3D ovl_start_creating_upper(ofs, parent, &name.name);
> +               release_dentry_name_snapshot(&name);

OK. not saying no to this (yet) but I have to admit that it is pretty
ugly that the callers of ovl_create_real() want to create a specific
stable name, which is could be passed in as const char *name
and yet we end up doing this weird dance here just to keep the name
from newdentry.

Thanks,
Amir.

