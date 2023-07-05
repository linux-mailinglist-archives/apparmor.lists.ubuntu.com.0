Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 087767497FC
	for <lists+apparmor@lfdr.de>; Thu,  6 Jul 2023 11:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHKzO-00049d-BC; Thu, 06 Jul 2023 09:09:26 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.gruenbacher@gmail.com>) id 1qHBmk-0004QA-Bw
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 23:19:46 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso408581fa.0
 for <apparmor@lists.ubuntu.com>; Wed, 05 Jul 2023 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688599185; x=1691191185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qvm/ESewbN0H2Rkg9On6IkqD7SWtNhnTUlvYjg/d9JA=;
 b=EpWCN8W4J50qBjCe+S5pn8rLfU8N4Q9dKL7hcLdv2Oop977UZ/lxeB6T7Ca353XM11
 KJX642s07IuUTRuI2Z6HfR0QbL7oGglA/ArgPy1abSeukJE+Xd3oSn1M8wEgELxuc+4M
 ViJSgVJgXDRUJwgVpfM/WohX+q74u7XH7+qcxI3EVzncb6ybA5oN5N9Upci+4uQ/Nrao
 hbjDzPoioYji7M88qwpwjVi01xg+sbikS11yWad7o4ALW3s21MdHFA7pYz5EWhD9bZxC
 n3dWTvPKTCm9UiPMRt9jHBX6Gn8Hlh7xkaGKEhScIZpAHmThFoGSrS8IhLeNLAmqyGL/
 B+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688599185; x=1691191185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qvm/ESewbN0H2Rkg9On6IkqD7SWtNhnTUlvYjg/d9JA=;
 b=L2UMArXJy2DCyCQJYfa5Qskwy7v9zBIzXr/fLqd2Nvnhlvs0urOZ1E2qQetldJPVMg
 oO0yvOv9aB6PyBWuMiw4LhaDF1NeZpFpU38fCgu1wxx/w6du/BJmTefs2+x1n3zIAWe9
 3AXJFWM8Xr3kOhKTbdnRF2bBnL47TR6IcJyQAuWzT8nWKlV5uzKnLvXas2WF/4wsDzZ3
 KqlezhO3ASdKTfuYQPbpe16hdv5F7EGSK26MElvLPpdJ05utYa3sbLa9q04Jq/pGuKIV
 NzNh5SKNVqSALvZC2HdrlKhNvw5kxb5Hzb7INx1bfi09B/JpEh8oK0t1mMDthtjA+FZq
 b1Rw==
X-Gm-Message-State: ABy/qLZ3kD2r4FoiQlN4u9+VGnWex7cMw5zMM6HXQtpuOHBv444p4Kkf
 Cr61li1e0+BHxOBrLn3ZkDA/bZjY/ZvfFROiThw=
X-Google-Smtp-Source: APBJJlELm51lB9I+2X7mnELiIo/3gyycTB0nOTJa7gdmrmQA0kycn716CHsgpSj/cHth9HPURMsqR6Dsm4KUn5EZang=
X-Received: by 2002:a2e:9104:0:b0:2b6:f85a:20b0 with SMTP id
 m4-20020a2e9104000000b002b6f85a20b0mr111615ljg.16.1688599184905; Wed, 05 Jul
 2023 16:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
 <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
 <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
 <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
In-Reply-To: <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 6 Jul 2023 01:19:33 +0200
Message-ID: <CAHpGcMJriZRgwHL1yVJG9KkSwoDs9knnNRhakYN3GiuXPRkYOA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.169;
 envelope-from=andreas.gruenbacher@gmail.com; helo=mail-lj1-f169.google.com
X-Mailman-Approved-At: Thu, 06 Jul 2023 09:09:22 +0000
Subject: Re: [apparmor] [PATCH 7/9] gfs2: update ctime when quota is updated
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
Cc: linux-efi@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Bob Peterson <rpeterso@redhat.com>, Sungjong Seo <sj1557.seo@samsung.com>,
 Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Am Mi., 5. Juli 2023 um 23:51 Uhr schrieb Jeff Layton <jlayton@kernel.org>:
>
> On Wed, 2023-07-05 at 22:25 +0200, Andreas Gruenbacher wrote:
> > On Mon, Jun 12, 2023 at 12:36=E2=80=AFPM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > > On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> > > > Jeff,
> > > >
> > > > On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.=
org> wrote:
> > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > > ---
> > > > >  fs/gfs2/quota.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > > > > index 1ed17226d9ed..6d283e071b90 100644
> > > > > --- a/fs/gfs2/quota.c
> > > > > +++ b/fs/gfs2/quota.c
> > > > > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inod=
e *ip, loff_t loc,
> > > > >                 size =3D loc + sizeof(struct gfs2_quota);
> > > > >                 if (size > inode->i_size)
> > > > >                         i_size_write(inode, size);
> > > > > -               inode->i_mtime =3D inode->i_atime =3D current_tim=
e(inode);
> > > > > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ct=
ime =3D current_time(inode);
> > > >
> > > > I don't think we need to worry about the ctime of the quota inode a=
s
> > > > that inode is internal to the filesystem only.
> > > >
> > >
> > > Thanks Andreas.  I'll plan to drop this patch from the series for now=
.
> > >
> > > Does updating the mtime and atime here serve any purpose, or should
> > > those also be removed? If you plan to keep the a/mtime updates then I=
'd
> > > still suggest updating the ctime for consistency's sake. It shouldn't
> > > cost anything extra to do so since you're dirtying the inode below
> > > anyway.
> >
> > Yes, good point actually, we should keep things consistent for simplici=
ty.
> >
> > Would you add this back in if you do another posting?
> >
>
> I just re-posted the other patches in this as part of the ctime accessor
> conversion. If I post again though, I can resurrect the gfs2 patch. If
> not, we can do a follow-on fix later.

Sure, not a big deal.

> Since we're discussing it, it may be more correct to remove the atime
> update there. gfs2_adjust_quota sounds like a "modify" operation, not a
> "read", so I don't see a reason to update the atime.
>
> In general, the only time you only want to set the atime, ctime and
> mtime in lockstep is when the inode is brand new.

Yes, that makes sense, too.

Thanks,
Andreas

