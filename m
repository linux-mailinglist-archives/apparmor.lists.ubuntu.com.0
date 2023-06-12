Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768D72DC46
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHZ-0000Bd-3n; Tue, 13 Jun 2023 08:21:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8euW-0003pB-SF
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 10:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4E61623DE;
 Mon, 12 Jun 2023 10:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C3AC4339C;
 Mon, 12 Jun 2023 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686566191;
 bh=7lfE8n4wCuge2Ilsu3h1F4ipyzhUj7bSJuflx8EXZtw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=DU0ZjjsJO4rS5B/LrOhkcDtfvbBZTjXhclQjcMb8L0SMAJ/Zj8o6cOouP0LPA9kRi
 VqJ/momrCYS9bgBfSwuBqZwMMGlKax5OQGCSRTBF7m/eO1OCct4ECh1Dq3q51n5hhV
 Yhf0l7cjjbGMIJ2UYDeBi6gwKGFHv0g6f2BclJ5kTS9KJF0zsyYQaetziIibzJHykN
 7tP2iy40SDcuxMKwZA7N7Mbn26TeBSys37uMErgDMUpaf6wBIfwFsLid/c78sbMh0z
 WHZh5yV0lSHcOPaWQW6a50hTCYgYFvBa4rOsjTJ1iVF0vlDpRO8qNBXUJAB1ctdV+d
 JMJSCsxLTJnJg==
Message-ID: <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 12 Jun 2023 06:36:26 -0400
In-Reply-To: <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
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

On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> Jeff,
>=20
> On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/gfs2/quota.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > index 1ed17226d9ed..6d283e071b90 100644
> > --- a/fs/gfs2/quota.c
> > +++ b/fs/gfs2/quota.c
> > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *ip,=
 loff_t loc,
> >                 size =3D loc + sizeof(struct gfs2_quota);
> >                 if (size > inode->i_size)
> >                         i_size_write(inode, size);
> > -               inode->i_mtime =3D inode->i_atime =3D current_time(inod=
e);
> > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ctime =
=3D current_time(inode);
>=20
> I don't think we need to worry about the ctime of the quota inode as
> that inode is internal to the filesystem only.
>=20

Thanks Andreas.  I'll plan to drop this patch from the series for now.

Does updating the mtime and atime here serve any purpose, or should
those also be removed? If you plan to keep the a/mtime updates then I'd
still suggest updating the ctime for consistency's sake. It shouldn't
cost anything extra to do so since you're dirtying the inode below
anyway.

Thanks!

> >                 mark_inode_dirty(inode);
> >                 set_bit(QDF_REFRESH, &qd->qd_flags);
> >         }
> > --
> > 2.40.1
> >=20
>=20
> Thanks,
> Andreas
>=20

--=20
Jeff Layton <jlayton@kernel.org>

