Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AE917911EE7
	for <lists+apparmor@lfdr.de>; Fri, 21 Jun 2024 10:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sKZkZ-0004b5-Du; Fri, 21 Jun 2024 08:36:03 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1sKMY3-00051f-6I
 for apparmor@lists.ubuntu.com; Thu, 20 Jun 2024 18:30:40 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6fb696d2e5so138886766b.3
 for <apparmor@lists.ubuntu.com>; Thu, 20 Jun 2024 11:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718908214; x=1719513014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6m1gMzA5fnD2sjUydDvpKr3zIKxDfhIqLd68Kj5jrIU=;
 b=mGqlJ7V+JAh8OtXvOaiwh649kPua9+xaYTvlcoLFhfWs1NcuqUSBxu9QRwJ8PWSDCj
 OAQBbgiHa+AjoJRR4c1fzqMYaLy8Fb+sTOg2IF0L1Dzq1/2VsJ7/SCqqTVlK6roRma6B
 hGjigTqm6v3puiowZU6KBjEEA+5raWeqZhAsjKNYARC1bXOCV1IRa7ND1LmDPRgh25GA
 w6+YKmmsiAseVnhrkKFR5uSbDLsyctXffbJCcFKoo+8XLDBdgt7v7qGuHntdVJGP2J9+
 jfzxjwdAw2JSPtB4DpvtgExtIwui6GS0k/8i9Dvm7aSLfn2Okeq29EJASbk+XQmkohq5
 mk3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbD4JpwKUPa1+XKwxWYtKiWoK9qx5A59ppuCQkSk9ChrCcYpdja+v1rjGJfPlIdGt249MAFuB/PladRaHkntsqoa/8Zcx1TAhS
X-Gm-Message-State: AOJu0Yxab0Qfkq3IOYeWOV/vgiihaCUesuEV5nkJH9B9tDCjP+sVPxG/
 a8EdKJaBHop2ZA0KJyCLmJmOZyl8gt0mZl707jnNcgWKfCu7eOYuF+nChaRlW1n6nll2W360Vqi
 Rfo1S3W1OxVjWvX9MTIaU60RvToitjHKq
X-Google-Smtp-Source: AGHT+IHUEaMNwS1/lDslY7n8j8o8MmR5UldgYWqZCqrHZCOG6gHMWvb41UggkniTgZec+c4o1IZNVFbioZ/sL6VxoI0=
X-Received: by 2002:a17:907:1686:b0:a6f:b428:30fa with SMTP id
 a640c23a62f3a-a6fb4283167mr368999466b.59.1718908214436; Thu, 20 Jun 2024
 11:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240620171528.167997-1-mjguzik@gmail.com>
 <155a24f7-8059-49b0-93fa-94bcdc058621@amd.com>
In-Reply-To: <155a24f7-8059-49b0-93fa-94bcdc058621@amd.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 20 Jun 2024 20:30:02 +0200
Message-ID: <CAGudoHFsqDS-5ELmy=t2fdQ2Xrk8q+xyfCkZPpb4XA-+6HOpNA@mail.gmail.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.52; envelope-from=mjguzik@gmail.com;
 helo=mail-ej1-f52.google.com
X-Mailman-Approved-At: Fri, 21 Jun 2024 08:36:00 +0000
Subject: Re: [apparmor] [PATCH v2] apparmor: try to avoid refing the label
	in apparmor_file_open
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jun 20, 2024 at 8:23=E2=80=AFPM Neeraj Upadhyay <Neeraj.Upadhyay@am=
d.com> wrote:
>
>
>
> On 6/20/2024 10:45 PM, Mateusz Guzik wrote:
> > apparmor: try to avoid refing the label in apparmor_file_open
> >
> > If the label is not stale (which is the common case), the fact that the
> > passed file object holds a reference can be leverged to avoid the
>
> Minor: Typo 'leveraged'
>
> > ref/unref cycle. Doing so reduces performance impact of apparmor on
> > parallel open() invocations.
> >
> > When benchmarking on a 24-core vm using will-it-scale's open1_process
> > ("Separate file open"), the results are (ops/s):
> > before: 6092196
> > after:  8309726 (+36%)
> >
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > ---
>
>
> Trying to understand the changes done here. So, while the file cred can b=
e updated
> async to the task (referring to the comment from John here [1]), the file=
 cred label
