Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE3YGXArwml5ZwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 07:13:04 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D8302A92
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 07:13:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4v0V-0008Vy-Q8; Tue, 24 Mar 2026 06:12:51 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1w4v0U-0008Vc-KV
 for apparmor@lists.ubuntu.com; Tue, 24 Mar 2026 06:12:51 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 62O6C6MJ020335;
 Tue, 24 Mar 2026 15:12:06 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.2] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 62O6C6wv020332
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 24 Mar 2026 15:12:06 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6609e11e-90aa-4021-974e-e9937688dd49@I-love.SAKURA.ne.jp>
Date: Tue, 24 Mar 2026 15:12:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Song Liu <songliubraving@meta.com>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
 <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
 <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
 <CAAeYb7k+TWArOKyOomkLZ8fwqUPjha9iORpJaj4nMyN=o4ZRQg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAAeYb7k+TWArOKyOomkLZ8fwqUPjha9iORpJaj4nMyN=o4ZRQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav305.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: "herton@canonical.com" <herton@canonical.com>,
 Christian Brauner <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:songliubraving@meta.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,I-love.SAKURA.ne.jp:mid]
X-Rspamd-Queue-Id: 744D8302A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/03/24 4:31, Song Liu wrote:
>> Then, how can LSM modules know that how the requested filesystem resolves
>> the dev_name argument, without embedding filesystem specific resolution
>> logic into individual LSM module?
> 
> IIUC, if an LSM cares about the dev_name of a new mount, it will have to look
> into each individual filesystem. We can add a LSM hook for the filesystems to
> call. But this will require changes to individual filesystem code. OTOH,
> dev_name can probably bridge the gap as we change filesystems.
> 
> Would this work?

I guess something like untested diff shown below would work.

 block/bdev.c               |   26 ++++++++++++++------------
 fs/fs_context.c            |    4 ++++
 fs/namespace.c             |   10 ++++++----
 fs/super.c                 |    2 +-
 include/linux/blkdev.h     |   12 +++++++++++-
 include/linux/fs_context.h |    1 +
 security/tomoyo/mount.c    |   26 ++------------------------
 security/tomoyo/tomoyo.c   |    2 +-
 8 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index ed022f8c48c7..35707a6144fa 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1199,44 +1199,46 @@ void bdev_fput(struct file *bdev_file)
 EXPORT_SYMBOL(bdev_fput);
 
 /**
- * lookup_bdev() - Look up a struct block_device by name.
+ * lookup_bdev_path() - Look up a struct block_device by name.
  * @pathname: Name of the block device in the filesystem.
  * @dev: Pointer to the block device's dev_t, if found.
+ * @path: Pointer to the block device's path, if found.
  *
- * Lookup the block device's dev_t at @pathname in the current
- * namespace if possible and return it in @dev.
+ * Lookup the block device's dev_t and path at @pathname in the current
+ * namespace if possible and return these in @dev and @path
  *
  * Context: May sleep.
  * Return: 0 if succeeded, negative errno otherwise.
+ * Caller must call path_put(@path) if this function returned 0.
  */
-int lookup_bdev(const char *pathname, dev_t *dev)
+int lookup_bdev_path(const char *pathname, dev_t *dev, struct path *path)
 {
 	struct inode *inode;
-	struct path path;
 	int error;
 
 	if (!pathname || !*pathname)
 		return -EINVAL;
 
-	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
+	error = kern_path(pathname, LOOKUP_FOLLOW, path);
 	if (error)
 		return error;
 
-	inode = d_backing_inode(path.dentry);
+	inode = d_backing_inode(path->dentry);
 	error = -ENOTBLK;
 	if (!S_ISBLK(inode->i_mode))
 		goto out_path_put;
 	error = -EACCES;
-	if (!may_open_dev(&path))
+	if (!may_open_dev(path))
 		goto out_path_put;
-
 	*dev = inode->i_rdev;
-	error = 0;
+	return 0;
 out_path_put:
-	path_put(&path);
+	path_put(path);
+	path->dentry = NULL;
+	path->mnt = NULL;
 	return error;
 }
