Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 75719C1F739
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZR-0006pR-Pm; Thu, 30 Oct 2025 10:07:53 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFqf-0004iP-T9
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:45:02 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.stl.internal (Postfix) with ESMTP id ECC6313001A1;
 Wed, 29 Oct 2025 19:44:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 29 Oct 2025 19:45:00 -0400
X-ME-Sender: <xms:-6YCacUaRvYv_Mflw_xZ8RyXiZrnUxY6w2DI9aM7HiM21NuynjFsGg>
 <xme:-6YCaTfGDUqd6QLsFE9W2jNDWSsBMhRu3LXg5AhxztFlBCLZazO6bR2W9yJoTTJpD
 ChHl3Recz5jAYFi0nhscw5G1sIXqE50L1ckCODcnknTsonM>
X-ME-Received: <xmr:-6YCaRNvGjbWf5pBSHhLLOVaSLHF_oLnauPwnIJH1vTm8AgByAEKkbsgxi3-WiqeiA-S7O56ozbxn5ZES7R3v7JeuKCE3CP1z1_4DwKXBDPN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:-6YCadIyTdrxokJYCtTMpMzcz5tb3HF4FhcwX7MRHoKlRzwuAQbJag>
 <xmx:-6YCaUiCDOFEkcA5NKrk-QsCncLxVbYwl8WA0HwN5MhERWd7u-60_g>
 <xmx:-6YCaTcrKKlQcn9FVcqbPWFwGB8nQ0zEAaZnOTcaaQs04iks_k_guQ>
 <xmx:-6YCaU4H0XNp5cbSn0qsV1wNPyuEEMgyWWax0SbzOYOaATjFPJBbvg>
 <xmx:-6YCaR8v6Y2UJYVVEeieMm1A5cG-x5Hs8QS8aoQaX4LfG1N9icPZDPom>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:44:48 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:02 +1100
Message-ID: <20251029234353.1321957-3-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:43 +0000
Subject: [apparmor] [PATCH v4 02/14] VFS: introduce start_dirop() and
	end_dirop()
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

The fact that directory operations (create,remove,rename) are protected
by a lock on the parent is known widely throughout the kernel.
In order to change this - to instead lock the target dentry  - it is
best to centralise this knowledge so it can be changed in one place.

This patch introduces start_dirop() which is local to VFS code.
It performs the required locking for create and remove.  Rename
will be handled separately.

Various functions with names like start_creating() or start_removing_path(),
some of which already exist, will export this functionality beyond the VFS.

end_dirop() is the partner of start_dirop().  It drops the lock and
releases the reference on the dentry.
It *is* exported so that various end_creating etc functions can be inline.

As vfs_mkdir() drops the dentry on error we cannot use end_dirop() as
that won't unlock when the dentry IS_ERR().  For now we need an explicit
unlock when dentry IS_ERR().  I hope to change vfs_mkdir() to unlock
when it drops a dentry so that explicit unlock can go away.

end_dirop() can always be called on the result of start_dirop(), but not
after vfs_mkdir().  After a vfs_mkdir() we still may need the explicit
unlock as seen in end_creating_path().

As well as adding start_dirop() and end_dirop()
this patch uses them in:
 - simple_start_creating (which requires sharing lookup_noperm_common()
        with libfs.c)
 - start_removing_path / start_removing_user_path_at
 - filename_create / end_creating_path()
 - do_rmdir(), do_unlinkat()

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/internal.h      |  3 ++
 fs/libfs.c         | 36 ++++++++---------
 fs/namei.c         | 98 ++++++++++++++++++++++++++++++++++------------
 include/linux/fs.h |  2 +
 4 files changed, 95 insertions(+), 44 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 9b2b4d116880..d08d5e2235e9 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -67,6 +67,9 @@ int vfs_tmpfile(struct mnt_idmap *idmap,
 		const struct path *parentpath,
 		struct file *file, umode_t mode);
 struct dentry *d_hash_and_lookup(struct dentry *, struct qstr *);
