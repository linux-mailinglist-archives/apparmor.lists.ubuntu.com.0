Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C8AC1F738
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZK-0006dh-0I; Thu, 30 Oct 2025 10:07:46 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFtA-0005EA-En
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:47:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 7E78B130007D;
 Wed, 29 Oct 2025 19:47:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 29 Oct 2025 19:47:35 -0400
X-ME-Sender: <xms:lacCab8cvPtnHPYkLtGOXKAPz_uoddtScdLetYx-rONsF4hs6w5THQ>
 <xme:lacCaak5i0GJRWh574jRYUeafKWg8dffqGED1LOHxI3sr2LD1ugB_JbRgw_ZPQk_z
 r2l6hxSG3YQtJN5sLrv-BJ4cchN0DVlkOqUiS0mlUSbapwI1Ao>
X-ME-Received: <xmr:lacCaZ0CVZUid6V2jdLqoMnbWu-5vomiQeNcsfElNBvHK__hEJlaWhDuKjJaO-7S6YMOsWmcXgmSc8rEjeYOQUjG1-QDaEeUn-MYsx-3Jw2e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehtdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhhrggfgsedtkeertdertddtnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epveevkeffudeuvefhieeghffgudektdelkeejiedtjedugfeukedvkeffvdefvddunecu
 vehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
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
X-ME-Proxy: <xmx:lacCaZQABLbeok7-hyPTim7c_s1SgUh81gRAFqP9eQTsaJFNI3Vx1w>
 <xmx:lacCaeJplpX0m31yHxK25OxPBGEll73XaOABrobKjkqonxdIU7w9KQ>
 <xmx:lacCackj7HseNBpiBQXYDbeW_gZPviB0L_7B6YvvJAX6T1waYVMgyg>
 <xmx:lacCaXgJLQUyyObmrOOg2J8H64-B0kSCqbqaIjvjWiQYE0oYVyFTyQ>
 <xmx:lqcCaSRxISSOjdFne159wfxoKBGC0yeRGC2lQ3L98Ljem4ypFMQGuOo->
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:47:23 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:13 +1100
Message-ID: <20251029234353.1321957-14-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: [apparmor] [PATCH v4 13/14] VFS: change vfs_mkdir() to unlock on
	failure.
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

vfs_mkdir() already drops the reference to the dentry on failure but it
leaves the parent locked.
This complicates end_creating() which needs to unlock the parent even
though the dentry is no longer available.

If we change vfs_mkdir() to unlock on failure as well as releasing the
dentry, we can remove the "parent" arg from end_creating() and simplify
the rules for calling it.

Note that cachefiles_get_directory() can choose to substitute an error
instead of actually calling vfs_mkdir(), for fault injection.  In that
case it needs to call end_creating(), just as vfs_mkdir() now does on
error.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>

--
changes since v2:
 - extra {} in if() branch in cachefiles_get_directory() to
   match the new extra {} in the else branch.
 - filesystems/porting.rst updated.
---
 Documentation/filesystems/porting.rst | 13 +++++++++++++
 fs/btrfs/ioctl.c                      |  2 +-
 fs/cachefiles/namei.c                 | 16 ++++++++-------
 fs/ecryptfs/inode.c                   |  8 ++++----
 fs/namei.c                            |  4 ++--
 fs/nfsd/nfs3proc.c                    |  2 +-
 fs/nfsd/nfs4proc.c                    |  2 +-
 fs/nfsd/nfs4recover.c                 |  2 +-
 fs/nfsd/nfsproc.c                     |  2 +-
 fs/nfsd/vfs.c                         |  8 ++++----
 fs/overlayfs/copy_up.c                |  4 ++--
 fs/overlayfs/dir.c                    | 13 ++++++-------
 fs/overlayfs/super.c                  |  6 +++---
 fs/xfs/scrub/orphanage.c              |  2 +-
 include/linux/namei.h                 | 28 +++++++++------------------
 ipc/mqueue.c                          |  2 +-
 16 files changed, 59 insertions(+), 55 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 7233b04668fc..76ff738a00f3 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1309,3 +1309,16 @@ a different length, use
 	vfs_parse_fs_qstr(fc, key, &QSTR_LEN(value, len))
 
 instead.
