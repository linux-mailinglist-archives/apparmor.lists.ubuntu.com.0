Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B75F69A1
	for <lists+apparmor@lfdr.de>; Thu,  6 Oct 2022 16:32:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogRup-0006Cf-RV; Thu, 06 Oct 2022 14:31:59 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1ogMEI-0004mU-Ev
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 08:27:42 +0000
Received: by mail-pf1-f171.google.com with SMTP id w191so1415117pfc.5
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JXTirUT/Csg4APgKb6IoBxbOkY1M1FiylJ4snUxz0UA=;
 b=MV1Xq/Ck5nDq5FkA2A/UwIV8B30dvCVwZwYBMaY5KkmjN8HzeobdGijbvEPdreTL0I
 hVhs0leFZmmgwsEcyYJ5LKRD3rksRH/MX05zPgzCuhL2mf5faZobGVDXhr0NK0y3ncts
 WDg5Irmwiclv1+TuKbuqMlK939w/T3VPQBGLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JXTirUT/Csg4APgKb6IoBxbOkY1M1FiylJ4snUxz0UA=;
 b=KXJ+V8nBMN0YYcVvef+4E6JNCUOvisx4at+4EUFv9iBJp4oXN3sUdyzJGYGcqEyg5y
 wGxzLGh7Cjj80r0wiLo2+EXJaYMYO/09sflUpyLmDk+5nTZy1MAyShh5CpBzt2dt8Kpj
 btWRVG0K+fJki7hbUAzWqabG7QJo3/O2YnGo62y4pWl/Wt9T0qLCZ7w5zh/VeAonElGE
 YNufjye6vG297pEOeFUBSHPswbJdU0CKqRgjjYgUW74IS5d3jEn4JSn7QKQYsD4F1gSo
 K27drObDHzsHmkHDngSgMPsCLLr62uFeDq2iyFzQSmVF3xkxDgo8zyJoAQeXRG/TkyAr
 pUzg==
X-Gm-Message-State: ACrzQf3fFzXsXRxP2l9kCw+p4HHCA4h0iR3g1G/JOt/6AkhRgNP4XxNX
 l+YcBQG/4KhxH14E/elaGC8UoA==
X-Google-Smtp-Source: AMsMyM6W5XwnXecNI4zSPGpyeZlol/ZTonmHl763803Md18AZocxPoiswNswpf1uUPT4OHuojpgkmA==
X-Received: by 2002:a63:d54a:0:b0:454:395a:73d6 with SMTP id
 v10-20020a63d54a000000b00454395a73d6mr3545058pgi.531.1665044860838; 
 Thu, 06 Oct 2022 01:27:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a17090a4ec900b00200b2894648sm2344795pjl.52.2022.10.06.01.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 01:27:39 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>
Date: Thu,  6 Oct 2022 01:27:35 -0700
Message-Id: <20221006082735.1321612-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006082735.1321612-1-keescook@chromium.org>
References: <20221006082735.1321612-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3927; h=from:subject;
 bh=ekDs8TYo6gmnVS2X5P/NZPdmVTJQlJO9uXeDqf2iTeY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjPpF336GBqTJk2qjgX5GvQ3feqQTP3mEtrz77nvir
 edCOPRuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYz6RdwAKCRCJcvTf3G3AJpwJEA
 CMrwF69qIO3OxGZxaGmmHUH3737CPlmPn0pDmdy3Hdb4vdmhacgZe56ZODfZEIOyku5HRei4EgW9Un
 lzYhSJLyWOrRjwPEVTKM0BlRqY1HItnaiqVWowS5JKvfxL2L9IQpY0QYtxCwvnJ2W0k8AQ+p6+Ki4o
 F/g2Je0/gx6G4S7AF/T2dVFNrC1I2c87k6eL23rFSo0OQU9LR7LjdrpSZJ30+nBivjJGu5sgi4eHwn
 pQXXIhLFBaII7ltA8d62vwj7rKBAAeQoRzpY95pA1nciM5YG4B9P8aJHsgdBADxRZbVXQlepYcvdRf
 VlawFag7VNsY3EDHQsFYuVxU3jfNQ9aWYiQm3IId5UVkzpseGi1cp/VAH10ttHQtajYjO5MIM/tKh4
 7ms3y2FKhLnnEdyE3WSdd8mSgawrXjpmeuEpDI2vMZ6BlhuIx3kFGvg0wwXPKmuhKRF/KTQ+Xm7Q1B
 whkflq3t78dZ8X+TqDC5voTQ0W1A8o3EMLBJCNfs19t51e9ZWpL+GFM2xZlZeUGxY+arOWBjkl68yH
 hBgpFgFl3+Ti42WCPYzFfu3pVGyV/VYFC3VWIh0k2UTi9ncMlCncCVMVt+w+NSHYYLQzTADe44E3kX
 fF3/UQMXjAf4VO+FWmoBpvB2CbVa1VW942hoVo6zyef2e+sodtvRAZwUdA1w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Oct 2022 14:31:58 +0000
