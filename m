Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5A92E6DB
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004AX-Ay; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRrzP-0003dB-1A
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:29:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXCx6KmBz4f3kKp
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 8E06F1A0568
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:57 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S9;
 Thu, 11 Jul 2024 19:13:57 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:55 +0800
Message-Id: <20240711111908.3817636-8-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S9
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww4fXr4kCw4kAFyrJr48tFb_yoWxuw4DpF
 s8K3W3Gr48GFy7XF4vyFnxCa1a93yrGr17J39xCwnFyFy7Jw4Igay3GFyjkFWfCw18Wr18
 KanFqrW3Cr4UAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Subject: [apparmor] [PATCH bpf-next v4 07/20] lsm: Refactor return value of
	LSM hook setprocattr
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
hook setprocattr to 0 or a negative error code.

Before:
- Hook setprocattr returns the number of bytes written on success
  or a negative error code on failure.

After:
- Hook setprocattr returns 0 on success or a negative error code
  on failure. An output parameter @wbytes is introduced to hold
  the number of bytes written on success.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 fs/proc/base.c                |  5 +++--
 include/linux/lsm_hook_defs.h |  3 ++-
 include/linux/security.h      |  5 +++--
 security/apparmor/lsm.c       | 10 +++++++---
 security/security.c           |  8 +++++---
 security/selinux/hooks.c      | 11 ++++++++---
 security/smack/smack_lsm.c    | 14 ++++++++++----
 7 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 72a1acd03675..9e1cf6cc674d 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2740,6 +2740,7 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
 {
 	struct inode * inode = file_inode(file);
 	struct task_struct *task;
+	size_t wbytes;
 	void *page;
 	int rv;
 
@@ -2785,12 +2786,12 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
 
 	rv = security_setprocattr(PROC_I(inode)->op.lsmid,
 				  file->f_path.dentry->d_name.name, page,
-				  count);
+				  count, &wbytes);
 	mutex_unlock(&current->signal->cred_guard_mutex);
 out_free:
 	kfree(page);
 out:
-	return rv;
+	return rv < 0 ? rv : wbytes;
 }
 
 static const struct file_operations proc_pid_attr_operations = {
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index dbc16f14f42f..2628514bb19c 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -287,7 +287,8 @@ LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
 	 struct lsm_ctx *ctx, u32 size, u32 flags)
 LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
 	 char **value)
-LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
+LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size,
+	 size_t *wbytes)
 LSM_HOOK(int, 0, ismaclabel, const char *name)
 LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
 	 u32 *seclen)
diff --git a/include/linux/security.h b/include/linux/security.h
index 96a63e132abf..1f1a9696e65d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -496,7 +496,8 @@ int security_setselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
 			 u32 size, u32 flags);
 int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
 			 char **value);
-int security_setprocattr(int lsmid, const char *name, void *value, size_t size);
+int security_setprocattr(int lsmid, const char *name, void *value, size_t size,
+			 size_t *wbytes);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
@@ -1440,7 +1441,7 @@ static inline int security_getprocattr(struct task_struct *p, int lsmid,
 }
 
 static inline int security_setprocattr(int lsmid, char *name, void *value,
-				       size_t size)
+				       size_t size, size_t *wbytes)
 {
 	return -EINVAL;
 }
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 72dd09993f28..6c8b1f8c5781 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -939,13 +939,17 @@ static int apparmor_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
 }
 
 static int apparmor_setprocattr(const char *name, void *value,
-				size_t size)
+				size_t size, size_t *wbytes)
 {
+	int rc = -EINVAL;
 	int attr = lsm_name_to_attr(name);
 
 	if (attr)
-		return do_setattr(attr, value, size);
-	return -EINVAL;
+		rc = do_setattr(attr, value, size);
+	if (rc < 0)
+		return rc;
+	*wbytes = rc;
+	return 0;
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index 095e78efcb32..9685096dbf16 100644
--- a/security/security.c
+++ b/security/security.c
@@ -4141,20 +4141,22 @@ int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
  * @name: attribute name
  * @value: attribute value
  * @size: attribute value size
+ * @wbytes: bytes written on success
  *
  * Write (set) the current task's attribute @name to @value, size @size if
  * allowed.
  *
- * Return: Returns bytes written on success, a negative value otherwise.
+ * Return: Returns 0 on success, a negative error code otherwise.
  */
-int security_setprocattr(int lsmid, const char *name, void *value, size_t size)
+int security_setprocattr(int lsmid, const char *name, void *value, size_t size,
+			 size_t *wbytes)
 {
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
 		if (lsmid != 0 && lsmid != hp->lsmid->id)
 			continue;
-		return hp->hook.setprocattr(name, value, size);
+		return hp->hook.setprocattr(name, value, size, wbytes);
 	}
 	return LSM_RET_DEFAULT(setprocattr);
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0d35bb93baca..7a73f3710025 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6589,13 +6589,18 @@ static int selinux_getprocattr(struct task_struct *p,
 	return -EINVAL;
 }
 
-static int selinux_setprocattr(const char *name, void *value, size_t size)
+static int selinux_setprocattr(const char *name, void *value, size_t size,
+			       size_t *wbytes)
 {
+	int rc = -EINVAL;
 	int attr = lsm_name_to_attr(name);
 
 	if (attr)
-		return selinux_lsm_setattr(attr, value, size);
-	return -EINVAL;
+		rc = selinux_lsm_setattr(attr, value, size);
+	if (rc < 0)
+		return rc;
+	*wbytes = rc;
+	return 0;
 }
 
 static int selinux_ismaclabel(const char *name)
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 63d9c5f456c1..4265f2639106 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3797,19 +3797,25 @@ static int smack_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
  * @name: the name of the attribute in /proc/.../attr
  * @value: the value to set
  * @size: the size of the value
+ * @wbytes: the length of the smack label written
  *
  * Sets the Smack value of the task. Only setting self
  * is permitted and only with privilege
  *
- * Returns the length of the smack label or an error code
+ * Returns 0 on success or a negative error code
  */
-static int smack_setprocattr(const char *name, void *value, size_t size)
+static int smack_setprocattr(const char *name, void *value, size_t size,
+			     size_t *wbytes)
 {
+	int rc = -EINVAL;
 	int attr = lsm_name_to_attr(name);
 
 	if (attr != LSM_ATTR_UNDEF)
-		return do_setattr(attr, value, size);
-	return -EINVAL;
+		rc = do_setattr(attr, value, size);
+	if (rc < 0)
+		return rc;
+	*wbytes = rc;
+	return 0;
 }
 
 /**
-- 
2.30.2


