Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A92EBC1F73C
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:08:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZS-0006sF-JV; Thu, 30 Oct 2025 10:07:54 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFsi-00058a-Ge
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:47:08 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.stl.internal (Postfix) with ESMTP id 95E23130007D;
 Wed, 29 Oct 2025 19:47:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 29 Oct 2025 19:47:07 -0400
X-ME-Sender: <xms:eqcCaV5BvmYotUBWjilldZzXV5AOVWKOInE_ujdferO6sjPGV29ABQ>
 <xme:eqcCaVyr72IyIij7FXxBzw0qfjZ4x-iQvqQOOx1631ItDl9gbaQ9H2uCtjwGh-2uN
 dB7FsFcSFjHpREAuPhVNjIK7R5Es3fC9v1OOrniyy0cSp15Qy8>
X-ME-Received: <xmr:eqcCadQ9RBYGt8cQPUgR91HquuwZM6G_Rl4Ii5n76NU__ZMzqSo4Rd-FKpKwjs6ELry5lAviTLvIUHjeAil_-8bjGB684IVwm4OlaJbQfK52>
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
X-ME-Proxy: <xmx:eqcCaf-gx9Pl5ATAqdBuMK5Hi4wdHFHPh_u-P9McnI9P7RiThPDHqg>
 <xmx:eqcCaXHZpbAZ9OlUl-L-vHs59H2JbLWW9-nbsSCZXJOKVIFCZpOj-g>
 <xmx:eqcCaawdjblc1x6oRvTSqgGz2X7rgPd5F2G7u4xHw7XD2PiQDrYtoQ>
 <xmx:eqcCaR9hfRqNX3QD9dTZLddikluWlwqo1SyEiqNUqf48YOAXn58O-A>
 <xmx:eqcCaUibYVHmQHjbhfTnLAAZlNEEsXoatWyFTMcJwGFLOYRMBQc_lAB9>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:46:55 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:11 +1100
Message-ID: <20251029234353.1321957-12-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: [apparmor] [PATCH v4 11/14] Add start_renaming_two_dentries()
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

A few callers want to lock for a rename and already have both dentries.
Also debugfs does want to perform a lookup but doesn't want permission
checking, so start_renaming_dentry() cannot be used.

This patch introduces start_renaming_two_dentries() which is given both
dentries.  debugfs performs one lookup itself.  As it will only continue
with a negative dentry and as those cannot be renamed or unlinked, it is
safe to do the lookup before getting the rename locks.

overlayfs uses start_renaming_two_dentries() in three places and  selinux
uses it twice in sel_make_policy_nodes().

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>

---
changes since v3:
 added missing assignment to rd.mnt_idmap in ovl_cleanup_and_whiteout