+
+---
+
+**mandatory**
+
+vfs_mkdir() now returns a dentry - the one returned by ->mkdir().  If
+that dentry is different from the dentry passed in, including if it is
+an IS_ERR() dentry pointer, the original dentry is dput().
+
+When vfs_mkdir() returns an error, and so both dputs() the original
+dentry and doesn't provide a replacement, it also unlocks the parent.
+Consequently the return value from vfs_mkdir() can be passed to
+end_creating() and the parent will be unlocked precisely when necessary.
diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 4fbfdd8faf6a..90ef777eae25 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -935,7 +935,7 @@ static noinline int btrfs_mksubvol(struct dentry *parent,
 out_up_read:
 	up_read(&fs_info->subvol_sem);
 out_dput:
-	end_creating(dentry, parent);
+	end_creating(dentry);
 	return ret;
 }
 
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index b97a40917a32..c417ba4bcec3 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -128,10 +128,12 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		if (ret < 0)
 			goto mkdir_error;
 		ret = cachefiles_inject_write_error();
-		if (ret == 0)
+		if (ret == 0) {
 			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700);
-		else
+		} else {
+			end_creating(subdir);
 			subdir = ERR_PTR(ret);
+		}
 		if (IS_ERR(subdir)) {
 			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
 						   cachefiles_trace_mkdir_error);
@@ -140,7 +142,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		trace_cachefiles_mkdir(dir, subdir);
 
 		if (unlikely(d_unhashed(subdir) || d_is_negative(subdir))) {
-			end_creating(subdir, dir);
+			end_creating(subdir);
 			goto retry;
 		}
 		ASSERT(d_backing_inode(subdir));
@@ -154,7 +156,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	/* Tell rmdir() it's not allowed to delete the subdir */
 	inode_lock(d_inode(subdir));
 	dget(subdir);
-	end_creating(subdir, dir);
+	end_creating(subdir);
 
 	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
 		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
@@ -196,7 +198,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	return ERR_PTR(-EBUSY);
 
 mkdir_error:
-	end_creating(subdir, dir);
+	end_creating(subdir);
 	pr_err("mkdir %s failed with error %d\n", dirname, ret);
 	return ERR_PTR(ret);
 
@@ -705,7 +707,7 @@ bool cachefiles_commit_tmpfile(struct cachefiles_cache *cache,
 		if (ret < 0)
 			goto out_end;
 
-		end_creating(dentry, fan);
+		end_creating(dentry);
 
 		ret = cachefiles_inject_read_error();
 		if (ret == 0)
@@ -739,7 +741,7 @@ bool cachefiles_commit_tmpfile(struct cachefiles_cache *cache,
 	}
 
 out_end:
-	end_creating(dentry, fan);
+	end_creating(dentry);
 out:
 	_leave(" = %u", success);
 	return success;
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index b3702105d236..90d74ecc5028 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -211,7 +211,7 @@ ecryptfs_do_create(struct inode *directory_inode,
 	fsstack_copy_attr_times(directory_inode, lower_dir);
 	fsstack_copy_inode_size(directory_inode, lower_dir);
 out_lock:
-	end_creating(lower_dentry, NULL);
+	end_creating(lower_dentry);
 	return inode;
 }
 
@@ -456,7 +456,7 @@ static int ecryptfs_link(struct dentry *old_dentry, struct inode *dir,
 		  ecryptfs_inode_to_lower(d_inode(old_dentry))->i_nlink);
 	i_size_write(d_inode(new_dentry), file_size_save);
 out_lock:
-	end_creating(lower_new_dentry, NULL);
+	end_creating(lower_new_dentry);
 	return rc;
 }
 
@@ -500,7 +500,7 @@ static int ecryptfs_symlink(struct mnt_idmap *idmap,
 	fsstack_copy_attr_times(dir, lower_dir);
 	fsstack_copy_inode_size(dir, lower_dir);
 out_lock:
-	end_creating(lower_dentry, NULL);
+	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return rc;
@@ -534,7 +534,7 @@ static struct dentry *ecryptfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	fsstack_copy_inode_size(dir, lower_dir);
 	set_nlink(dir, lower_dir->i_nlink);
 out:
-	end_creating(lower_dentry, lower_dir_dentry);
+	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
 	return ERR_PTR(rc);
diff --git a/fs/namei.c b/fs/namei.c
index 8b7807cd1343..d284ebae41bf 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4832,7 +4832,7 @@ EXPORT_SYMBOL(start_creating_path);
  */
 void end_creating_path(const struct path *path, struct dentry *dentry)
 {
-	end_creating(dentry, path->dentry);
+	end_creating(dentry);
 	mnt_drop_write(path->mnt);
 	path_put(path);
 }
@@ -5034,7 +5034,7 @@ struct dentry *vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	return dentry;
 
 err:
-	dput(dentry);
+	end_creating(dentry);
 	return ERR_PTR(error);
 }
 EXPORT_SYMBOL(vfs_mkdir);
diff --git a/fs/nfsd/nfs3proc.c b/fs/nfsd/nfs3proc.c
index e2aac0def2cb..6b39e4aff959 100644
--- a/fs/nfsd/nfs3proc.c
+++ b/fs/nfsd/nfs3proc.c
@@ -364,7 +364,7 @@ nfsd3_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	status = nfsd_create_setattr(rqstp, fhp, resfhp, &attrs);
 
 out:
