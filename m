Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBD947A9F
	for <lists+apparmor@lfdr.de>; Mon,  5 Aug 2024 13:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sawIX-0006Zl-Dj; Mon, 05 Aug 2024 11:54:45 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1sawIT-0006ZF-JY
 for apparmor@lists.ubuntu.com; Mon, 05 Aug 2024 11:54:41 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5b9fe5ea355so11248a12.0
 for <apparmor@lists.ubuntu.com>; Mon, 05 Aug 2024 04:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722858881; x=1723463681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEoPY9IiE7pq7MMNhJ56hJ5lCC474oXSLVXIXdotg3Y=;
 b=bu1BEEk6xprv4vYHSRd/35pcufM1eyI/ucbeEbJ0LuAXMQs81VN+TwpyvkKHli4drH
 fejE96De6BppzgxR4/8P4HfA0fWMoIeaH/Wx7vyMHFbn67cWGUQN0RH+FLAhUwAJWB7Z
 lyysM7Ub6cQIoP4agHcqK/dok2/lYobZY4CIgoD2FuvQ0ZgN9frOUXv+gINLUkH3yTrD
 vzJPcHWb+irVHU5JoANIGg9KG7PYeGQWs2qUXcGsY7xE2UxHZAiaG9PB4eXgrjitiSSU
 lK9lzVRH1AxaIDlArA3COMJU3rEjo9GuUwfJEua5n2vjUNVHk5rofYnCJzpI3IiAzZcS
 kD5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqc0T9j91TY+2bVpJJ2V1JpyPTmOWTtSyeX1GlFI2vbTzp45sqPZ/gb7p4SRpHzzWHOHHc1Jy8ZF7+8zL9d7aH5NUtyqA9WiYp
X-Gm-Message-State: AOJu0YywQ5Xx0EhtdqJOniOhuHl4S5RUOq9sj7hdbnaGC1+NT192MC9P
 sjv4gkPmly42ILJWbVjQqvPLy6WCG5jOUpLMLfDHWxCucRkkoAQ3Saeg9Yn7e8vtZ4ZrVJrRvQA
 zDNH2
X-Google-Smtp-Source: AGHT+IFRBYyBjGqXEShWHBlWfZnELySEFWvet+AS8kT1WHTve1pLuTGQwTj6UulOd+7/NG2kYB9Zdw==
X-Received: by 2002:a05:6402:27d4:b0:58b:93:b623 with SMTP id
 4fb4d7f45d1cf-5b9ca81eb7bmr235474a12.5.1722858880259; 
 Mon, 05 Aug 2024 04:54:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:ca74:8a49:a6f6:b872])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm9507146f8f.37.2024.08.05.04.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 04:54:39 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 05 Aug 2024 13:54:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-remove-cred-transfer-v2-2-a2aa1d45e6b8@google.com>
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 John Johansen <john.johansen@canonical.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722858874; l=15392;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=4nc01cQfuB5ACezmUV6BHy3ON8aK7aPel4CWRgHU0QY=;
 b=I4ftB/ikEnSVBmwdzyEDlP55zVu27ULxCXbXsbUnHwhL5khVTHib/FlgsCk5XTubjaShDJJ2v
 STCa9PefrujDvAMOi+knH1NZgRhYLVcBM5rn7s9/1LIwXVrr9aWhtEz
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
Received-SPF: pass client-ip=209.85.208.43; envelope-from=jannh@google.com;
 helo=mail-ed1-f43.google.com
Subject: [apparmor] [PATCH v2 2/2] security: remove unused
 cred_alloc_blank/cred_transfer helpers
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
Cc: Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Now that they're unused thanks to the preceding commit, remove
cred_alloc_blank(), security_transfer_creds(), and the corresponding LSM
hook implementations.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/cred.h          |  1 -
 include/linux/lsm_hook_defs.h |  3 ---
 include/linux/security.h      | 12 ------------
 kernel/cred.c                 | 23 -----------------------
 security/apparmor/lsm.c       | 19 -------------------
 security/landlock/cred.c      | 11 ++---------
 security/security.c           | 35 -----------------------------------
 security/selinux/hooks.c      | 12 ------------
 security/smack/smack_lsm.c    | 32 --------------------------------
 9 files changed, 2 insertions(+), 146 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 2976f534a7a3..54b5105d4cd5 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -147,13 +147,12 @@ struct cred {
 } __randomize_layout;
 
 extern void __put_cred(struct cred *);
 extern void exit_creds(struct task_struct *);
 extern int copy_creds(struct task_struct *, unsigned long);
 extern const struct cred *get_task_cred(struct task_struct *);
