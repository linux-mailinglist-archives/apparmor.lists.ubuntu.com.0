Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 022737734DA
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 01:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qT9W2-0007mY-Nk; Mon, 07 Aug 2023 23:19:58 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kamrankhadijadj@gmail.com>) id 1qSuDF-0000Mp-T1
 for apparmor@lists.ubuntu.com; Mon, 07 Aug 2023 06:59:33 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e8c4so19055185e9.3
 for <apparmor@lists.ubuntu.com>; Sun, 06 Aug 2023 23:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691391573; x=1691996373;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yoEjkyoJWoU8MTKFrPpvoEvG+DJ9Uo0OBGnuZDHzeuY=;
 b=aBHdNavavWvZNE5TYPD1x/w6Y7U0r4NdjdRVcoKX2DCGZ+pKFMVv2LEcR/J/Hj7+2T
 LTk3k4CHSpSh3AI9vA9n5pf4OqCtfyfjzJUSuSn3/2r/2Q/mWoX8MZKdKrrqHZbjtxlE
 vBPUC/c1Ry/iMVSSqRYfFWQT/+OS4oaxD5/FPk5r/AlkpZA2n1e9W0qNVLenJ+bdG7+S
 aUSFTYxPFgl6GOxKlniNKAnYqqACwZtJFLgX8nUfKBrPhlDnEscvbrcVGn2IPhzC4Gpf
 /uux5h4WM51ZCQk3w6maeHNZyqWU3vCeBlfb8m85eBAh34f4c2i013tsK9nWlpa32Bcf
 mnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691391573; x=1691996373;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yoEjkyoJWoU8MTKFrPpvoEvG+DJ9Uo0OBGnuZDHzeuY=;
 b=Ppsis7T53P7MOilZfI9Qs5M9ghKnyLCo1W+AmS577VquBQL82ua8Zrwmk7yjkCEFCM
 jRIva6uhnRXSAjHXhA7yJDha/Slefkhm14e4+3aFPeP7navt6ZdZhFQWusJJjW02lA7Y
 hX5TC2Yuhp5gQDUYgSyoxq1P2G7b1KPIGVitb4WzQ/GrnQK3qoZrs6kOQF80Pva4Tt3R
 XKh0no6IiiTN6oK0TJKsgmxf7FgN0UyzIGNnaN0853eVfk6b38VxsOecYJj0RxIti5Ux
 MZfpigcgJ18TAjhSk+pT/JcW5MmBLS3PVsXOiyC0DKtMBYiO1HFpcgPokvejSi4KbqA8
 lbWw==
X-Gm-Message-State: AOJu0YxaTL+rGrBaOyo6g7f2aVUHFkUZojp/FAo8YG2bTe3Hh3BTENDY
 HnXkES5S7pCrDxkys00yLw8=
X-Google-Smtp-Source: AGHT+IFNpTAp1sf/QAMLhuwEX/5EuBOM3S+430+mCRJJeI/cGJ4W192pU/l3+DGp1K6bF8bs2omGlg==
X-Received: by 2002:a7b:ce09:0:b0:3fe:2219:9052 with SMTP id
 m9-20020a7bce09000000b003fe22199052mr5327478wmc.18.1691391572688; 
 Sun, 06 Aug 2023 23:59:32 -0700 (PDT)
Received: from khadija-virtual-machine ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm14086700wmq.8.2023.08.06.23.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 23:59:32 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:59:29 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>, paul@paul-moore.com,
 stephen.smalley.work@gmail.com, eparis@parisplace.org,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 jmorris@namei.org, serge@hallyn.com,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 john.johansen@canonical.com, ztarkhani@microsoft.com
Message-ID: <ZNCWUQXKrZnCeB/5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=209.85.128.43;
 envelope-from=kamrankhadijadj@gmail.com; helo=mail-wm1-f43.google.com
X-Mailman-Approved-At: Mon, 07 Aug 2023 23:19:57 +0000
Subject: [apparmor] [PATCH v2] lsm: constify the 'target' parameter in
	security_capget()
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Three LSMs register the implementations for the "capget" hook: AppArmor,
SELinux, and the normal capability code. Looking at the function
implementations we may observe that the first parameter "target" is not
changing.

Mark the first argument "target" of LSM hook security_capget() as
"const" since it will not be changing in the LSM hook.

cap_capget() LSM hook declaration exceeds the 80 characters per line
limit. Split the function declaration to multple lines to decrease the
line length.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
Changes in v2:
 - Squash the patches 1/2 and 2/2 into a single patch
 - Simplify the commit message

 include/linux/lsm_hook_defs.h | 2 +-
 include/linux/security.h      | 7 ++++---
 kernel/capability.c           | 2 +-
 security/apparmor/lsm.c       | 2 +-
 security/commoncap.c          | 2 +-
 security/security.c           | 2 +-
 security/selinux/hooks.c      | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 6bb55e61e8e8..fd3844e11077 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -36,7 +36,7 @@ LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
 LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
 	 unsigned int mode)
 LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
