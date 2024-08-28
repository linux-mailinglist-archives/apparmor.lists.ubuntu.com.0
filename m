Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EF9634A9
	for <lists+apparmor@lfdr.de>; Thu, 29 Aug 2024 00:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sjR6T-0007EN-EF; Wed, 28 Aug 2024 22:25:25 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1sjR6S-0007EA-5T
 for apparmor@lists.ubuntu.com; Wed, 28 Aug 2024 22:25:24 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F032F3F327
 for <apparmor@lists.ubuntu.com>; Wed, 28 Aug 2024 22:25:22 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-202563ba251so39765ad.1
 for <apparmor@lists.ubuntu.com>; Wed, 28 Aug 2024 15:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724883921; x=1725488721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynm9y//O68rzGlG4iIp7OGXPbmZziZkAPq7TldzTXFc=;
 b=V6vFhLFX9tSAILjUEOrn6DCCv5aNn77sSHdcrBghn/4sjcsnjlPXmbUSkbC1nb9r0G
 DshB+gcfmx46r8wQRznigBwbRhgyxSm2Mi4+4TJ9YbHVYje9eNHfaGHwDpfUKKITafxa
 k8XphoXzapKT5notWjuJmicGnRg2BkTVKb5AFBo0k+Y6cUYTnS/fDkUmHixYaOZKU+/K
 Znl6Y721LleSE/VjihSUSelXgfqQudYHR8Xj4YXuD98K5Otn8mk6l3LGYjevMGGikMRG
 J/sFvYLf0eMMYmmkgwsN/XYwtJ4oxcqrS8sMy8W/SkvlJhL2xKoMGSyD9jOMDYk8lGc4
 dEKQ==
X-Gm-Message-State: AOJu0Yw0C4CB5I6sx+e4VYMS9xmUsiPRt+d1zKqsEQ6pFIQi7iYsaCCV
 OEdZDKdaYgwXntZfP4BBft11yNvtSH9f4M0IFLK4kIGWdDdKf7TctFh7FbxoY3eZGCNSF/+HOj+
 2jYKPwHovAs4ILMkL1FULXkeXPdW/pz1SQj+RMiHpMGi7UktovQPpgo28E5oqd5JiGbHqwE4TSL
 dwun2qCw==
X-Received: by 2002:a17:902:f68c:b0:1fa:4b9:d00f with SMTP id
 d9443c01a7336-2050c4b1a61mr11271505ad.53.1724883921526; 
 Wed, 28 Aug 2024 15:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLvBSskrpLI+p8b7nVXqwTJeMPsL+mrIl1+8s7kSzBSFuWE3uRSICYK+YacME0JSVrG+TdwQ==
X-Received: by 2002:a17:902:f68c:b0:1fa:4b9:d00f with SMTP id
 d9443c01a7336-2050c4b1a61mr11271315ad.53.1724883921033; 
 Wed, 28 Aug 2024 15:25:21 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855665b3sm103546185ad.35.2024.08.28.15.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:25:20 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 28 Aug 2024 15:24:46 -0700
Message-ID: <20240828222500.615911-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: replace misleading 'scrubbing
	environment' phrase in debug print
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

The wording of 'scrubbing environment' implied that all environment
variables would be removed, when instead secure-execution mode only
removes a small number of environment variables. This patch updates the
wording to describe what actually occurs instead: setting AT_SECURE for
ld.so's secure-execution mode.

Link: https://gitlab.com/apparmor/apparmor/-/merge_requests/1315 is a
merge request that does similar updating for apparmor userspace.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 9914a2b130de..c89f4222f2e9 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -720,8 +720,8 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 
 	if (!(perms.xindex & AA_X_UNSAFE)) {
 		if (DEBUG_ON) {
-			dbg_printk("apparmor: scrubbing environment variables"
-				   " for %s profile=", name);
+			dbg_printk("apparmor: setting AT_SECURE "
+				   "for %s profile=", name);
 			aa_label_printk(new, GFP_KERNEL);
 			dbg_printk("\n");
 		}
@@ -799,8 +799,8 @@ static int profile_onexec(const struct cred *subj_cred,
 
 	if (!(perms.xindex & AA_X_UNSAFE)) {
 		if (DEBUG_ON) {
-			dbg_printk("apparmor: scrubbing environment "
-				   "variables for %s label=", xname);
+			dbg_printk("apparmor: setting AT_SECURE for "
+				   "%s label=", xname);
 			aa_label_printk(onexec, GFP_KERNEL);
 			dbg_printk("\n");
 		}
@@ -970,7 +970,7 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *bprm)
 
 	if (unsafe) {
 		if (DEBUG_ON) {
-			dbg_printk("scrubbing environment variables for %s "
+			dbg_printk("setting AT_SECURE for %s "
 				   "label=", bprm->filename);
 			aa_label_printk(new, GFP_KERNEL);
 			dbg_printk("\n");
-- 
2.43.0


