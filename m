Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC4692E6D2
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4A-00049y-R8; Thu, 11 Jul 2024 11:34:26 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRrkO-0001pd-LV
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:14:01 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXCx50Mqz4f3kK2
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 61FA51A0188
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:57 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S8;
 Thu, 11 Jul 2024 19:13:57 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:54 +0800
Message-Id: <20240711111908.3817636-7-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S8
X-Coremail-Antispam: 1UD129KBjvJXoWxKFWxXFW5tr4fKrWxJFWUurg_yoWfJw4UpF
 n5K3Zrtr40yF97WFWkAF47Ca1a9rySgry7J39xGw4SyFy5tr1xWFy3Ja4jkrWUGw1DCF4F
 yanF9r45CrsrC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
 xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
 z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU13l1DUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.51;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout11.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 06/20] lsm: Refactor return value of
	LSM hook getselfattr
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
hook getselfattr to 0 or a negative error code.

Before:
- Hook getselfattr returns number of attributes found on success
  or a negative error code on failure.

After:
- Hook getselfattr returns 0 on success or a negative error code
  on failure. An output parameter @nattr is introduced to hold
  the number of attributes found on success.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      |  5 +++--
 security/apparmor/lsm.c       |  5 +++--
 security/lsm_syscalls.c       |  6 +++++-
 security/security.c           | 18 +++++++++++-------
 security/selinux/hooks.c      | 13 +++++++++----
 security/smack/smack_lsm.c    | 13 +++++++++----
 7 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 1b7761ae2777..dbc16f14f42f 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -282,7 +282,7 @@ LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
 LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
 	 struct inode *inode)
 LSM_HOOK(int, -EOPNOTSUPP, getselfattr, unsigned int attr,
-	 struct lsm_ctx __user *ctx, u32 *size, u32 flags)
+	 struct lsm_ctx __user *ctx, u32 *size, u32 flags, u32 *nattr)
 LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
 	 struct lsm_ctx *ctx, u32 size, u32 flags)
 LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
diff --git a/include/linux/security.h b/include/linux/security.h
index 0ed53e232c4d..96a63e132abf 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -491,7 +491,7 @@ int security_sem_semop(struct kern_ipc_perm *sma, struct sembuf *sops,
 			unsigned nsops, int alter);
 void security_d_instantiate(struct dentry *dentry, struct inode *inode);
 int security_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
-			 u32 __user *size, u32 flags);
+			 u32 __user *size, u32 flags, u32 *nattr);
 int security_setselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 			 u32 size, u32 flags);
 int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
@@ -1420,7 +1420,8 @@ static inline void security_d_instantiate(struct dentry *dentry,
 
 static inline int security_getselfattr(unsigned int attr,
 				       struct lsm_ctx __user *ctx,
-				       size_t __user *size, u32 flags)
+				       size_t __user *size, u32 flags,
+				       u32 *nattr)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 6239777090c4..72dd09993f28 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -779,7 +779,7 @@ static int apparmor_sb_pivotroot(const struct path *old_path,
 }
 
 static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