-extern struct cred *cred_alloc_blank(void);
 extern struct cred *prepare_creds(void);
 extern struct cred *prepare_exec_creds(void);
 extern int commit_creds(struct cred *);
 extern void abort_creds(struct cred *);
 extern const struct cred *override_creds(const struct cred *);
 extern void revert_creds(const struct cred *);
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 855db460e08b..1d75075cb607 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -204,18 +204,15 @@ LSM_HOOK(int, 0, file_receive, struct file *file)
 LSM_HOOK(int, 0, file_open, struct file *file)
 LSM_HOOK(int, 0, file_post_open, struct file *file, int mask)
 LSM_HOOK(int, 0, file_truncate, struct file *file)
 LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
 	 unsigned long clone_flags)
 LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
-LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
 LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
 LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
 	 gfp_t gfp)
-LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
-	 const struct cred *old)
 LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
 LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
 LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
 LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
 LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
 LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
diff --git a/include/linux/security.h b/include/linux/security.h
index 1390f1efb4f0..a366c2a03f55 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -421,16 +421,14 @@ int security_file_send_sigiotask(struct task_struct *tsk,
 int security_file_receive(struct file *file);
 int security_file_open(struct file *file);
 int security_file_post_open(struct file *file, int mask);
 int security_file_truncate(struct file *file);
 int security_task_alloc(struct task_struct *task, unsigned long clone_flags);
 void security_task_free(struct task_struct *task);
-int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
 void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
-void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
 int security_kernel_act_as(struct cred *new, u32 secid);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id, bool contents);
 int security_kernel_post_load_data(char *buf, loff_t size,
@@ -1117,32 +1115,22 @@ static inline int security_task_alloc(struct task_struct *task,
 	return 0;
 }
 
 static inline void security_task_free(struct task_struct *task)
 { }
 
-static inline int security_cred_alloc_blank(struct cred *cred, gfp_t gfp)
-{
-	return 0;
-}
-
 static inline void security_cred_free(struct cred *cred)
 { }
 
 static inline int security_prepare_creds(struct cred *new,
 					 const struct cred *old,
 					 gfp_t gfp)
 {
 	return 0;
 }
 
-static inline void security_transfer_creds(struct cred *new,
-					   const struct cred *old)
-{
-}
-
 static inline void security_cred_getsecid(const struct cred *c, u32 *secid)
 {
 	*secid = 0;
 }
 
 static inline int security_kernel_act_as(struct cred *cred, u32 secid)
diff --git a/kernel/cred.c b/kernel/cred.c
index 075cfa7c896f..b2f6130cd6b7 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -163,35 +163,12 @@ const struct cred *get_task_cred(struct task_struct *task)
 
 	rcu_read_unlock();
 	return cred;
 }
 EXPORT_SYMBOL(get_task_cred);
 
-/*
- * Allocate blank credentials, such that the credentials can be filled in at a
- * later date without risk of ENOMEM.
- */
-struct cred *cred_alloc_blank(void)
-{
-	struct cred *new;
-
-	new = kmem_cache_zalloc(cred_jar, GFP_KERNEL);
-	if (!new)
-		return NULL;
-
-	atomic_long_set(&new->usage, 1);
-	if (security_cred_alloc_blank(new, GFP_KERNEL_ACCOUNT) < 0)
-		goto error;
-
-	return new;
-
-error:
-	abort_creds(new);
-	return NULL;
-}
-
 /**
  * prepare_creds - Prepare a new set of credentials for modification
  *
  * Prepare a new set of task credentials for modification.  A task's creds
  * shouldn't generally be modified directly, therefore this function is used to
  * prepare a new copy, which the caller then modifies and then commits by
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 808060f9effb..089d53978d9e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -74,39 +74,22 @@ static DEFINE_PER_CPU(struct aa_local_cache, aa_local_buffers);
 static void apparmor_cred_free(struct cred *cred)
 {
 	aa_put_label(cred_label(cred));
 	set_cred_label(cred, NULL);
 }
 
-/*
- * allocate the apparmor part of blank credentials
- */
-static int apparmor_cred_alloc_blank(struct cred *cred, gfp_t gfp)
-{
-	set_cred_label(cred, NULL);
-	return 0;
-}
-
 /*
  * prepare new cred label for modification by prepare_cred block
  */
 static int apparmor_cred_prepare(struct cred *new, const struct cred *old,
 				 gfp_t gfp)
 {
 	set_cred_label(new, aa_get_newest_label(cred_label(old)));
 	return 0;
 }
 
-/*
- * transfer the apparmor data to a blank set of creds
- */
-static void apparmor_cred_transfer(struct cred *new, const struct cred *old)
-{
-	set_cred_label(new, aa_get_newest_label(cred_label(old)));
-}
-
 static void apparmor_task_free(struct task_struct *task)
 {
 
 	aa_free_task_ctx(task_ctx(task));
 }
 
