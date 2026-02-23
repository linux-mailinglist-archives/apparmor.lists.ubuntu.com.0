Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGwTJXcgnGkZ/wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:40:07 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B561740EB
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:40:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuSPz-0002dn-1q; Mon, 23 Feb 2026 09:39:55 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vuSPx-0002de-In
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 09:39:53 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b8fb6ad3243so596433966b.1
 for <apparmor@lists.ubuntu.com>; Mon, 23 Feb 2026 01:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771839593; cv=none;
 d=google.com; s=arc-20240605;
 b=aJmTLcHMcaUZl16A1nLUogjXcKm+weTN0kQOwliw22oa/rQvp0hgeM4R/jB23anUST
 vGGIU5PMd4S/G2e1tFkWWt3tFtOVDQiRKz51w9I6ctHwP7zntSXt3Gk5JKtmoD+hmb51
 Yh36cKU7mqL0BS5+jiyWKkLJXSLC5pLXTlmX1nfOaNJjyuxgLxOxA+tVxva0PNUJ+HMf
 JVw2g+e5X0Gw4oEaiYkVQRMb4qJ7IBz4K7P0+SagtwOGQ71uuu5wMufyJkACSOucviAi
 fds/UpurFNdFrv913095S5SDvzDKITCochTeN1Z2v9KeGoL908G4AfNxN8PVFF0G7oz1
 JTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CdIlV/ChuwGIF+GC1fBCbGy0HUmwCjEnTpmiQxTAsXA=;
 fh=lgAExtfNW7u+eYtPRGDHMKOJS6R8ZKelfBv/YIFSnjc=;
 b=DwagQ4WuMDacixlQmNv4cG2R4X2uCp9jRDfKbL3rKFrHCjkAvxrNQUtfdNFwcg8Mpn
 k5aF4BZBI3z7zrORBbT8lnDQ73t2QYNXIJweDNbgDGgAxhn4UQsWxRo6rX7MTRYe5WmY
 TUkHIZQ55qLRHI/9IYJrgVU/9TveCSESVSU3iciYoNuDdWNH/8r5tVoQLrVynD91qvWs
 AIyDK0ihU0/+9sCmdmhgDnzpUqWdB+Hsmi9JhWSHMGUjdpdAyjicuKdf/Kly9FiRdDFv
 St5xKLWh6k+4qc2W7SwxyzutLlRyHgKP2A6m2KywnHdrYwcG+s27MqFbFwvggQo/czsR
 PBMA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771839593; x=1772444393; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdIlV/ChuwGIF+GC1fBCbGy0HUmwCjEnTpmiQxTAsXA=;
 b=jFbLYFLipXfj/qV14OWfU5pkFyyEu3EtdTFUinh/ULuWy5wayM1ShNbU8QmjRY011r
 tKVF/lqRWbjg1JrbAw1saFs7fdZIYyZ5cBOyOpd4k9qz/+7rCT2SegPbxjRwYC4wfMSH
 3rIvlt2jbn/a1mKk3Nq6FrfujYzniQMuwN5LXokKQB9NIz7ZfmEZNCq6eI/QbIJj/GvF
 //zif752X3A2OKu+K2RX33+6LvQNPqpUglJ/aPtJ4W0GYcsmiu/AA7nLVtRQY4yvDMBS
 pgqTajimBmIkhc0RSg+0Odmr+3J1d+EbkyfyWTHc0BN6YD3mUagx8UytG9+X5CQCcWOW
 ZAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771839593; x=1772444393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CdIlV/ChuwGIF+GC1fBCbGy0HUmwCjEnTpmiQxTAsXA=;
 b=FhbmGAUAIXGQcwvOCh+v3VnNfEEoSGFZXjG4+wkr6hciXsVHuuJefr6G5xK1wzAIBS
 cEy+lauzhcZOGZVr6ApS0fetZMMHkqySl7UFnA57+4PmaegJYq65AIXA93tOY0NKokWu
 VWECbZlP84yixsmv662kZZ+LoqOXU/suFEtyEWQ6VssA8nndhhbouM2f4J6bNlCl04Qw
 64cpxuXb99KRsrmVsTmvJj0hF8z48lqgLyY68m/jNcswyjghQvqbuWrjpp0yvrPdFO8J
 rsD4534cmbW3h7Uin4sQpjS+r8T7zDLyxULf0PB7ueTdgW2DcopbkmsmHbrgBZ0CuH+s
 lhyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqRH8gmEKxOu9vaSq5OXqMsr21HBnKT0BPsBFj3HUG4R/nNB+VCgk3oEhTZ8uiKrsnJiIYxR0nA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyZAlPVvCJyOibCGZ7z8obpCr+/oqzfUu+Ptk5jpq5xIqxTlUjH
 z5zDMY6Ad+msTAAYiOCM0SskBo8IbhDMOwxO6hSi7LgIU8vyH2Lz50qcIu6cH/OdQTn49EpELdg
 p7ZK2W4VSiNao+zrzS5ienTs9FURstY8=
