Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE90NawinGn4/wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:49:32 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D9174307
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:49:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuSZ0-0004dT-11; Mon, 23 Feb 2026 09:49:14 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vuSYz-0004dE-01
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 09:49:13 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so3391968f8f.1
 for <apparmor@lists.ubuntu.com>; Mon, 23 Feb 2026 01:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771840152; cv=none;
 d=google.com; s=arc-20240605;
 b=kgu98v8Sn/ms1BmVqH4Bn5dsqDAK4lycqToaSTN1nz58+4wFRSjhavzlKscpSl3ggV
 9oEwfv3RI2sp69CFLHBdWs6cyOZEARH5ttlF4oAcCGt/FUTn9S8W1zp0wdJPeg4PWxti
 zBuxVm6qKnDrN+majnrQ268Zy8jL3TtbgOj03ZP5/Iv6JMC8XUaEr593+QuRKsStdOCU
 BgtaHd6mATVkc/HPrnlC+xy+8crzEDAwwfJRRxQqUo/MG9QqO73f8ae/jDIyrjP0XSR/
 EnC1TwR8qcCjkPmVSvzW7TVLGpG3+jzOIYDLnxNLPO5OVJKLSqebnnZqmz6jvuXAmj2M
 YDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2/el3cFDhCdryFwCuaSLEKRCesYmHLj0qrChriFmVgE=;
 fh=h74SmEN8rfTnxv7z5JM1ZLdo/4aoApsjaj+j+fJsHqM=;
 b=hwmzGDHieDSjyO5pnvDNZs3BNlMtfJ4cWxBNne66OLoKA+DVyZBBdH9QR3g2NBITta
 siMmH98dCpt777hQw7zdALtdpjkeYybIptCxJWEKJrKPJryybLOa18jccMCKrv9Zv+MN
 FOKl4EcEI88GPDBjrq+HAk8L+YaMQg9uOh1AbDMbuSOIaKF497KAsOVJTbivqkI+AP6o
 e1+rI+Sc0+U7DKx/jjP/W0CHogBFx8sRmJBgulC2rRLF7DXHjAqNyvmEStAeAam04X11
 IgmgvkcH/1SsGoLpI9nsY7THt5iTVMvbou+QmUkXO5GRJ0A3G6WHx1ucnP/94eGvzeET
 ZlzQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771840152; x=1772444952; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/el3cFDhCdryFwCuaSLEKRCesYmHLj0qrChriFmVgE=;
 b=GLyW/Xua3r+HY97ycIIfTQvy5V5NF4Y+w6y+eTlQN4VHcq6kcWdStSt7Vy9PSYDKTY
 Z0NxSV+hur4xFuSTN36dJErJZl4Ac3zkLFLvhQJHI7N4xnoocqajSS4pF5TrjmQC7nar
 OyBfsAwnGRtcEjR3njjPq5dkBkGJBBmeWck74bp0aXekirBBuZeDIRZGXKN1dA91jnY8
 3p43bPOjZI1mviI4G9MjkQApFYmntp+l3VxylBiGNTB8M3f1EEuhOiSKGFRz60Ui3bwo
 2yDVbC0Shfuc9kfFjgLkNohip8hbjOaYBNHCRPa4aMCOV+Zy8NzXBYhOO8rzS+Fm9pM4
 aIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840152; x=1772444952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2/el3cFDhCdryFwCuaSLEKRCesYmHLj0qrChriFmVgE=;
 b=mUPYxEpB2YoM1wDH9J6NFNuZ7Z45xSCNxqwEleccFH1W/XYEbHQ/2R/aGPKaLpMYHQ
 lLBd711vWfuTIl5AzSPX54t8QoYky53puSAVa3Wiatd8eqLyI1zWObwWNl5m1b2H/wcN
 da0H4ldVEND5ssQGcITymwa+yGJwGy9/jrxAwQnD/XNnIpF8i+nmSBJaL4EZ4KbVkpO0
 tF8mEvCLH3iF8b0DqR4/dVYVJfCBQaJfjhdT9AYIGJ+iN63GAwPcOP++joQlc0wHg7wA
 pQC46Dj8ZJ0Za2zA679P6Dax7apzS6P36uXQaN8DgI2IxDZtC0Q9Hx9y/2DRYWNKv9YV
 N9XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKh2G7wqx1TqlUO9MNLI0olFw4rqb7J5S5UR8qDyr3W3i14cFV9lX43arr9H3uUGsbZ8IpFRg6ng==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzTTUQclU/Tfo+8oJtJYxrljVBk99TCIDepnjWftvXfDUhTwuUb
 tAglR4JfKAjBQnhuIS2GA+bFpc0BOXcDfsc23MDN8naoiacoUTAxy320ox67Sd8iQNiO6/FgUjl
 Is0JtGZxoRtftJa9p05ZsiePLaRJDQ+0=
