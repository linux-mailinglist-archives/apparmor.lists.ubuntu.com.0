Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC3C1F734
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZL-0006eA-Ka; Thu, 30 Oct 2025 10:07:47 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFsw-00059d-Bt
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:47:22 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.stl.internal (Postfix) with ESMTP id 502CE130007D;
 Wed, 29 Oct 2025 19:47:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 29 Oct 2025 19:47:21 -0400
X-ME-Sender: <xms:h6cCaecamEaKpX82II19TOtSVz6TEsHa23eAwDZtk-9nIedKhjphvA>
 <xme:h6cCabFgbsS4ixmxph06JATlknq_0KnxI-EnhvGboAnruDSqMiOHxg_hvFUpN_b4O
 Q5LZqZQ8diFC9g36YYx4EinX4d35qSSxdQcCJgFoP6YhqOXhw>
X-ME-Received: <xmr:h6cCaQXRfVAv_5pjRcb-OoW2wQJQMmEwOA_Qc5aj7wlCSxFdQOOwe-QMW28x7Qn6mqY8Bsodmqxc5kGTJwZFzpEAtomsGTJIapZeWk2LG8Mb>
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
X-ME-Proxy: <xmx:h6cCadxStYeVfXyBCw1DO8LhOd_TxZf5pyn5kXgX2ciweFSYDHVLOg>
 <xmx:iKcCaYoiY3iwb0rAIaz1HIomH2gxsV1tZ-LAYyfODTDL-yzcY7o_DQ>
 <xmx:iKcCaVGz3eWy1xIMSfps6YAoaNa3rKfG9lvERU27oWR6Zx5oXt1gVA>
 <xmx:iKcCaWBWW2mz43jNNkB48s8agjiEdhRBBg4X1BpUajcmVCH3ix9p1w>
 <xmx:iKcCaXJdDI-Tz4zdIyqdwqFxc4jNkQnnIj5vr4FPBNNPSbPDBDxraasK>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:47:09 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:12 +1100
Message-ID: <20251029234353.1321957-13-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: [apparmor] [PATCH v4 12/14] ecryptfs: use new
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

This requires the addition of start_creating_dentry() which is given the
dentry which has already been found, and asks for it to be locked and
its parent validated.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/ecryptfs/inode.c   | 153 ++++++++++++++++++++----------------------
 fs/namei.c            |  33 +++++++++
 include/linux/namei.h |   2 +
 3 files changed, 107 insertions(+), 81 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index ed1394da8d6b..b3702105d236 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -24,18 +24,26 @@
 #include <linux/unaligned.h>
 #include "ecryptfs_kernel.h"
 
-static int lock_parent(struct dentry *dentry,
-		       struct dentry **lower_dentry,
-		       struct inode **lower_dir)
+static struct dentry *ecryptfs_start_creating_dentry(struct dentry *dentry)
 {
-	struct dentry *lower_dir_dentry;
+	struct dentry *parent = dget_parent(dentry->d_parent);
+	struct dentry *ret;
 
-	lower_dir_dentry = ecryptfs_dentry_to_lower(dentry->d_parent);
-	*lower_dir = d_inode(lower_dir_dentry);
-	*lower_dentry = ecryptfs_dentry_to_lower(dentry);
+	ret = start_creating_dentry(ecryptfs_dentry_to_lower(parent),
+				    ecryptfs_dentry_to_lower(dentry));
+	dput(parent);
+	return ret;
+}
 
-	inode_lock_nested(*lower_dir, I_MUTEX_PARENT);
-	return (*lower_dentry)->d_parent == lower_dir_dentry ? 0 : -EINVAL;
+static struct dentry *ecryptfs_start_removing_dentry(struct dentry *dentry)
+{
+	struct dentry *parent = dget_parent(dentry->d_parent);
+	struct dentry *ret;
+
+	ret = start_removing_dentry(ecryptfs_dentry_to_lower(parent),
+				    ecryptfs_dentry_to_lower(dentry));
+	dput(parent);
+	return ret;
 }
 
 static int ecryptfs_inode_test(struct inode *inode, void *lower_inode)
@@ -141,15 +149,12 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
 	struct inode *lower_dir;
 	int rc;
 
