Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFD7497FA
	for <lists+apparmor@lfdr.de>; Thu,  6 Jul 2023 11:09:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHKzO-00049X-3r; Thu, 06 Jul 2023 09:09:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1qHAMQ-0008N5-VB
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 21:48:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1F9761775;
 Wed,  5 Jul 2023 21:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E78C433C7;
 Wed,  5 Jul 2023 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688593709;
 bh=h+2Oiqv58gv2R2xrLYaAfuDcnFGFQp3vjxbTRcCD3nk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=uYAsWrZnNsKm67NabNfCqqsuoiplt1RFIzeyfmhi0CvjEy6szK1kzcAX+caCXIi8D
 tNphEy2+4+DidH4f/7zTuli+zcD49lSAm/CWpM7DonP9xVehceVSmlMpr5LSmGdc+j
 0j51Y+kCp2oPaBo/nXxuZpw7E5cU7obblDZHnCzybDgS3/1r4RC9VF74bIuGMqqFac
 DVM24/jWLK0Ph/Wb8nr806CrVy7zYksfunXO6TmumEGAY6X2kp9rSvgWeD978JsqvW
 1PIiS0in5CtMZ+FuYP+L7A2HY/4iaFsY98NRfuB18Q4FAyB5f4tIDlHZZNersY7hI4
 tlc2tZtwXWdDQ==
Message-ID: <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 05 Jul 2023 17:48:24 -0400
In-Reply-To: <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
 <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
 <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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

On Wed, 2023-07-05 at 22:25 +0200, Andreas Gruenbacher wrote:
> On Mon, Jun 12, 2023 at 12:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> > > Jeff,
> > >=20
> > > On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > ---
> > > >  fs/gfs2/quota.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > > > index 1ed17226d9ed..6d283e071b90 100644
> > > > --- a/fs/gfs2/quota.c
> > > > +++ b/fs/gfs2/quota.c
> > > > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inode =
*ip, loff_t loc,
> > > >                 size =3D loc + sizeof(struct gfs2_quota);
> > > >                 if (size > inode->i_size)
> > > >                         i_size_write(inode, size);
> > > > -               inode->i_mtime =3D inode->i_atime =3D current_time(=
inode);
> > > > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ctim=
e =3D current_time(inode);
> > >=20
> > > I don't think we need to worry about the ctime of the quota inode as
> > > that inode is internal to the filesystem only.
> > >=20
> >=20
> > Thanks Andreas.  I'll plan to drop this patch from the series for now.
> >=20
> > Does updating the mtime and atime here serve any purpose, or should
> > those also be removed? If you plan to keep the a/mtime updates then I'd
> > still suggest updating the ctime for consistency's sake. It shouldn't
> > cost anything extra to do so since you're dirtying the inode below
> > anyway.
>=20
> Yes, good point actually, we should keep things consistent for simplicity=
.
>=20
> Would you add this back in if you do another posting?
>=20

I just re-posted the other patches in this as part of the ctime accessor
conversion. If I post again though, I can resurrect the gfs2 patch.=C2=A0If
not, we can do a follow-on fix later.

Since we're discussing it, it may be more correct to remove the atime
update there. gfs2_adjust_quota sounds like a "modify" operation, not a
"read", so I don't see a reason to update the atime.

In general, the only time you only want to set the atime, ctime and
mtime in lockstep is when the inode is brand new.
--=20
Jeff Layton <jlayton@kernel.org>

