Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C19DBD6E
	for <lists+apparmor@lfdr.de>; Thu, 28 Nov 2024 23:00:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tGmYj-0003z4-Jo; Thu, 28 Nov 2024 22:00:25 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tGmYi-0003tN-3A
 for apparmor@lists.ubuntu.com; Thu, 28 Nov 2024 22:00:24 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BB63A3F2A0
 for <apparmor@lists.ubuntu.com>; Thu, 28 Nov 2024 22:00:23 +0000 (UTC)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-7f8af3950ecso956029a12.3
 for <apparmor@lists.ubuntu.com>; Thu, 28 Nov 2024 14:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732831222; x=1733436022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pdg8AlLHLotjLO6thm7/4gyzA2eYiQ3jfgX04ekfVXg=;
 b=MFNfsJBIZoTcTQx4y8OblYzzn+xMsunL2SOuNCwQ/UrKRqtM5CEOEbUixb8ffIxd8V
 cktOHpMCCvlFRpnSx4XT73z6YfFPI50Xd2ts00GMcIW19/i/SHj+tUOYlAYF25EEKSvJ
 uy7Wtfoh/qsIhVqcgQsQpjuNHb+/woS4Pzez1GDwR9CsdW83e+mBzJrH+5btVtSyqUhy
 lOUJxU/y/sOh76y19BO2b4u2YjkH87K/3+VzbCpKFlYLT3X8xkd+Q2aFqCxWKHXULopf
 iRI5aAlHxMkhEdG6KlOHSs5J0SnCxQbpdXtPQU5zNslVN9PlWcr+b/now1SQmM/kctgE
 GIzA==
X-Gm-Message-State: AOJu0YxRhh4hfti7VuCAoOMo3zxPg8ixmYHz3P+8x6DOI9CPJAMqc4c3
 Ru2sXwSwgg4FVMGlJeiyOzZNN4CVeS7jZPUQDj+6KL1tMNLmK7m1zgAALVNukZzeU4qKMXiA7MS
 XspnCtcDUL2olIOEvmX4o9Wjwsv5bfpnO5XzXmxHIOBEQpJ+XD+F1ZGP3zR0m5yEMgKUbWs2ZB1
 9pmvwH8g==
X-Gm-Gg: ASbGnctsEr2uUEjC+phc0rz9IjQggFSQJnx0Zv1EtWDw6qZhQhY/ilmCvGyRDqMYkpa
 1gxu/i9xyMKM/Pf1xIzOJuWXinrf4kDwGUa4dazpBWBzHboTrzFG/RyDo3eOYDezopL+t6lSs11
 jr1POfAcFjRy/mjXgfFQargaRXknFkcZgyTeLKRDmJ0RTmi2/FuCdUfmSHlpwK02sgBVf3JhIKJ
 ETBr+/+X83CHhYwQ0ON3ZnRKYhnkWIIO2ooEjS7G9lpgF1gAyFLtGo1sGetFwFjMd2ZIYDLJsqi
 zMjyij4BsyxOZWpmzpCLEZheKS9LoA==
X-Received: by 2002:a17:90b:4b8e:b0:2ea:8fee:508d with SMTP id
 98e67ed59e1d1-2ee097bf308mr10905379a91.30.1732831222127; 
 Thu, 28 Nov 2024 14:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnNO+mTpCc4yl5ocuJ/08ABoCT4wGp28STfgVpY7SKiXgzgR0nmTabDv/tFEmjGuKD8xbuQQ==
X-Received: by 2002:a17:90b:4b8e:b0:2ea:8fee:508d with SMTP id
 98e67ed59e1d1-2ee097bf308mr10905344a91.30.1732831221825; 
 Thu, 28 Nov 2024 14:00:21 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ee0fa47fbasm4030261a91.13.2024.11.28.14.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 14:00:21 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com,
	john.johansen@canonical.com
Date: Thu, 28 Nov 2024 13:58:38 -0800
Message-ID: <20241128215911.237700-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: audit mqueue-via-path access as
	getattr instead of unlink
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

Running `ls /dev/mqueue` under a profile that does not include mqueue
rules would produce apparmor logs like

apparmor="DENIED" operation="unlink" class="posix_mqueue"
profile="mqueue_testing" name="/" pid=4791 comm="ls"
requested="getattr" denied="getattr"

that audit the denial as an unlink instead of as a getattr.

Not only was apparmor_inode_getattr passing in a hardcoded OP_UNLINK
to the common_mqueue_path_perm helper, but the helper was also discarding
the op argument and auditing as a hardcoded OP_UNLINK. This patch fixes
both of these issues.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 245207b005e7..c6a06d504b1e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -470,7 +470,7 @@ static int common_mqueue_path_perm(const char *op, u32 request,
 
 	label = begin_current_label_crit_section();
 	if (!unconfined(label))
-		error = aa_mqueue_perm(OP_UNLINK, current_cred(), label, path,
+		error = aa_mqueue_perm(op, current_cred(), label, path,
 				       request);
 
 	end_current_label_crit_section(label);
@@ -482,7 +482,7 @@ static int apparmor_inode_getattr(const struct path *path)
 {
 	if (is_mqueue_dentry(path->dentry))
 		/* TODO: fn() for d_parent */
-		return common_mqueue_path_perm(OP_UNLINK, AA_MAY_GETATTR, path);
+		return common_mqueue_path_perm(OP_GETATTR, AA_MAY_GETATTR, path);
 
 	return common_perm_cond(OP_GETATTR, path, AA_MAY_GETATTR);
 }
-- 
2.43.0