@@ -1504,16 +1487,14 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
 		      apparmor_socket_getpeersec_dgram),
 	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
 #ifdef CONFIG_NETWORK_SECMARK
 	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
 #endif
 
-	LSM_HOOK_INIT(cred_alloc_blank, apparmor_cred_alloc_blank),
 	LSM_HOOK_INIT(cred_free, apparmor_cred_free),
 	LSM_HOOK_INIT(cred_prepare, apparmor_cred_prepare),
-	LSM_HOOK_INIT(cred_transfer, apparmor_cred_transfer),
 
 	LSM_HOOK_INIT(bprm_creds_for_exec, apparmor_bprm_creds_for_exec),
 	LSM_HOOK_INIT(bprm_committing_creds, apparmor_bprm_committing_creds),
 	LSM_HOOK_INIT(bprm_committed_creds, apparmor_bprm_committed_creds),
 
 	LSM_HOOK_INIT(task_free, apparmor_task_free),
diff --git a/security/landlock/cred.c b/security/landlock/cred.c
index db9fe7d906ba..786af18c4a1c 100644
--- a/security/landlock/cred.c
+++ b/security/landlock/cred.c
@@ -11,41 +11,34 @@
 
 #include "common.h"
 #include "cred.h"
 #include "ruleset.h"
 #include "setup.h"
 
-static void hook_cred_transfer(struct cred *const new,
-			       const struct cred *const old)
+static int hook_cred_prepare(struct cred *const new,
+			     const struct cred *const old, const gfp_t gfp)
 {
 	struct landlock_ruleset *const old_dom = landlock_cred(old)->domain;
 
 	if (old_dom) {
 		landlock_get_ruleset(old_dom);
 		landlock_cred(new)->domain = old_dom;
 	}
-}
-
-static int hook_cred_prepare(struct cred *const new,
-			     const struct cred *const old, const gfp_t gfp)
-{
-	hook_cred_transfer(new, old);
 	return 0;
 }
 
 static void hook_cred_free(struct cred *const cred)
 {
 	struct landlock_ruleset *const dom = landlock_cred(cred)->domain;
 
 	if (dom)
 		landlock_put_ruleset_deferred(dom);
 }
 
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(cred_prepare, hook_cred_prepare),
-	LSM_HOOK_INIT(cred_transfer, hook_cred_transfer),
 	LSM_HOOK_INIT(cred_free, hook_cred_free),
 };
 
 __init void landlock_add_cred_hooks(void)
 {
 	security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
diff --git a/security/security.c b/security/security.c
index 8cee5b6c6e6d..4fb81de5cf80 100644
--- a/security/security.c
+++ b/security/security.c
@@ -3057,35 +3057,12 @@ void security_task_free(struct task_struct *task)
 	call_void_hook(task_free, task);
 
 	kfree(task->security);
 	task->security = NULL;
 }
 
-/**
- * security_cred_alloc_blank() - Allocate the min memory to allow cred_transfer
- * @cred: credentials
- * @gfp: gfp flags
- *
- * Only allocate sufficient memory and attach to @cred such that
- * cred_transfer() will not get ENOMEM.
- *
- * Return: Returns 0 on success, negative values on failure.
- */
-int security_cred_alloc_blank(struct cred *cred, gfp_t gfp)
-{
-	int rc = lsm_cred_alloc(cred, gfp);
-
-	if (rc)
-		return rc;
-
-	rc = call_int_hook(cred_alloc_blank, cred, gfp);
-	if (unlikely(rc))
-		security_cred_free(cred);
-	return rc;
-}
-
 /**
  * security_cred_free() - Free the cred's LSM blob and associated resources
  * @cred: credentials
  *
  * Deallocate and clear the cred->security field in a set of credentials.
  */
@@ -3124,24 +3101,12 @@ int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp)
 	rc = call_int_hook(cred_prepare, new, old, gfp);
 	if (unlikely(rc))
 		security_cred_free(new);
 	return rc;
 }
 