-				u32 *size, u32 flags)
+				u32 *size, u32 flags, u32 *nattr)
 {
 	int error = -ENOENT;
 	struct aa_task_ctx *ctx = task_ctx(current);
@@ -815,7 +815,8 @@ static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
 
 	if (error < 0)
 		return error;
-	return 1;
+	*nattr = 1;
+	return 0;
 }
 
 static int apparmor_getprocattr(struct task_struct *task, const char *name,
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
index 8440948a690c..845866f94b03 100644
--- a/security/lsm_syscalls.c
+++ b/security/lsm_syscalls.c
@@ -77,7 +77,11 @@ SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
 SYSCALL_DEFINE4(lsm_get_self_attr, unsigned int, attr, struct lsm_ctx __user *,
 		ctx, u32 __user *, size, u32, flags)
 {
-	return security_getselfattr(attr, ctx, size, flags);
+	int rc;
+	u32 nattr;
+
+	rc = security_getselfattr(attr, ctx, size, flags, &nattr);
+	return rc < 0 ? rc : nattr;
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index 12215ca286af..095e78efcb32 100644
--- a/security/security.c
+++ b/security/security.c
@@ -3969,21 +3969,23 @@ EXPORT_SYMBOL(security_d_instantiate);
  * @flags: special handling options. LSM_FLAG_SINGLE indicates that only
  * attributes associated with the LSM identified in the passed @ctx be
  * reported.
+ * @nattr: number of attributes found on success
  *
  * A NULL value for @uctx can be used to get both the number of attributes
  * and the size of the data.
  *
- * Returns the number of attributes found on success, negative value
- * on error. @size is reset to the total size of the data.
- * If @size is insufficient to contain the data -E2BIG is returned.
+ * Returns 0 on success, a negative error code on failure. @size is reset
+ * to the total size of the data. If @size is insufficient to contain the
+ * data -E2BIG is returned.
  */
 int security_getselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
-			 u32 __user *size, u32 flags)
+			 u32 __user *size, u32 flags, u32 *nattr)
 {
 	struct security_hook_list *hp;
 	struct lsm_ctx lctx = { .id = LSM_ID_UNDEF, };
 	u8 __user *base = (u8 __user *)uctx;
 	u32 entrysize;
+	u32 entrycount;
 	u32 total = 0;
 	u32 left;
 	bool toobig = false;
@@ -4024,7 +4026,8 @@ int security_getselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
 		entrysize = left;
 		if (base)
 			uctx = (struct lsm_ctx __user *)(base + total);
-		rc = hp->hook.getselfattr(attr, uctx, &entrysize, flags);
+		rc = hp->hook.getselfattr(attr, uctx, &entrysize, flags,
+					  &entrycount);
 		if (rc == -EOPNOTSUPP) {
 			rc = 0;
 			continue;
@@ -4039,7 +4042,7 @@ int security_getselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
 			left -= entrysize;
 
 		total += entrysize;
-		count += rc;
+		count += entrycount;
 		if (single)
 			break;
 	}
@@ -4047,9 +4050,10 @@ int security_getselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
 		return -EFAULT;
 	if (toobig)
 		return -E2BIG;
+	*nattr = count;
 	if (count == 0)
 		return LSM_RET_DEFAULT(getselfattr);
-	return count;
+	return 0;
 }
 
 /*
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index f9a6637dfd78..0d35bb93baca 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6536,15 +6536,17 @@ static int selinux_lsm_setattr(u64 attr, void *value, size_t size)
  * @ctx: buffer to receive the result
  * @size: buffer size (input), buffer size used (output)
  * @flags: unused
+ * @nattr: number of attributes found on success.
  *
  * Fill the passed user space @ctx with the details of the requested
  * attribute.
  *
- * Returns the number of attributes on success, an error code otherwise.
- * There will only ever be one attribute.
+ * Returns 0 on success or a negative error code on failure.
+ * There will only ever be one attribute, so @nattr is set to
+ * 1 on success.
  */
 static int selinux_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
-			       u32 *size, u32 flags)
+			       u32 *size, u32 flags, u32 *nattr)
 {
 	int rc;
 	char *val = NULL;
@@ -6555,7 +6557,10 @@ static int selinux_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 		return val_len;
 	rc = lsm_fill_user_ctx(ctx, size, val, val_len, LSM_ID_SELINUX, 0);
 	kfree(val);
-	return (!rc ? 1 : rc);
+	if (rc < 0)
+		return rc;
+	*nattr = 1;
+	return 0;
 }
 
 static int selinux_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index ae8f1c2d0ca6..63d9c5f456c1 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3648,15 +3648,17 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
  * @ctx: buffer to receive the result
  * @size: available size in, actual size out
  * @flags: unused
+ * @nattr: number of attributes found on success
  *
  * Fill the passed user space @ctx with the details of the requested
  * attribute.
  *
- * Returns the number of attributes on success, an error code otherwise.
- * There will only ever be one attribute.
+ * Returns 0 on success or a ngetaive error code on failure.
+ * There will only ever be one attribute, so @nattr is set to
+ * 1 on success.
  */
 static int smack_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
-			     u32 *size, u32 flags)
+			     u32 *size, u32 flags, u32 *nattr)
 {
 	int rc;
 	struct smack_known *skp;
@@ -3668,7 +3670,10 @@ static int smack_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 	rc = lsm_fill_user_ctx(ctx, size,
 			       skp->smk_known, strlen(skp->smk_known) + 1,
 			       LSM_ID_SMACK, 0);
-	return (!rc ? 1 : rc);
+	if (rc < 0)
+		return rc;
+	*nattr = 1;
+	return 0;
 }
 
 /**
-- 
2.30.2


