Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E764AC1F735
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZJ-0006da-QW; Thu, 30 Oct 2025 10:07:45 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFro-0004xI-Bm
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:46:12 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.stl.internal (Postfix) with ESMTP id 5F34E130007D;
 Wed, 29 Oct 2025 19:46:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Wed, 29 Oct 2025 19:46:11 -0400
X-ME-Sender: <xms:QqcCaSn5TQHk33AML_fWZGvgC3E-IDuA6GNTjbnxFsW-fgrr7aDRzQ>
 <xme:QqcCactOZcpj0IAUiEYkCeLJttYVVN6ajUYqDcenqgLzSid7ZSePZorQhX6qhA5Ah
 DBbc1V9Zwsxtchra3tp_z4rjp_7luacXA-QBUo2RP8BSaawqA>
X-ME-Received: <xmr:QqcCaReOhMA84CINv9qWqnwI5FUiLZEKz-W23Gj_4IJexPhbLiChRUsekp8UaL63OAGQNLTXh8I-5YbLze-rYwXzVbpG7XC1eDlAu9Fi0yrx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:QqcCaYb_CTFDEqOjYxF-gnTPUCmOr_W9QZeGCaI0T5hIpPfQlyyNcQ>
 <xmx:QqcCaexiST1ZroOiD4CqwUHn4HYjjUvF6ZIMcfw4fnmIhQw19RdWRQ>
 <xmx:QqcCaQspF_DOWkoLCsEIJqMdnW8CsvqmrBT4iTXdBcQESzBxZEDyRw>
 <xmx:QqcCaZKSDzdcHNkoKUKUJEEvkr3mBxWzPCuYBopgHlfeqaWHzcLdUQ>
 <xmx:QqcCaWbQVLjIXd8d1er_RxbT8C0c_F0tfe9tviWfxcYGjed7wFVEjUES>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:45:59 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:07 +1100
Message-ID: <20251029234353.1321957-8-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:43 +0000
Subject: [apparmor] [PATCH v4 07/14] VFS: introduce start_removing_dentry()
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

start_removing_dentry() is similar to start_removing() but instead of
providing a name for lookup, the target dentry is given.

start_removing_dentry() checks that the dentry is still hashed and in
the parent, and if so it locks and increases the refcount so that
end_removing() can be used to finish the operation.

This is used in cachefiles, overlayfs, smb/server, and apparmor.

There will be other users including ecryptfs.

As start_removing_dentry() takes an extra reference to the dentry (to be
put by end_removing()), there is no need to explicitly take an extra
reference to stop d_delete() from using dentry_unlink_inode() to negate
the dentry - as in cachefiles_delete_object(), and ksmbd_vfs_unlink().

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/cachefiles/interface.c      | 14 +++++++++-----
 fs/cachefiles/namei.c          | 24 ++++++++++++++----------
 fs/cachefiles/volume.c         | 10 +++++++---
 fs/namei.c                     | 33 +++++++++++++++++++++++++++++++++
 fs/overlayfs/dir.c             | 10 ++++------
 fs/overlayfs/readdir.c         |  8 ++++----
 fs/smb/server/vfs.c            | 27 ++++-----------------------
 include/linux/namei.h          |  2 ++
 security/apparmor/apparmorfs.c |  8 ++++----
 9 files changed, 81 insertions(+), 55 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 3e63cfe15874..3f8a6f1a8fc3 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -9,6 +9,7 @@
 #include <linux/mount.h>
 #include <linux/xattr.h>
 #include <linux/file.h>
+#include <linux/namei.h>
 #include <linux/falloc.h>
 #include <trace/events/fscache.h>
 #include "internal.h"
@@ -428,11 +429,14 @@ static bool cachefiles_invalidate_cookie(struct fscache_cookie *cookie)
 		if (!old_tmpfile) {
 			struct cachefiles_volume *volume = object->volume;
 			struct dentry *fan = volume->fanout[(u8)cookie->key_hash];
-
-			inode_lock_nested(d_inode(fan), I_MUTEX_PARENT);
-			cachefiles_bury_object(volume->cache, object, fan,
-					       old_file->f_path.dentry,
-					       FSCACHE_OBJECT_INVALIDATED);
+			struct dentry *obj;
+
+			obj = start_removing_dentry(fan, old_file->f_path.dentry);
+			if (!IS_ERR(obj))
+				cachefiles_bury_object(volume->cache, object,
+						       fan, obj,
+						       FSCACHE_OBJECT_INVALIDATED);
+			end_removing(obj);
 		}
 		fput(old_file);
 	}
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index c7f0c6ab9b88..b97a40917a32 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -425,13 +425,12 @@ int cachefiles_delete_object(struct cachefiles_object *object,
 
 	_enter(",OBJ%x{%pD}", object->debug_id, object->file);
 
-	/* Stop the dentry being negated if it's only pinned by a file struct. */
-	dget(dentry);
-
-	inode_lock_nested(d_backing_inode(fan), I_MUTEX_PARENT);
-	ret = cachefiles_unlink(volume->cache, object, fan, dentry, why);
-	inode_unlock(d_backing_inode(fan));
-	dput(dentry);
+	dentry = start_removing_dentry(fan, dentry);
+	if (IS_ERR(dentry))
+		ret = PTR_ERR(dentry);
+	else
+		ret = cachefiles_unlink(volume->cache, object, fan, dentry, why);
+	end_removing(dentry);
 	return ret;
 }
 