-	end_creating(child, parent);
+	end_creating(child);
 out_write:
 	fh_drop_write(fhp);
 	return status;
diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index b2c95e8e7c68..524cb07a477c 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -376,7 +376,7 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	if (attrs.na_aclerr)
 		open->op_bmval[0] &= ~FATTR4_WORD0_ACL;
 out:
-	end_creating(child, parent);
+	end_creating(child);
 	nfsd_attrs_free(&attrs);
 out_write:
 	fh_drop_write(fhp);
diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index 3eefaa2202e3..18c08395b273 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -215,7 +215,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
 	if (IS_ERR(dentry))
 		status = PTR_ERR(dentry);
 out_end:
-	end_creating(dentry, dir);
+	end_creating(dentry);
 out:
 	if (status == 0) {
 		if (nn->in_grace)
diff --git a/fs/nfsd/nfsproc.c b/fs/nfsd/nfsproc.c
index ee1b16e921fd..28f03a6a3cc3 100644
--- a/fs/nfsd/nfsproc.c
+++ b/fs/nfsd/nfsproc.c
@@ -421,7 +421,7 @@ nfsd_proc_create(struct svc_rqst *rqstp)
 	}
 
 out_unlock:
-	end_creating(dchild, dirfhp->fh_dentry);
+	end_creating(dchild);
 out_write:
 	fh_drop_write(dirfhp);
 done:
diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 62109885d4db..6e9a57863904 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1589,7 +1589,7 @@ nfsd_create_locked(struct svc_rqst *rqstp, struct svc_fh *fhp,
 out:
 	if (!err)
 		fh_fill_post_attrs(fhp);
-	end_creating(dchild, dentry);
+	end_creating(dchild);
 	return err;
 
 out_nfserr:
@@ -1646,7 +1646,7 @@ nfsd_create(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	return err;
 
 out_unlock:
-	end_creating(dchild, dentry);
+	end_creating(dchild);
 	return err;
 }
 
@@ -1747,7 +1747,7 @@ nfsd_symlink(struct svc_rqst *rqstp, struct svc_fh *fhp,
 		nfsd_create_setattr(rqstp, fhp, resfhp, attrs);
 	fh_fill_post_attrs(fhp);
 out_unlock:
-	end_creating(dnew, dentry);
+	end_creating(dnew);
 	if (!err)
 		err = nfserrno(commit_metadata(fhp));
 	if (!err)
@@ -1824,7 +1824,7 @@ nfsd_link(struct svc_rqst *rqstp, struct svc_fh *ffhp,
 	host_err = vfs_link(dold, &nop_mnt_idmap, dirp, dnew, NULL);
 	fh_fill_post_attrs(ffhp);
 out_unlock:
-	end_creating(dnew, ddir);
+	end_creating(dnew);
 	if (!host_err) {
 		host_err = commit_metadata(ffhp);
 		if (!host_err)
diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index 27014ada11c7..36949856ddea 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -624,7 +624,7 @@ static int ovl_link_up(struct ovl_copy_up_ctx *c)
 			ovl_dentry_set_upper_alias(c->dentry);
 			ovl_dentry_update_reval(c->dentry, upper);
 		}
-		end_creating(upper, upperdir);
+		end_creating(upper);
 	}
 	if (err)
 		goto out;
@@ -891,7 +891,7 @@ static int ovl_copy_up_tmpfile(struct ovl_copy_up_ctx *c)
 	err = PTR_ERR(upper);
 	if (!IS_ERR(upper)) {
 		err = ovl_do_link(ofs, temp, udir, upper);
-		end_creating(upper, c->destdir);
+		end_creating(upper);
 	}
 
 	if (err)
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index c297648c7487..10e732360ace 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -91,7 +91,7 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
 		err = ovl_do_whiteout(ofs, wdir, whiteout);
 		if (!err)
 			ofs->whiteout = dget(whiteout);
-		end_creating(whiteout, workdir);
+		end_creating(whiteout);
 		if (err)
 			return ERR_PTR(err);
 	}
@@ -103,7 +103,7 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
 		err = ovl_do_link(ofs, ofs->whiteout, wdir, link);
 		if (!err)
 			whiteout = dget(link);
-		end_creating(link, workdir);
+		end_creating(link);
 		if (!err)
 			return whiteout;;
 
@@ -254,7 +254,7 @@ struct dentry *ovl_create_temp(struct ovl_fs *ofs, struct dentry *workdir,
 	ret = ovl_create_real(ofs, workdir, ret, attr);
 	if (!IS_ERR(ret))
 		dget(ret);
-	end_creating(ret, workdir);
+	end_creating(ret);
 	return ret;
 }
 
@@ -362,12 +362,11 @@ static int ovl_create_upper(struct dentry *dentry, struct inode *inode,
 	if (IS_ERR(newdentry))
 		return PTR_ERR(newdentry);
 	newdentry = ovl_create_real(ofs, upperdir, newdentry, attr);
-	if (IS_ERR(newdentry)) {
-		end_creating(newdentry, upperdir);
+	if (IS_ERR(newdentry))
 		return PTR_ERR(newdentry);
-	}
+
 	dget(newdentry);
-	end_creating(newdentry, upperdir);
+	end_creating(newdentry);
 
 	if (ovl_type_merge(dentry->d_parent) && d_is_dir(newdentry) &&
 	    !ovl_allow_offline_changes(ofs)) {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index a721ef2b90e8..3acda985c8a3 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -320,7 +320,7 @@ static struct dentry *ovl_workdir_create(struct ovl_fs *ofs,
 
 		if (work->d_inode) {
 			dget(work);
-			end_creating(work, ofs->workbasedir);
+			end_creating(work);
 			if (persist)
 				return work;
 			err = -EEXIST;
@@ -338,7 +338,7 @@ static struct dentry *ovl_workdir_create(struct ovl_fs *ofs,
 		work = ovl_do_mkdir(ofs, dir, work, attr.ia_mode);
 		if (!IS_ERR(work))
 			dget(work);
-		end_creating(work, ofs->workbasedir);
+		end_creating(work);
 		err = PTR_ERR(work);
 		if (IS_ERR(work))
 			goto out_err;
@@ -632,7 +632,7 @@ static struct dentry *ovl_lookup_or_create(struct ovl_fs *ofs,
 						OVL_CATTR(mode));
 		if (!IS_ERR(child))
 			dget(child);
-		end_creating(child, parent);
+		end_creating(child);
 	}
 	dput(parent);
 
diff --git a/fs/xfs/scrub/orphanage.c b/fs/xfs/scrub/orphanage.c
index e732605924a1..b77c2b6b6d44 100644
--- a/fs/xfs/scrub/orphanage.c
+++ b/fs/xfs/scrub/orphanage.c
@@ -199,7 +199,7 @@ xrep_orphanage_create(
 	sc->orphanage_ilock_flags = 0;
 
 out_dput_orphanage:
-	end_creating(orphanage_dentry, root_dentry);
+	end_creating(orphanage_dentry);
 out_dput_root:
 	dput(root_dentry);
 out:
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 208aed1d6728..0ef73d739a31 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -105,34 +105,24 @@ struct dentry *start_creating_dentry(struct dentry *parent,
 struct dentry *start_removing_dentry(struct dentry *parent,
 				     struct dentry *child);
 
-/**
- * end_creating - finish action started with start_creating
- * @child:  dentry returned by start_creating() or vfs_mkdir()
- * @parent: dentry given to start_creating(),
- *
- * Unlock and release the child.
+/* end_creating - finish action started with start_creating
+ * @child: dentry returned by start_creating() or vfs_mkdir()
  *
- * Unlike end_dirop() this can only be called if start_creating() succeeded.
- * It handles @child being and error as vfs_mkdir() might have converted the
- * dentry to an error - in that case the parent still needs to be unlocked.
+ * Unlock and release the child. This can be called after
+ * start_creating() whether that function succeeded or not,
+ * but it is not needed on failure.
  *
  * If vfs_mkdir() was called then the value returned from that function
  * should be given for @child rather than the original dentry, as vfs_mkdir()
- * may have provided a new dentry.  Even if vfs_mkdir() returns an error
- * it must be given to end_creating().
+ * may have provided a new dentry.
+ *
  *
  * If vfs_mkdir() was not called, then @child will be a valid dentry and
  * @parent will be ignored.
  */
-static inline void end_creating(struct dentry *child, struct dentry *parent)
+static inline void end_creating(struct dentry *child)
 {
-	if (IS_ERR(child))
-		/* The parent is still locked despite the error from
-		 * vfs_mkdir() - must unlock it.
-		 */
-		inode_unlock(parent->d_inode);
-	else
-		end_dirop(child);
+	end_dirop(child);
 }
 
 /**
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 6d7610310003..83d9466710d6 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -932,7 +932,7 @@ static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 		put_unused_fd(fd);
 		fd = error;
 	}
-	end_creating(path.dentry, root);
+	end_creating(path.dentry);
 	if (!ro)
 		mnt_drop_write(mnt);
 out_putname:
-- 
2.50.0.107.gf914562f5916.dirty