Subject: [apparmor] [PATCH 2/2] exec: Remove LSM_UNSAFE_SHARE
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 "Christian Brauner \(Microsoft\)" <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

With fs_struct explicitly unshared during exec, it is no longer possible
to have unexpected shared state, and LSM_UNSAFE_SHARE can be entirely
removed.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: John Johansen <john.johansen@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Eric Paris <eparis@parisplace.org>
Cc: Richard Haines <richard_c_haines@btinternet.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: Xin Long <lucien.xin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Todd Kjos <tkjos@google.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: apparmor@lists.ubuntu.com
Cc: linux-security-module@vger.kernel.org
Cc: selinux@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/exec.c                  | 17 +----------------
 include/linux/security.h   |  5 ++---
 security/apparmor/domain.c |  5 -----
 security/selinux/hooks.c   | 10 ----------
 4 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 7d5f63f03c58..3cd058711098 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1563,8 +1563,7 @@ EXPORT_SYMBOL(bprm_change_interp);
  */
 static void check_unsafe_exec(struct linux_binprm *bprm)
 {
-	struct task_struct *p = current, *t;
-	unsigned n_fs;
+	struct task_struct *p = current;
 
 	if (p->ptrace)
 		bprm->unsafe |= LSM_UNSAFE_PTRACE;
@@ -1575,20 +1574,6 @@ static void check_unsafe_exec(struct linux_binprm *bprm)
 	 */
 	if (task_no_new_privs(current))
 		bprm->unsafe |= LSM_UNSAFE_NO_NEW_PRIVS;
-
-	t = p;
-	n_fs = 1;
-	spin_lock(&p->fs->lock);
-	rcu_read_lock();
-	while_each_thread(p, t) {
-		if (t->fs == p->fs)
-			n_fs++;
-	}
-	rcu_read_unlock();
-
-	if (p->fs->users > n_fs)
-		bprm->unsafe |= LSM_UNSAFE_SHARE;
-	spin_unlock(&p->fs->lock);
 }
 
 static void bprm_fill_uid(struct linux_binprm *bprm, struct file *file)
diff --git a/include/linux/security.h b/include/linux/security.h
index 1bc362cb413f..db508a8c3cc7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -215,9 +215,8 @@ struct sched_param;
 struct request_sock;
 
 /* bprm->unsafe reasons */
-#define LSM_UNSAFE_SHARE	1
-#define LSM_UNSAFE_PTRACE	2
-#define LSM_UNSAFE_NO_NEW_PRIVS	4
+#define LSM_UNSAFE_PTRACE	BIT(0)
+#define LSM_UNSAFE_NO_NEW_PRIVS	BIT(1)
 
 #ifdef CONFIG_MMU
 extern int mmap_min_addr_handler(struct ctl_table *table, int write,
diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 91689d34d281..1b2c0bb4d9ae 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -924,11 +924,6 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *bprm)
 		goto audit;
 	}
 
-	if (bprm->unsafe & LSM_UNSAFE_SHARE) {
-		/* FIXME: currently don't mediate shared state */
-		;
-	}
-
 	if (bprm->unsafe & (LSM_UNSAFE_PTRACE)) {
 		/* TODO: test needs to be profile of label to new */
 		error = may_change_ptraced_domain(new, &info);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 79573504783b..3ec80cc8ad1c 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2349,16 +2349,6 @@ static int selinux_bprm_creds_for_exec(struct linux_binprm *bprm)
 		if (rc)
 			return rc;
 
-		/* Check for shared state */
-		if (bprm->unsafe & LSM_UNSAFE_SHARE) {
-			rc = avc_has_perm(&selinux_state,
-					  old_tsec->sid, new_tsec->sid,
-					  SECCLASS_PROCESS, PROCESS__SHARE,
-					  NULL);
-			if (rc)
-				return -EPERM;
-		}
-
 		/* Make sure that anyone attempting to ptrace over a task that
 		 * changes its SID has the appropriate permit */
 		if (bprm->unsafe & LSM_UNSAFE_PTRACE) {
-- 
2.34.1


