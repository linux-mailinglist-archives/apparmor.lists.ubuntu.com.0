Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D4A45109
	for <lists+apparmor@lfdr.de>; Wed, 26 Feb 2025 00:51:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tn4hi-0001Ur-CK; Tue, 25 Feb 2025 23:51:10 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tn4hg-0001Ui-Qk
 for apparmor@lists.ubuntu.com; Tue, 25 Feb 2025 23:51:08 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 62E3350316
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 23:51:08 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so20178064a91.2
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 15:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740527467; x=1741132267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOmtCwwGMXn34aFuUF5ZiYKFHK80o30STiBUQlN0+7w=;
 b=dYLdi+C0QEZfTJfYJAQO+8uuEMWYHPzJcozKFM6kZP1lmEPUScmHNsXigeK079DSJB
 LNXxcx5a9zZGytpntzABpr4IyDNZnikUw0bIiMyPLztDXRwO9U+U90OMtc1ubwwCe3+1
 iyJ/ReiMHKur7GsQnDNxB9tF/iDcAlscErpw1VFV3FUlEVfokVWGZ7zYfuIPIndgopMO
 o92NgYapk+1FgbAypAl8KNEiFcs3VkLanijKIu7ky2tHBbbK0GL+8aXznU3XvFopQ1DG
 UZ21vikPtw34qVoyE8qw/F002bOSTair5e+QjVSHFXJg6yz6FUuSWYoU9M18fbxxknzp
 Enmg==
X-Gm-Message-State: AOJu0YyRHAt0VRoY1F6EGZVM1DSyeuNy24h3cuBEHavODXvmLV/VPSDa
 1uS+7cD/0A4vbUMOvCb+y+xNHprwOTThcz392Rgj4oxyQmxtsMHxxso9ZTLnCoT9mYv31FtCrR6
 rblicug7rHGfd93vmBd+do5kmCg/y9Xbw3rvKoTYNaBueSq3X9hImATpfurRSXqjqpTYy5VbPEU
 5t+trxBw==
X-Gm-Gg: ASbGncsJKxzHOKJGI3uLF2/zGLZRiL+UxkRkCbFEz0MVHfYGwjV2w1OI+97n3F+W/eu
 KVlAW52wFltA4Rhu5MEy+1p6FzLfrJNh3R+GdzGYksmkfNjbP7tBIlLazPdHs3XKiWo9WBLyZQg
 TqchO+L3VzYR/1R+2y15+nZUZPkpi3MBqvUPJol0JQCpYAi9wIgqhxCL0/K6T3qBmk6jWqaZ7ty
 adclt4zH7OQLyk2X152acZumZAknjX/tJpIMg7Z2HjcagBA7LnzBdUXdIWFfhDBWcF+019n+Ciz
 pFe9w2+3xfqaVxwbqpJtM+uFFMH5QxqHsrc6K6mZ1gFokxsy5uzF+oHKP0MRzwHbi1KDoUQ=
X-Received: by 2002:a17:90b:2e08:b0:2f5:88bb:12f with SMTP id
 98e67ed59e1d1-2fe68ae74ebmr7285769a91.21.1740527467027; 
 Tue, 25 Feb 2025 15:51:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZQEGRuE9Rz6RLWl86tVQ2WcGekha+/VC4P5OftSLgBOJPtFmxi4Y52y29ud7TzA95U7BN8A==
X-Received: by 2002:a17:90b:2e08:b0:2f5:88bb:12f with SMTP id
 98e67ed59e1d1-2fe68ae74ebmr7285743a91.21.1740527466659; 
 Tue, 25 Feb 2025 15:51:06 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe8284f076sm147823a91.42.2025.02.25.15.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 15:51:06 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 25 Feb 2025 15:50:51 -0800
Message-ID: <20250225235054.530607-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: use GFP_ATOMIC for aa_dup_audit_data
	in check_user
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

aa_dup_audit_data is called in check_user (file.c) with GFP_KERNEL, which
is in turn called by aa_audit_file through path_name. GFP_KERNEL allocs
may sleep, but the file permission hook that invokes aa_file_perm is
called in an atomic context that doesn't allow sleeping:

BUG: sleeping function called from invalid context at include/linux/sched/mm.h:337
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1821, name: 5
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
|3 locks held by 5/1821:
|0: (&sig->cred_guard_mutex){....}-{3:3}, at: bprm_execve (fs/exec.c)
|1: (&sig->exec_update_lock){....}-{3:3}, at: begin_new_exec (fs/exec.c)
|2: (&newf->file_lock){....}-{2:2}, at: iterate_fd (fs/file.c)

Call trace excerpt:

aa_dup_audit_data (security/apparmor/audit.c)
aa_audit_file (security/apparmor/file.c)
? srso_alias_return_thunk (arch/x86/lib/retpoline.S)
path_name (security/apparmor/file.c)
profile_path_perm (security/apparmor/file.c)
aa_file_perm (security/apparmor/file.c)

Switch the allocation flag for that call to GFP_ATOMIC instead.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 79e5307090e3..f7ccab51d416 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -142,7 +142,7 @@ static int check_user(struct aa_profile *profile,
 	int err;
 
 	/* assume we are going to dispatch */
-	node = aa_dup_audit_data(ad, GFP_KERNEL);
+	node = aa_dup_audit_data(ad, GFP_ATOMIC);
 	if (!node) {
 		AA_DEBUG(DEBUG_UPCALL,
 			 "notifcation failed to duplicate with error -ENOMEM\n");
-- 
2.43.0


