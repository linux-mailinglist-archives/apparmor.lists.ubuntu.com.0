Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4892E6D9
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4D-0004CY-An; Thu, 11 Jul 2024 11:34:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRrkO-0001pe-WB
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:14:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXCs0CkRz4f3m6r
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id E84701A0189
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:13:57 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgCHjPVxvo9mulQgBw--.25300S11;
 Thu, 11 Jul 2024 19:13:57 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:18:57 +0800
Message-Id: <20240711111908.3817636-10-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHjPVxvo9mulQgBw--.25300S11
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1UtF1UuF47Ww45XFy8Grg_yoW3WrW8pF
 45KF1xtrW8GFy2vrn7Aa13Kaya9ayFgry7G39xu343tF1vqryUWr1jkF1Ykry5ArWUJr10
 yw47Za13CF1qyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Subject: [apparmor] [PATCH bpf-next v4 09/20] lsm: Refactor return value of
	LSM hook key_getsecurity
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
hook key_getsecurity to 0 or a negative error code.

Before:
- Hook key_getsecurity returns length of value on success or a
  negative error code on failure.

After:
- Hook key_getsecurity returns 0 on success or a negative error
  code on failure. An output parameter @len is introduced to hold
  the length of value on success.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 include/linux/lsm_hook_defs.h |  3 ++-
 include/linux/security.h      |  6 ++++--
 security/keys/keyctl.c        | 11 ++++++++---
 security/security.c           | 26 +++++++++++++++++++++-----
 security/selinux/hooks.c      | 11 +++++------
 security/smack/smack_lsm.c    | 21 +++++++++++----------
 6 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index b0e3cf3fc33f..54fec360947c 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -407,7 +407,8 @@ LSM_HOOK(int, 0, key_alloc, struct key *key, const struct cred *cred,
 LSM_HOOK(void, LSM_RET_VOID, key_free, struct key *key)
 LSM_HOOK(int, 0, key_permission, key_ref_t key_ref, const struct cred *cred,
 	 enum key_need_perm need_perm)
-LSM_HOOK(int, 0, key_getsecurity, struct key *key, char **buffer)
+LSM_HOOK(int, 0, key_getsecurity, struct key *key, char **buffer,
+	 size_t *len)
 LSM_HOOK(void, LSM_RET_VOID, key_post_create_or_update, struct key *keyring,
 	 struct key *key, const void *payload, size_t payload_len,
 	 unsigned long flags, bool create)
diff --git a/include/linux/security.h b/include/linux/security.h
index 616047030a89..4e64e51a1a86 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -2020,7 +2020,7 @@ int security_key_alloc(struct key *key, const struct cred *cred, unsigned long f
 void security_key_free(struct key *key);
 int security_key_permission(key_ref_t key_ref, const struct cred *cred,
 			    enum key_need_perm need_perm);
-int security_key_getsecurity(struct key *key, char **_buffer);
+int security_key_getsecurity(struct key *key, char **_buffer, size_t *_len);
 void security_key_post_create_or_update(struct key *keyring, struct key *key,
 					const void *payload, size_t payload_len,
 					unsigned long flags, bool create);
@@ -2045,9 +2045,11 @@ static inline int security_key_permission(key_ref_t key_ref,
 	return 0;
 }
 
-static inline int security_key_getsecurity(struct key *key, char **_buffer)
+static inline int security_key_getsecurity(struct key *key, char **_buffer,
+					   size_t *_len)
 {
 	*_buffer = NULL;
+	*_len = 0;
 	return 0;
 }
 
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 4bc3e9398ee3..e9f857620f28 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1565,6 +1565,7 @@ long keyctl_get_security(key_serial_t keyid,
 	struct key *key, *instkey;
 	key_ref_t key_ref;
 	char *context;
+	size_t len;
 	long ret;
 
 	key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, KEY_NEED_VIEW);
@@ -1586,15 +1587,18 @@ long keyctl_get_security(key_serial_t keyid,
 	}
 
 	key = key_ref_to_ptr(key_ref);
-	ret = security_key_getsecurity(key, &context);
-	if (ret == 0) {
+	ret = security_key_getsecurity(key, &context, &len);
+	if (ret < 0)
+		goto error;
+	if (len == 0) {
 		/* if no information was returned, give userspace an empty
 		 * string */
 		ret = 1;
 		if (buffer && buflen > 0 &&
 		    copy_to_user(buffer, "", 1) != 0)
 			ret = -EFAULT;
-	} else if (ret > 0) {
+	} else {
+		ret = len;
 		/* return as much data as there's room for */
 		if (buffer && buflen > 0) {
 			if (buflen > ret)
@@ -1607,6 +1611,7 @@ long keyctl_get_security(key_serial_t keyid,
 		kfree(context);
 	}
 
+error:
 	key_ref_put(key_ref);
 	return ret;
 }
diff --git a/security/security.c b/security/security.c
index 9dd2ae6cf763..2c161101074d 100644
--- a/security/security.c
+++ b/security/security.c
@@ -5338,19 +5338,35 @@ int security_key_permission(key_ref_t key_ref, const struct cred *cred,
  * security_key_getsecurity() - Get the key's security label
  * @key: key
  * @buffer: security label buffer
+ * @len: the length of @buffer (including terminating NULL) on success
  *
  * Get a textual representation of the security context attached to a key for
  * the purposes of honouring KEYCTL_GETSECURITY.  This function allocates the
  * storage for the NUL-terminated string and the caller should free it.
  *
- * Return: Returns the length of @buffer (including terminating NUL) or -ve if
- *         an error occurs.  May also return 0 (and a NULL buffer pointer) if
- *         there is no security label assigned to the key.
+ * Return: Returns 0 on success or -ve if an error occurs. May also return 0
+ *         (and a NULL buffer pointer) if there is no security label assigned
+ *         to the key.
  */
-int security_key_getsecurity(struct key *key, char **buffer)
+int security_key_getsecurity(struct key *key, char **buffer, size_t *len)
 {
+	int rc;
+	size_t n = 0;
+	struct security_hook_list *hp;
+
 	*buffer = NULL;
-	return call_int_hook(key_getsecurity, key, buffer);
+
+	hlist_for_each_entry(hp, &security_hook_heads.key_getsecurity, list) {
+		rc = hp->hook.key_getsecurity(key, buffer, &n);
+		if (rc < 0)
+			return rc;
+		if (n)
+			break;
+	}
+
+	*len = n;
+
+	return 0;
 }
 
 /**
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 16cd336aab3d..747ec602dec0 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6737,18 +6737,17 @@ static int selinux_key_permission(key_ref_t key_ref,
 	return avc_has_perm(sid, ksec->sid, SECCLASS_KEY, perm, NULL);
 }
 
-static int selinux_key_getsecurity(struct key *key, char **_buffer)
+static int selinux_key_getsecurity(struct key *key, char **_buffer,
+				   size_t *_len)
 {
 	struct key_security_struct *ksec = key->security;
 	char *context = NULL;
-	unsigned len;
+	u32 context_len;
 	int rc;
 
-	rc = security_sid_to_context(ksec->sid,
-				     &context, &len);
-	if (!rc)
-		rc = len;
+	rc = security_sid_to_context(ksec->sid, &context, &context_len);
 	*_buffer = context;
+	*_len = context_len;
 	return rc;
 }
 
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 8a352bd05565..9a121ad53b16 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4585,30 +4585,31 @@ static int smack_key_permission(key_ref_t key_ref,
 /*
  * smack_key_getsecurity - Smack label tagging the key
  * @key points to the key to be queried
- * @_buffer points to a pointer that should be set to point to the
- * resulting string (if no label or an error occurs).
- * Return the length of the string (including terminating NUL) or -ve if
- * an error.
- * May also return 0 (and a NULL buffer pointer) if there is no label.
+ * @_buffer points to a pointer that should be set to point to the resulting
+ *          string (if no label or an error occurs).
+ * @_len  the length of the @_buffer (including terminating NUL)
+ *
+ * Return 0 on success or -ve if an error.
+ * If there is no label, @_buffer will be set to NULL and @_len will be set to
+ * 0.
  */
-static int smack_key_getsecurity(struct key *key, char **_buffer)
+static int smack_key_getsecurity(struct key *key, char **_buffer, size_t *_len)
 {
 	struct smack_known *skp = key->security;
-	size_t length;
 	char *copy;
 
 	if (key->security == NULL) {
 		*_buffer = NULL;
+		*_len = 0;
 		return 0;
 	}
 
 	copy = kstrdup(skp->smk_known, GFP_KERNEL);
 	if (copy == NULL)
 		return -ENOMEM;
-	length = strlen(copy) + 1;
-
+	*_len = strlen(copy) + 1;
 	*_buffer = copy;
-	return length;
+	return 0;
 }
 
 
-- 
2.30.2


