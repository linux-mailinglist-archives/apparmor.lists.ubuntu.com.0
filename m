Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B7A0B0B7
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX6-0000Lw-Or; Mon, 13 Jan 2025 08:10:48 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <tanyaagarwal25699@gmail.com>)
 id 1tWsQw-0002eJ-9I
 for apparmor@lists.ubuntu.com; Sun, 12 Jan 2025 07:30:54 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-215770613dbso40307145ad.2
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2025 23:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736667052; x=1737271852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7+KZIabYjHMCcMYLzm434ffxpK30mZmGo2A00HT3KY=;
 b=RmLi72eF6zaM5rfHhQBckXX+1CwBpOrhD8m9sMXiHxaCyXraEWMIhyF5OlYGM6x7VP
 khRCVfSoFyQqBZK3K9SEq48rCCH7BCCWoXb+r8Rp9jkP+kFGEbwKRncsNEEP72U7/3mM
 iM5JKlcbdxvv1RFaYcYiWTQBPd5k8Jw3kDkS1vv/CTorrdJTGlv8mATnXuvVMJPL5ZCA
 pACRprArxS6avdUA61gB/G6EPlY8fMKnfTDI2il6viTTsVQqDOvaCo0UNTPUhzpm2GB1
 hYWCpKCP/vFnwf99OzoEkYtXGF5w2gcRPHw+4MWUKvfVUh8ViypB7ZD6v4zo/zR0lQL/
 yVAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzRcAO2BzlZJMBdjTM/GLJqQh9R44Bd8KaZVql+mWuELcQcWPI7mxAmuFYGsY21QDWPEN4iBOIHA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxZMlmjviFr+XfbuFUygSUlFfZRnzUYUeSeRz9G8VVDZjo6J/EO
 aEgKYGVem2PxbxZrcuFrzIeSu85cZDEmCR4bMLC1Syvetm9jBeKX
X-Gm-Gg: ASbGncthDlWIOWjqoVnCFPqe2VsLOLHmaw+msE6VMq7N/s334HPRU/JA8wwEpi7TD42
 LQUN4ndUz1OJEf9kLAMP9+4GW+QElBxDXNqCrS727FyPcjP4zLNcMjfAJNeFauUW2ZtjllKboaX
 s9MI2TXtOzclxg43OcFt2jQaMbNP4b3FlDJaDVVa42LNbU2yZ711rGtrav8kVhTqe3uZrn7o8Pv
 riIPg4k9n/qDYf3wmuFAC08WyRwZUhdZJm4EDRRWULMGfQBIcMKTsk=
X-Google-Smtp-Source: AGHT+IFpPpCi+VL6IvLEKJLym8igC+MjdCG+S8OPf5QDLuroN8Bn+bdaYXqt9L6bvSUJYp5M11UJ5w==
X-Received: by 2002:a17:902:c951:b0:216:2b14:b625 with SMTP id
 d9443c01a7336-21a83f765c4mr239952305ad.31.1736667052218; 
 Sat, 11 Jan 2025 23:30:52 -0800 (PST)
Received: from localhost.localdomain ([122.174.69.103])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21a9f22d293sm35074905ad.185.2025.01.11.23.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 23:30:50 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: casey@schaufler-ca.com, takedakn@nttdata.co.jp,
 penguin-kernel@I-love.SAKURA.ne.jp
Date: Sun, 12 Jan 2025 12:59:27 +0530
Message-Id: <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250111.22fc32ae0729@gnoack.org>
References: <20250111.22fc32ae0729@gnoack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.174;
 envelope-from=tanyaagarwal25699@gmail.com; helo=mail-pl1-f174.google.com
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:43 +0000
Subject: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: eric.snowberg@oracle.com, paul@paul-moore.com,
 Tanya Agarwal <tanyaagarwal25699@gmail.com>, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 zohar@linux.ibm.com, omosnace@redhat.com,
 linux-security-module@vger.kernel.org, gnoack@google.com,
 skhan@linuxfoundation.org, mic@digikod.net, linux-integrity@vger.kernel.org,
 anupnewsmail@gmail.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Fix typos and spelling errors in security module comments that were
