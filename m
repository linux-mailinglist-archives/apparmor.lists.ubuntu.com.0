Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E392E6D4
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004AQ-84; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRrm4-0001qX-Bo
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:15:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WKXCt0YYVz4f3jrf
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id BF8581A06D7
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:57 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S10;
 Thu, 11 Jul 2024 19:13:57 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:56 +0800
Message-Id: <20240711111908.3817636-9-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S10
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWUWr4xGFyfGFyfZFy7ZFb_yoWxZw48pF
 s5K3ZrGrW8WFy7ZF4vyFnxCa1Sv3yrWr13J398Cw1IyFy2qw4xWa45GFyY9rWrCw1DuF1D
 tanFqr45Cr4DAF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Received-SPF: pass client-ip=45.249.212.56;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout12.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 08/20] lsm: Refactor return value of
	LSM hook getprocattr
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
hook getprocattr to 0 or a negative error code.

Before:
- Hook getprocattr returns length of value on success or a negative
  error code on failure.

After:
- Hook getprocattr returns 0 on success or a negative error code on
  failure. An output parameter @len is introduced to hold the
  length of value on success.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 fs/proc/base.c                |  5 ++++-
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      |  5 +++--
 security/apparmor/lsm.c       |  7 +++++--
 security/security.c           |  8 +++++---
 security/selinux/hooks.c      | 16 +++++++++-------
 security/smack/smack_lsm.c    | 11 ++++++-----
 7 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 9e1cf6cc674d..516a00f6ce36 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2721,13 +2721,16 @@ static ssize_t proc_pid_attr_read(struct file * file, char __user * buf,
 	char *p = NULL;
 	ssize_t length;
 	struct task_struct *task = get_proc_task(inode);
+	u32 n;
 
 	if (!task)
 		return -ESRCH;
 
 	length = security_getprocattr(task, PROC_I(inode)->op.lsmid,
 				      file->f_path.dentry->d_name.name,
-				      &p);
+				      &p, &n);
+	if (!length)
+		length = n;
 	put_task_struct(task);
 	if (length > 0)
 		length = simple_read_from_buffer(buf, count, ppos, p, length);
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 2628514bb19c..b0e3cf3fc33f 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -286,7 +286,7 @@ LSM_HOOK(int, -EOPNOTSUPP, getselfattr, unsigned int attr,
 LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
 	 struct lsm_ctx *ctx, u32 size, u32 flags)
 LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
-	 char **value)
+	 char **value, u32 *len)
 LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size,
 	 size_t *wbytes)
 LSM_HOOK(int, 0, ismaclabel, const char *name)
diff --git a/include/linux/security.h b/include/linux/security.h
index 1f1a9696e65d..616047030a89 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -495,7 +495,7 @@ int security_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 int security_setselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 			 u32 size, u32 flags);
 int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
-			 char **value);
+			 char **value, u32 *len);
 int security_setprocattr(int lsmid, const char *name, void *value, size_t size,
 			 size_t *wbytes);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
@@ -1435,7 +1435,8 @@ static inline int security_setselfattr(unsigned int attr,
 }
 
 static inline int security_getprocattr(struct task_struct *p, int lsmid,
-				       const char *name, char **value)
+				       const char *name, char **value,
+				       u32 *len)
 {
 	return -EINVAL;
 }
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 6c8b1f8c5781..0454f3f1af06 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -820,7 +820,7 @@ static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
 }
 
 static int apparmor_getprocattr(struct task_struct *task, const char *name,
-				char **value)
+				char **value, u32 *len)
 {
 	int error = -ENOENT;
 	/* released below */
@@ -843,7 +843,10 @@ static int apparmor_getprocattr(struct task_struct *task, const char *name,
 	aa_put_label(label);
 	put_cred(cred);
 
-	return error;
+	if (error < 0)
+		return error;
+	*len = error;
+	return 0;
 }
 
 static int do_setattr(u64 attr, void *value, size_t size)
diff --git a/security/security.c b/security/security.c
index 9685096dbf16..9dd2ae6cf763 100644
--- a/security/security.c
+++ b/security/security.c
@@ -4117,20 +4117,22 @@ int security_setselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
  * @lsmid: LSM identification
  * @name: attribute name
  * @value: attribute value
+ * @len: length of @value
  *
  * Read attribute @name for task @p and store it into @value if allowed.
  *
- * Return: Returns the length of @value on success, a negative value otherwise.
+ * Return: Returns 0 on success or a negative error code on failure.
+ *         @len is set to the length of @value on success.
  */
 int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
-			 char **value)
+			 char **value, u32 *len)
 {
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.getprocattr, list) {
 		if (lsmid != 0 && lsmid != hp->lsmid->id)
 			continue;
-		return hp->hook.getprocattr(p, name, value);
+		return hp->hook.getprocattr(p, name, value, len);
 	}
 	return LSM_RET_DEFAULT(getprocattr);
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 7a73f3710025..16cd336aab3d 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6574,19 +6574,21 @@ static int selinux_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
 	return rc;
 }
 
-static int selinux_getprocattr(struct task_struct *p,
-			       const char *name, char **value)
+static int selinux_getprocattr(struct task_struct *p, const char *name,
+			       char **value, u32 *len)
 {
 	unsigned int attr = lsm_name_to_attr(name);
-	int rc;
+	int rc = -EINVAL;
 
 	if (attr) {
 		rc = selinux_lsm_getattr(attr, p, value);
-		if (rc != -EOPNOTSUPP)
-			return rc;
+		if (rc == -EOPNOTSUPP)
+			rc = -EINVAL;
 	}
-
-	return -EINVAL;
+	if (rc < 0)
+		return rc;
+	*len = rc;
+	return 0;
 }
 
 static int selinux_setprocattr(const char *name, void *value, size_t size,
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 4265f2639106..8a352bd05565 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3681,16 +3681,17 @@ static int smack_getselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
  * @p: the object task
  * @name: the name of the attribute in /proc/.../attr
  * @value: where to put the result
+ * @len: where to put the length of the result
  *
  * Places a copy of the task Smack into value
  *
- * Returns the length of the smack label or an error code
+ * Returns 0 on success or a negative error code on failure.
  */
-static int smack_getprocattr(struct task_struct *p, const char *name, char **value)
+static int smack_getprocattr(struct task_struct *p, const char *name,
+			     char **value, u32 *len)
 {
 	struct smack_known *skp = smk_of_task_struct_obj(p);
 	char *cp;
-	int slen;
 
 	if (strcmp(name, "current") != 0)
 		return -EINVAL;
@@ -3699,9 +3700,9 @@ static int smack_getprocattr(struct task_struct *p, const char *name, char **val
 	if (cp == NULL)
 		return -ENOMEM;
 
-	slen = strlen(cp);
+	*len = strlen(cp);
 	*value = cp;
-	return slen;
+	return 0;
 }
 
 /**
-- 
2.30.2


