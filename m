Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56CC1F736
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZJ-0006dT-Jc; Thu, 30 Oct 2025 10:07:45 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFra-0004tn-M3
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:45:58 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.stl.internal (Postfix) with ESMTP id BC387130034B;
 Wed, 29 Oct 2025 19:45:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 29 Oct 2025 19:45:57 -0400
X-ME-Sender: <xms:M6cCaeAal03b5dOA5LouiVcIY8skm75-dTttRLI7fENjSgThW_4NIg>
 <xme:M6cCabYTh8Cee1Qmp8-BgnQdZB9ggknca55GtfP8t7dvLct2AsL-X13IgEt1ke52o
 ZCJkzOLhKuJF49LB805-6ilckKKyD2tIiF0A-y-m05zOJPy>
X-ME-Received: <xmr:M6cCaSaIdDaaRDbhnJSMMs5WBXvasgGjCST-gJbynRSk5BZTMuBdl2azY6Wc6EpXsHCFLl8tjsrKfgtrCTIx5vmPbOd5bfegbTAf4cCD1sDn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
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
X-ME-Proxy: <xmx:M6cCaenxtIqyHe7MpQN7Ve8hODapyAZnjdBKu7WMQ0rHJLl-J8sEaQ>
 <xmx:M6cCaROJG06YuJng-kbj_-P9-rWGbU7rfi9W7OUsUVaQKTcTLw5Mtg>
 <xmx:M6cCaaZxzOVzT4GjR5mDQQj6ox0MJlgk7FIWnzEDySwhccZzpYXKZg>
 <xmx:M6cCaZG-Xg2GcepdgJQgyDU4pdQedkaGEkr1IBulcOKanapVTrovWw>
 <xmx:NKcCaeqERhqFXTmy5BvllqdEz_mSwoi3rYHy535hhn_aVqr3ymogg_RK>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:45:45 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:06 +1100
Message-ID: <20251029234353.1321957-7-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:43 +0000
Subject: [apparmor] [PATCH v4 06/14] VFS: introduce start_creating_noperm()
	and start_removing_noperm()
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

xfs, fuse, ipc/mqueue need variants of start_creating or start_removing
which do not check permissions.
This patch adds _noperm versions of these functions.

Note that do_mq_open() was only calling mntget() so it could call
path_put() - it didn't really need an extra reference on the mnt.
Now it doesn't call mntget() and uses end_creating() which does
the dput() half of path_put().

Also mq_unlink() previously passed
   d_inode(dentry->d_parent)
as the dir inode to vfs_unlink().  This is after locking
   d_inode(mnt->mnt_root)
These two inodes are the same, but normally calls use the textual
parent.
So I've changes the vfs_unlink() call to be given d_inode(mnt->mnt_root).

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: NeilBrown <neil@brown.name>

--
changes since v2:
 - dir arg passed to vfs_unlink() in mq_unlink() changed to match
   the dir passed to lookup_noperm()
 - restore assignment to path->mnt even though the mntget() is removed.
---
 fs/fuse/dir.c            | 19 +++++++---------
 fs/namei.c               | 48 ++++++++++++++++++++++++++++++++++++++++
 fs/xfs/scrub/orphanage.c | 11 ++++-----
 include/linux/namei.h    |  2 ++
 ipc/mqueue.c             | 32 ++++++++++-----------------
 5 files changed, 74 insertions(+), 38 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index ecaec0fea3a1..40ca94922349 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1397,27 +1397,25 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, u64 parent_nodeid,
 	if (!parent)
 		return -ENOENT;
 
-	inode_lock_nested(parent, I_MUTEX_PARENT);
 	if (!S_ISDIR(parent->i_mode))
-		goto unlock;
+		goto put_parent;
 
 	err = -ENOENT;
 	dir = d_find_alias(parent);
 	if (!dir)
-		goto unlock;
+		goto put_parent;
 
-	name->hash = full_name_hash(dir, name->name, name->len);
-	entry = d_lookup(dir, name);
+	entry = start_removing_noperm(dir, name);
 	dput(dir);
