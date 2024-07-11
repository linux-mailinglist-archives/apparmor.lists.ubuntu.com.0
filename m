Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F892E6DD
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4A-0004A5-V4; Thu, 11 Jul 2024 11:34:26 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRrkO-0001pb-LR
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:14:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXCr2DvQz4f3m78
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 362AE1A058E
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:57 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S7;
 Thu, 11 Jul 2024 19:13:56 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:53 +0800
Message-Id: <20240711111908.3817636-6-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S7
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1kXF4DJFWkXFWrJF1fJFb_yoWruw4fpa
 1Dtan2qr1rJFy7ZFykJF47ua1F93yfGFWUCa9xuw12yFZ3Xrn3Wryayr12gr45Wry8JF4k
 tanFvrs8C3WYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Subject: [apparmor] [PATCH bpf-next v4 05/20] lsm: Refactor return value of
	LSM hook inode_copy_up_xattr
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
hook inode_copy_up_xattr to 0 or a negative error code.

Before:
- Hook inode_copy_up_xattr returns 0 when accepting xattr, 1 when
  discarding xattr, -EOPNOTSUPP if it does not know xattr, or any
  other negative error code otherwise.

After:
- Hook inode_copy_up_xattr returns 0 when accepting xattr, *-ECANCELED*
  when discarding xattr, -EOPNOTSUPP if it does not know xattr, or
  any other negative error code otherwise.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 fs/overlayfs/copy_up.c            |  6 +++---
 security/integrity/evm/evm_main.c |  2 +-
 security/security.c               | 12 ++++++------
 security/selinux/hooks.c          |  4 ++--
 security/smack/smack_lsm.c        |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index a5ef2005a2cc..337a5be99ac9 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -115,12 +115,12 @@ int ovl_copy_xattr(struct super_block *sb, const struct path *oldpath, struct de
 			continue;
 
 		error = security_inode_copy_up_xattr(old, name);
-		if (error < 0 && error != -EOPNOTSUPP)
-			break;
-		if (error == 1) {
+		if (error == -ECANCELED) {
 			error = 0;
 			continue; /* Discard */
 		}
+		if (error < 0 && error != -EOPNOTSUPP)
+			break;
 
 		if (is_posix_acl_xattr(name)) {
 			error = ovl_copy_acl(OVL_FS(sb), oldpath, new, name);
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 62fe66dd53ce..6924ed508ebd 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -1000,7 +1000,7 @@ static int evm_inode_copy_up_xattr(struct dentry *src, const char *name)
 	case EVM_XATTR_HMAC:
 	case EVM_IMA_XATTR_DIGSIG:
 	default:
-		rc = 1; /* discard */
+		rc = -ECANCELED; /* discard */
 	}
 
 	kfree(xattr_data);
diff --git a/security/security.c b/security/security.c
index 26eea8f4cd74..12215ca286af 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2675,18 +2675,18 @@ EXPORT_SYMBOL(security_inode_copy_up);
  * lower layer to the union/overlay layer.   The caller is responsible for
  * reading and writing the xattrs, this hook is merely a filter.
  *
- * Return: Returns 0 to accept the xattr, 1 to discard the xattr, -EOPNOTSUPP
- *         if the security module does not know about attribute, or a negative
- *         error code to abort the copy up.
+ * Return: Returns 0 to accept the xattr, -ECANCELED to discard the xattr,
+ *         -EOPNOTSUPP if the security module does not know about attribute,
+ *         or a negative error code to abort the copy up.
  */
 int security_inode_copy_up_xattr(struct dentry *src, const char *name)
 {
 	int rc;
 
 	/*
-	 * The implementation can return 0 (accept the xattr), 1 (discard the
-	 * xattr), -EOPNOTSUPP if it does not know anything about the xattr or
-	 * any other error code in case of an error.
+	 * The implementation can return 0 (accept the xattr), -ECANCELED
+	 * (discard the xattr), -EOPNOTSUPP if it does not know anything
+	 *  about the xattr or any other error code in case of an error.
 	 */
 	rc = call_int_hook(inode_copy_up_xattr, src, name);
 	if (rc != LSM_RET_DEFAULT(inode_copy_up_xattr))
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 5dedd3917d57..f9a6637dfd78 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3528,8 +3528,8 @@ static int selinux_inode_copy_up_xattr(struct dentry *dentry, const char *name)
 	 * xattrs up.  Instead, filter out SELinux-related xattrs following
 	 * policy load.
 	 */
-	if (selinux_initialized() && strcmp(name, XATTR_NAME_SELINUX) == 0)
-		return 1; /* Discard */
+	if (selinux_initialized() && !strcmp(name, XATTR_NAME_SELINUX))
+		return -ECANCELED; /* Discard */
 	/*
 	 * Any other attribute apart from SELINUX is not claimed, supported
 	 * by selinux.
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 6f73906bf7ea..ae8f1c2d0ca6 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4893,10 +4893,10 @@ static int smack_inode_copy_up(struct dentry *dentry, struct cred **new)
 static int smack_inode_copy_up_xattr(struct dentry *src, const char *name)
 {
 	/*
-	 * Return 1 if this is the smack access Smack attribute.
+	 * Return -ECANCELED if this is the smack access Smack attribute.
 	 */
-	if (strcmp(name, XATTR_NAME_SMACK) == 0)
-		return 1;
+	if (!strcmp(name, XATTR_NAME_SMACK))
+		return -ECANCELED;
 
 	return -EOPNOTSUPP;
 }
-- 
2.30.2


