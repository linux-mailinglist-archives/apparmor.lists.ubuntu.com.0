Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D5A5A3F1
	for <lists+apparmor@lfdr.de>; Mon, 10 Mar 2025 20:42:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1trj1P-0002Mq-RF; Mon, 10 Mar 2025 19:42:43 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1trj1O-0002Jr-Dn
 for apparmor@lists.ubuntu.com; Mon, 10 Mar 2025 19:42:42 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F0E4E3F5E4
 for <apparmor@lists.ubuntu.com>; Mon, 10 Mar 2025 19:42:41 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2254bdd4982so60128745ad.1
 for <apparmor@lists.ubuntu.com>; Mon, 10 Mar 2025 12:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741635760; x=1742240560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZb7CoYJD57cyyDZ4XoKCkHa31T8kAUGGj9FTUFOLD4=;
 b=rXdXPhMeS6LvZdoHLW1EUb007ToiV63XFHuklXz70/oyDclw1g5qeMDgt4DS+HKi6G
 aLFKy/y4oP0VKYQBJBlIz5IxL+1I0m3+w35p8NHYQZL+FVyGoNppb9F+LsDvV7GpCPJi
 1QpwSPZthrRiKzjc3s9sK5n6jQdXk2u1JlK0G3ktz02sVGREQD2vUNnQGBX6IjchkbaX
 SHsOpRO43Nwkn2hZqvOINp69mF/4v2N/sqzJ7xJ1YIZ/yq5t2O6wYbwOe+zV2n9AcmGK
 vyynK6J+FxJiRmHoI6rXh3SdSdEVkHbDkxhByhMLYEt0M6vMxF+EAaYhwu3w6GAoG09w
 N7jQ==
X-Gm-Message-State: AOJu0YwD024wTzoAS9yeYCBGq0BqQ/JXk/dGVsxyX0EUI4HVaFiT4HCj
 STFm1AbKpcKYR99kCneIOueN8/F341TL/VuikUb47NMHoo8klJyLZ6mTsdt5YTDQinv0ekNkJgl
 aqrDQ39YsqMGV3R9tE4MPegT5iMy6seQ9HM4j30p3UtoCmn3T1eh7K5nWMgZbtvmZurNMEKtvI2
 Ys6xy1/g==
X-Gm-Gg: ASbGnct6dVLQZYDkPd4qG4W25G9j3/AvuZvEdSfIe+o1UfPv/CgdO47OnDAfbaTMFwE
 D14JKrdRPEMN027QScU6P16kzUC476fqPOcEeYgQ83VatTGK3VaO0ow1pD7KaBslkb7oQ5WBj11
 +ORKmDOD+rYbwJmqq2pY+uPuyGEZsl+tbpo/1S13IBoQIPlbdNvYtTRHdpymyZ7Wj1MmRMnoqII
 EMp4faD7fMN0K/zl2X4R01N8TcI4Iek3dte1nvcs59lnSit/EhsFaS0zv7RFkpahE7mCIjvui8E
 Rl+bKzHGF2tmYyATguqbRaxY4qR5xp0tkP/0AGOlwGICVe5Bvm1MEIsmEVVlnE4enf9tgY8=
X-Received: by 2002:a17:902:da82:b0:215:a179:14ca with SMTP id
 d9443c01a7336-2242887b343mr179120105ad.2.1741635760609; 
 Mon, 10 Mar 2025 12:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5njTilaN3zgjAbPma9J+W1byYRCWn73oFwq8/ZhjbbF51+zuSDUCBqMuh5xKZT4z0FF+Qrg==
X-Received: by 2002:a17:902:da82:b0:215:a179:14ca with SMTP id
 d9443c01a7336-2242887b343mr179119975ad.2.1741635760339; 
 Mon, 10 Mar 2025 12:42:40 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736984f99bdsm8692245b3a.110.2025.03.10.12.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 12:42:39 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 10 Mar 2025 12:42:28 -0700
Message-ID: <20250310194230.112915-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: AA_BUG on null path mnt pointer in
	apparmor_file_open
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

We aren't expecting a null path mnt pointer here, and file_mnt_idmap
dereferences it without checking for null, leading to a null pointer
dereference BUG print. Instead, explicitly check for this via AA_BUG
line in order to get more useful diagnostics.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 45cc81234c0d..d0facedb1cfd 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -649,12 +649,23 @@ static int apparmor_file_open(struct file *file)
 
 	label = aa_get_newest_cred_label_condref(file->f_cred, &needput);
 	if (!unconfined(label)) {
-		struct mnt_idmap *idmap = file_mnt_idmap(file);
-		struct inode *inode = file_inode(file);
+		struct mnt_idmap *idmap;
+		struct inode *inode;
 		vfsuid_t vfsuid;
+		/* Set a dummy value to default-initialize the rest, and then
+		 * write the correct value to mode once we have an inode ptr.
+		 * Unfortunately, default-initializing everything with {} is
+		 * only supported since C23.
+		 */
 		struct path_cond cond = {
-			.mode = inode->i_mode,
+			.mode = 0
 		};
+
+		AA_BUG(!(file->f_path.mnt));
+		idmap = file_mnt_idmap(file);
+		inode = file_inode(file);
+		cond.mode = inode->i_mode;
+
 		vfsuid = i_uid_into_vfsuid(idmap, inode);
 		cond.uid = vfsuid_into_kuid(vfsuid);
 
-- 
2.43.0

base-kernel: v6.14-rc6

