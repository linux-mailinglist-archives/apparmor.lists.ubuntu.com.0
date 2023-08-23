Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CF785289
	for <lists+apparmor@lfdr.de>; Wed, 23 Aug 2023 10:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qYj2j-00042e-ON; Wed, 23 Aug 2023 08:16:45 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kamrankhadijadj@gmail.com>) id 1qYj2i-00042V-Ji
 for apparmor@lists.ubuntu.com; Wed, 23 Aug 2023 08:16:44 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso50112905e9.0
 for <apparmor@lists.ubuntu.com>; Wed, 23 Aug 2023 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692778604; x=1693383404;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WGeYTVNlLk1eqjERhn+1TmGsa+sTLy5TwOaFbMiaCnk=;
 b=hNE+t3vXzk+kI4NoeFuGsBCridXOB6fj+7eJ6tVk6yVmdxRVGyKwg6IZM278ktqbjO
 RrGojBI/CIgDM3Yp9iF/0akGRHb9F2+Z06WGdRX7uprVU/YbqskKGIzYN6ffBaBaSgAP
 iuH9Fv9Q6jDrZnXD4gEDfLvaafjqSII3+FEH7SaaxtvZS585D2nqbTlpyHygAowrYIAU
 YITLpDJVo/EvmjKuhJm4v7rwXIcqnzENjS9j1gl60cTprXLbLhjJpmK+ouWY6QxzopXP
 aNpUPgPfJVI2jISedDRbTddcVCysCQAXOmDqNZ3Z06f6S3npsNN0Jkxm5N0IG3zdY5xG
 YQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778604; x=1693383404;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGeYTVNlLk1eqjERhn+1TmGsa+sTLy5TwOaFbMiaCnk=;
 b=B6/UZm3xFq4/+Ptrrzcu8UTxN1Zs8XE1SmIQEvKXY43q86AI7RogyvkyguVnCxtqcJ
 UYTUUkM6MJNn061qH2+k3ijzJ/ALSDu9Pl1y3jJQ1D2qjiQSCsss/6uKfgWo75ZDc5Pe
 il1K/iaS0rMl7u4NkIe5ReleHmyHzeoFMyc9h7KBedPPPaM9ooGAIYWe73fDx0mCEi/x
 Spb3lapOZ3FBcjlAQlFOa7AaM63UhRoGVGscA6kKyEZU5pceyExMEF4f2MGf6nCbkmQx
 yzIu8UpO7Cc1Y6ppAYyueOSRH+JujZiDk69whTdh7clB7CztmbnVJ7ihnPxkyHcDTjs6
 AiLw==
X-Gm-Message-State: AOJu0YxbrYo+fdhvPAwhkQBm58+plkfp/4ZvbhK70qHC/UUgAVA2WBvL
 QPZrszIQnNXO83vTMqwOyhE=
X-Google-Smtp-Source: AGHT+IGAAziKcTkggq71HGSG5m64rxdYpBzDd1Eu8X0cM+NUwLtapbNYPwuCrBVVSHmc/uXchl7IIQ==
X-Received: by 2002:a05:600c:2307:b0:3fd:1cfa:939e with SMTP id
 7-20020a05600c230700b003fd1cfa939emr9482911wmo.4.1692778603398; 
 Wed, 23 Aug 2023 01:16:43 -0700 (PDT)
Received: from khadija-virtual-machine ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a7bca45000000b003fbd9e390e1sm522037wml.47.2023.08.23.01.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:16:42 -0700 (PDT)
Date: Wed, 23 Aug 2023 13:16:40 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 ztarkhani@microsoft.com, alison.schofield@intel.com
Message-ID: <ZOXAaHDqesqQXaNi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=209.85.128.54;
 envelope-from=kamrankhadijadj@gmail.com; helo=mail-wm1-f54.google.com
Subject: [apparmor] [PATCH] lsm: constify 'bprm' parameter in
 security_bprm_committed_creds()
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

Three LSMs register the implementations for the 'bprm_committed_creds()'
hook: AppArmor, SELinux and tomoyo. Looking at the function
implementations we may observe that the 'bprm' parameter is not changing.

