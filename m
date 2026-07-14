Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Py8DNypYVmrj3gAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 17:39:22 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5B75683E
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 17:39:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wjfDu-0004rJ-Jd; Tue, 14 Jul 2026 15:39:06 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1wjfDs-0004rB-8N
 for apparmor@lists.ubuntu.com; Tue, 14 Jul 2026 15:39:04 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b8d92a4eso68175e9.1
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jul 2026 08:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784043543; x=1784648343;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=J01qK8ph2yz3FUSd+RgsaIaOKQH5OUzQg7HSEfuNJTU=;
 b=f8AqwR/lcOLdhk8lHpGHVhYYbAjSta3scdFQcsyRwLJhSl9GMDzNcHkw8/stD7f1Zi
 PrAdwO28AQ3e4aT8SVXrWih06d8Yuhntyti+TokAK6NxfRvLwgchsKjJ5Wz6KUxJaLJ1
 YY4zlC5LbSvJmhsbnlIHbfvR7LkcYFdYF6XAIc1/stjNFDC5hojIo4EhravLAhCsnhgl
 oPb67xyVKBd6hLZh7y8U3ap9MGKEiz8/MTeFxDry3ndSxAOJoC2vm6WpSAwSwPSCx8wU
 jM/XJp/UZ13KJkZdqv3KfhPS2WFE14fslrN8OqpOmbyNJDa6ZF4kjZrSp7z32RflkdOC
 gvTg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+wfTF4ERh6XjJDvp0gVQ1IUJWHIZ7TAfsiyK1hEpHHsroUa29/XkVe4Q9edY4OuQEypTWr4JXyw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxe1JtyVC8mmVN20i0zf3Q8eOpVTHkaiTSBA6JIvQhZTVcv0fpZ
 K51y1Vos8dc/D6ysoRKvuWjZ42YbQUaei0QfP0fAh3RN8A5g2l1OP/OE0IyPubMxww==
X-Gm-Gg: AfdE7ck1jHqaRob/3PTGnJBcWXPZcch99lD0CgLBWzDKcp77Xj4GacHslHe1z+wj8FY
 yp3IaQhoN9Cw4Dh9BMr5DRjTvdmezgjV9R9YldGnB4mwPBwhAnQ21Vipi6oEZpCV/4t891LUY68
 zLgXDybtM7iB4Cb9BhZ+ajOTp57eNocnk8Hs1ANSuoUeOXL+EmG9dU7MPxhNZWuPRMrIrYBs3+h
 wZqvqN6ZsB/cevK3y20yypYrJTgcnZBLYhUEp9eqouMaC3OLIdOXK8kaNbURW+sE2xwv+oHTiUI
 /6PksS9nhXaKRe+VO8wf0kZKTsSbG+2eGoiZjPQJxLrjhgSyZS+vVALuxCNanK1M7EDFPYXsR24
 2s0Sq0QHPmDfvFCO18miG1IetsTs7a8GWdDt/QI/+elgQAP0kVmX4Z/hMVHJXJmNFIaSWRMjjTu
 C92qJAqym30H8B+DJ6Qdjh7t4YvSKaWYv27fglN/U753Y++P05SI3YyAlV2KTqiSMEy2/3GoQK
X-Received: by 2002:a05:600c:828c:b0:493:b279:6012 with SMTP id
 5b1f17b1804b1-4945e2be9femr2073435e9.0.1784043542713; 
 Tue, 14 Jul 2026 08:39:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:84a1:f866:349a:250b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464caeffsm8522501f8f.36.2026.07.14.08.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 08:39:02 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:38:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-fix-apparmor-cred-uaf-v1-1-be40e8c83b90@google.com>
X-B4-Tracking: v=1; b=H4sIAN5XVmoC/yXMQQqEMAyF4atI1ga0DipeRVy0MToZUEuqIoh3n
 6rLD977TwiswgGa5ATlXYIsc0SeJkBfO4+M0keDyUyZVfkHBznQem91WhRJucfNDkhU1EzGFbW
 rIH69chw+3bZ7HTb3Y1rvGFzXH+fPN6t5AAAA
