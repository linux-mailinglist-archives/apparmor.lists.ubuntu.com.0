Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D4C248A1
	for <lists+apparmor@lfdr.de>; Fri, 31 Oct 2025 11:41:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEmZZ-0001wS-5y; Fri, 31 Oct 2025 10:41:33 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEcGt-0003Vv-DA
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 23:41:35 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.stl.internal (Postfix) with ESMTP id 5577013000CC;
 Thu, 30 Oct 2025 19:41:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 30 Oct 2025 19:41:34 -0400
X-ME-Sender: <xms:rPcDaZ8fz2PV7rMm0ZSYArsKSJ75ceExcgCJ6QGyjQRKO5KBTq8nPQ>
 <xme:rPcDaQmzuIyO28wxwNQwfudDj_CV47r-uovIjzlv4bUJkjMusrInjlEArZ7k-UwLI
 HAc48WwcRI1vfCPp3MElGN-CErojabz0OZDD46_wQzL8799Zw>
X-ME-Received: <xmr:rPcDaX3wPZf_7EgJjGns4r24abu2VRs0WJIogDD88n5dRmdBmesekvHkBU1FVszWCB6vmtuXogZ7a40oqlM_9oHkO0wg6GQDgpt5pOJAwPuz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieejleeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:rPcDafSIaFYl-RgHoqcs0t7YrKDZ2gioLPgi-mlU48SQlKTTMBJOIA>
 <xmx:rPcDacK6aitOy-K4GZOFYzD9IizJlaKR_2q4A8eMNjCKjpMIUTwCHA>
 <xmx:rPcDaSnTe9Z_0l91HNTze7DZRYuxwKs7F3DOvRPNBgkt8xRriYRBIQ>
 <xmx:rPcDaVj1apibW2cs8riW6YdfSEBfeA_ytKnNM-17ym5kitOJlMeFcg>
 <xmx:rfcDaZmZWSefDAP2LqnLmEPokPLWMSLY_fExqU3FZVX4WsNL0DMUw6Zo>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Oct 2025 19:41:22 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Al Viro" <viro@zeniv.linux.org.uk>
In-reply-to: <20251030062420.GX2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>,
 <20251029234353.1321957-13-neilb@ownmail.net>,
 <20251030062420.GX2441659@ZenIV>
Date: Fri, 31 Oct 2025 10:41:20 +1100
Message-id: <176186768028.1793333.3200874180667501034@noble.neil.brown.name>
Received-SPF: pass client-ip=202.12.124.142; envelope-from=neilb@ownmail.net;
 helo=flow-b7-smtp.messagingengine.com
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:41:31 +0000
Subject: [apparmor] Re: [PATCH v4 12/14] ecryptfs: use new
	start_creating/start_removing APIs
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
> On Thu, Oct 30, 2025 at 10:31:12AM +1100, NeilBrown wrote:
>=20
> > +static struct dentry *ecryptfs_start_creating_dentry(struct dentry *dent=
ry)
> >  {
> > -	struct dentry *lower_dir_dentry;
> > +	struct dentry *parent =3D dget_parent(dentry->d_parent);
>=20
> "Grab the reference to grandparent"?
>=20

That's somewhat embarrassing :-(

Fixed as below.
Thanks a lot!

NeilBrown

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index b3702105d236..6a5bca89e752 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -26,7 +26,7 @@
=20
 static struct dentry *ecryptfs_start_creating_dentry(struct dentry *dentry)
 {
-	struct dentry *parent =3D dget_parent(dentry->d_parent);
+	struct dentry *parent =3D dget_parent(dentry);
 	struct dentry *ret;
=20
 	ret =3D start_creating_dentry(ecryptfs_dentry_to_lower(parent),
@@ -37,7 +37,7 @@ static struct dentry *ecryptfs_start_creating_dentry(struct=
 dentry *dentry)
=20
 static struct dentry *ecryptfs_start_removing_dentry(struct dentry *dentry)
 {
-	struct dentry *parent =3D dget_parent(dentry->d_parent);
+	struct dentry *parent =3D dget_parent(dentry);
 	struct dentry *ret;
=20
 	ret =3D start_removing_dentry(ecryptfs_dentry_to_lower(parent),