> cannot change during apparmor_file_open() execution?
>

Refing a label retains racy vs refing it.

On stock code you can test the flag, determine it's not stale, grab
the ref and have it become stale immediately after. My patch avoids
the atomic dance for the common case, does not alter anything
correctness-wise AFAICS.

I am assuming the race is tolerated and checking here is only done to
make sure the new label is seen eventually.

Not having the race is possible with a bunch of trickery like seqc,
but so far does not look like this is necessary.

>
> Reviewed-by: Neeraj upadhyay <Neeraj.Upadhyay@amd.com>
>
>
> Thanks
> Neeraj
>
> [1] https://lore.kernel.org/lkml/9bfaeec2-535d-4401-8244-7560f660a065@can=
onical.com/
>
>
> >
> > v2:
> > - reword the commit message
> >
> > If you want any changes made to it can you just do them on your own
> > accord? :) Will be faster for both of us than another mail trip.
> >
> >  security/apparmor/include/cred.h | 20 ++++++++++++++++++++
> >  security/apparmor/lsm.c          |  5 +++--
> >  2 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/security/apparmor/include/cred.h b/security/apparmor/inclu=
de/cred.h
> > index 58fdc72af664..7265d2f81dd5 100644
> > --- a/security/apparmor/include/cred.h
> > +++ b/security/apparmor/include/cred.h
> > @@ -63,6 +63,26 @@ static inline struct aa_label *aa_get_newest_cred_la=
bel(const struct cred *cred)
> >       return aa_get_newest_label(aa_cred_raw_label(cred));
> >  }
> >
> > +static inline struct aa_label *aa_get_newest_cred_label_condref(const =
struct cred *cred,
> > +                                                             bool *nee=
dput)
> > +{
> > +     struct aa_label *l =3D aa_cred_raw_label(cred);
> > +
> > +     if (unlikely(label_is_stale(l))) {
> > +             *needput =3D true;
> > +             return aa_get_newest_label(l);
> > +     }
> > +
> > +     *needput =3D false;
> > +     return l;
> > +}
> > +
> > +static inline void aa_put_label_condref(struct aa_label *l, bool needp=
ut)
> > +{
> > +     if (unlikely(needput))
> > +             aa_put_label(l);
> > +}
> > +
> >  /**
> >   * aa_current_raw_label - find the current tasks confining label
> >   *
> > diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> > index 2cea34657a47..4bf87eac4a56 100644
> > --- a/security/apparmor/lsm.c
> > +++ b/security/apparmor/lsm.c
> > @@ -461,6 +461,7 @@ static int apparmor_file_open(struct file *file)
> >       struct aa_file_ctx *fctx =3D file_ctx(file);
> >       struct aa_label *label;
> >       int error =3D 0;
> > +     bool needput;
> >
> >       if (!path_mediated_fs(file->f_path.dentry))
> >               return 0;
> > @@ -477,7 +478,7 @@ static int apparmor_file_open(struct file *file)
> >               return 0;
> >       }
> >
> > -     label =3D aa_get_newest_cred_label(file->f_cred);
> > +     label =3D aa_get_newest_cred_label_condref(file->f_cred, &needput=
);
> >       if (!unconfined(label)) {
> >               struct mnt_idmap *idmap =3D file_mnt_idmap(file);
> >               struct inode *inode =3D file_inode(file);
> > @@ -494,7 +495,7 @@ static int apparmor_file_open(struct file *file)
> >               /* todo cache full allowed permissions set and state */
> >               fctx->allow =3D aa_map_file_to_perms(file);
> >       }
> > -     aa_put_label(label);
> > +     aa_put_label_condref(label, needput);
> >
> >       return error;
> >  }



--=20
Mateusz Guzik <mjguzik gmail.com>