-LSM_HOOK(int, 0, capget, struct task_struct *target, kernel_cap_t *effective,
+LSM_HOOK(int, 0, capget, const struct task_struct *target, kernel_cap_t *effective,
 	 kernel_cap_t *inheritable, kernel_cap_t *permitted)
 LSM_HOOK(int, 0, capset, struct cred *new, const struct cred *old,
 	 const kernel_cap_t *effective, const kernel_cap_t *inheritable,
diff --git a/include/linux/security.h b/include/linux/security.h
index e2734e9e44d5..fef65d0e522d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -145,7 +145,8 @@ extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 extern int cap_settime(const struct timespec64 *ts, const struct timezone *tz);
 extern int cap_ptrace_access_check(struct task_struct *child, unsigned int mode);
 extern int cap_ptrace_traceme(struct task_struct *parent);
-extern int cap_capget(struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
+extern int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
+					  kernel_cap_t *inheritable, kernel_cap_t *permitted);
 extern int cap_capset(struct cred *new, const struct cred *old,
 		      const kernel_cap_t *effective,
 		      const kernel_cap_t *inheritable,
@@ -271,7 +272,7 @@ int security_binder_transfer_file(const struct cred *from,
 				  const struct cred *to, struct file *file);
 int security_ptrace_access_check(struct task_struct *child, unsigned int mode);
 int security_ptrace_traceme(struct task_struct *parent);
-int security_capget(struct task_struct *target,
+int security_capget(const struct task_struct *target,
 		    kernel_cap_t *effective,
 		    kernel_cap_t *inheritable,
 		    kernel_cap_t *permitted);
@@ -553,7 +554,7 @@ static inline int security_ptrace_traceme(struct task_struct *parent)
 	return cap_ptrace_traceme(parent);
 }
 
-static inline int security_capget(struct task_struct *target,
+static inline int security_capget(const struct task_struct *target,
 				   kernel_cap_t *effective,
 				   kernel_cap_t *inheritable,
 				   kernel_cap_t *permitted)
diff --git a/kernel/capability.c b/kernel/capability.c
index 3e058f41df32..67bdee3414dd 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -112,7 +112,7 @@ static inline int cap_get_target_pid(pid_t pid, kernel_cap_t *pEp,
 	int ret;
 
 	if (pid && (pid != task_pid_vnr(current))) {
-		struct task_struct *target;
+		const struct task_struct *target;
 
 		rcu_read_lock();
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index f431251ffb91..12dd96c3b2f0 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -144,7 +144,7 @@ static int apparmor_ptrace_traceme(struct task_struct *parent)
 }
 
 /* Derived from security/commoncap.c:cap_capget */
-static int apparmor_capget(struct task_struct *target, kernel_cap_t *effective,
+static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effective,
 			   kernel_cap_t *inheritable, kernel_cap_t *permitted)
 {
 	struct aa_label *label;
diff --git a/security/commoncap.c b/security/commoncap.c
index 0b3fc2f3afe7..5fd64d3e5bfd 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -197,7 +197,7 @@ int cap_ptrace_traceme(struct task_struct *parent)
  * This function retrieves the capabilities of the nominated task and returns
  * them to the caller.
  */
-int cap_capget(struct task_struct *target, kernel_cap_t *effective,
+int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
 	       kernel_cap_t *inheritable, kernel_cap_t *permitted)
 {
 	const struct cred *cred;
diff --git a/security/security.c b/security/security.c
index d5ff7ff45b77..fb2d93b481f1 100644
--- a/security/security.c
+++ b/security/security.c
@@ -893,7 +893,7 @@ int security_ptrace_traceme(struct task_struct *parent)
  *
  * Return: Returns 0 if the capability sets were successfully obtained.
  */
-int security_capget(struct task_struct *target,
+int security_capget(const struct task_struct *target,
 		    kernel_cap_t *effective,
 		    kernel_cap_t *inheritable,
 		    kernel_cap_t *permitted)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 79b4890e9936..ff42d49f1b41 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2056,7 +2056,7 @@ static int selinux_ptrace_traceme(struct task_struct *parent)
 			    SECCLASS_PROCESS, PROCESS__PTRACE, NULL);
 }
 
-static int selinux_capget(struct task_struct *target, kernel_cap_t *effective,
+static int selinux_capget(const struct task_struct *target, kernel_cap_t *effective,
 			  kernel_cap_t *inheritable, kernel_cap_t *permitted)
 {
 	return avc_has_perm(current_sid(), task_sid_obj(target),
-- 
2.34.1