---
 fs/debugfs/inode.c           | 48 ++++++++++++--------------
 fs/namei.c                   | 65 ++++++++++++++++++++++++++++++++++++
 fs/overlayfs/dir.c           | 43 ++++++++++++++++--------
 include/linux/namei.h        |  2 ++
 security/selinux/selinuxfs.c | 27 ++++++++++-----
 5 files changed, 136 insertions(+), 49 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index f241b9df642a..532bd7c46baf 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -842,7 +842,8 @@ int __printf(2, 3) debugfs_change_name(struct dentry *dentry, const char *fmt, .
 	int error = 0;
 	const char *new_name;
 	struct name_snapshot old_name;
-	struct dentry *parent, *target;
+	struct dentry *target;
+	struct renamedata rd = {};
 	struct inode *dir;
 	va_list ap;
 
@@ -855,36 +856,31 @@ int __printf(2, 3) debugfs_change_name(struct dentry *dentry, const char *fmt, .
 	if (!new_name)
 		return -ENOMEM;
 
-	parent = dget_parent(dentry);
-	dir = d_inode(parent);
-	inode_lock(dir);
+	rd.old_parent = dget_parent(dentry);
+	rd.new_parent = rd.old_parent;
+	rd.flags = RENAME_NOREPLACE;
+	target = lookup_noperm_unlocked(&QSTR(new_name), rd.new_parent);
+	if (IS_ERR(target))
+		return PTR_ERR(target);
 
-	take_dentry_name_snapshot(&old_name, dentry);
-
-	if (WARN_ON_ONCE(dentry->d_parent != parent)) {
-		error = -EINVAL;
-		goto out;
-	}
-	if (strcmp(old_name.name.name, new_name) == 0)
-		goto out;
-	target = lookup_noperm(&QSTR(new_name), parent);
-	if (IS_ERR(target)) {
-		error = PTR_ERR(target);
-		goto out;
-	}
-	if (d_really_is_positive(target)) {
-		dput(target);
-		error = -EINVAL;
+	error = start_renaming_two_dentries(&rd, dentry, target);
+	if (error) {
+		if (error == -EEXIST && target == dentry)
+			/* it isn't an error to rename a thing to itself */
+			error = 0;
 		goto out;
 	}
-	simple_rename_timestamp(dir, dentry, dir, target);
-	d_move(dentry, target);
-	dput(target);
+
+	dir = d_inode(rd.old_parent);
+	take_dentry_name_snapshot(&old_name, dentry);
+	simple_rename_timestamp(dir, dentry, dir, rd.new_dentry);
+	d_move(dentry, rd.new_dentry);
 	fsnotify_move(dir, dir, &old_name.name, d_is_dir(dentry), NULL, dentry);
-out:
 	release_dentry_name_snapshot(&old_name);
-	inode_unlock(dir);
-	dput(parent);
+	end_renaming(&rd);
+out:
+	dput(rd.old_parent);
+	dput(target);
 	kfree_const(new_name);
 	return error;
 }
diff --git a/fs/namei.c b/fs/namei.c
index 5153ceddd37a..4a4b8b96c192 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3877,6 +3877,71 @@ int start_renaming_dentry(struct renamedata *rd, int lookup_flags,
 }
 EXPORT_SYMBOL(start_renaming_dentry);
 
+/**
+ * start_renaming_two_dentries - Lock to dentries in given parents for rename
+ * @rd:           rename data containing parent
+ * @old_dentry:   dentry of name to move
+ * @new_dentry:   dentry to move to
+ *
+ * Ensure locks are in place for rename and check parentage is still correct.
+ *
+ * On success the two dentries are stored in @rd.old_dentry and
+ * @rd.new_dentry and @rd.old_parent and @rd.new_parent are confirmed to
+ * be the parents of the dentries.
+ *
+ * References and the lock can be dropped with end_renaming()
+ *
+ * Returns: zero or an error.
+ */
+int
+start_renaming_two_dentries(struct renamedata *rd,
+			    struct dentry *old_dentry, struct dentry *new_dentry)
+{
+	struct dentry *trap;
+	int err;
+
+	/* Already have the dentry - need to be sure to lock the correct parent */
+	trap = lock_rename_child(old_dentry, rd->new_parent);
+	if (IS_ERR(trap))
+		return PTR_ERR(trap);
+	err = -EINVAL;
+	if (d_unhashed(old_dentry) ||
+	    (rd->old_parent && rd->old_parent != old_dentry->d_parent))
+		/* old_dentry was removed, or moved and explicit parent requested */
+		goto out_unlock;
+	if (d_unhashed(new_dentry) ||
+	    rd->new_parent != new_dentry->d_parent)
+		/* new_dentry was removed or moved */
+		goto out_unlock;
+
+	if (old_dentry == trap)
+		/* source is an ancestor of target */
+		goto out_unlock;
+
+	if (new_dentry == trap) {
+		/* target is an ancestor of source */
+		if (rd->flags & RENAME_EXCHANGE)
+			err = -EINVAL;
+		else
+			err = -ENOTEMPTY;
+		goto out_unlock;
+	}
+
+	err = -EEXIST;
+	if (d_is_positive(new_dentry) && (rd->flags & RENAME_NOREPLACE))
+		goto out_unlock;
+
+	rd->old_dentry = dget(old_dentry);
+	rd->new_dentry = dget(new_dentry);
+	rd->old_parent = dget(old_dentry->d_parent);
+	return 0;
+
+out_unlock:
+	unlock_rename(old_dentry->d_parent, rd->new_parent);
+	return err;
+}
+EXPORT_SYMBOL(start_renaming_two_dentries);
+
 void end_renaming(struct renamedata *rd)
 {
 	unlock_rename(rd->old_parent, rd->new_parent);
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 2b423ebc85c4..c297648c7487 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -123,6 +123,7 @@ int ovl_cleanup_and_whiteout(struct ovl_fs *ofs, struct dentry *dir,
 			     struct dentry *dentry)
 {
 	struct dentry *whiteout;
+	struct renamedata rd = {};
 	int err;
 	int flags = 0;
 
@@ -134,10 +135,14 @@ int ovl_cleanup_and_whiteout(struct ovl_fs *ofs, struct dentry *dir,
 	if (d_is_dir(dentry))
 		flags = RENAME_EXCHANGE;
 
-	err = ovl_lock_rename_workdir(ofs->workdir, whiteout, dir, dentry);
+	rd.mnt_idmap = ovl_upper_mnt_idmap(ofs);
+	rd.old_parent = ofs->workdir;
+	rd.new_parent = dir;
+	rd.flags = flags;
+	err = start_renaming_two_dentries(&rd, whiteout, dentry);
 	if (!err) {
-		err = ovl_do_rename(ofs, ofs->workdir, whiteout, dir, dentry, flags);
-		unlock_rename(ofs->workdir, dir);
+		err = ovl_do_rename_rd(&rd);
+		end_renaming(&rd);
 	}
 	if (err)
 		goto kill_whiteout;
@@ -388,6 +393,7 @@ static struct dentry *ovl_clear_empty(struct dentry *dentry,
 	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
 	struct dentry *workdir = ovl_workdir(dentry);
 	struct dentry *upperdir = ovl_dentry_upper(dentry->d_parent);
+	struct renamedata rd = {};
 	struct path upperpath;
 	struct dentry *upper;
 	struct dentry *opaquedir;
@@ -413,7 +419,11 @@ static struct dentry *ovl_clear_empty(struct dentry *dentry,
 	if (IS_ERR(opaquedir))
 		goto out;
 
-	err = ovl_lock_rename_workdir(workdir, opaquedir, upperdir, upper);
+	rd.mnt_idmap = ovl_upper_mnt_idmap(ofs);
+	rd.old_parent = workdir;
+	rd.new_parent = upperdir;
+	rd.flags = RENAME_EXCHANGE;
+	err = start_renaming_two_dentries(&rd, opaquedir, upper);
 	if (err)
 		goto out_cleanup_unlocked;
 
@@ -431,8 +441,8 @@ static struct dentry *ovl_clear_empty(struct dentry *dentry,
 	if (err)
 		goto out_cleanup;
 
-	err = ovl_do_rename(ofs, workdir, opaquedir, upperdir, upper, RENAME_EXCHANGE);
-	unlock_rename(workdir, upperdir);
+	err = ovl_do_rename_rd(&rd);
+	end_renaming(&rd);
 	if (err)
 		goto out_cleanup_unlocked;
 
@@ -445,7 +455,7 @@ static struct dentry *ovl_clear_empty(struct dentry *dentry,
 	return opaquedir;
 
 out_cleanup:
-	unlock_rename(workdir, upperdir);
+	end_renaming(&rd);
 out_cleanup_unlocked:
 	ovl_cleanup(ofs, workdir, opaquedir);
 	dput(opaquedir);
@@ -468,6 +478,7 @@ static int ovl_create_over_whiteout(struct dentry *dentry, struct inode *inode,
 	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
 	struct dentry *workdir = ovl_workdir(dentry);
 	struct dentry *upperdir = ovl_dentry_upper(dentry->d_parent);
+	struct renamedata rd = {};
 	struct dentry *upper;
 	struct dentry *newdentry;
 	int err;
@@ -499,7 +510,11 @@ static int ovl_create_over_whiteout(struct dentry *dentry, struct inode *inode,
 	if (IS_ERR(newdentry))
 		goto out_dput;
 
-	err = ovl_lock_rename_workdir(workdir, newdentry, upperdir, upper);
+	rd.mnt_idmap = ovl_upper_mnt_idmap(ofs);
+	rd.old_parent = workdir;
+	rd.new_parent = upperdir;
+	rd.flags = 0;
+	err = start_renaming_two_dentries(&rd, newdentry, upper);
 	if (err)
 		goto out_cleanup_unlocked;
 
@@ -536,16 +551,16 @@ static int ovl_create_over_whiteout(struct dentry *dentry, struct inode *inode,
 		if (err)
 			goto out_cleanup;
 
-		err = ovl_do_rename(ofs, workdir, newdentry, upperdir, upper,
-				    RENAME_EXCHANGE);
-		unlock_rename(workdir, upperdir);
+		rd.flags = RENAME_EXCHANGE;
+		err = ovl_do_rename_rd(&rd);
+		end_renaming(&rd);
 		if (err)
 			goto out_cleanup_unlocked;
 
 		ovl_cleanup(ofs, workdir, upper);
 	} else {
-		err = ovl_do_rename(ofs, workdir, newdentry, upperdir, upper, 0);
-		unlock_rename(workdir, upperdir);
+		err = ovl_do_rename_rd(&rd);
+		end_renaming(&rd);
 		if (err)
 			goto out_cleanup_unlocked;
 	}
@@ -565,7 +580,7 @@ static int ovl_create_over_whiteout(struct dentry *dentry, struct inode *inode,
 	return err;
 
 out_cleanup:
-	unlock_rename(workdir, upperdir);
+	end_renaming(&rd);
 out_cleanup_unlocked:
 	ovl_cleanup(ofs, workdir, newdentry);
 	dput(newdentry);
diff --git a/include/linux/namei.h b/include/linux/namei.h
index f73001e3719a..a99ac8b7e24a 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -160,6 +160,8 @@ int start_renaming(struct renamedata *rd, int lookup_flags,
 		   struct qstr *old_last, struct qstr *new_last);
 int start_renaming_dentry(struct renamedata *rd, int lookup_flags,
 			  struct dentry *old_dentry, struct qstr *new_last);
+int start_renaming_two_dentries(struct renamedata *rd,
+				struct dentry *old_dentry, struct dentry *new_dentry);
 void end_renaming(struct renamedata *rd);
 
 /**
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 232e087bce3e..a224ef9bb831 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -506,6 +506,7 @@ static int sel_make_policy_nodes(struct selinux_fs_info *fsi,
 {
 	int ret = 0;
 	struct dentry *tmp_parent, *tmp_bool_dir, *tmp_class_dir;
+	struct renamedata rd = {};
 	unsigned int bool_num = 0;
 	char **bool_names = NULL;
 	int *bool_values = NULL;
@@ -539,22 +540,30 @@ static int sel_make_policy_nodes(struct selinux_fs_info *fsi,
 	if (ret)
 		goto out;
 
-	lock_rename(tmp_parent, fsi->sb->s_root);
+	rd.old_parent = tmp_parent;
+	rd.new_parent = fsi->sb->s_root;
 
 	/* booleans */
-	d_exchange(tmp_bool_dir, fsi->bool_dir);
+	ret = start_renaming_two_dentries(&rd, tmp_bool_dir, fsi->bool_dir);
+	if (!ret) {
+		d_exchange(tmp_bool_dir, fsi->bool_dir);
 
-	swap(fsi->bool_num, bool_num);
-	swap(fsi->bool_pending_names, bool_names);
-	swap(fsi->bool_pending_values, bool_values);
+		swap(fsi->bool_num, bool_num);
+		swap(fsi->bool_pending_names, bool_names);
+		swap(fsi->bool_pending_values, bool_values);
 
-	fsi->bool_dir = tmp_bool_dir;
+		fsi->bool_dir = tmp_bool_dir;
+		end_renaming(&rd);
+	}
 
 	/* classes */
-	d_exchange(tmp_class_dir, fsi->class_dir);
-	fsi->class_dir = tmp_class_dir;
+	ret = start_renaming_two_dentries(&rd, tmp_class_dir, fsi->class_dir);
+	if (ret == 0) {
+		d_exchange(tmp_class_dir, fsi->class_dir);
+		fsi->class_dir = tmp_class_dir;
 
-	unlock_rename(tmp_parent, fsi->sb->s_root);
+		end_renaming(&rd);
+	}
 
 out:
 	sel_remove_old_bool_data(bool_num, bool_names, bool_values);
-- 
2.50.0.107.gf914562f5916.dirty