X-Gm-Gg: ATEYQzy3GcH/phlSPHOLch6jrYFYM2tRiHLOXufh7vE63z4+T254FQ13/PiOAxUD+JF
 ypBs01ggb4543kEOHgkgH+PHbKewESaAqCB7H02QNZHgRfQL8AG95boe1fuCL/e8Qxwx56kPUVZ
 rMRxSGdpsWH/Xc/XTX8MYHFxXcbb77OtotBn/QHfi1AQbwlr7sVYVBKJIj+izcRMHQoHxbdTKpe
 fuRzHRzwepPmGTqx8BYR0TkLu5gxMOOSoF/oX2JGdc1lAi5SE+HndLfwsfaWyseCaIbHV6hjQSx
 XgMT0uqjvnofL2Ci1X1ZcSXgJlzJT0GEZWrJTOLNJA==
X-Received: by 2002:a05:6000:4014:b0:437:6aa8:b7eb with SMTP id
 ffacd0b85a97d-4396fd9b885mr14177751f8f.5.1771840152054; Mon, 23 Feb 2026
 01:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-10-neilb@ownmail.net>
In-Reply-To: <20260223011210.3853517-10-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Feb 2026 11:49:00 +0200
X-Gm-Features: AaiRm53oCa-QOult778vTlpI836VKQ_vX_Rm7xdLmLP8dTvXCc4lfRf1Ct2RZiU
Message-ID: <CAOQ4uxjtedA8B1QZDddRtsSP0XgFZCuBTD1VGvN4wawRyoox=A@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.54; envelope-from=amir73il@gmail.com;
 helo=mail-wr1-f54.google.com
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:apparmor@lists.ubuntu.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.993];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ownmail.net:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,brown.name:email]
X-Rspamd-Queue-Id: 9A0D9174307
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 2:13=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> The primary purpose of this patch is to remove the locking from
> ovl_lookup_real_one() as part of centralising all locking of directories
> for name operations.
>
> The locking here isn't needed.  By performing consistency tests after
> the lookup we can be sure that the result of the lookup was valid at
> least for a moment, which is all the original code promised.
>
> lookup_noperm_unlocked() is used for the lookup and it will take the
> lock if needed only where it is needed.
>
> Also:
>  - don't take a reference to real->d_parent.  The parent is
>    only use for a pointer comparison, and no reference is needed for
>    that.
>  - Several "if" statements have a "goto" followed by "else" - the
>    else isn't needed: the following statement can directly follow
>    the "if" as a new statement
>  - Use a consistent pattern of setting "err" before performing a test
>    and possibly going to "fail".
>  - remove the "out" label (now that we don't need to dput(parent) or
>    unlock) and simply return from fail:.
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: NeilBrown <neil@brown.name>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/export.c | 71 ++++++++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 38 deletions(-)
>
> diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> index 83f80fdb1567..b448fc9424b6 100644
> --- a/fs/overlayfs/export.c
> +++ b/fs/overlayfs/export.c
> @@ -349,69 +349,64 @@ static struct dentry *ovl_dentry_real_at(struct den=
try *dentry, int idx)
>         return NULL;
>  }
>
> -/*
> - * Lookup a child overlay dentry to get a connected overlay dentry whose=
 real
> - * dentry is @real. If @real is on upper layer, we lookup a child overla=
y
> - * dentry with the same name as the real dentry. Otherwise, we need to c=
onsult
> - * index for lookup.
> +/**
> + * ovl_lookup_real_one -  Lookup a child overlay dentry to get an overla=
y dentry whose real dentry is given
> + * @connected: parent overlay dentry
> + * @real: given child real dentry
> + * @layer: layer in which @real exists
> + *
> + *
> + * Lookup a child overlay dentry in @connected with the same name as the=
 @real
> + * dentry.  Then check that the parent of the result is the real dentry =
for
> + * @connected, and @real is the real dentry for the result.
> + *
> + * Returns:
> + *   %-ECHILD if the parent of @real is no longer the real dentry for @c=
onnected.
> + *   %-ESTALE if @real is no the real dentry of the found dentry.
> + *   Otherwise the found dentry is returned.
>   */
>  static struct dentry *ovl_lookup_real_one(struct dentry *connected,
>                                           struct dentry *real,
>                                           const struct ovl_layer *layer)
>  {
> -       struct inode *dir =3D d_inode(connected);
> -       struct dentry *this, *parent =3D NULL;
> +       struct dentry *this;
>         struct name_snapshot name;
>         int err;
>
>         /*
> -        * Lookup child overlay dentry by real name. The dir mutex protec=
ts us
> -        * from racing with overlay rename. If the overlay dentry that is=
 above
> -        * real has already been moved to a parent that is not under the
> -        * connected overlay dir, we return -ECHILD and restart the looku=
p of
> -        * connected real path from the top.
> -        */
> -       inode_lock_nested(dir, I_MUTEX_PARENT);
> -       err =3D -ECHILD;
> -       parent =3D dget_parent(real);
> -       if (ovl_dentry_real_at(connected, layer->idx) !=3D parent)
> -               goto fail;
> -
> -       /*
> -        * We also need to take a snapshot of real dentry name to protect=
 us
> +        * We need to take a snapshot of real dentry name to protect us
>          * from racing with underlying layer rename. In this case, we don=
't
>          * care about returning ESTALE, only from dereferencing a free na=
me
>          * pointer because we hold no lock on the real dentry.
>          */
>         take_dentry_name_snapshot(&name, real);
> -       /*
> -        * No idmap handling here: it's an internal lookup.
> -        */
> -       this =3D lookup_noperm(&name.name, connected);
> +       this =3D lookup_noperm_unlocked(&name.name, connected);
>         release_dentry_name_snapshot(&name);
> +
> +       err =3D -ECHILD;
> +       if (ovl_dentry_real_at(connected, layer->idx) !=3D real->d_parent=
)
> +               goto fail;
> +
>         err =3D PTR_ERR(this);
> -       if (IS_ERR(this)) {
> +       if (IS_ERR(this))
>                 goto fail;
> -       } else if (!this || !this->d_inode) {
> -               dput(this);
> -               err =3D -ENOENT;
> +
> +       err =3D -ENOENT;
> +       if (!this || !this->d_inode)
>                 goto fail;
> -       } else if (ovl_dentry_real_at(this, layer->idx) !=3D real) {
> -               dput(this);
> -               err =3D -ESTALE;
> +
> +       err =3D -ESTALE;
> +       if (ovl_dentry_real_at(this, layer->idx) !=3D real)
>                 goto fail;
> -       }
>
> -out:
> -       dput(parent);
> -       inode_unlock(dir);
>         return this;
>
>  fail:
>         pr_warn_ratelimited("failed to lookup one by real (%pd2, layer=3D=
%d, connected=3D%pd2, err=3D%i)\n",
>                             real, layer->idx, connected, err);
> -       this =3D ERR_PTR(err);
> -       goto out;
> +       if (!IS_ERR(this))
> +               dput(this);
> +       return ERR_PTR(err);
>  }
>
>  static struct dentry *ovl_lookup_real(struct super_block *sb,
> --
> 2.50.0.107.gf914562f5916.dirty
>

