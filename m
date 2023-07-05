Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F2F748EF0
	for <lists+apparmor@lfdr.de>; Wed,  5 Jul 2023 22:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qH95e-0001Yo-Cu; Wed, 05 Jul 2023 20:27:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <agruenba@redhat.com>) id 1qH94h-0001Js-6h
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 20:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688588766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t45r9A2YvfoSJv2GZo8UC8AtO/lxGa/2A2TsFaxOzFQ=;
 b=KvBPxlmM7mEvVLMsbCX/DAIj6BbKqGnVDhcdDKOY5frryJUrPW+4hqwqhS92uWh3DpKW3S
 hGldEEDgW8vwHY/fdrTBK2RpXHf5ZW7b2YHBVzH/oPXUDerM/7l7oAs/nuzz1RM81YElis
 CvSBJ/Ty6HOiEPf4gJ7AteLAfw5OeJc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-iE2zjHbkMNSEfnAWPFnXJg-1; Wed, 05 Jul 2023 16:26:04 -0400
X-MC-Unique: iE2zjHbkMNSEfnAWPFnXJg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-666ecb24eb3so100449b3a.1
 for <apparmor@lists.ubuntu.com>; Wed, 05 Jul 2023 13:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688588764; x=1691180764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t45r9A2YvfoSJv2GZo8UC8AtO/lxGa/2A2TsFaxOzFQ=;
 b=PNKwipvp9AcssyMnhRfKOiTBm+d7j+czrwkN43/BPq0GbeAinJB9qHX5/pgBzPkL+Q
 oUr5yM2T39VmZOnH/Ez/tI4Jhx71bHkABxXjUNllCogbX8wxNpXDkdAaUGRpgWyzbx22
 aOsm8sou9XV/LKlTr1PqDtx834Kg4QsgGaW3Fh2nKq2Eefsril9E3QmDPaVUCbZzD+Du
 jZQ6pLYeE9jIfm4XWtUvZWvQZgLnEJycHL0t3uYTgRDD/LxIQHw2jx+a9Z260POm4xyH
 KyToeQOfG5cG6h6DDNTpmZzpyHDtdg9YAXY6W3F6OYbFR14dh54gXPtxcMbCUaZfPzzd
 GWAw==
X-Gm-Message-State: AC+VfDzd3zGaRfC0pvwc/nI1ZPq3L4ai/I9Z+TdDc270CKvjg3uzJaZg
 m20LPcXSt5K8YmMb+yLv3LznN+D2ZjOfXH7NvqBsOM9/RMtkqrlu7ZueRQeqvFytnIOh6NAkZ9x
 +dIa4/YOby2XzS1rM5Ys0BGzSBpxFFYA874fX
X-Received: by 2002:a05:6a21:6d88:b0:122:e4f:25c7 with SMTP id
 wl8-20020a056a216d8800b001220e4f25c7mr15659559pzb.31.1688588763759; 
 Wed, 05 Jul 2023 13:26:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ds4xvbUG+ZYaDvJ2apGx91OQ4qB0akGNWWFL3LaWKhMz96IxFpmQ2sEuPoCI3p2ih7fuYhkf9fNjQ5oeaAq0=
X-Received: by 2002:a05:6a21:6d88:b0:122:e4f:25c7 with SMTP id
 wl8-20020a056a216d8800b001220e4f25c7mr15659535pzb.31.1688588763446; Wed, 05
 Jul 2023 13:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
 <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
In-Reply-To: <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 5 Jul 2023 22:25:51 +0200
Message-ID: <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 05 Jul 2023 20:27:05 +0000
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
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Bob Peterson <rpeterso@redhat.com>, Sungjong Seo <sj1557.seo@samsung.com>,
 Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jun 12, 2023 at 12:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
> On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> > Jeff,
> >
> > On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/gfs2/quota.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > > index 1ed17226d9ed..6d283e071b90 100644
> > > --- a/fs/gfs2/quota.c
> > > +++ b/fs/gfs2/quota.c
> > > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *i=
p, loff_t loc,
> > >                 size =3D loc + sizeof(struct gfs2_quota);
> > >                 if (size > inode->i_size)
> > >                         i_size_write(inode, size);
> > > -               inode->i_mtime =3D inode->i_atime =3D current_time(in=
ode);
> > > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ctime =
=3D current_time(inode);
> >
> > I don't think we need to worry about the ctime of the quota inode as
> > that inode is internal to the filesystem only.
> >
>
> Thanks Andreas.  I'll plan to drop this patch from the series for now.
>
> Does updating the mtime and atime here serve any purpose, or should
> those also be removed? If you plan to keep the a/mtime updates then I'd
> still suggest updating the ctime for consistency's sake. It shouldn't
> cost anything extra to do so since you're dirtying the inode below
> anyway.

Yes, good point actually, we should keep things consistent for simplicity.

Would you add this back in if you do another posting?

Thanks,
Andreas

> Thanks!
>
> > >                 mark_inode_dirty(inode);
> > >                 set_bit(QDF_REFRESH, &qd->qd_flags);
> > >         }
> > > --
> > > 2.40.1
> > >
> >
> > Thanks,
> > Andreas
> >
>
> --
> Jeff Layton <jlayton@kernel.org>
>