-EXPORT_SYMBOL(lookup_bdev);
+EXPORT_SYMBOL(lookup_bdev_path);
 
 /**
  * bdev_mark_dead - mark a block device as dead
diff --git a/fs/fs_context.c b/fs/fs_context.c
index a37b0a093505..e5294f48eb32 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -377,6 +377,8 @@ struct fs_context *vfs_dup_fs_context(struct fs_context *src_fc)
 	fc->fs_private	= NULL;
 	fc->s_fs_info	= NULL;
 	fc->source	= NULL;
+	fc->source_path.dentry = NULL;
+	fc->source_path.mnt = NULL;
 	fc->security	= NULL;
 	get_filesystem(fc->fs_type);
 	get_net(fc->net_ns);
@@ -504,6 +506,8 @@ void put_fs_context(struct fs_context *fc)
 	put_cred(fc->cred);
 	put_fc_log(fc);
 	put_filesystem(fc->fs_type);
+	if (fc->source_path.dentry)
+		path_put(&fc->source_path);
 	kfree(fc->source);
 	kfree(fc);
 }
diff --git a/fs/namespace.c b/fs/namespace.c
index ba5baccdde67..621b8205a0af 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3777,7 +3777,7 @@ static bool mount_too_revealing(const struct super_block *sb, int *new_mnt_flags
  * be added to the namespace tree.
  */
 static int do_new_mount_fc(struct fs_context *fc, const struct path *mountpoint,
-			   unsigned int mnt_flags)
+			   unsigned int mnt_flags, void *data, unsigned long flags)
 {
 	struct super_block *sb;
 	struct vfsmount *mnt __free(mntput) = fc_mount(fc);
@@ -3786,6 +3786,10 @@ static int do_new_mount_fc(struct fs_context *fc, const struct path *mountpoint,
 	if (IS_ERR(mnt))
 		return PTR_ERR(mnt);
 
+	error = security_mount_new(fc, mountpoint, mnt_flags, flags, data);
+	if (error)
+		return error;
+
 	sb = fc->root->d_sb;
 	error = security_sb_kern_mount(sb);
 	if (unlikely(error))
@@ -3857,9 +3861,7 @@ static int do_new_mount(const struct path *path, const char *fstype,
 		err = -EPERM;
 
 	if (!err)
-		err = security_mount_new(fc, path, mnt_flags, flags, data);
-	if (!err)
-		err = do_new_mount_fc(fc, path, mnt_flags);
+		err = do_new_mount_fc(fc, path, mnt_flags, data, flags);
 
 	put_fs_context(fc);
 	return err;
diff --git a/fs/super.c b/fs/super.c
index 378e81efe643..588f207f26ae 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1670,7 +1670,7 @@ int get_tree_bdev_flags(struct fs_context *fc,
 	if (!fc->source)
 		return invalf(fc, "No source specified");
 
-	error = lookup_bdev(fc->source, &dev);
+	error = lookup_bdev_path(fc->source, &dev, &fc->source_path);
 	if (error) {
 		if (!(flags & GET_TREE_BDEV_QUIET_LOOKUP))
 			errorf(fc, "%s: Can't lookup blockdev", fc->source);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d463b9b5a0a5..c38d538f2a07 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1723,7 +1723,17 @@ static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
 int bdev_validate_blocksize(struct block_device *bdev, int block_size);
 int set_blocksize(struct file *file, int size);
 
-int lookup_bdev(const char *pathname, dev_t *dev);
+int lookup_bdev_path(const char *pathname, dev_t *dev, struct path *path);
+static inline int lookup_bdev(const char *pathname, dev_t *dev)
+{
+	struct path path = {};
+	int ret = lookup_bdev_path(pathname, dev, &path);
+
+	if (!ret)
+		path_put(&path);
+	return ret;
+}
+
 
 void blkdev_show(struct seq_file *seqf, off_t offset);
 
diff --git a/include/linux/fs_context.h b/include/linux/fs_context.h
index 0d6c8a6d7be2..0dfa6b6fc256 100644
--- a/include/linux/fs_context.h
+++ b/include/linux/fs_context.h
@@ -99,6 +99,7 @@ struct fs_context {
 	const struct cred	*cred;		/* The mounter's credentials */
 	struct p_log		log;		/* Logging buffer */
 	const char		*source;	/* The source name (eg. dev path) */
+	struct path		source_path;    /* Fields are NULL unless resolved from the source name. */
 	void			*security;	/* LSM options */
 	void			*s_fs_info;	/* Proposed s_fs_info */
 	unsigned int		sb_flags;	/* Proposed superblock flags (SB_*) */
diff --git a/security/tomoyo/mount.c b/security/tomoyo/mount.c
index 82ffe7d02814..3a384b698557 100644
--- a/security/tomoyo/mount.c
+++ b/security/tomoyo/mount.c
@@ -84,7 +84,6 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 	__must_hold_shared(&tomoyo_ss)
 {
 	struct tomoyo_obj_info obj = { };
-	struct file_system_type *fstype = NULL;
 	const char *requested_type = NULL;
 	const char *requested_dir_name = NULL;
 	const char *requested_dev_name = NULL;
@@ -124,32 +123,16 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
 	} else if (type == tomoyo_mounts[TOMOYO_MOUNT_BIND] ||
 		   type == tomoyo_mounts[TOMOYO_MOUNT_MOVE]) {
 		need_dev = -1; /* dev_name is a directory */
-	} else {
-		fstype = get_fs_type(type);
-		if (!fstype) {
-			error = -ENODEV;
-			goto out;
-		}
-		if (fstype->fs_flags & FS_REQUIRES_DEV)
-			/* dev_name is a block device file. */
-			need_dev = 1;
+	} else if (dev_path) {
+		need_dev = 1; /* dev_name is a block device file. */
 	}
 	if (need_dev) {
 		if (dev_path) {
 			/* Use pre-resolved path to avoid TOCTOU issues. */
 			obj.path1 = *dev_path;
-			path_get(&obj.path1);
 		} else if (!dev_name) {
 			error = -ENOENT;
 			goto out;
-		} else {
-			struct path path;
-
-			if (kern_path(dev_name, LOOKUP_FOLLOW, &path)) {
-				error = -ENOENT;
-				goto out;
-			}
-			obj.path1 = path;
 		}
 		requested_dev_name = tomoyo_realpath_from_path(&obj.path1);
 		if (!requested_dev_name) {
@@ -181,12 +164,7 @@ static int tomoyo_mount_acl(struct tomoyo_request_info *r,
  out:
 	kfree(requested_dev_name);
 	kfree(requested_dir_name);
-	if (fstype)
-		put_filesystem(fstype);
 	kfree(requested_type);
-	/* Drop refcount obtained by kern_path() or path_get(). */
-	if (obj.path1.dentry)
-		path_put(&obj.path1);
 	return error;
 }
 
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index ac84e1f03d5e..6235e527cc20 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -413,7 +413,7 @@ static int tomoyo_mount_new(struct fs_context *fc, const struct path *mp,
 {
 	/* Use original MS_* flags for policy matching */
 	return tomoyo_mount_permission(fc->source, mp, fc->fs_type->name,
-				       flags, NULL);
+				       flags, &fc->source_path);
 }
 
 static int tomoyo_mount_remount(struct fs_context *fc, const struct path *mp,