X-Change-ID: 20260714-fix-apparmor-cred-uaf-cc38ec2b38b7
To: John Johansen <john.johansen@canonical.com>, 
 John Johansen <john@apparmor.net>, 
 Georgia Garcia <georgia.garcia@canonical.com>, apparmor@lists.ubuntu.com, 
 Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784043499; l=7433;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Hn3a99V0GshSYRRajT1LdTigZCY403M9C6bDrN6U6Xg=;
 b=ek9GXlKutf3DdPTWJIyyWtUNapXj2tmf0u00pReeaJnFg6apXCXhtVQ1Le/ihIA9Lbny+trOM
 qUbSL85AurAADcVVB6QDQ3Q/RDJg48BA9OYerWkBkrLig0pjgV0UrGG
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
Received-SPF: pass client-ip=209.85.128.45; envelope-from=jannh@google.com;
 helo=mail-wm1-f45.google.com
Subject: [apparmor] [PATCH] apparmor: fix cred UAF caused by
 begin_current_label_crit_section()
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
From: Jann Horn via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 James Morris <jmorris@namei.org>, stable@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:john@apparmor.net,m:georgia.garcia@canonical.com,m:apparmor@lists.ubuntu.com,m:paul@paul-moore.com,m:serge@hallyn.com,m:brauner@kernel.org,m:jannh@google.com,m:peterz@infradead.org,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[jannh@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:rdns,lists.ubuntu.com:helo,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77C5B75683E

AppArmor's begin_current_label_crit_section() is a scary function called
from lots of LSM hooks (in particular VFS/socket-related ones) that checks
if the label referenced by the current creds is marked FLAG_STALE, and if
so, attempts to use aa_replace_current_label() to replace the creds with an
updated version that uses a new label.

The first problem with this is that it would directly lead to UAF of
`struct cred` if anything in the kernel takes a pointer to the current
creds and accesses these past a security hook invocation that replaces
creds, like so:
```
const struct cred *cred = current_cred();
alloc_file_pseudo(...);
uid_t uid = cred->euid;
```
I don't know if anything in the kernel actually does this, but I think it
is very surprising that this pattern could lead to UAF.

The second problem is that things go wrong when aa_replace_current_label()
runs with overridden credentials. aa_replace_current_label() bails out if
`current_cred() != current_real_cred()` (mirroring the check in
proc_pid_attr_write()), but this check can't actually reliably detect
overridden credentials because the overridden creds can be the same as the
objective creds.

So in approximately the following scenario, things go wrong:

1. task begins with <creds A> (as both objective and subjective creds),
   with refcount=2
2. task grabs an extra reference on <creds A> for overriding
3. task calls override_creds(<creds A>), which returns a pointer to the old
   subjective creds (<creds A>)
4. task enters AppArmor LSM hook
5. AppArmor checks that objective/subjective creds are equal
6. AppArmor replaces both cred pointers with <creds B> and drops 2 refs on
   <creds A>
7. task leaves AppArmor LSM hook
8. task calls revert_creds(<creds A>)
9. now task->cred is <creds A> while task->real_cred is <creds B>, but the
   task_struct logically holds two references to <creds B>
10. another task drops the extra reference on <creds A> that was used for
    overriding, refcount drops to 0
11. now task->real_cred points to freed creds

At this point, any access to current_cred() will be UAF.

I have a test case where I run aa-disable on a profile while a process
using that profile is blocked on splice() from a FUSE passthrough file into
a full pipe; after the profile update, the pipe becomes empty, splice()
resumes, the credentials go out of sync, and a subsequent getuid() syscall
results in a KASAN UAF splat.

To fix this, instead of directly replacing creds, do it via task_work that
will run at the end of the current syscall. (The point in time at which the
cred replacement happens should have no correctness impact; it is just a
performance optimization to avoid unnecessarily touching the refcount of
the new label.)

Note that AppArmor still performs direct cred replacements in the
sb_pivotroot LSM hook after this change, and that direct cred replacements
can still happen in VFS ->write() callbacks via proc_pid_attr_write().

Cc: stable@vger.kernel.org
Fixes: c75afcd153f6 ("AppArmor: contexts used in attaching policy to system objects")
Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/task_work.h        |  1 +
 kernel/task_work.c               | 14 ++++++++++++++
 security/apparmor/include/cred.h |  6 +-----
 security/apparmor/include/task.h |  1 +
 security/apparmor/task.c         | 29 +++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/include/linux/task_work.h b/include/linux/task_work.h
index 0646804860ff..ce19fc14060c 100644
--- a/include/linux/task_work.h
+++ b/include/linux/task_work.h
@@ -33,6 +33,7 @@ struct callback_head *task_work_cancel_match(struct task_struct *task,
 	bool (*match)(struct callback_head *, void *data), void *data);
 struct callback_head *task_work_cancel_func(struct task_struct *, task_work_func_t);
 bool task_work_cancel(struct task_struct *task, struct callback_head *cb);
+bool task_work_has_func(struct task_struct *task, task_work_func_t func);
 void task_work_run(void);
 
 static inline void exit_task_work(struct task_struct *task)
diff --git a/kernel/task_work.c b/kernel/task_work.c
index 0f7519f8e7c9..f83d1528e0bc 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -189,6 +189,20 @@ bool task_work_cancel(struct task_struct *task, struct callback_head *cb)
 	return ret == cb;
 }
 
