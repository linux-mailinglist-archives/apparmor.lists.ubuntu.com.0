Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FB66AFEA
	for <lists+apparmor@lfdr.de>; Sun, 15 Jan 2023 09:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pGyJ7-0008DK-RH; Sun, 15 Jan 2023 08:24:01 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <quanfafu@gmail.com>) id 1pGjk8-0005rh-Vi
 for apparmor@lists.ubuntu.com; Sat, 14 Jan 2023 16:50:57 +0000
Received: by mail-pf1-f171.google.com with SMTP id c26so13778392pfp.10
 for <apparmor@lists.ubuntu.com>; Sat, 14 Jan 2023 08:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NZly66Ps0eB33co09HnOQatKjFfOi6yr5GhUn1KYlDU=;
 b=FAVOLUS9ICwO++64A7PSe0pjIcOEtzpXz7bJSZz52hfSZu8dKGxDGhSlPrNU6nk1st
 d4R3uYjvi3rbrmtp1V30CBEmVb7GkJ6qWve9hkODkRZGqvOkXgFZ0Vw5xBiptuKCN9l2
 +ig2eyzSPyE7Zz/fP2SKRm3OeDbNJHKWqivDHyYF+6l9ZJBxYX7Tls8Ut2lX8q64O4oT
 dHTp0AFaYlNj1u++KJMzQ9OfwOxv+alPk3JkE7mDSnk0waNWX2m+a3inh4ZuIw1JG0bV
 Q9r9AW37T1fkyzbohT2gVArYL+rxyjIXgXZxDKReyS65PyRz8xLpkBu75/bFtxVHMuXp
 IQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZly66Ps0eB33co09HnOQatKjFfOi6yr5GhUn1KYlDU=;
 b=vF24rbUIezEi3Sh/lbxG2ohyLrsrBLUsJ97A1IZleRRErwAOTs2lbIVCtMW6zRp5qp
 jkjptMUhq46+cjd3swMz0PFTR0odGu0OhdVJn/9tYEIXjrsMMUhwLtJrtIE6IzttNdV4
 fdbdgnhULDkB6W+aZYdbwiUz0qrYHYFyqYcFUFVVR1DuPi4l4ExDxPDFeMsp9qoqlpA8
 2rtjPmPrg2xMoso/8IK+4Hg9h9WY4lZs3736PBR+GPk/JEzbWK2pypYYDMLORZLYGm/Z
 p69jDwAIbxxbc4J8EiE58SLDBgmfEzKyUVA5GUENU0ADcn5GG5y4wcNzqBYLbLNSJY+l
 S2jA==
X-Gm-Message-State: AFqh2kps5LHsX8jfcImB+xOMlUNLIrcwy4x/VTB8dLKSNMjYsgQ+q2Wf
 lBBPkgiYa6NjZFpC4zstmQw=
X-Google-Smtp-Source: AMrXdXskaADfyXZPiXQBnsq5Xv+wHt17uljPJQdoFsQXvusgV10GH8au07ItipctqmEOkab2bIkuHA==
X-Received: by 2002:a05:6a00:1da3:b0:589:d831:ad2a with SMTP id
 z35-20020a056a001da300b00589d831ad2amr18625228pfw.6.1673715054981; 
 Sat, 14 Jan 2023 08:50:54 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.3])
 by smtp.gmail.com with ESMTPSA id
 186-20020a6216c3000000b0057fec210d33sm14148888pfw.152.2023.01.14.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 08:50:54 -0800 (PST)
From: Quanfa Fu <quanfafu@gmail.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Sun, 15 Jan 2023 00:49:52 +0800
Message-Id: <20230114164952.232653-1-quanfafu@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.171; envelope-from=quanfafu@gmail.com;
 helo=mail-pf1-f171.google.com
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:24:00 +0000
Subject: [apparmor] [PATCH] apparmor: make aa_set_current_onexec return void
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Quanfa Fu <quanfafu@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Change the return type to void since it always return 0, and no need
to do the checking in aa_set_current_onexec.

Signed-off-by: Quanfa Fu <quanfafu@gmail.com>
---
 security/apparmor/domain.c       | 2 +-
 security/apparmor/include/task.h | 2 +-
 security/apparmor/task.c         | 5 +----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 6dd3cc5309bf..bbc9c8a87b8e 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -1446,7 +1446,7 @@ int aa_change_profile(const char *fqname, int flags)
 		}
 
 		/* full transition will be built in exec path */
-		error = aa_set_current_onexec(target, stack);
+		aa_set_current_onexec(target, stack);
 	}
 
 audit:
diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
index 13437d62c70f..01717fe432c3 100644
--- a/security/apparmor/include/task.h
+++ b/security/apparmor/include/task.h
@@ -30,7 +30,7 @@ struct aa_task_ctx {
 };
 
 int aa_replace_current_label(struct aa_label *label);
-int aa_set_current_onexec(struct aa_label *label, bool stack);
+void aa_set_current_onexec(struct aa_label *label, bool stack);
 int aa_set_current_hat(struct aa_label *label, u64 token);
 int aa_restore_previous_label(u64 cookie);
 struct aa_label *aa_get_task_label(struct task_struct *task);
diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index 84d16a29bfcb..5671a716fcd2 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -93,9 +93,8 @@ int aa_replace_current_label(struct aa_label *label)
  * aa_set_current_onexec - set the tasks change_profile to happen onexec
  * @label: system label to set at exec  (MAYBE NULL to clear value)
  * @stack: whether stacking should be done
- * Returns: 0 or error on failure
  */
-int aa_set_current_onexec(struct aa_label *label, bool stack)
+void aa_set_current_onexec(struct aa_label *label, bool stack)
 {
 	struct aa_task_ctx *ctx = task_ctx(current);
 
@@ -103,8 +102,6 @@ int aa_set_current_onexec(struct aa_label *label, bool stack)
 	aa_put_label(ctx->onexec);
 	ctx->onexec = label;
 	ctx->token = stack;
-
-	return 0;
 }
 
 /**
-- 
2.31.1