identified using the codespell tool.
No functional changes - documentation only.

Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
Thanks Günther, for catching this error.
The irony of having a spelling mistake in a patch that fixes spelling
mistakes is not lost on me :) 

I've fixed it in V2 of the patch. Thank you for the careful review!

V2: fix spelling mistake - s/beeen/been/ 

 security/apparmor/apparmorfs.c      | 6 +++---
 security/apparmor/domain.c          | 4 ++--
 security/apparmor/label.c           | 2 +-
 security/apparmor/lsm.c             | 2 +-
 security/apparmor/policy.c          | 4 ++--
 security/integrity/evm/evm_crypto.c | 2 +-
 security/integrity/evm/evm_main.c   | 2 +-
 security/integrity/ima/ima_main.c   | 6 +++---
 security/landlock/ruleset.c         | 2 +-
 security/selinux/avc.c              | 2 +-
 security/smack/smack.h              | 2 +-
 security/smack/smack_access.c       | 4 ++--
 security/smack/smack_lsm.c          | 6 +++---
 security/smack/smackfs.c            | 2 +-
 security/tomoyo/domain.c            | 2 +-
 15 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 2c0185ebc900..0c2f248d31bf 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -43,7 +43,7 @@
  * The interface is split into two main components based on their function
  * a securityfs component:
  *   used for static files that are always available, and which allows
- *   userspace to specificy the location of the security filesystem.
+ *   userspace to specify the location of the security filesystem.
  *
  *   fns and data are prefixed with
  *      aa_sfs_