-	if (!entry)
-		goto unlock;
+	if (IS_ERR(entry))
+		goto put_parent;
 
 	fuse_dir_changed(parent);
 	if (!(flags & FUSE_EXPIRE_ONLY))
 		d_invalidate(entry);
 	fuse_invalidate_entry_cache(entry);
 
-	if (child_nodeid != 0 && d_really_is_positive(entry)) {
+	if (child_nodeid != 0) {
 		inode_lock(d_inode(entry));
 		if (get_node_id(d_inode(entry)) != child_nodeid) {
 			err = -ENOENT;
@@ -1445,10 +1443,9 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, u64 parent_nodeid,
 	} else {
 		err = 0;
 	}
-	dput(entry);
 
- unlock:
-	inode_unlock(parent);
+	end_removing(entry);
+ put_parent:
 	iput(parent);
 	return err;
 }
diff --git a/fs/namei.c b/fs/namei.c
index ae833dfa277c..696e4b794416 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3275,6 +3275,54 @@ struct dentry *start_removing(struct mnt_idmap *idmap, struct dentry *parent,
 }
 EXPORT_SYMBOL(start_removing);
 
+/**
+ * start_creating_noperm - prepare to create a given name without permission checking
+ * @parent: directory in which to prepare to create the name
+ * @name:   the name to be created
+ *
+ * Locks are taken and a lookup in performed prior to creating
+ * an object in a directory.
+ *
+ * If the name already exists, a positive dentry is returned.
+ *
+ * Returns: a negative or positive dentry, or an error.
+ */
+struct dentry *start_creating_noperm(struct dentry *parent,
+				     struct qstr *name)
+{
+	int err = lookup_noperm_common(name, parent);
+
+	if (err)
+		return ERR_PTR(err);
+	return start_dirop(parent, name, LOOKUP_CREATE);
+}
+EXPORT_SYMBOL(start_creating_noperm);
+
+/**
+ * start_removing_noperm - prepare to remove a given name without permission checking
+ * @parent: directory in which to find the name
+ * @name:   the name to be removed
+ *
+ * Locks are taken and a lookup in performed prior to removing
+ * an object from a directory.
+ *
+ * If the name doesn't exist, an error is returned.
+ *
+ * end_removing() should be called when removal is complete, or aborted.
+ *
+ * Returns: a positive dentry, or an error.
+ */
+struct dentry *start_removing_noperm(struct dentry *parent,
+				     struct qstr *name)
+{
+	int err = lookup_noperm_common(name, parent);
+
+	if (err)
+		return ERR_PTR(err);
+	return start_dirop(parent, name, 0);
+}
+EXPORT_SYMBOL(start_removing_noperm);
+
 #ifdef CONFIG_UNIX98_PTYS
 int path_pts(struct path *path)
 {
diff --git a/fs/xfs/scrub/orphanage.c b/fs/xfs/scrub/orphanage.c
index 9c12cb844231..e732605924a1 100644
--- a/fs/xfs/scrub/orphanage.c
+++ b/fs/xfs/scrub/orphanage.c
@@ -152,11 +152,10 @@ xrep_orphanage_create(
 	}
 
 	/* Try to find the orphanage directory. */
-	inode_lock_nested(root_inode, I_MUTEX_PARENT);
-	orphanage_dentry = lookup_noperm(&QSTR(ORPHANAGE), root_dentry);
+	orphanage_dentry = start_creating_noperm(root_dentry, &QSTR(ORPHANAGE));
 	if (IS_ERR(orphanage_dentry)) {
 		error = PTR_ERR(orphanage_dentry);
-		goto out_unlock_root;
+		goto out_dput_root;
 	}
 
 	/*
@@ -170,7 +169,7 @@ xrep_orphanage_create(
 					     orphanage_dentry, 0750);
 		error = PTR_ERR(orphanage_dentry);
 		if (IS_ERR(orphanage_dentry))
-			goto out_unlock_root;
+			goto out_dput_orphanage;
 	}
 
 	/* Not a directory? Bail out. */
@@ -200,9 +199,7 @@ xrep_orphanage_create(
 	sc->orphanage_ilock_flags = 0;
 
 out_dput_orphanage:
-	dput(orphanage_dentry);
-out_unlock_root:
-	inode_unlock(VFS_I(sc->mp->m_rootip));
+	end_creating(orphanage_dentry, root_dentry);
 out_dput_root:
 	dput(root_dentry);
 out:
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 9ee76e88f3dd..688e157d6afc 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -92,6 +92,8 @@ struct dentry *start_creating(struct mnt_idmap *idmap, struct dentry *parent,
 			      struct qstr *name);
 struct dentry *start_removing(struct mnt_idmap *idmap, struct dentry *parent,
 			      struct qstr *name);
+struct dentry *start_creating_noperm(struct dentry *parent, struct qstr *name);
+struct dentry *start_removing_noperm(struct dentry *parent, struct qstr *name);
 
 /**
  * end_creating - finish action started with start_creating
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 093551fe66a7..6d7610310003 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -913,13 +913,12 @@ static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 		goto out_putname;
 
 	ro = mnt_want_write(mnt);	/* we'll drop it in any case */
-	inode_lock(d_inode(root));
-	path.dentry = lookup_noperm(&QSTR(name->name), root);
+	path.dentry = start_creating_noperm(root, &QSTR(name->name));
 	if (IS_ERR(path.dentry)) {
 		error = PTR_ERR(path.dentry);
 		goto out_putfd;
 	}
-	path.mnt = mntget(mnt);
+	path.mnt = mnt;
 	error = prepare_open(path.dentry, oflag, ro, mode, name, attr);
 	if (!error) {
 		struct file *file = dentry_open(&path, oflag, current_cred());
@@ -928,13 +927,12 @@ static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 		else
 			error = PTR_ERR(file);
 	}
-	path_put(&path);
 out_putfd:
 	if (error) {
 		put_unused_fd(fd);
 		fd = error;
 	}
-	inode_unlock(d_inode(root));
+	end_creating(path.dentry, root);
 	if (!ro)
 		mnt_drop_write(mnt);
 out_putname:
@@ -957,7 +955,7 @@ SYSCALL_DEFINE1(mq_unlink, const char __user *, u_name)
 	int err;
 	struct filename *name;
 	struct dentry *dentry;
-	struct inode *inode = NULL;
+	struct inode *inode;
 	struct ipc_namespace *ipc_ns = current->nsproxy->ipc_ns;
 	struct vfsmount *mnt = ipc_ns->mq_mnt;
 
@@ -969,26 +967,20 @@ SYSCALL_DEFINE1(mq_unlink, const char __user *, u_name)
 	err = mnt_want_write(mnt);
 	if (err)
 		goto out_name;
-	inode_lock_nested(d_inode(mnt->mnt_root), I_MUTEX_PARENT);
-	dentry = lookup_noperm(&QSTR(name->name), mnt->mnt_root);
+	dentry = start_removing_noperm(mnt->mnt_root, &QSTR(name->name));
 	if (IS_ERR(dentry)) {
 		err = PTR_ERR(dentry);
-		goto out_unlock;
+		goto out_drop_write;
 	}
 
 	inode = d_inode(dentry);
-	if (!inode) {
-		err = -ENOENT;
-	} else {
-		ihold(inode);
-		err = vfs_unlink(&nop_mnt_idmap, d_inode(dentry->d_parent),
-				 dentry, NULL);
-	}
-	dput(dentry);
-
-out_unlock:
-	inode_unlock(d_inode(mnt->mnt_root));
+	ihold(inode);
+	err = vfs_unlink(&nop_mnt_idmap, d_inode(mnt->mnt_root),
+			 dentry, NULL);
+	end_removing(dentry);
 	iput(inode);
+
+out_drop_write:
 	mnt_drop_write(mnt);
 out_name:
 	putname(name);
-- 
2.50.0.107.gf914562f5916.dirty


