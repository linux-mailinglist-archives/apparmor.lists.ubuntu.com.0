Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D1978BA2
	for <lists+apparmor@lfdr.de>; Sat, 14 Sep 2024 01:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1spFKk-0002Qb-TD; Fri, 13 Sep 2024 23:04:10 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1spFKj-0002QS-83
 for apparmor@lists.ubuntu.com; Fri, 13 Sep 2024 23:04:09 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 075163F5B4
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 23:04:09 +0000 (UTC)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-718ea25967eso3097987b3a.2
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 16:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726268647; x=1726873447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OTnUOaoWmgNhix5pddQbE5+qJ3wqC5N9HpV8aBwz7E=;
 b=aDCTVSoFhpJh9UGAS37+6Mydt8J6GybZppRgJdkOuOE6W42msELsbAugsfSBB1HcHF
 C2Zb+da6cj3Iefk/ElLBWtXiAw2Ft8zbuU0onT+3q0yvMUxHEy9sXUCgsfvabJjaBFg8
 4hmEw8Th3sHVZQN57XjMQsNH7qkhBB9zTT4UY3MkExB0utUa2813BTEaVAel6/y8YCND
 ICxHs6ZuKK2YOLLXyu1kbhunGxrusqkQ3Gikh9f3+gzI2o173UUWupMVYj/gi0lxGxdy
 PjSEhHvOtiXp1LeWYFJAkuFgPrEauSz0ktYwHT7ToKcWF0gyrKwBkuywDTGLOE29BRnv
 opOA==
X-Gm-Message-State: AOJu0Yx7N6Wr+gxxE3gEY8es0sI5zOmoPBoDTfeVtcdEKbVZ2DioU6Tc
 DP/k8tW9Aixjfl69wl+eXgMYc2AJgMXZtXCyFhrfLCTSa9+3QvlAMEngeUADtW8TL5Uef2Wp4F/
 rYiZuPl9asZLcYCl6Sgi5UJwPdFgbO7Gz04tBudKo02gk99BuVRsWC+B4MihWG5ZBFAPZ8RZ0SQ
 sLnjUM7g==
X-Received: by 2002:a05:6a21:e8e:b0:1bd:2214:e92f with SMTP id
 adf61e73a8af0-1cf75eaeaedmr10986506637.14.1726268647247; 
 Fri, 13 Sep 2024 16:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVCjbqMNFPPeyrwwDBnGFfFDtEJ/iucW8jn29g9vUE0ePFUqdBBpONewRYPqDR4lwd9JwVkg==
X-Received: by 2002:a05:6a21:e8e:b0:1bd:2214:e92f with SMTP id
 adf61e73a8af0-1cf75eaeaedmr10986461637.14.1726268646574; 
 Fri, 13 Sep 2024 16:04:06 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db49920497sm178646a12.45.2024.09.13.16.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 16:04:06 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Sep 2024 16:03:15 -0700
Message-ID: <20240913230325.1624331-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: hide aa_unprivileged_uring_restricted
	from userspace when io_uring is disabled
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

The variable aa_unprivileged_uring_restricted is still exposed to
userspace even when CONFIG_IO_URING is disabled and the variable would
do nothing. This patch hides both the apparmorfs entry and the sysctl
when CONFIG_IO_URING is disabled.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/apparmorfs.c | 2 ++
 security/apparmor/lsm.c        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index be6c3293c9e0..d1ea78c9122f 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2587,8 +2587,10 @@ static struct aa_sfs_entry aa_sfs_entry_domain[] = {
 static struct aa_sfs_entry aa_sfs_entry_unconfined[] = {
 	AA_SFS_FILE_BOOLEAN("change_profile", 1),
 	AA_SFS_FILE_INTPTR("userns",		aa_unprivileged_userns_restricted),
+#ifdef CONFIG_IO_URING
 	AA_SFS_FILE_INTPTR("io_uring",
 			    aa_unprivileged_uring_restricted),
+#endif
 	{ }
 };
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b086451f6e3..245207b005e7 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2462,6 +2462,7 @@ static struct ctl_table apparmor_sysctl_table[] = {
 		.mode           = 0644,
 		.proc_handler   = userns_restrict_dointvec,
 	},
+#ifdef CONFIG_IO_URING
 	{
 		.procname       = "apparmor_restrict_unprivileged_io_uring",
 		.data           = &aa_unprivileged_uring_restricted,
@@ -2469,6 +2470,7 @@ static struct ctl_table apparmor_sysctl_table[] = {
 		.mode           = 0600,
 		.proc_handler   = apparmor_dointvec,
 	},
+#endif
 	{ }
 };
 
-- 
2.43.0