@@ -204,7 +204,7 @@ static struct file_system_type aafs_ops = {
 /**
  * __aafs_setup_d_inode - basic inode setup for apparmorfs
  * @dir: parent directory for the dentry
- * @dentry: dentry we are seting the inode up for
+ * @dentry: dentry we are setting the inode up for
  * @mode: permissions the file should have
  * @data: data to store on inode.i_private, available in open()
  * @link: if symlink, symlink target string
@@ -2244,7 +2244,7 @@ static void *p_next(struct seq_file *f, void *p, loff_t *pos)
 /**
  * p_stop - stop depth first traversal
  * @f: seq_file we are filling
- * @p: the last profile writen
+ * @p: the last profile written
  *
  * Release all locking done by p_start/p_next on namespace tree
  */
diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 5939bd9a9b9b..d959931eac28 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -755,7 +755,7 @@ static int profile_onexec(const struct cred *subj_cred,
 		/* change_profile on exec already granted */
 		/*
 		 * NOTE: Domain transitions from unconfined are allowed
-		 * even when no_new_privs is set because this aways results
+		 * even when no_new_privs is set because this always results
 		 * in a further reduction of permissions.
 		 */
 		return 0;
@@ -926,7 +926,7 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *bprm)
 	 *
 	 * NOTE: Domain transitions from unconfined and to stacked
 	 * subsets are allowed even when no_new_privs is set because this
-	 * aways results in a further reduction of permissions.
+	 * always results in a further reduction of permissions.
 	 */
 	if ((bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS) &&
 	    !unconfined(label) &&
diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 91483ecacc16..8bcff51becb8 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -1456,7 +1456,7 @@ bool aa_update_label_name(struct aa_ns *ns, struct aa_label *label, gfp_t gfp)
 
 /*
  * cached label name is present and visible
- * @label->hname only exists if label is namespace hierachical
+ * @label->hname only exists if label is namespace hierarchical
  */
 static inline bool use_label_hname(struct aa_ns *ns, struct aa_label *label,
 				   int flags)
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 1edc12862a7d..04bf5d2f6e00 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2006,7 +2006,7 @@ static int __init alloc_buffers(void)
 	 * two should be enough, with more CPUs it is possible that more
 	 * buffers will be used simultaneously. The preallocated pool may grow.
 	 * This preallocation has also the side-effect that AppArmor will be
-	 * disabled early at boot if aa_g_path_max is extremly high.
+	 * disabled early at boot if aa_g_path_max is extremely high.
 	 */
 	if (num_online_cpus() > 1)
 		num = 4 + RESERVE_COUNT;
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index d0244fab0653..5cec3efc4794 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -463,7 +463,7 @@ static struct aa_policy *__lookup_parent(struct aa_ns *ns,
 }
 
 /**
- * __create_missing_ancestors - create place holders for missing ancestores
+ * __create_missing_ancestors - create place holders for missing ancestors
  * @ns: namespace to lookup profile in (NOT NULL)
  * @hname: hierarchical profile name to find parent of (NOT NULL)
  * @gfp: type of allocation.
@@ -1068,7 +1068,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 		goto out;
 
 	/* ensure that profiles are all for the same ns
-	 * TODO: update locking to remove this constaint. All profiles in
+	 * TODO: update locking to remove this constraint. All profiles in
 	 *       the load set must succeed as a set or the load will
 	 *       fail. Sort ent list and take ns locks in hierarchy order
 	 */
diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
index 7c06ffd633d2..a5e730ffda57 100644
--- a/security/integrity/evm/evm_crypto.c
+++ b/security/integrity/evm/evm_crypto.c
@@ -180,7 +180,7 @@ static void hmac_add_misc(struct shash_desc *desc, struct inode *inode,
 }
 
 /*
- * Dump large security xattr values as a continuous ascii hexademical string.
+ * Dump large security xattr values as a continuous ascii hexadecimal string.
  * (pr_debug is limited to 64 bytes.)
  */
 static void dump_security_xattr_l(const char *prefix, const void *src,
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 377e57e9084f..0add782e73ba 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -169,7 +169,7 @@ static int is_unsupported_hmac_fs(struct dentry *dentry)
  * and compare it against the stored security.evm xattr.
  *
  * For performance:
- * - use the previoulsy retrieved xattr value and length to calculate the
+ * - use the previously retrieved xattr value and length to calculate the
  *   HMAC.)
  * - cache the verification result in the iint, when available.
  *
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 9b87556b03a7..cdb8c7419d7e 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -983,9 +983,9 @@ int process_buffer_measurement(struct mnt_idmap *idmap,
 	}
 
 	/*
-	 * Both LSM hooks and auxilary based buffer measurements are
-	 * based on policy.  To avoid code duplication, differentiate
-	 * between the LSM hooks and auxilary buffer measurements,
+	 * Both LSM hooks and auxiliary based buffer measurements are
+	 * based on policy. To avoid code duplication, differentiate
+	 * between the LSM hooks and auxiliary buffer measurements,
 	 * retrieving the policy rule information only for the LSM hook
 	 * buffer measurements.
 	 */
diff --git a/security/landlock/ruleset.c b/security/landlock/ruleset.c
index a93bdbf52fff..c464d1f84792 100644
--- a/security/landlock/ruleset.c
+++ b/security/landlock/ruleset.c
@@ -121,7 +121,7 @@ create_rule(const struct landlock_id id,
 		return ERR_PTR(-ENOMEM);
 	RB_CLEAR_NODE(&new_rule->node);
 	if (is_object_pointer(id.type)) {
-		/* This should be catched by insert_rule(). */
+		/* This should have been caught by insert_rule(). */
 		WARN_ON_ONCE(!id.key.object);
 		landlock_get_object(id.key.object);
 	}
diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index 1f2680bcc43a..4b4837a20225 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -936,7 +936,7 @@ static void avc_flush(void)
 
 		spin_lock_irqsave(lock, flag);
 		/*
-		 * With preemptable RCU, the outer spinlock does not
+		 * With preemptible RCU, the outer spinlock does not
 		 * prevent RCU grace periods from ending.
 		 */
 		rcu_read_lock();
diff --git a/security/smack/smack.h b/security/smack/smack.h
index dbf8d7226eb5..ca38e145f364 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -42,7 +42,7 @@
 
 /*
  * This is the repository for labels seen so that it is
- * not necessary to keep allocating tiny chuncks of memory
+ * not necessary to keep allocating tiny chunks of memory
  * and so that they can be shared.
  *
  * Labels are never modified in place. Anytime a label
diff --git a/security/smack/smack_access.c b/security/smack/smack_access.c
index 585e5e35710b..5c17aee5dd78 100644
--- a/security/smack/smack_access.c
+++ b/security/smack/smack_access.c
@@ -242,7 +242,7 @@ int smk_tskacc(struct task_smack *tsp, struct smack_known *obj_known,
 	}
 
 	/*
-	 * Allow for priviliged to override policy.
+	 * Allow for privileged to override policy.
 	 */
 	if (rc != 0 && smack_privileged(CAP_MAC_OVERRIDE))
 		rc = 0;
@@ -277,7 +277,7 @@ int smk_curacc(struct smack_known *obj_known,
 
 #ifdef CONFIG_AUDIT
 /**
- * smack_str_from_perm : helper to transalate an int to a
+ * smack_str_from_perm : helper to translate an int to a
  * readable string
  * @string : the string to fill
  * @access : the int
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 0c476282e279..85ec288eefe7 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -1950,7 +1950,7 @@ static int smack_file_send_sigiotask(struct task_struct *tsk,
 	 */
 	file = fown->file;
 
-	/* we don't log here as rc can be overriden */
+	/* we don't log here as rc can be overridden */
 	blob = smack_file(file);
 	skp = *blob;
 	rc = smk_access(skp, tkp, MAY_DELIVER, NULL);
@@ -4211,7 +4211,7 @@ static int smack_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 		/*
 		 * Receiving a packet requires that the other end
 		 * be able to write here. Read access is not required.
-		 * This is the simplist possible security model
+		 * This is the simplest possible security model
 		 * for networking.
 		 */
 		rc = smk_access(skp, ssp->smk_in, MAY_WRITE, &ad);
@@ -4717,7 +4717,7 @@ static int smack_post_notification(const struct cred *w_cred,
  * @gfp: type of the memory for the allocation
  *
  * Prepare to audit cases where (@field @op @rulestr) is true.
- * The label to be audited is created if necessay.
+ * The label to be audited is created if necessary.
  */
 static int smack_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule,
 				 gfp_t gfp)
diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 1401412fd794..432e2d094e35 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -165,7 +165,7 @@ static int smk_cipso_doi_value = SMACK_CIPSO_DOI_DEFAULT;
 #define SMK_LOADLEN	(SMK_LABELLEN + SMK_LABELLEN + SMK_ACCESSLEN)
 
 /*
- * Stricly for CIPSO level manipulation.
+ * Strictly for CIPSO level manipulation.
  * Set the category bit number in a smack label sized buffer.
  */
 static inline void smack_catset_bit(unsigned int cat, char *catsetp)
diff --git a/security/tomoyo/domain.c b/security/tomoyo/domain.c
index aed9e3ef2c9e..9a1928be707d 100644
--- a/security/tomoyo/domain.c
+++ b/security/tomoyo/domain.c
@@ -913,7 +913,7 @@ bool tomoyo_dump_page(struct linux_binprm *bprm, unsigned long pos,
 #ifdef CONFIG_MMU
 	/*
 	 * This is called at execve() time in order to dig around
-	 * in the argv/environment of the new proceess
+	 * in the argv/environment of the new process
 	 * (represented by bprm).
 	 */
 	mmap_read_lock(bprm->mm);
-- 
2.39.5