X-Gm-Gg: AZuq6aL8nM4QU1Q+BdEq72TNIxlxuT4SmeZtjxVaGQd854vOmivfzq79AhbN9YyOm6W
 +dtzAgUPfNrHBOP91FQewRdIMzAVpYkRD0KuOf1PAfhfP607zNMAU5D/QmK7awCTOzI1zczBweZ
 CXj58+vOrCnpeyQMIA02WEfcCa2vSTJpI9tMAgO+z8SbkZ1ioLnOxY+YbNSfBEhBPl6dh3bhpyR
 iwmS+NzMPwFw23MX3gqHbZJqCaIBhYjJC89zYaN056JieFr8mewyfau2eBno5VTbgwG2R3N1+XR
 X03tz9wMFR67hC0EoXzl3tPYGIG+7zC/31hnpWWHNw==
X-Received: by 2002:a17:907:1c82:b0:b8e:9d66:f5fb with SMTP id
 a640c23a62f3a-b9081740d0dmr424886666b.0.1771839592396; Mon, 23 Feb 2026
 01:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-13-neilb@ownmail.net>
In-Reply-To: <20260223011210.3853517-13-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Feb 2026 11:39:39 +0200
X-Gm-Features: AaiRm520yGF-zG-sk2MFqVbrXx4CSPHjFRw_GQJQRDsdMUgjtqZIz9W0G6HtkPM
Message-ID: <CAOQ4uxg0k2TMdmxoTL5-HW=5njZijX=FzMgWgVBa2GuHYV3-Zg@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.52; envelope-from=amir73il@gmail.com;
 helo=mail-ej1-f52.google.com
Subject: Re: [apparmor] [PATCH v2 12/15] ovl: change ovl_create_real() to
 get a new lock when re-opening created file.
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
 selinux@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:apparmor@lists.ubuntu.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.ubuntu.com,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid,brown.name:email,ownmail.net:email]
X-Rspamd-Queue-Id: 45B561740EB
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 2:14=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
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
> The lookup previously used the name from newdentry which was guaranteed
> to be stable because the parent directory was locked.  As we now drop
> the lock we lose that guarantee.  As newdentry is unhashed it is
> unlikely for the name to change, but safest not to depend on that.  So
> the expected name is now passed in to ovl_create_real() and that is
> used.
>
> This removes the only remaining use of ovl_lookup_upper, so it is
> removed.
>
> Signed-off-by: NeilBrown <neil@brown.name>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/dir.c       | 36 ++++++++++++++++++++++++------------
>  fs/overlayfs/overlayfs.h |  8 +-------
>  fs/overlayfs/super.c     |  1 +
>  3 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index c4feb89ad1e3..6285069ccc59 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -159,7 +159,8 @@ int ovl_cleanup_and_whiteout(struct ovl_fs *ofs, stru=
ct dentry *dir,
>  }
>
>  struct dentry *ovl_create_real(struct ovl_fs *ofs, struct dentry *parent=
,
> -                              struct dentry *newdentry, struct ovl_cattr=
 *attr)