+struct dentry *start_dirop(struct dentry *parent, struct qstr *name,
+			   unsigned int lookup_flags);
+int lookup_noperm_common(struct qstr *qname, struct dentry *base);
 
 /*
  * namespace.c
diff --git a/fs/libfs.c b/fs/libfs.c
index ce8c496a6940..02371f45ef7d 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -2289,27 +2289,25 @@ void stashed_dentry_prune(struct dentry *dentry)
 	cmpxchg(stashed, dentry, NULL);
 }
 
-/* parent must be held exclusive */
+/**
+ * simple_start_creating - prepare to create a given name
+ * @parent: directory in which to prepare to create the name
+ * @name:   the name to be created
+ *
+ * Required lock is taken and a lookup in performed prior to creating an
+ * object in a directory.  No permission checking is performed.
+ *
+ * Returns: a negative dentry on which vfs_create() or similar may
+ *  be attempted, or an error.
+ */
 struct dentry *simple_start_creating(struct dentry *parent, const char *name)
 {
-	struct dentry *dentry;
-	struct inode *dir = d_inode(parent);
+	struct qstr qname = QSTR(name);
+	int err;
 
-	inode_lock(dir);
-	if (unlikely(IS_DEADDIR(dir))) {
-		inode_unlock(dir);
-		return ERR_PTR(-ENOENT);
-	}
-	dentry = lookup_noperm(&QSTR(name), parent);
-	if (IS_ERR(dentry)) {
-		inode_unlock(dir);
-		return dentry;
-	}
-	if (dentry->d_inode) {
-		dput(dentry);
-		inode_unlock(dir);
-		return ERR_PTR(-EEXIST);
-	}
-	return dentry;
+	err = lookup_noperm_common(&qname, parent);
+	if (err)
+		return ERR_PTR(err);
+	return start_dirop(parent, &qname, LOOKUP_CREATE | LOOKUP_EXCL);
 }
 EXPORT_SYMBOL(simple_start_creating);
diff --git a/fs/namei.c b/fs/namei.c
index 7377020a2cba..3618efd4bcaa 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2765,6 +2765,48 @@ static int filename_parentat(int dfd, struct filename *name,
 	return __filename_parentat(dfd, name, flags, parent, last, type, NULL);
 }
 
+/**
+ * start_dirop - begin a create or remove dirop, performing locking and lookup
+ * @parent:       the dentry of the parent in which the operation will occur
+ * @name:         a qstr holding the name within that parent
+ * @lookup_flags: intent and other lookup flags.
+ *
+ * The lookup is performed and necessary locks are taken so that, on success,
+ * the returned dentry can be operated on safely.
+ * The qstr must already have the hash value calculated.
+ *
+ * Returns: a locked dentry, or an error.
+ *
+ */
+struct dentry *start_dirop(struct dentry *parent, struct qstr *name,
+			   unsigned int lookup_flags)
+{
+	struct dentry *dentry;
+	struct inode *dir = d_inode(parent);
+
+	inode_lock_nested(dir, I_MUTEX_PARENT);
+	dentry = lookup_one_qstr_excl(name, parent, lookup_flags);
+	if (IS_ERR(dentry))
+		inode_unlock(dir);
+	return dentry;
+}
+
+/**
+ * end_dirop - signal completion of a dirop
+ * @de: the dentry which was returned by start_dirop or similar.
+ *
+ * If the de is an error, nothing happens. Otherwise any lock taken to
+ * protect the dentry is dropped and the dentry itself is release (dput()).
+ */
+void end_dirop(struct dentry *de)
+{
+	if (!IS_ERR(de)) {
+		inode_unlock(de->d_parent->d_inode);
+		dput(de);
+	}
+}
+EXPORT_SYMBOL(end_dirop);
+
 /* does lookup, returns the object with parent locked */
 static struct dentry *__start_removing_path(int dfd, struct filename *name,
 					   struct path *path)
