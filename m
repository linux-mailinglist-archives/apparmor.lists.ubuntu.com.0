Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CFC1F731
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZL-0006eG-Pi; Thu, 30 Oct 2025 10:07:47 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFtN-0005HP-Vt
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:47:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 0FB3B130007D;
 Wed, 29 Oct 2025 19:47:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 29 Oct 2025 19:47:49 -0400
X-ME-Sender: <xms:o6cCaVZf6J0SUdN43Qo87RX9dXYloaAhXWN-L23LOXStYGc1VAg1VA>
 <xme:o6cCafQ9a2cQWLeZyOZN3aIZe4XOZiHqzZpmoBjc0NhHWIgZRnGkMD5fTwBrqbQ3W
 wV0bsa7PzmMdaIi8Kzsf8xVZruNYfD4eUkQzZzvIhKcz-i2tw>
X-ME-Received: <xmr:o6cCaYw4tvjTN-WRiQo0CIQjdMx9Ev_Fgbw0XNcfl5M_BxytK7dSEF55Y-2kIiW_-M_ZCvOJu0AuY3WcbQnRlgao_AeFxqU02X4jOsnqG27g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:o6cCaVexMFfNBZ9TxXLxfgFhawwEM9E3KfEHpVFvRX0oCPsblTmBWA>
 <xmx:o6cCaeneMGqxertrNWF58HZ_jUJUxgh9Bxb1FYx6SATfdomS9MDNzQ>
 <xmx:o6cCacRBSLsrU3eF35jlLqtRqS0aB3bitsjyl0fEX6Zv6A39rqOA6A>
 <xmx:o6cCaVdPuQ8h5dKXVtkzXPbXxbBPm50S3g3duxz1RpVnI1xqnnygqA>
 <xmx:o6cCaWnh3FQONjxIEwzvmLdsCtKTlbETjNsHsO8u-jZl9q48984d1tPg>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:47:37 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:14 +1100
Message-ID: <20251029234353.1321957-15-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: [apparmor] [PATCH v4 14/14] VFS: introduce end_creating_keep()
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
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, Steve French <smfrench@gmail.com>,
 linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Olga Kornievskaia <okorniev@redhat.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 Mateusz Guzik <mjguzik@gmail.com>, David Sterba <dsterba@suse.com>,
 linux-nfs@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: NeilBrown <neil@brown.name>

Occasionally the caller of end_creating() wants to keep using the dentry.
Rather then requiring them to dget() the dentry (when not an error)
before calling end_creating(), provide end_creating_keep() which does
this.

cachefiles and overlayfs make use of this.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/cachefiles/namei.c |  3 +--
 fs/overlayfs/dir.c    |  8 ++------
 fs/overlayfs/super.c  | 11 +++--------
 include/linux/namei.h | 22 ++++++++++++++++++++++
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index c417ba4bcec3..4c72af174540 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -155,8 +155,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 
 	/* Tell rmdir() it's not allowed to delete the subdir */
 	inode_lock(d_inode(subdir));
-	dget(subdir);
-	end_creating(subdir);
+	end_creating_keep(subdir);
 
 	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
 		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 10e732360ace..8faab04dc79f 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -252,10 +252,7 @@ struct dentry *ovl_create_temp(struct ovl_fs *ofs, struct dentry *workdir,
 	if (IS_ERR(ret))
 		return ret;
 	ret = ovl_create_real(ofs, workdir, ret, attr);
-	if (!IS_ERR(ret))
-		dget(ret);
-	end_creating(ret);
-	return ret;
+	return end_creating_keep(ret);
 }
 
 static int ovl_set_opaque_xerr(struct dentry *dentry, struct dentry *upper,
@@ -365,8 +362,7 @@ static int ovl_create_upper(struct dentry *dentry, struct inode *inode,
 	if (IS_ERR(newdentry))
 		return PTR_ERR(newdentry);
 
-	dget(newdentry);
-	end_creating(newdentry);
+	end_creating_keep(newdentry);
 
 	if (ovl_type_merge(dentry->d_parent) && d_is_dir(newdentry) &&
 	    !ovl_allow_offline_changes(ofs)) {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 3acda985c8a3..7b8fc1cab6eb 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -319,8 +319,7 @@ static struct dentry *ovl_workdir_create(struct ovl_fs *ofs,
 		};
 
 		if (work->d_inode) {
-			dget(work);
-			end_creating(work);
+			end_creating_keep(work);
 			if (persist)
 				return work;
 			err = -EEXIST;
@@ -336,9 +335,7 @@ static struct dentry *ovl_workdir_create(struct ovl_fs *ofs,
 		}
 
 		work = ovl_do_mkdir(ofs, dir, work, attr.ia_mode);
-		if (!IS_ERR(work))
-			dget(work);
-		end_creating(work);
+		end_creating_keep(work);
 		err = PTR_ERR(work);
 		if (IS_ERR(work))
 			goto out_err;
@@ -630,9 +627,7 @@ static struct dentry *ovl_lookup_or_create(struct ovl_fs *ofs,
 		if (!child->d_inode)
 			child = ovl_create_real(ofs, parent, child,
 						OVL_CATTR(mode));
-		if (!IS_ERR(child))
-			dget(child);
-		end_creating(child);
+		end_creating_keep(child);
 	}
 	dput(parent);
 
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 0ef73d739a31..3d82c6a19197 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -125,6 +125,28 @@ static inline void end_creating(struct dentry *child)
 	end_dirop(child);
 }
 
+/* end_creating_keep - finish action started with start_creating() and return result
+ * @child: dentry returned by start_creating() or vfs_mkdir()
+ *
+ * Unlock and return the child. This can be called after
+ * start_creating() whether that function succeeded or not,
+ * but it is not needed on failure.
+ *
+ * If vfs_mkdir() was called then the value returned from that function
+ * should be given for @child rather than the original dentry, as vfs_mkdir()
+ * may have provided a new dentry.
+ *
+ * Returns: @child, which may be a dentry or an error.
+ *
+ */
+static inline struct dentry *end_creating_keep(struct dentry *child)
+{
+	if (!IS_ERR(child))
+		dget(child);
+	end_dirop(child);
+	return child;
+}
+
 /**
  * end_removing - finish action started with start_removing
  * @child:  dentry returned by start_removing()
-- 
2.50.0.107.gf914562f5916.dirty