Mark the 'bprm' parameter of LSM hook security_bprm_committed_creds() as
'const' since it will not be changing in the LSM hook.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 include/linux/lsm_hook_defs.h | 2 +-
 include/linux/security.h      | 4 ++--
 security/apparmor/lsm.c       | 2 +-
 security/security.c           | 2 +-
 security/selinux/hooks.c      | 2 +-
 security/tomoyo/tomoyo.c      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 6bb55e61e8e8..cb8d2a047f41 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -53,7 +53,7 @@ LSM_HOOK(int, 0, bprm_creds_for_exec, struct linux_binprm *bprm)
 LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, struct file *file)
 LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
 LSM_HOOK(void, LSM_RET_VOID, bprm_committing_creds, struct linux_binprm *bprm)
-LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, struct linux_binprm *bprm)
+LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, const struct linux_binprm *bprm)
 LSM_HOOK(int, 0, fs_context_dup, struct fs_context *fc,
 	 struct fs_context *src_sc)
 LSM_HOOK(int, -ENOPARAM, fs_context_parse_param, struct fs_context *fc,
diff --git a/include/linux/security.h b/include/linux/security.h
index e2734e9e44d5..96579f830047 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -292,7 +292,7 @@ int security_bprm_creds_for_exec(struct linux_binprm *bprm);
 int security_bprm_creds_from_file(struct linux_binprm *bprm, struct file *file);
 int security_bprm_check(struct linux_binprm *bprm);
 void security_bprm_committing_creds(struct linux_binprm *bprm);
-void security_bprm_committed_creds(struct linux_binprm *bprm);
+void security_bprm_committed_creds(const struct linux_binprm *bprm);
 int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc);
 int security_fs_context_parse_param(struct fs_context *fc, struct fs_parameter *param);
 int security_sb_alloc(struct super_block *sb);
@@ -625,7 +625,7 @@ static inline void security_bprm_committing_creds(struct linux_binprm *bprm)
 {
 }
 
-static inline void security_bprm_committed_creds(struct linux_binprm *bprm)
+static inline void security_bprm_committed_creds(const struct linux_binprm *bprm)
 {
 }
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index f431251ffb91..c68d15af4d64 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -756,7 +756,7 @@ static void apparmor_bprm_committing_creds(struct linux_binprm *bprm)
  * apparmor_bprm_committed_creds() - do cleanup after new creds committed
  * @bprm: binprm for the exec  (NOT NULL)
  */
-static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
+static void apparmor_bprm_committed_creds(const struct linux_binprm *bprm)
 {
 	/* clear out temporary/transitional state from the context */
 	aa_clear_task_ctx_trans(task_ctx(current));
diff --git a/security/security.c b/security/security.c
index d5ff7ff45b77..ee7026390a60 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1133,7 +1133,7 @@ void security_bprm_committing_creds(struct linux_binprm *bprm)
  * process such as clearing out non-inheritable signal state.  This is called
  * immediately after commit_creds().
  */
-void security_bprm_committed_creds(struct linux_binprm *bprm)
+void security_bprm_committed_creds(const struct linux_binprm *bprm)
 {
 	call_void_hook(bprm_committed_creds, bprm);
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 79b4890e9936..b3780f6628dc 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2450,7 +2450,7 @@ static void selinux_bprm_committing_creds(struct linux_binprm *bprm)
  * Clean up the process immediately after the installation of new credentials
  * due to exec
  */
-static void selinux_bprm_committed_creds(struct linux_binprm *bprm)
+static void selinux_bprm_committed_creds(const struct linux_binprm *bprm)
 {
 	const struct task_security_struct *tsec = selinux_cred(current_cred());
 	u32 osid, sid;
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 25006fddc964..255f1b470295 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -52,7 +52,7 @@ static int tomoyo_cred_prepare(struct cred *new, const struct cred *old,
  *
  * @bprm: Pointer to "struct linux_binprm".
  */
-static void tomoyo_bprm_committed_creds(struct linux_binprm *bprm)
+static void tomoyo_bprm_committed_creds(const struct linux_binprm *bprm)
 {
 	/* Clear old_domain_info saved by execve() request. */
 	struct tomoyo_task *s = tomoyo_task(current);
-- 
2.34.1