@@ -2781,10 +2823,9 @@ static struct dentry *__start_removing_path(int dfd, struct filename *name,
 		return ERR_PTR(-EINVAL);
 	/* don't fail immediately if it's r/o, at least try to report other errors */
 	error = mnt_want_write(parent_path.mnt);
-	inode_lock_nested(parent_path.dentry->d_inode, I_MUTEX_PARENT);
-	d = lookup_one_qstr_excl(&last, parent_path.dentry, 0);
+	d = start_dirop(parent_path.dentry, &last, 0);
 	if (IS_ERR(d))
-		goto unlock;
+		goto drop;
 	if (error)
 		goto fail;
 	path->dentry = no_free_ptr(parent_path.dentry);
@@ -2792,10 +2833,9 @@ static struct dentry *__start_removing_path(int dfd, struct filename *name,
 	return d;
 
 fail:
-	dput(d);
+	end_dirop(d);
 	d = ERR_PTR(error);
-unlock:
-	inode_unlock(parent_path.dentry->d_inode);
+drop:
 	if (!error)
 		mnt_drop_write(parent_path.mnt);
 	return d;
@@ -2910,7 +2950,7 @@ int vfs_path_lookup(struct dentry *dentry, struct vfsmount *mnt,
 }
 EXPORT_SYMBOL(vfs_path_lookup);
 
-static int lookup_noperm_common(struct qstr *qname, struct dentry *base)
+int lookup_noperm_common(struct qstr *qname, struct dentry *base)
 {
 	const char *name = qname->name;
 	u32 len = qname->len;
@@ -4223,21 +4263,18 @@ static struct dentry *filename_create(int dfd, struct filename *name,
 	 */
 	if (last.name[last.len] && !want_dir)
 		create_flags &= ~LOOKUP_CREATE;
-	inode_lock_nested(path->dentry->d_inode, I_MUTEX_PARENT);
-	dentry = lookup_one_qstr_excl(&last, path->dentry,
-				      reval_flag | create_flags);
+	dentry = start_dirop(path->dentry, &last, reval_flag | create_flags);
 	if (IS_ERR(dentry))
-		goto unlock;
+		goto out_drop_write;
 
 	if (unlikely(error))
 		goto fail;
 
 	return dentry;
 fail:
-	dput(dentry);
+	end_dirop(dentry);
 	dentry = ERR_PTR(error);
-unlock:
-	inode_unlock(path->dentry->d_inode);
+out_drop_write:
 	if (!error)
 		mnt_drop_write(path->mnt);
 out:
@@ -4256,11 +4293,26 @@ struct dentry *start_creating_path(int dfd, const char *pathname,
 }
 EXPORT_SYMBOL(start_creating_path);
 
+/**
+ * end_creating_path - finish a code section started by start_creating_path()
+ * @path: the path instantiated by start_creating_path()
+ * @dentry: the dentry returned by start_creating_path()
+ *
+ * end_creating_path() will unlock and locks taken by start_creating_path()
+ * and drop an references that were taken.  It should only be called
+ * if start_creating_path() returned a non-error.
+ * If vfs_mkdir() was called and it returned an error, that error *should*
+ * be passed to end_creating_path() together with the path.
+ */
 void end_creating_path(const struct path *path, struct dentry *dentry)
 {
-	if (!IS_ERR(dentry))
-		dput(dentry);
-	inode_unlock(path->dentry->d_inode);
+	if (IS_ERR(dentry))
+		/* The parent is still locked despite the error from
+		 * vfs_mkdir() - must unlock it.
+		 */
+		inode_unlock(path->dentry->d_inode);
+	else
+		end_dirop(dentry);
 	mnt_drop_write(path->mnt);
 	path_put(path);
 }
@@ -4592,8 +4644,7 @@ int do_rmdir(int dfd, struct filename *name)
 	if (error)
 		goto exit2;
 
-	inode_lock_nested(path.dentry->d_inode, I_MUTEX_PARENT);
-	dentry = lookup_one_qstr_excl(&last, path.dentry, lookup_flags);
+	dentry = start_dirop(path.dentry, &last, lookup_flags);
 	error = PTR_ERR(dentry);
 	if (IS_ERR(dentry))
 		goto exit3;
@@ -4602,9 +4653,8 @@ int do_rmdir(int dfd, struct filename *name)
 		goto exit4;
 	error = vfs_rmdir(mnt_idmap(path.mnt), path.dentry->d_inode, dentry);
 exit4:
-	dput(dentry);
+	end_dirop(dentry);
 exit3:
-	inode_unlock(path.dentry->d_inode);
 	mnt_drop_write(path.mnt);
 exit2:
 	path_put(&path);
@@ -4721,8 +4771,7 @@ int do_unlinkat(int dfd, struct filename *name)
 	if (error)
 		goto exit2;
 retry_deleg:
-	inode_lock_nested(path.dentry->d_inode, I_MUTEX_PARENT);
-	dentry = lookup_one_qstr_excl(&last, path.dentry, lookup_flags);
+	dentry = start_dirop(path.dentry, &last, lookup_flags);
 	error = PTR_ERR(dentry);
 	if (!IS_ERR(dentry)) {
 
@@ -4737,9 +4786,8 @@ int do_unlinkat(int dfd, struct filename *name)
 		error = vfs_unlink(mnt_idmap(path.mnt), path.dentry->d_inode,
 				   dentry, &delegated_inode);
 exit3:
-		dput(dentry);
+		end_dirop(dentry);
 	}
-	inode_unlock(path.dentry->d_inode);
 	if (inode)
 		iput(inode);	/* truncate the inode here */
 	inode = NULL;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..f4543612ef1e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3609,6 +3609,8 @@ extern void iterate_supers_type(struct file_system_type *,
 void filesystems_freeze(void);
 void filesystems_thaw(void);
 
+void end_dirop(struct dentry *de);
+
 extern int dcache_dir_open(struct inode *, struct file *);
 extern int dcache_dir_close(struct inode *, struct file *);
 extern loff_t dcache_dir_lseek(struct file *, loff_t, int);
-- 
2.50.0.107.gf914562f5916.dirty