+bool task_work_has_func(struct task_struct *task, task_work_func_t func)
+{
+	struct callback_head *work;
+
+	if (!task_work_pending(task))
+		return false;
+	guard(raw_spinlock_irqsave)(&task->pi_lock);
+	for (work = READ_ONCE(task->task_works); work; work = READ_ONCE(work->next)) {
+		if (work->func == func)
+			return true;
+	}
+	return false;
+}
+
 /**
  * task_work_run - execute the works added by task_work_add()
  *
diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index 2b6098149b15..0e8b67159f56 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -222,13 +222,9 @@ static inline struct aa_label *begin_current_label_crit_section(void)
 {
 	struct aa_label *label = aa_current_raw_label();
 
-	might_sleep();
-
 	if (label_is_stale(label)) {
 		label = aa_get_newest_label(label);
-		if (aa_replace_current_label(label) == 0)
-			/* task cred will keep the reference */
-			aa_put_label(label);
+		aa_schedule_stale_label_replacement();
 	}
 
 	return label;
diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
index b1aaaf60fa8b..4e49a4142777 100644
--- a/security/apparmor/include/task.h
+++ b/security/apparmor/include/task.h
@@ -30,6 +30,7 @@ struct aa_task_ctx {
 };
 
 int aa_replace_current_label(struct aa_label *label);
+void aa_schedule_stale_label_replacement(void);
 void aa_set_current_onexec(struct aa_label *label, bool stack);
 int aa_set_current_hat(struct aa_label *label, u64 token);
 int aa_restore_previous_label(u64 cookie);
diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index b9fb3738124e..8e368f6278f5 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -14,6 +14,7 @@
 
 #include <linux/gfp.h>
 #include <linux/ptrace.h>
+#include <linux/task_work.h>
 
 #include "include/path.h"
 #include "include/audit.h"
@@ -89,6 +90,34 @@ int aa_replace_current_label(struct aa_label *label)
 	return 0;
 }
 
+static void aa_replace_stale_label_tw_func(struct callback_head *tw)
+{
+	struct aa_label *label;
+
+	kfree(tw);
+	label = aa_current_raw_label();
+	if (!label_is_stale(label))
+		return;
+	label = aa_get_newest_label(label);
+	aa_replace_current_label(label);
+	aa_put_label(label);
+}
+
+/* replace the current task's stale label on syscall return */
+void aa_schedule_stale_label_replacement(void)
+{
+	struct callback_head *tw;
+
+	if (task_work_has_func(current, aa_replace_stale_label_tw_func))
+		return;
+	tw = kmalloc_obj(struct callback_head);
+	if (!tw)
+		return;
+	init_task_work(tw, aa_replace_stale_label_tw_func);
+	if (task_work_add(current, tw, TWA_RESUME))
+		kfree(tw);
+}
+
 
 /**
  * aa_set_current_onexec - set the tasks change_profile to happen onexec

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-fix-apparmor-cred-uaf-cc38ec2b38b7

Best regards,
--  
Jann Horn <jannh@google.com>