-	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
-	dget(lower_dentry);	// don't even try to make the lower negative
-	if (!rc) {
-		if (d_unhashed(lower_dentry))
-			rc = -EINVAL;
-		else
-			rc = vfs_unlink(&nop_mnt_idmap, lower_dir, lower_dentry,
-					NULL);
-	}
+	lower_dentry = ecryptfs_start_removing_dentry(dentry);
+	if (IS_ERR(lower_dentry))
+		return PTR_ERR(lower_dentry);
+
+	lower_dir = lower_dentry->d_parent->d_inode;
+	rc = vfs_unlink(&nop_mnt_idmap, lower_dir, lower_dentry, NULL);
 	if (rc) {
 		printk(KERN_ERR "Error in vfs_unlink; rc = [%d]\n", rc);
 		goto out_unlock;
@@ -158,8 +163,7 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
 	set_nlink(inode, ecryptfs_inode_to_lower(inode)->i_nlink);
 	inode_set_ctime_to_ts(inode, inode_get_ctime(dir));
 out_unlock:
-	dput(lower_dentry);
-	inode_unlock(lower_dir);
+	end_removing(lower_dentry);
 	if (!rc)
 		d_drop(dentry);
 	return rc;
@@ -186,10 +190,12 @@ ecryptfs_do_create(struct inode *directory_inode,
 	struct inode *lower_dir;
 	struct inode *inode;
 
-	rc = lock_parent(ecryptfs_dentry, &lower_dentry, &lower_dir);
-	if (!rc)
-		rc = vfs_create(&nop_mnt_idmap, lower_dir,
-				lower_dentry, mode, true);
+	lower_dentry = ecryptfs_start_creating_dentry(ecryptfs_dentry);
+	if (IS_ERR(lower_dentry))
+		return ERR_CAST(lower_dentry);
+	lower_dir = lower_dentry->d_parent->d_inode;
+	rc = vfs_create(&nop_mnt_idmap, lower_dir,
+			lower_dentry, mode, true);
 	if (rc) {
 		printk(KERN_ERR "%s: Failure to create dentry in lower fs; "
 		       "rc = [%d]\n", __func__, rc);
@@ -205,7 +211,7 @@ ecryptfs_do_create(struct inode *directory_inode,
 	fsstack_copy_attr_times(directory_inode, lower_dir);
 	fsstack_copy_inode_size(directory_inode, lower_dir);
 out_lock:
-	inode_unlock(lower_dir);
+	end_creating(lower_dentry, NULL);
 	return inode;
 }
 
@@ -433,10 +439,12 @@ static int ecryptfs_link(struct dentry *old_dentry, struct inode *dir,
 
 	file_size_save = i_size_read(d_inode(old_dentry));
 	lower_old_dentry = ecryptfs_dentry_to_lower(old_dentry);
-	rc = lock_parent(new_dentry, &lower_new_dentry, &lower_dir);
-	if (!rc)
-		rc = vfs_link(lower_old_dentry, &nop_mnt_idmap, lower_dir,
-			      lower_new_dentry, NULL);
+	lower_new_dentry = ecryptfs_start_creating_dentry(new_dentry);
+	if (IS_ERR(lower_new_dentry))
+		return PTR_ERR(lower_new_dentry);
+	lower_dir = lower_new_dentry->d_parent->d_inode;
+	rc = vfs_link(lower_old_dentry, &nop_mnt_idmap, lower_dir,
+		      lower_new_dentry, NULL);
 	if (rc || d_really_is_negative(lower_new_dentry))
 		goto out_lock;
 	rc = ecryptfs_interpose(lower_new_dentry, new_dentry, dir->i_sb);
@@ -448,7 +456,7 @@ static int ecryptfs_link(struct dentry *old_dentry, struct inode *dir,
 		  ecryptfs_inode_to_lower(d_inode(old_dentry))->i_nlink);
 	i_size_write(d_inode(new_dentry), file_size_save);
 out_lock:
-	inode_unlock(lower_dir);
+	end_creating(lower_new_dentry, NULL);
 	return rc;
 }
 
@@ -468,9 +476,11 @@ static int ecryptfs_symlink(struct mnt_idmap *idmap,
 	size_t encoded_symlen;
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat = NULL;
 
-	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
-	if (rc)
-		goto out_lock;
+	lower_dentry = ecryptfs_start_creating_dentry(dentry);
+	if (IS_ERR(lower_dentry))
+		return PTR_ERR(lower_dentry);
+	lower_dir = lower_dentry->d_parent->d_inode;
+
 	mount_crypt_stat = &ecryptfs_superblock_to_private(
 		dir->i_sb)->mount_crypt_stat;
 	rc = ecryptfs_encrypt_and_encode_filename(&encoded_symname,
@@ -490,7 +500,7 @@ static int ecryptfs_symlink(struct mnt_idmap *idmap,
 	fsstack_copy_attr_times(dir, lower_dir);
 	fsstack_copy_inode_size(dir, lower_dir);
 out_lock:
-	inode_unlock(lower_dir);
+	end_creating(lower_dentry, NULL);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return rc;
@@ -501,12 +511,14 @@ static struct dentry *ecryptfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 {
 	int rc;
 	struct dentry *lower_dentry;
+	struct dentry *lower_dir_dentry;
 	struct inode *lower_dir;
 
-	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
-	if (rc)
-		goto out;
-
+	lower_dentry = ecryptfs_start_creating_dentry(dentry);
+	if (IS_ERR(lower_dentry))
+		return lower_dentry;
+	lower_dir_dentry = dget(lower_dentry->d_parent);
+	lower_dir = lower_dir_dentry->d_inode;
 	lower_dentry = vfs_mkdir(&nop_mnt_idmap, lower_dir,
 				 lower_dentry, mode);
 	rc = PTR_ERR(lower_dentry);
@@ -522,7 +534,7 @@ static struct dentry *ecryptfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	fsstack_copy_inode_size(dir, lower_dir);
 	set_nlink(dir, lower_dir->i_nlink);
 out:
-	inode_unlock(lower_dir);
+	end_creating(lower_dentry, lower_dir_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return ERR_PTR(rc);
@@ -534,21 +546,18 @@ static int ecryptfs_rmdir(struct inode *dir, struct dentry *dentry)
 	struct inode *lower_dir;
 	int rc;
 
-	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
-	dget(lower_dentry);	// don't even try to make the lower negative
-	if (!rc) {
-		if (d_unhashed(lower_dentry))
-			rc = -EINVAL;
-		else
-			rc = vfs_rmdir(&nop_mnt_idmap, lower_dir, lower_dentry);
-	}
+	lower_dentry = ecryptfs_start_removing_dentry(dentry);
+	if (IS_ERR(lower_dentry))
+		return PTR_ERR(lower_dentry);
+	lower_dir = lower_dentry->d_parent->d_inode;
+
+	rc = vfs_rmdir(&nop_mnt_idmap, lower_dir, lower_dentry);
 	if (!rc) {
 		clear_nlink(d_inode(dentry));
 		fsstack_copy_attr_times(dir, lower_dir);
 		set_nlink(dir, lower_dir->i_nlink);
 	}
-	dput(lower_dentry);
-	inode_unlock(lower_dir);
+	end_removing(lower_dentry);
 	if (!rc)
 		d_drop(dentry);
 	return rc;
@@ -562,10 +571,12 @@ ecryptfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	struct dentry *lower_dentry;
 	struct inode *lower_dir;
 
-	rc = lock_parent(dentry, &lower_dentry, &lower_dir);
-	if (!rc)
-		rc = vfs_mknod(&nop_mnt_idmap, lower_dir,
-			       lower_dentry, mode, dev);
+	lower_dentry = ecryptfs_start_creating_dentry(dentry);
+	if (IS_ERR(lower_dentry))
+		return PTR_ERR(lower_dentry);
+	lower_dir = lower_dentry->d_parent->d_inode;
+
+	rc = vfs_mknod(&nop_mnt_idmap, lower_dir, lower_dentry, mode, dev);
 	if (rc || d_really_is_negative(lower_dentry))
 		goto out;
 	rc = ecryptfs_interpose(lower_dentry, dentry, dir->i_sb);
@@ -574,7 +585,7 @@ ecryptfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	fsstack_copy_attr_times(dir, lower_dir);
 	fsstack_copy_inode_size(dir, lower_dir);
 out:
-	inode_unlock(lower_dir);
+	end_removing(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return rc;
@@ -590,7 +601,6 @@ ecryptfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	struct dentry *lower_new_dentry;
 	struct dentry *lower_old_dir_dentry;
 	struct dentry *lower_new_dir_dentry;
-	struct dentry *trap;
 	struct inode *target_inode;
 	struct renamedata rd = {};
 
@@ -605,31 +615,13 @@ ecryptfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 	target_inode = d_inode(new_dentry);
 
-	trap = lock_rename(lower_old_dir_dentry, lower_new_dir_dentry);
-	if (IS_ERR(trap))
-		return PTR_ERR(trap);
-	dget(lower_new_dentry);
-	rc = -EINVAL;
-	if (lower_old_dentry->d_parent != lower_old_dir_dentry)
-		goto out_lock;
-	if (lower_new_dentry->d_parent != lower_new_dir_dentry)
-		goto out_lock;
-	if (d_unhashed(lower_old_dentry) || d_unhashed(lower_new_dentry))
-		goto out_lock;
-	/* source should not be ancestor of target */
-	if (trap == lower_old_dentry)
-		goto out_lock;
-	/* target should not be ancestor of source */
-	if (trap == lower_new_dentry) {
-		rc = -ENOTEMPTY;
-		goto out_lock;
-	}
+	rd.mnt_idmap  = &nop_mnt_idmap;
+	rd.old_parent = lower_old_dir_dentry;
+	rd.new_parent = lower_new_dir_dentry;
+	rc = start_renaming_two_dentries(&rd, lower_old_dentry, lower_new_dentry);
+	if (rc)
+		return rc;
 
-	rd.mnt_idmap		= &nop_mnt_idmap;
-	rd.old_parent		= lower_old_dir_dentry;
-	rd.old_dentry		= lower_old_dentry;
-	rd.new_parent		= lower_new_dir_dentry;
-	rd.new_dentry		= lower_new_dentry;
 	rc = vfs_rename(&rd);
 	if (rc)
 		goto out_lock;
@@ -640,8 +632,7 @@ ecryptfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	if (new_dir != old_dir)
 		fsstack_copy_attr_all(old_dir, d_inode(lower_old_dir_dentry));
 out_lock:
-	dput(lower_new_dentry);
-	unlock_rename(lower_old_dir_dentry, lower_new_dir_dentry);
+	end_renaming(&rd);
 	return rc;
 }
 
diff --git a/fs/namei.c b/fs/namei.c
index 4a4b8b96c192..8b7807cd1343 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3397,6 +3397,39 @@ struct dentry *start_removing_noperm(struct dentry *parent,
 }
 EXPORT_SYMBOL(start_removing_noperm);
 
+/**
+ * start_creating_dentry - prepare to create a given dentry
+ * @parent: directory from which dentry should be removed
+ * @child:  the dentry to be removed
+ *
+ * A lock is taken to protect the dentry again other dirops and
+ * the validity of the dentry is checked: correct parent and still hashed.
+ *
+ * If the dentry is valid and negative a reference is taken and
+ * returned.  If not an error is returned.
+ *
+ * end_creating() should be called when creation is complete, or aborted.
+ *
+ * Returns: the valid dentry, or an error.
+ */
+struct dentry *start_creating_dentry(struct dentry *parent,
+				     struct dentry *child)
+{
+	inode_lock_nested(parent->d_inode, I_MUTEX_PARENT);
+	if (unlikely(IS_DEADDIR(parent->d_inode) ||
+		     child->d_parent != parent ||
+		     d_unhashed(child))) {
+		inode_unlock(parent->d_inode);
+		return ERR_PTR(-EINVAL);
+	}
+	if (d_is_positive(child)) {
+		inode_unlock(parent->d_inode);
+		return ERR_PTR(-EEXIST);
+	}
+	return dget(child);
+}
+EXPORT_SYMBOL(start_creating_dentry);
+
 /**
  * start_removing_dentry - prepare to remove a given dentry
  * @parent: directory from which dentry should be removed
diff --git a/include/linux/namei.h b/include/linux/namei.h
index a99ac8b7e24a..208aed1d6728 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -100,6 +100,8 @@ struct dentry *start_removing_killable(struct mnt_idmap *idmap,
 				       struct qstr *name);
 struct dentry *start_creating_noperm(struct dentry *parent, struct qstr *name);
 struct dentry *start_removing_noperm(struct dentry *parent, struct qstr *name);
+struct dentry *start_creating_dentry(struct dentry *parent,
+				     struct dentry *child);
 struct dentry *start_removing_dentry(struct dentry *parent,
 				     struct dentry *child);
 
-- 
2.50.0.107.gf914562f5916.dirty


