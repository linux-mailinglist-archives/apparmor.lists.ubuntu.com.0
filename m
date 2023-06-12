Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D572DC42
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHY-0000AA-Nn; Tue, 13 Jun 2023 08:21:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jlayton@kernel.org>) id 1q8hxd-0001Rc-ER
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 13:51:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E82062970;
 Mon, 12 Jun 2023 13:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EC5C433A1;
 Mon, 12 Jun 2023 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686577915;
 bh=N35u9HNcA2GE6O0RLNmO/H/bI7DFCPIb/J9WbCfp+7I=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=ObL7C8SEHs/LzGPrSxC74RrT9T2yAr7+1XglnX3EW1FZM90y7O6ormobkdpAWuZ0e
 RdLzx900Hqpy9HE3EfCtu+74BEGhE/aZtEqml+3NJgQSzQx53YAlTOFBgpsZKSbcTh
 +zXor8GIZ20+va1qDjHAfR3RyRUEaBOMhmjJ7l5g2lpz8/OpJX+h5I3T6nxDG8Q0Ct
 vPS6mDUmgWbpb1+t3cmEUqFflpPCwKrf9+eWZ+e4rjAuOfKobUeruOpGBYBZ90Wbpa
 C9ELvqhW19k3IAANYXAYjz0pZ8SMZZaeiSfoRUPDrDPMlZiF0tSo1r2eVMBMPNiBkq
 +CwHQ9soLqvPA==
Message-ID: <a6ca6c14a6b3727b7416198824b37bd7bd386180.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Tom Talpey <tom@talpey.com>, Christian Brauner <brauner@kernel.org>, Al
 Viro <viro@zeniv.linux.org.uk>, Brad Warrum <bwarrum@linux.ibm.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Kent <raven@themaw.net>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Jeremy Kerr
 <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
 Suren Baghdasaryan <surenb@google.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, autofs@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
Date: Mon, 12 Jun 2023 09:51:50 -0400
In-Reply-To: <a34b598a-374b-5dbf-dd36-4b62e52fe36c@talpey.com>
References: <20230612104524.17058-1-jlayton@kernel.org>
 <20230612104524.17058-9-jlayton@kernel.org>
 <a34b598a-374b-5dbf-dd36-4b62e52fe36c@talpey.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:37 +0000
Subject: Re: [apparmor] [PATCH v2 8/8] cifs: update the ctime on a partial
	page write
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 2023-06-12 at 09:41 -0400, Tom Talpey wrote:
> On 6/12/2023 6:45 AM, Jeff Layton wrote:
> > POSIX says:
> >=20
> >      "Upon successful completion, where nbyte is greater than 0, write(=
)
> >       shall mark for update the last data modification and last file st=
atus
> >       change timestamps of the file..."
> >=20
> > Add the missing ctime update.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >   fs/smb/client/file.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > index df88b8c04d03..a00038a326cf 100644
> > --- a/fs/smb/client/file.c
> > +++ b/fs/smb/client/file.c
> > @@ -2596,7 +2596,7 @@ static int cifs_partialpagewrite(struct page *pag=
e, unsigned from, unsigned to)
> >   					   write_data, to - from, &offset);
> >   		cifsFileInfo_put(open_file);
> >   		/* Does mm or vfs already set times? */
> > -		inode->i_atime =3D inode->i_mtime =3D current_time(inode);
> > +		inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D current_tim=
e(inode);
>=20
> Question. It appears that roughly half the filesystems in this series
> don't touch the i_atime in this case. And the other half do. Which is
> correct? Did they incorrectly set i_atime instead of i_ctime?
>=20

I noticed that too, and with this set, I decided to not make any atime
changes since I wasn't sure.

I think the answer to your question is "it depends". atime is supposed
to be updated on reads, not writes, but sometimes a write requires a RMW
cycle of some flavor so one can imagine that in some cases we'd need to
update all three.

In this case, I'm not sure that updating any of these times is the right
thing to do. This is called from ->launder_folio, so the syscall that
issued the write is long gone and we're in writeback here.

With NFS, we generally leave timestamp updates to the server. Should any
of these timestamps be updated by the (SMB1) client here?
--=20
Jeff Layton <jlayton@kernel.org>

