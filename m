Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 86387769088
	for <lists+apparmor@lfdr.de>; Mon, 31 Jul 2023 10:43:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQOUS-0007z0-OV; Mon, 31 Jul 2023 08:42:56 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kamrankhadijadj@gmail.com>) id 1qQN0b-0001gs-Dy
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 07:08:01 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so38448225e9.0
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jul 2023 00:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690787281; x=1691392081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfPe6oOYMMedBDB4xd574gcfMtPjOKfspfZcrHbarSk=;
 b=Cdnwf6zqQRk63GK1qy1/wvGs1oNzayMz08OpJcs+yhi/U80Uhm8GHkWzp6bAe+dVxm
 BHEofR6deiExpvMh5+0wRclXXQDNNxFVJBcesCSzW+MIMCif7sl+EYgDdS6lZQtOOuiK
 ivlpcMTAT4h8xbhQZklWioPSWOtYGtdWhkLN6az7Sj6g/chFLvB1EhJBaj9a5oaF0skY
 QQRwc50G/SFSCn3GyKscTq7Gtq4LFpxHLkcn2fIHJ94ryxtEH6MmIgpjXkdiKqf1+hKb
 zI6Pm8XuJni1d1drKG2ytivtMcDy4qz77eO+NRcv+uIn3YNzJlze1zw3+XISIl3mounl
 jJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787281; x=1691392081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfPe6oOYMMedBDB4xd574gcfMtPjOKfspfZcrHbarSk=;
 b=KYTzEdWqJiAgZecHBu9XLTHFHUczucWD9M48+Ryb8Yjax5SAWYQxhYidv5TOFNPqFK
 iiag+4q4tC7xJDXM+Z54IOD8MI7p8KDKvFRMYrajyFpUipB6wBct8541WlXU/+ilfOQV
 SXdDqHSozgJaElg/Aaff1Wy2c1Z2q/5V/nRlANCe7srykXtRdhkrswBSqY3qqFE87Wxr
 W8LXskqD5vLhYcLoSfU/o6X/PoDR4KHLBmqvOtd8gXOQppVU5/kC5MfKXeaYHnrwQjH+
 2n5rjVSMOC3snFNNgvg/DqDcytkYfZS32o6dMedh7YYrV9GHbbrPOgLFMFF5EQ0XdGPI
 Kpuw==
X-Gm-Message-State: ABy/qLbFJgsEMuAArvIJbMsLKeCQSo+iLI8V04gax3oDRW4eW4OwVcWX
 1fs7q3FGXhS0CQn5YG+tah0=
X-Google-Smtp-Source: APBJJlGupX3Wu9zlyxclnQH5I+YVUadh5sPcJ5XhfbMabFHBpNn8tRTHMj3IClfdyefQ0bOp5LzxNA==
X-Received: by 2002:a05:600c:b54:b0:3fa:9348:51a8 with SMTP id
 k20-20020a05600c0b5400b003fa934851a8mr4368451wmr.23.1690787280696; 
 Mon, 31 Jul 2023 00:08:00 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.65.235])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c1d0a00b003fd2d3462fcsm15114098wms.1.2023.07.31.00.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:08:00 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: paul@paul-moore.com, stephen.smalley.work@gmail.com, eparis@parisplace.org,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, jmorris@namei.org,
 serge@hallyn.com, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, john.johansen@canonical.com,
 alison.schofield@intel.com, ztarkhani@microsoft.com
Date: Mon, 31 Jul 2023 12:07:32 +0500
Message-Id: <e5d8757c7f9108aaf4bc2fd904b75244d2393174.1690786467.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690786466.git.kamrankhadijadj@gmail.com>
References: <cover.1690786466.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.41;
 envelope-from=kamrankhadijadj@gmail.com; helo=mail-wm1-f41.google.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 08:42:55 +0000
Subject: [apparmor] [PATCH 2/2] lsm: split cap_capget() declaration to
	multiple lines
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
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

cap_capget(...) LSM hook declaration exceeds the 80 characters per line
limit. Split the function declaration to multple lines to decrease the
line length.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 include/linux/security.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 8b7d0b2ec1a4..fef65d0e522d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -145,7 +145,8 @@ extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 extern int cap_settime(const struct timespec64 *ts, const struct timezone *tz);
 extern int cap_ptrace_access_check(struct task_struct *child, unsigned int mode);
 extern int cap_ptrace_traceme(struct task_struct *parent);
-extern int cap_capget(const struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
+extern int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
+					  kernel_cap_t *inheritable, kernel_cap_t *permitted);
 extern int cap_capset(struct cred *new, const struct cred *old,
 		      const kernel_cap_t *effective,
 		      const kernel_cap_t *inheritable,
-- 
2.34.1


