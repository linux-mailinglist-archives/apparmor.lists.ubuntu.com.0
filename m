Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC3D92EA1A
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 16:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRuMx-0002Kj-9x; Thu, 11 Jul 2024 14:01:59 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs4E-0004CT-F2
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:34:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXCw73y1z4f3k6M
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id A90241A01D2
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:56 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S4;
 Thu, 11 Jul 2024 19:13:56 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:50 +0800
Message-Id: <20240711111908.3817636-3-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S4
X-Coremail-Antispam: 1UD129KBjvJXoW3AFWfGw4xWFW5Ary7Gr4xXrb_yoW3XFy7pF
 4UKF13Gws5XFy7Wrn7tFsru34SvFWfWrW7JFZ09w12yFnrJr1xKr4ak3yUCryrCr1j9rnI
 v3ZFkw4rCr15JrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1sa9DUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.51;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout11.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 14:01:58 +0000
Subject: [apparmor] [PATCH bpf-next v4 02/20] lsm: Refactor return value of
	LSM hook inode_need_killpriv
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Xu Kuohai <xukuohai@huawei.com>

To be consistent with most LSM hooks, convert the return value of
hook inode_need_killpriv to 0 or a negative error code.

Before:
- Both hook inode_need_killpriv and func security_inode_need_killpriv
  return > 0 if security_inode_killpriv is required, 0 if not, and < 0
  to abort the operation.

After:
- Both hook inode_need_killpriv and func security_inode_need_killpriv
  return 0 on success and a negative error code on failure.
  On success, hook inode_need_killpriv sets output param @need to true
  if security_inode_killpriv is required, and false if not. When @need
  is true, func security_inode_need_killpriv sets ATTR_KILL_PRIV flag
  in @attr; when false, it clears the flag.
  On failure, @need and @attr remains unchanged.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 fs/attr.c                     |  5 ++---
 fs/inode.c                    |  4 +---
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      | 20 ++++++++++++++++----
 security/commoncap.c          | 12 ++++++++----
 security/security.c           | 29 ++++++++++++++++++++++++-----
 6 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 960a310581eb..aaadc721c982 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -427,11 +427,10 @@ int notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
 		attr->ia_mtime = timestamp_truncate(attr->ia_mtime, inode);
 
 	if (ia_valid & ATTR_KILL_PRIV) {
-		error = security_inode_need_killpriv(dentry);
+		error = security_inode_need_killpriv(dentry, &ia_valid);
 		if (error < 0)
 			return error;
-		if (error == 0)
-			ia_valid = attr->ia_valid &= ~ATTR_KILL_PRIV;
+		attr->ia_valid = ia_valid;
 	}
 
 	/*
diff --git a/fs/inode.c b/fs/inode.c
index 3a41f83a4ba5..cd335dc3a3bc 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2012,11 +2012,9 @@ int dentry_needs_remove_privs(struct mnt_idmap *idmap,
 		return 0;
 
 	mask = setattr_should_drop_suidgid(idmap, inode);
-	ret = security_inode_need_killpriv(dentry);
+	ret = security_inode_need_killpriv(dentry, &mask);
 	if (ret < 0)
 		return ret;
-	if (ret)
-		mask |= ATTR_KILL_PRIV;
 	return mask;
 }
 
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index e6e6f8473955..964849de424b 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -165,7 +165,7 @@ LSM_HOOK(int, 0, inode_remove_acl, struct mnt_idmap *idmap,
 	 struct dentry *dentry, const char *acl_name)
 LSM_HOOK(void, LSM_RET_VOID, inode_post_remove_acl, struct mnt_idmap *idmap,
 	 struct dentry *dentry, const char *acl_name)
-LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
+LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry, bool *need)
 LSM_HOOK(int, 0, inode_killpriv, struct mnt_idmap *idmap,
 	 struct dentry *dentry)
 LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct mnt_idmap *idmap,
diff --git a/include/linux/security.h b/include/linux/security.h
index 454f96307cb9..1614ef5b2dd2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -161,7 +161,7 @@ int cap_inode_setxattr(struct dentry *dentry, const char *name,
 		       const void *value, size_t size, int flags);
 int cap_inode_removexattr(struct mnt_idmap *idmap,
 			  struct dentry *dentry, const char *name);
-int cap_inode_need_killpriv(struct dentry *dentry);
+int cap_inode_need_killpriv(struct dentry *dentry, bool *need);
 int cap_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
 int cap_inode_getsecurity(struct mnt_idmap *idmap,
 			  struct inode *inode, const char *name, void **buffer,
@@ -389,7 +389,7 @@ int security_inode_listxattr(struct dentry *dentry);
 int security_inode_removexattr(struct mnt_idmap *idmap,
 			       struct dentry *dentry, const char *name);
 void security_inode_post_removexattr(struct dentry *dentry, const char *name);
-int security_inode_need_killpriv(struct dentry *dentry);
+int security_inode_need_killpriv(struct dentry *dentry, int *attr);
 int security_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
 int security_inode_getsecurity(struct mnt_idmap *idmap,
 			       struct inode *inode, const char *name,
@@ -971,9 +971,21 @@ static inline void security_inode_post_removexattr(struct dentry *dentry,
 						   const char *name)
 { }
 
-static inline int security_inode_need_killpriv(struct dentry *dentry)
+static inline int security_inode_need_killpriv(struct dentry *dentry, int *attr)
 {
-	return cap_inode_need_killpriv(dentry);
+	int rc;
+	bool need = false;
+
+	rc = cap_inode_need_killpriv(dentry, &need);
+	if (rc < 0)
+		return rc;
+
+	if (need)
+		*attr |= ATTR_KILL_PRIV;
+	else
+		*attr &= ~ATTR_KILL_PRIV;
+
+	return 0;
 }
 
 static inline int security_inode_killpriv(struct mnt_idmap *idmap,
diff --git a/security/commoncap.c b/security/commoncap.c
index cefad323a0b1..17d6188d22cf 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -286,21 +286,25 @@ int cap_capset(struct cred *new,
 /**
  * cap_inode_need_killpriv - Determine if inode change affects privileges
  * @dentry: The inode/dentry in being changed with change marked ATTR_KILL_PRIV
+ * @need: If inode_killpriv() is needed
  *
  * Determine if an inode having a change applied that's marked ATTR_KILL_PRIV
  * affects the security markings on that inode, and if it is, should
  * inode_killpriv() be invoked or the change rejected.
  *
- * Return: 1 if security.capability has a value, meaning inode_killpriv()
- * is required, 0 otherwise, meaning inode_killpriv() is not required.
+ * Return: Always returns 0. If security.capability has a value, meaning
+ * inode_killpriv() is required, @need is set to true.
  */
