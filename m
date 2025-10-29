Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB83C1F733
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZN-0006eb-H5; Thu, 30 Oct 2025 10:07:49 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1vEFqt-0004lc-Uz
 for apparmor@lists.ubuntu.com; Wed, 29 Oct 2025 23:45:16 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.stl.internal (Postfix) with ESMTP id 0C71B1300228;
 Wed, 29 Oct 2025 19:45:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 29 Oct 2025 19:45:15 -0400
X-ME-Sender: <xms:CacCaSN00cLSQBoqQgSdFpnLrX0Sw4ZRRQuq6DRXTtVoXBfK7cfrLA>
 <xme:CacCaT1HVXpEkYuUwX9Mj3gi2c3hC2k-FETR7PZ7u9IOTsFedjK1OCKVEDkpvb163
 RQtRxYw-MYcpP9Vvzk2IR609dmWwAnJEUXHZy9hOEEC0ydgPw>
X-ME-Received: <xmr:CacCaaHC_yd1MaN3VZH2FOEkq8YL27j67LCKens0HX0VZVUKgGZfdBGXka0y_j_YkOXdviq2xM34wyTHKqVcC2p2m9d3MFidD2DuKCyKLbWw>
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
X-ME-Proxy: <xmx:CacCaUha6wx_DtWI4PUF1bXbYiP0fj-T5EyvKnFfFlaqa8Vj_MT62A>
 <xmx:CacCaYZTnzrj5fIHYQBwZe8671Y23pQJGWlh0Gf4tJSECPFQ6hFoPQ>
 <xmx:CacCaZ320F0pkCKkY9pYfZXjCqUVdgSWiOYRVaataOzuQTyF0_P7WA>
 <xmx:CacCabxFdfyGdM9M_ueb3W1gZxRDekqXOdEGs-7tZqPzJoXunflhgw>
 <xmx:CacCaV0mWGjMcDY2QkUwdM0BBI2wiL7qs6rVwucAVZgPUJooIAdE7M0z>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 19:45:03 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>
Date: Thu, 30 Oct 2025 10:31:03 +1100
Message-ID: <20251029234353.1321957-4-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20251029234353.1321957-1-neilb@ownmail.net>
References: <20251029234353.1321957-1-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.139; envelope-from=neilb@ownmail.net;
 helo=flow-b4-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:43 +0000
Subject: [apparmor] [PATCH v4 03/14] VFS: tidy up do_unlinkat()
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

The simplification of locking in the previous patch opens up some room
for tidying up do_unlinkat()

- change all "exit" labels to describe what will happen at the label.
- always goto an exit label on an error - unwrap the "if (!IS_ERR())" branch.
- Move the "slashes" handing inline, but mark it as unlikely()
- simplify use of the "inode" variable - we no longer need to test for NULL.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/namei.c | 55 ++++++++++++++++++++++++++----------------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 3618efd4bcaa..9effaad115d9 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4755,65 +4755,62 @@ int do_unlinkat(int dfd, struct filename *name)
 	struct path path;
 	struct qstr last;
 	int type;
-	struct inode *inode = NULL;
+	struct inode *inode;
 	struct inode *delegated_inode = NULL;
 	unsigned int lookup_flags = 0;
 retry:
 	error = filename_parentat(dfd, name, lookup_flags, &path, &last, &type);
 	if (error)
-		goto exit1;
+		goto exit_putname;
 
 	error = -EISDIR;
 	if (type != LAST_NORM)
-		goto exit2;
+		goto exit_path_put;
 
 	error = mnt_want_write(path.mnt);
 	if (error)
-		goto exit2;
+		goto exit_path_put;
 retry_deleg:
 	dentry = start_dirop(path.dentry, &last, lookup_flags);
 	error = PTR_ERR(dentry);
-	if (!IS_ERR(dentry)) {
+	if (IS_ERR(dentry))
+		goto exit_drop_write;
 
-		/* Why not before? Because we want correct error value */
-		if (last.name[last.len])
-			goto slashes;
-		inode = dentry->d_inode;
-		ihold(inode);
-		error = security_path_unlink(&path, dentry);
-		if (error)
-			goto exit3;
-		error = vfs_unlink(mnt_idmap(path.mnt), path.dentry->d_inode,
-				   dentry, &delegated_inode);
-exit3:
+	/* Why not before? Because we want correct error value */
+	if (unlikely(last.name[last.len])) {
+		if (d_is_dir(dentry))
+			error = -EISDIR;
+		else
+			error = -ENOTDIR;
 		end_dirop(dentry);
+		goto exit_drop_write;
 	}
-	if (inode)
-		iput(inode);	/* truncate the inode here */
-	inode = NULL;
+	inode = dentry->d_inode;
+	ihold(inode);
+	error = security_path_unlink(&path, dentry);
+	if (error)
+		goto exit_end_dirop;
+	error = vfs_unlink(mnt_idmap(path.mnt), path.dentry->d_inode,
+			   dentry, &delegated_inode);
+exit_end_dirop:
+	end_dirop(dentry);
+	iput(inode);	/* truncate the inode here */
 	if (delegated_inode) {
 		error = break_deleg_wait(&delegated_inode);
 		if (!error)
 			goto retry_deleg;
 	}
+exit_drop_write:
 	mnt_drop_write(path.mnt);
-exit2:
+exit_path_put:
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
-		inode = NULL;
 		goto retry;
 	}
-exit1:
+exit_putname:
 	putname(name);
 	return error;
-
-slashes:
-	if (d_is_dir(dentry))
-		error = -EISDIR;
-	else
-		error = -ENOTDIR;
-	goto exit3;
 }
 
 SYSCALL_DEFINE3(unlinkat, int, dfd, const char __user *, pathname, int, flag)
-- 
2.50.0.107.gf914562f5916.dirty