@@ -644,9 +643,14 @@ bool cachefiles_look_up_object(struct cachefiles_object *object)
 
 	if (!d_is_reg(dentry)) {
 		pr_err("%pd is not a file\n", dentry);
-		inode_lock_nested(d_inode(fan), I_MUTEX_PARENT);
-		ret = cachefiles_bury_object(volume->cache, object, fan, dentry,
-					     FSCACHE_OBJECT_IS_WEIRD);
+		struct dentry *de = start_removing_dentry(fan, dentry);
+		if (IS_ERR(de))
+			ret = PTR_ERR(de);
+		else
+			ret = cachefiles_bury_object(volume->cache, object,
+						     fan, de,
+						     FSCACHE_OBJECT_IS_WEIRD);
+		end_removing(de);
 		dput(dentry);
 		if (ret < 0)
 			return false;
diff --git a/fs/cachefiles/volume.c b/fs/cachefiles/volume.c
index 781aac4ef274..ddf95ff5daf0 100644
--- a/fs/cachefiles/volume.c
+++ b/fs/cachefiles/volume.c
@@ -7,6 +7,7 @@
 
 #include <linux/fs.h>
 #include <linux/slab.h>
+#include <linux/namei.h>
 #include "internal.h"
 #include <trace/events/fscache.h>
 
@@ -58,9 +59,12 @@ void cachefiles_acquire_volume(struct fscache_volume *vcookie)
 		if (ret < 0) {
 			if (ret != -ESTALE)
 				goto error_dir;
-			inode_lock_nested(d_inode(cache->store), I_MUTEX_PARENT);
-			cachefiles_bury_object(cache, NULL, cache->store, vdentry,
-					       FSCACHE_VOLUME_IS_WEIRD);
+			vdentry = start_removing_dentry(cache->store, vdentry);
+			if (!IS_ERR(vdentry))
+				cachefiles_bury_object(cache, NULL, cache->store,
+						       vdentry,
+						       FSCACHE_VOLUME_IS_WEIRD);
+			end_removing(vdentry);
 			cachefiles_put_directory(volume->dentry);
 			cond_resched();
 			goto retry;
diff --git a/fs/namei.c b/fs/namei.c
index 696e4b794416..bfc443bec8a9 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3323,6 +3323,39 @@ struct dentry *start_removing_noperm(struct dentry *parent,
 }
 EXPORT_SYMBOL(start_removing_noperm);
 
+/**
+ * start_removing_dentry - prepare to remove a given dentry
+ * @parent: directory from which dentry should be removed
+ * @child:  the dentry to be removed
+ *
+ * A lock is taken to protect the dentry again other dirops and
+ * the validity of the dentry is checked: correct parent and still hashed.
+ *
+ * If the dentry is valid and positive, a reference is taken and
+ * returned.  If not an error is returned.
+ *
+ * end_removing() should be called when removal is complete, or aborted.
+ *
+ * Returns: the valid dentry, or an error.
+ */
+struct dentry *start_removing_dentry(struct dentry *parent,
+				     struct dentry *child)
+{
+	inode_lock_nested(parent->d_inode, I_MUTEX_PARENT);
+	if (unlikely(IS_DEADDIR(parent->d_inode) ||
+		     child->d_parent != parent ||
+		     d_unhashed(child))) {
+		inode_unlock(parent->d_inode);
+		return ERR_PTR(-EINVAL);
+	}
+	if (d_is_negative(child)) {
+		inode_unlock(parent->d_inode);
+		return ERR_PTR(-ENOENT);
+	}
+	return dget(child);
+}
+EXPORT_SYMBOL(start_removing_dentry);
+
 #ifdef CONFIG_UNIX98_PTYS
 int path_pts(struct path *path)
 {
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index b5247c9e1903..c8d0885ee5e0 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -47,14 +47,12 @@ static int ovl_cleanup_locked(struct ovl_fs *ofs, struct inode *wdir,
 int ovl_cleanup(struct ovl_fs *ofs, struct dentry *workdir,
 		struct dentry *wdentry)
 {
-	int err;
-
-	err = ovl_parent_lock(workdir, wdentry);
-	if (err)
-		return err;
+	wdentry = start_removing_dentry(workdir, wdentry);
+	if (IS_ERR(wdentry))
+		return PTR_ERR(wdentry);
 
 	ovl_cleanup_locked(ofs, workdir->d_inode, wdentry);
-	ovl_parent_unlock(workdir);
+	end_removing(wdentry);
 
 	return 0;
 }
diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index 1e9792cc557b..77ecc39fc33a 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -1242,11 +1242,11 @@ int ovl_workdir_cleanup(struct ovl_fs *ofs, struct dentry *parent,
 	if (!d_is_dir(dentry) || level > 1)
 		return ovl_cleanup(ofs, parent, dentry);
 
-	err = ovl_parent_lock(parent, dentry);
-	if (err)
-		return err;
+	dentry = start_removing_dentry(parent, dentry);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
 	err = ovl_do_rmdir(ofs, parent->d_inode, dentry);
-	ovl_parent_unlock(parent);
+	end_removing(dentry);
 	if (err) {
 		struct path path = { .mnt = mnt, .dentry = dentry };
 
diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 891ed2dc2b73..7c4ddc43ab39 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -49,24 +49,6 @@ static void ksmbd_vfs_inherit_owner(struct ksmbd_work *work,
 	i_uid_write(inode, i_uid_read(parent_inode));
 }
 
-/**
- * ksmbd_vfs_lock_parent() - lock parent dentry if it is stable
- * @parent: parent dentry
- * @child: child dentry
- *
- * Returns: %0 on success, %-ENOENT if the parent dentry is not stable
- */
-int ksmbd_vfs_lock_parent(struct dentry *parent, struct dentry *child)
-{
-	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
-	if (child->d_parent != parent) {
-		inode_unlock(d_inode(parent));
-		return -ENOENT;
-	}
-
-	return 0;
-}
-
 static int ksmbd_vfs_path_lookup(struct ksmbd_share_config *share_conf,
 				 char *pathname, unsigned int flags,
 				 struct path *path, bool do_lock)
@@ -1084,18 +1066,17 @@ int ksmbd_vfs_unlink(struct file *filp)
 		return err;
 
 	dir = dget_parent(dentry);
-	err = ksmbd_vfs_lock_parent(dir, dentry);
-	if (err)
+	dentry = start_removing_dentry(dir, dentry);
+	err = PTR_ERR(dentry);
+	if (IS_ERR(dentry))
 		goto out;
-	dget(dentry);
 
 	if (S_ISDIR(d_inode(dentry)->i_mode))
 		err = vfs_rmdir(idmap, d_inode(dir), dentry);
 	else
 		err = vfs_unlink(idmap, d_inode(dir), dentry, NULL);
 
-	dput(dentry);
-	inode_unlock(d_inode(dir));
+	end_removing(dentry);
 	if (err)
 		ksmbd_debug(VFS, "failed to delete, err %d\n", err);
 out:
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 688e157d6afc..7e916e9d7726 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -94,6 +94,8 @@ struct dentry *start_removing(struct mnt_idmap *idmap, struct dentry *parent,
 			      struct qstr *name);
 struct dentry *start_creating_noperm(struct dentry *parent, struct qstr *name);
 struct dentry *start_removing_noperm(struct dentry *parent, struct qstr *name);
+struct dentry *start_removing_dentry(struct dentry *parent,
+				     struct dentry *child);
 
 /**
  * end_creating - finish action started with start_creating
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 391a586d0557..9d08d103f142 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -355,17 +355,17 @@ static void aafs_remove(struct dentry *dentry)
 	if (!dentry || IS_ERR(dentry))
 		return;
 
+	/* ->d_parent is stable as rename is not supported */
 	dir = d_inode(dentry->d_parent);
-	inode_lock(dir);
-	if (simple_positive(dentry)) {
+	dentry = start_removing_dentry(dentry->d_parent, dentry);
+	if (!IS_ERR(dentry) && simple_positive(dentry)) {
 		if (d_is_dir(dentry))
 			simple_rmdir(dir, dentry);
 		else
 			simple_unlink(dir, dentry);
 		d_delete(dentry);
-		dput(dentry);
 	}
-	inode_unlock(dir);
+	end_removing(dentry);
 	simple_release_fs(&aafs_mnt, &aafs_count);
 }
 
-- 
2.50.0.107.gf914562f5916.dirty


