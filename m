Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F2C2489B
	for <lists+apparmor@lfdr.de>; Fri, 31 Oct 2025 11:41:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEmZY-0001wM-Pw; Fri, 31 Oct 2025 10:41:32 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEcDR-0003JF-KH
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 23:38:01 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailflow.stl.internal (Postfix) with ESMTP id 661A61300302;
 Thu, 30 Oct 2025 19:37:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 30 Oct 2025 19:38:00 -0400
X-ME-Sender: <xms:1PYDaUL3uN_ZYS5DyOozVcOf0w2OrQqbxc-4QWbx1bN9L-wzAX5fCQ>
 <xme:1PYDaXD1SYvuISc6YaixLM10IEYXN2KIrCSQs1A1ClNyiRazCd19f093favA5c40M
 7-GoGTkXglLhNP2wygqo_IMPU_LnRCTLyHeWXPNtpEDtSq92Ik>
X-ME-Received: <xmr:1PYDaVjAswXVecq4gQBB7tBXRAXS9uKaQM3AJIJWpLFVLitLTqK0YV4vkp04YsFF7HY-Tyt-_42MD1WfmnTd_UutGUpms5WF5ukAHv0sREF3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieejleehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepgedupdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 eplhhinhhugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdhsvggtuhhrihhthidqmhhoughulhgvsehvghgvrhdrkhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
 drohhrghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghifhhssehvghgvrhdrkhgvrhhnvg
 hlrdhorhhg
X-ME-Proxy: <xmx:1fYDaTPLNL_ZEx6UpYyzZGqNns6xiAnXEaWnIZ-9kiMvQ5TwdxKZYg>
 <xmx:1fYDaZWJ-wE55i1JUYw1GO0K8brT1sqaUxavUZGGa6qqQxvthHQaxA>
 <xmx:1fYDaQB1efCWq9QdJbyUhsAVgatruja8Z9S4VftpC7YwW4emP6XvQQ>
 <xmx:1fYDaeMHBC1QLhzVp0K3e_aClaQU--eFsbH2gQSnpE7T81tLe4kikw>
 <xmx:1_YDaVuNHJi2PkRkaZXi_thHraFG9qYrLgP6Q09afVQ-wZchIw1OZNeh>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Oct 2025 19:37:46 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Al Viro" <viro@zeniv.linux.org.uk>
In-reply-to: <20251030062214.GW2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>,
 <20251029234353.1321957-12-neilb@ownmail.net>,
 <20251030062214.GW2441659@ZenIV>
Date: Fri, 31 Oct 2025 10:37:44 +1100
Message-id: <176186746483.1793333.1130347070516464496@noble.neil.brown.name>
Received-SPF: pass client-ip=202.12.124.142; envelope-from=neilb@ownmail.net;
 helo=flow-b7-smtp.messagingengine.com
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:41:31 +0000
Subject: Re: [apparmor] [PATCH v4 11/14] Add start_renaming_two_dentries()
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
Reply-To: NeilBrown <neil@brown.name>
Cc: Jan Kara <jack@suse.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-cifs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, Steve French <smfrench@gmail.com>,
 linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Olga Kornievskaia <okorniev@redhat.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-nfs@vger.kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 David Sterba <dsterba@suse.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 30 Oct 2025, Al Viro wrote:
> On Thu, Oct 30, 2025 at 10:31:11AM +1100, NeilBrown wrote:
>=20
> > +++ b/fs/debugfs/inode.c
>=20
> Why does debugfs_change_name() need any of that horror?  Seriously, WTF?
> This is strictly a name change on a filesystem that never, ever moves
> anything from one directory to another.

"horror" is clearly in the eye of the beholder, and not a helpful
description...

Is there anything in this use of start_renaming_two_dentries() which is
harmful?  I agree that not all of the functionality is needed in this
case, but some of it is.

Would you prefer we also add
   start_renaming_two_dentries_with_same_parent()
or similar?

>=20
> IMO struct renamedata is a fucking eyesore, but that aside, this:
>=20
> > @@ -539,22 +540,30 @@ static int sel_make_policy_nodes(struct selinux_fs_=
info *fsi,
> >  	if (ret)
> >  		goto out;
> > =20
> > -	lock_rename(tmp_parent, fsi->sb->s_root);
> > +	rd.old_parent =3D tmp_parent;
> > +	rd.new_parent =3D fsi->sb->s_root;
> > =20
> >  	/* booleans */
> > -	d_exchange(tmp_bool_dir, fsi->bool_dir);
> > +	ret =3D start_renaming_two_dentries(&rd, tmp_bool_dir, fsi->bool_dir);
> > +	if (!ret) {
> > +		d_exchange(tmp_bool_dir, fsi->bool_dir);
> > =20
> > -	swap(fsi->bool_num, bool_num);
> > -	swap(fsi->bool_pending_names, bool_names);
> > -	swap(fsi->bool_pending_values, bool_values);
> > +		swap(fsi->bool_num, bool_num);
> > +		swap(fsi->bool_pending_names, bool_names);
> > +		swap(fsi->bool_pending_values, bool_values);
> > =20
> > -	fsi->bool_dir =3D tmp_bool_dir;
> > +		fsi->bool_dir =3D tmp_bool_dir;
> > +		end_renaming(&rd);
> > +	}
> > =20
> >  	/* classes */
> > -	d_exchange(tmp_class_dir, fsi->class_dir);
> > -	fsi->class_dir =3D tmp_class_dir;
> > +	ret =3D start_renaming_two_dentries(&rd, tmp_class_dir, fsi->class_dir);
> > +	if (ret =3D=3D 0) {
> > +		d_exchange(tmp_class_dir, fsi->class_dir);
> > +		fsi->class_dir =3D tmp_class_dir;
> > =20
> > -	unlock_rename(tmp_parent, fsi->sb->s_root);
> > +		end_renaming(&rd);
> > +	}
> > =20
> >  out:
> >  	sel_remove_old_bool_data(bool_num, bool_names, bool_values);
>=20
> is very interesting - suddenly you get two non-overlapping scopes instead o=
f one.
> Why is that OK?
>=20

From the perspective of code performing lookup of these names, two
consecutive lookups would not be locked so they could see
inconsistencies anyway.
From the perspective of code changing these names, that is protected by
selinux_state.policy_mutex which is held across the combined operation.
A readdir could possibly see the old inum for one name and the new inum
for the other name.  I don't imagine this would be a problem.

I have added a comment to the commit message to highlight this.

Thanks,
NeilBrown


