Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B0C2489E
	for <lists+apparmor@lfdr.de>; Fri, 31 Oct 2025 11:41:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEmZY-0001wF-Im; Fri, 31 Oct 2025 10:41:32 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEbyw-0002As-8H
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 23:23:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id BC65313000CB;
 Thu, 30 Oct 2025 19:22:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 30 Oct 2025 19:23:00 -0400
X-ME-Sender: <xms:UPMDaRhUVZd0x7_m2K17HihcRjCDpVNYHFuEuX0MMgm20e897e5KkA>
 <xme:UPMDaY7AjV2fQCLr_snCqH1fQeOzq1khXo6h6YlzncD-hrTaP3jvkupkkSppCGbEK
 3_FJ-R2P97AhdeuJVUfknkc1NHRstlmMB11PTJieu4Jgrp6>
X-ME-Received: <xmr:UPMDaR4wtri-pKxjBpYPkO67BfCd6oydbgfEbdFMML-UxKIpAqf7uEQcrmb8ircyBRb3gkh38Y-CFv6PS5eeA8faA1-9rnol0Gt6iFnCvxLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieejledvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UPMDaYFGMua7g80kGbfcUaz9Di8tafwlq4iKeb9hO4aVvX2qo_uERw>
 <xmx:UPMDacsdmaie4UXKmXFZ3mEfrheGemagwqaZFEvxWGs9YShlaMG9lQ>
 <xmx:UPMDaf4TguqIroQ6tzSgxweML37Y98bapEIbob097jWZZJuu0xphMA>
 <xmx:UPMDaQnurzcpOOav6s9l9JXVYIdItJKKsSEy0NTn122915Snsl7u-w>
 <xmx:U_MDaaJxwd0jRvItfq6nxG-85nWt4d2jCvckXynlPHJGLvIfrzldVxtX>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Oct 2025 19:22:46 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Al Viro" <viro@zeniv.linux.org.uk>
In-reply-to: <20251030061159.GV2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>,
 <20251029234353.1321957-8-neilb@ownmail.net>,
 <20251030061159.GV2441659@ZenIV>
Date: Fri, 31 Oct 2025 10:22:43 +1100
Message-id: <176186656376.1793333.1075264554692169239@noble.neil.brown.name>
Received-SPF: pass client-ip=202.12.124.142; envelope-from=neilb@ownmail.net;
 helo=flow-b7-smtp.messagingengine.com
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:41:31 +0000
Subject: Re: [apparmor] [PATCH v4 07/14] VFS: introduce
	start_removing_dentry()
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
> On Thu, Oct 30, 2025 at 10:31:07AM +1100, NeilBrown wrote:
>=20
> > @@ -428,11 +429,14 @@ static bool cachefiles_invalidate_cookie(struct fsc=
ache_cookie *cookie)
> >  		if (!old_tmpfile) {
> >  			struct cachefiles_volume *volume =3D object->volume;
> >  			struct dentry *fan =3D volume->fanout[(u8)cookie->key_hash];
> > -
> > -			inode_lock_nested(d_inode(fan), I_MUTEX_PARENT);
> > -			cachefiles_bury_object(volume->cache, object, fan,
> > -					       old_file->f_path.dentry,
> > -					       FSCACHE_OBJECT_INVALIDATED);
> > +			struct dentry *obj;
> > +
> > +			obj =3D start_removing_dentry(fan, old_file->f_path.dentry);
> > +			if (!IS_ERR(obj))
> > +				cachefiles_bury_object(volume->cache, object,
> > +						       fan, obj,
> > +						       FSCACHE_OBJECT_INVALIDATED);
> > +			end_removing(obj);
>=20
> Huh?  Where did you change cachefiles_bury_object to *not* unlock the paren=
t?
> Not in this commit, AFAICS, and that means at least a bisection hazard arou=
nd
> here...
>=20
> Confused...
>=20

Thanks for the review and for catching that error.
This incremental patch should fix it.

Thanks,
NeilBrown

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 3f8a6f1a8fc3..a08250d244ea 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -436,7 +436,6 @@ static bool cachefiles_invalidate_cookie(struct fscache_c=
ookie *cookie)
 				cachefiles_bury_object(volume->cache, object,
 						       fan, obj,
 						       FSCACHE_OBJECT_INVALIDATED);
-			end_removing(obj);
 		}
 		fput(old_file);
 	}
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index b97a40917a32..0104ac00485d 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -261,6 +261,7 @@ static int cachefiles_unlink(struct cachefiles_cache *cac=
he,
  * - Directory backed objects are stuffed into the graveyard for userspace to
  *   delete
  * On entry dir must be locked.  It will be unlocked on exit.
+ * On entry there must be at least 2 refs on rep, one will be dropped on exi=
t.
  */
 int cachefiles_bury_object(struct cachefiles_cache *cache,
 			   struct cachefiles_object *object,
@@ -275,12 +276,6 @@ int cachefiles_bury_object(struct cachefiles_cache *cach=
e,
=20
 	_enter(",'%pd','%pd'", dir, rep);
=20
-	/* end_removing() will dput() @rep but we need to keep
-	 * a ref, so take one now.  This also stops the dentry
-	 * being negated when unlinked which we need.
-	 */
-	dget(rep);
-
 	if (rep->d_parent !=3D dir) {
 		end_removing(rep);
 		_leave(" =3D -ESTALE");
@@ -650,7 +645,6 @@ bool cachefiles_look_up_object(struct cachefiles_object *=
object)
 			ret =3D cachefiles_bury_object(volume->cache, object,
 						     fan, de,
 						     FSCACHE_OBJECT_IS_WEIRD);
-		end_removing(de);
 		dput(dentry);
 		if (ret < 0)
 			return false;
diff --git a/fs/cachefiles/volume.c b/fs/cachefiles/volume.c
index ddf95ff5daf0..90ba926f488e 100644
--- a/fs/cachefiles/volume.c
+++ b/fs/cachefiles/volume.c
@@ -64,7 +64,6 @@ void cachefiles_acquire_volume(struct fscache_volume *vcook=
ie)
 				cachefiles_bury_object(cache, NULL, cache->store,
 						       vdentry,
 						       FSCACHE_VOLUME_IS_WEIRD);
-			end_removing(vdentry);
 			cachefiles_put_directory(volume->dentry);
 			cond_resched();
 			goto retry;