-/**
- * security_transfer_creds() - Transfer creds
- * @new: target credentials
- * @old: original credentials
- *
- * Transfer data from original creds to new creds.
- */
-void security_transfer_creds(struct cred *new, const struct cred *old)
-{
-	call_void_hook(cred_transfer, new, old);
-}
-
 /**
  * security_cred_getsecid() - Get the secid from a set of credentials
  * @c: credentials
  * @secid: secid value
  *
  * Retrieve the security identifier of the cred structure @c.  In case of
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 55c78c318ccd..8a659475cc12 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -4007,23 +4007,12 @@ static int selinux_cred_prepare(struct cred *new, const struct cred *old,
 	struct task_security_struct *tsec = selinux_cred(new);
 
 	*tsec = *old_tsec;
 	return 0;
 }
 
-/*
- * transfer the SELinux data to a blank set of creds
- */
-static void selinux_cred_transfer(struct cred *new, const struct cred *old)
-{
-	const struct task_security_struct *old_tsec = selinux_cred(old);
-	struct task_security_struct *tsec = selinux_cred(new);
-
-	*tsec = *old_tsec;
-}
-
 static void selinux_cred_getsecid(const struct cred *c, u32 *secid)
 {
 	*secid = cred_sid(c);
 }
 
 /*
@@ -7213,13 +7202,12 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(file_receive, selinux_file_receive),
 
 	LSM_HOOK_INIT(file_open, selinux_file_open),
 
 	LSM_HOOK_INIT(task_alloc, selinux_task_alloc),
 	LSM_HOOK_INIT(cred_prepare, selinux_cred_prepare),
-	LSM_HOOK_INIT(cred_transfer, selinux_cred_transfer),
 	LSM_HOOK_INIT(cred_getsecid, selinux_cred_getsecid),
 	LSM_HOOK_INIT(kernel_act_as, selinux_kernel_act_as),
 	LSM_HOOK_INIT(kernel_create_files_as, selinux_kernel_create_files_as),
 	LSM_HOOK_INIT(kernel_module_request, selinux_kernel_module_request),
 	LSM_HOOK_INIT(kernel_load_data, selinux_kernel_load_data),
 	LSM_HOOK_INIT(kernel_read_file, selinux_kernel_read_file),
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 4164699cd4f6..4cc658deb08b 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -2050,27 +2050,12 @@ static int smack_file_open(struct file *file)
 }
 
 /*
  * Task hooks
  */
 
-/**
- * smack_cred_alloc_blank - "allocate" blank task-level security credentials
- * @cred: the new credentials
- * @gfp: the atomicity of any memory allocations
- *
- * Prepare a blank set of credentials for modification.  This must allocate all
- * the memory the LSM module might require such that cred_transfer() can
- * complete without error.
- */
-static int smack_cred_alloc_blank(struct cred *cred, gfp_t gfp)
-{
-	init_task_smack(smack_cred(cred), NULL, NULL);
-	return 0;
-}
-
 
 /**
  * smack_cred_free - "free" task-level security credentials
  * @cred: the credentials in question
  *
  */
@@ -2113,27 +2098,12 @@ static int smack_cred_prepare(struct cred *new, const struct cred *old,
 
 	rc = smk_copy_relabel(&new_tsp->smk_relabel, &old_tsp->smk_relabel,
 				gfp);
 	return rc;
 }
 
-/**
- * smack_cred_transfer - Transfer the old credentials to the new credentials
- * @new: the new credentials
- * @old: the original credentials
- *
- * Fill in a set of blank credentials from another set of credentials.
- */
-static void smack_cred_transfer(struct cred *new, const struct cred *old)
-{
-	struct task_smack *old_tsp = smack_cred(old);
-	struct task_smack *new_tsp = smack_cred(new);
-
-	init_task_smack(new_tsp, old_tsp->smk_task, old_tsp->smk_task);
-}
-
 /**
  * smack_cred_getsecid - get the secid corresponding to a creds structure
  * @cred: the object creds
  * @secid: where to put the result
  *
  * Sets the secid to contain a u32 version of the smack label.
@@ -5107,16 +5077,14 @@ static struct security_hook_list smack_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(file_set_fowner, smack_file_set_fowner),
 	LSM_HOOK_INIT(file_send_sigiotask, smack_file_send_sigiotask),
 	LSM_HOOK_INIT(file_receive, smack_file_receive),
 
 	LSM_HOOK_INIT(file_open, smack_file_open),
 
-	LSM_HOOK_INIT(cred_alloc_blank, smack_cred_alloc_blank),
 	LSM_HOOK_INIT(cred_free, smack_cred_free),
 	LSM_HOOK_INIT(cred_prepare, smack_cred_prepare),
-	LSM_HOOK_INIT(cred_transfer, smack_cred_transfer),
 	LSM_HOOK_INIT(cred_getsecid, smack_cred_getsecid),
 	LSM_HOOK_INIT(kernel_act_as, smack_kernel_act_as),
 	LSM_HOOK_INIT(kernel_create_files_as, smack_kernel_create_files_as),
 	LSM_HOOK_INIT(task_setpgid, smack_task_setpgid),
 	LSM_HOOK_INIT(task_getpgid, smack_task_getpgid),
 	LSM_HOOK_INIT(task_getsid, smack_task_getsid),

-- 
2.46.0.rc2.264.g509ed76dc8-goog