> +                              struct dentry *newdentry, struct qstr *qna=
me,
> +                              struct ovl_cattr *attr)
>  {
>         struct inode *dir =3D parent->d_inode;
>         int err;
> @@ -221,19 +222,29 @@ struct dentry *ovl_create_real(struct ovl_fs *ofs, =
struct dentry *parent,
>                 struct dentry *d;
>                 /*
>                  * Some filesystems (i.e. casefolded) may return an unhas=
hed
> -                * negative dentry from the ovl_lookup_upper() call befor=
e
> +                * negative dentry from the ovl_start_creating_upper() ca=
ll before
>                  * ovl_create_real().
>                  * In that case, lookup again after making the newdentry
>                  * positive, so ovl_create_upper() always returns a hashe=
d
> -                * positive dentry.
> +                * positive dentry.  We lookup using qname which should b=
e
> +                * the same name as newentry, but is certain not to chang=
e.
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
> +               end_creating_keep(newdentry);
> +               d =3D ovl_start_creating_upper(ofs, parent, qname);
> +
> +               if (IS_ERR_OR_NULL(d)) {
>                         err =3D d ? PTR_ERR(d) : -ENOENT;
> -               else
> +               } else if (d->d_inode !=3D newdentry->d_inode) {
> +                       err =3D -EIO;
> +                       dput(newdentry);
> +               } else {
> +                       dput(newdentry);
>                         return d;
> +               }
> +               return ERR_PTR(err);
>         }
>  out:
>         if (err) {
> @@ -252,7 +263,7 @@ struct dentry *ovl_create_temp(struct ovl_fs *ofs, st=
ruct dentry *workdir,
>         ret =3D ovl_start_creating_temp(ofs, workdir, name);
>         if (IS_ERR(ret))
>                 return ret;
> -       ret =3D ovl_create_real(ofs, workdir, ret, attr);
> +       ret =3D ovl_create_real(ofs, workdir, ret, &QSTR(name), attr);
>         return end_creating_keep(ret);
>  }
>
> @@ -352,14 +363,15 @@ static int ovl_create_upper(struct dentry *dentry, =
struct inode *inode,
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct dentry *upperdir =3D ovl_dentry_upper(dentry->d_parent);
>         struct dentry *newdentry;
> +       struct qstr qname =3D QSTR_LEN(dentry->d_name.name,
> +                                    dentry->d_name.len);
>         int err;
>
>         newdentry =3D ovl_start_creating_upper(ofs, upperdir,
> -                                            &QSTR_LEN(dentry->d_name.nam=
e,
> -                                                      dentry->d_name.len=
));
> +                                            &qname);
>         if (IS_ERR(newdentry))
>                 return PTR_ERR(newdentry);
> -       newdentry =3D ovl_create_real(ofs, upperdir, newdentry, attr);
> +       newdentry =3D ovl_create_real(ofs, upperdir, newdentry, &qname, a=
ttr);
>         if (IS_ERR(newdentry))
>                 return PTR_ERR(newdentry);
>
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index cad2055ebf18..714a1cec3709 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -406,13 +406,6 @@ static inline struct file *ovl_do_tmpfile(struct ovl=
_fs *ofs,
>         return file;
>  }
>
> -static inline struct dentry *ovl_lookup_upper(struct ovl_fs *ofs,
> -                                             const char *name,
> -                                             struct dentry *base, int le=
n)
> -{
> -       return lookup_one(ovl_upper_mnt_idmap(ofs), &QSTR_LEN(name, len),=
 base);
> -}
> -
>  static inline struct dentry *ovl_lookup_upper_unlocked(struct ovl_fs *of=
s,
>                                                        const char *name,
>                                                        struct dentry *bas=
e,
> @@ -888,6 +881,7 @@ struct ovl_cattr {
>
>  struct dentry *ovl_create_real(struct ovl_fs *ofs,
>                                struct dentry *parent, struct dentry *newd=
entry,
> +                              struct qstr *qname,
>                                struct ovl_cattr *attr);
>  int ovl_cleanup(struct ovl_fs *ofs, struct dentry *workdir, struct dentr=
y *dentry);
>  #define OVL_TEMPNAME_SIZE 20
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index d4c12feec039..109643930b9f 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -634,6 +634,7 @@ static struct dentry *ovl_lookup_or_create(struct ovl=
_fs *ofs,
>         if (!IS_ERR(child)) {
>                 if (!child->d_inode)
>                         child =3D ovl_create_real(ofs, parent, child,
> +                                               &QSTR(name),
>                                                 OVL_CATTR(mode));
>                 end_creating_keep(child);
>         }
> --
> 2.50.0.107.gf914562f5916.dirty
>