-int cap_inode_need_killpriv(struct dentry *dentry)
+int cap_inode_need_killpriv(struct dentry *dentry, bool *need)
 {
 	struct inode *inode = d_backing_inode(dentry);
 	int error;
 
 	error = __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0);
-	return error > 0;
+	if (error > 0)
+		*need = true;
+
+	return 0;
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index 3475f0cab3da..a4abcd86eb36 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2490,17 +2490,36 @@ void security_inode_post_removexattr(struct dentry *dentry, const char *name)
 /**
  * security_inode_need_killpriv() - Check if security_inode_killpriv() required
  * @dentry: associated dentry
+ * @attr: attribute flags
  *
  * Called when an inode has been changed to determine if
  * security_inode_killpriv() should be called.
  *
- * Return: Return <0 on error to abort the inode change operation, return 0 if
- *         security_inode_killpriv() does not need to be called, return >0 if
- *         security_inode_killpriv() does need to be called.
+ * Return: Return 0 on success, negative error code on failure.
+ *         On success, set ATTR_KILL_PRIV flag in @attr when @need is true,
+ *         clears it when false.
  */
-int security_inode_need_killpriv(struct dentry *dentry)
+int security_inode_need_killpriv(struct dentry *dentry, int *attr)
 {
-	return call_int_hook(inode_need_killpriv, dentry);
+	int rc;
+	bool need = false;
+	struct security_hook_list *hp;
+
+	hlist_for_each_entry(hp, &security_hook_heads.inode_need_killpriv,
+			     list) {
+		rc = hp->hook.inode_need_killpriv(dentry, &need);
+		if (rc < 0)
+			return rc;
+		if (need)
+			break;
+	}
+
+	if (need)
+		*attr |= ATTR_KILL_PRIV;
+	else
+		*attr &= ~ATTR_KILL_PRIV;
+
+	return 0;
 }
 
 /**
-- 
2.30.2


