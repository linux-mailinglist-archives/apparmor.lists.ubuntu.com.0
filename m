Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62992E6E4
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004An-GM; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs0H-0003kJ-QN
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:30:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WKXCr5mqyz4f3jdn
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 7B6741A01B9
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:56 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S3;
 Thu, 11 Jul 2024 19:13:56 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:49 +0800
Message-Id: <20240711111908.3817636-2-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S3
X-Coremail-Antispam: 1UD129KBjvJXoWxur48GF1DAw17Kr47ur1rWFg_yoW7Gr4kpF
 s5Ka13KrWvkFyxZrs7GanxC3W3t34fWF4UGrWUu34Fk3ZFvr17KF4UAw1Y9r1UtrW8tasF
 qFW29rs3Ca1qq37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UAHUDUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.56;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout12.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 01/20] lsm: Refactor return value of
	LSM hook vm_enough_memory
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
hook vm_enough_memory to 0 or a negative error code.

Before:
- Hook vm_enough_memory returns 1 if permission is granted, 0 if not.
- LSM_RET_DEFAULT(vm_enough_memory_mm) is 1.

After:
- Hook vm_enough_memory reutrns 0 if permission is granted, negative
  error code if not.
- LSM_RET_DEFAULT(vm_enough_memory_mm) is 0.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      |  2 +-
 security/commoncap.c          | 11 +++--------
 security/security.c           | 11 +++++------
 security/selinux/hooks.c      | 15 ++++-----------
 5 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 44488b1ab9a9..e6e6f8473955 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -48,7 +48,7 @@ LSM_HOOK(int, 0, quota_on, struct dentry *dentry)
 LSM_HOOK(int, 0, syslog, int type)
 LSM_HOOK(int, 0, settime, const struct timespec64 *ts,
 	 const struct timezone *tz)
-LSM_HOOK(int, 1, vm_enough_memory, struct mm_struct *mm, long pages)
+LSM_HOOK(int, 0, vm_enough_memory, struct mm_struct *mm, long pages)
 LSM_HOOK(int, 0, bprm_creds_for_exec, struct linux_binprm *bprm)
 LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, const struct file *file)
 LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
diff --git a/include/linux/security.h b/include/linux/security.h
index de3af33e6ff5..454f96307cb9 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -634,7 +634,7 @@ static inline int security_settime64(const struct timespec64 *ts,
 
 static inline int security_vm_enough_memory_mm(struct mm_struct *mm, long pages)
 {
-	return __vm_enough_memory(mm, pages, cap_vm_enough_memory(mm, pages));
+	return __vm_enough_memory(mm, pages, !cap_vm_enough_memory(mm, pages));
 }
 
 static inline int security_bprm_creds_for_exec(struct linux_binprm *bprm)
diff --git a/security/commoncap.c b/security/commoncap.c
index 162d96b3a676..cefad323a0b1 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -1396,17 +1396,12 @@ int cap_task_prctl(int option, unsigned long arg2, unsigned long arg3,
  * Determine whether the allocation of a new virtual mapping by the current
  * task is permitted.
  *
- * Return: 1 if permission is granted, 0 if not.
+ * Return: 0 if permission granted, negative error code if not.
  */
 int cap_vm_enough_memory(struct mm_struct *mm, long pages)
 {
-	int cap_sys_admin = 0;
-
-	if (cap_capable(current_cred(), &init_user_ns,
-				CAP_SYS_ADMIN, CAP_OPT_NOAUDIT) == 0)
-		cap_sys_admin = 1;
-
-	return cap_sys_admin;
+	return cap_capable(current_cred(), &init_user_ns, CAP_SYS_ADMIN,
+			   CAP_OPT_NOAUDIT);
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index e5ca08789f74..3475f0cab3da 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1115,15 +1115,14 @@ int security_vm_enough_memory_mm(struct mm_struct *mm, long pages)
 	int rc;
 
 	/*
-	 * The module will respond with a positive value if
-	 * it thinks the __vm_enough_memory() call should be
-	 * made with the cap_sys_admin set. If all of the modules
-	 * agree that it should be set it will. If any module
-	 * thinks it should not be set it won't.
+	 * The module will respond with 0 if it thinks the __vm_enough_memory()
+	 * call should be made with the cap_sys_admin set. If all of the modules
+	 * agree that it should be set it will. If any module thinks it should
+	 * not be set it won't.
 	 */
 	hlist_for_each_entry(hp, &security_hook_heads.vm_enough_memory, list) {
 		rc = hp->hook.vm_enough_memory(mm, pages);
-		if (rc <= 0) {
+		if (rc < 0) {
 			cap_sys_admin = 0;
 			break;
 		}
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 7eed331e90f0..9cd5a8f1f6a3 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2202,23 +2202,16 @@ static int selinux_syslog(int type)
 }
 
 /*
- * Check that a process has enough memory to allocate a new virtual
- * mapping. 0 means there is enough memory for the allocation to
- * succeed and -ENOMEM implies there is not.
+ * Check permission for allocating a new virtual mapping. Returns
+ * 0 if permission is granted, negative error code if not.
  *
  * Do not audit the selinux permission check, as this is applied to all
  * processes that allocate mappings.
  */
 static int selinux_vm_enough_memory(struct mm_struct *mm, long pages)
 {
-	int rc, cap_sys_admin = 0;
-
-	rc = cred_has_capability(current_cred(), CAP_SYS_ADMIN,
-				 CAP_OPT_NOAUDIT, true);
-	if (rc == 0)
-		cap_sys_admin = 1;
-
-	return cap_sys_admin;
+	return cred_has_capability(current_cred(), CAP_SYS_ADMIN,
+				   CAP_OPT_NOAUDIT, true);
 }
 
 /* binprm security operations */
-- 
2.30.2


