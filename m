Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C95A5B5A5
	for <lists+apparmor@lfdr.de>; Tue, 11 Mar 2025 02:13:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1troB8-0005AP-Es; Tue, 11 Mar 2025 01:13:06 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1troB6-00054H-Fs
 for apparmor@lists.ubuntu.com; Tue, 11 Mar 2025 01:13:04 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 690BD3FCB1
 for <apparmor@lists.ubuntu.com>; Tue, 11 Mar 2025 01:13:02 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2241ae15dcbso101220715ad.0
 for <apparmor@lists.ubuntu.com>; Mon, 10 Mar 2025 18:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741655581; x=1742260381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NWDbbeXerdHAtwOhtI4fQ8Kd4Zq6g8hgeHrvZlw2ZPg=;
 b=nJ954eMIq0OIynAkPjMHgFu1jeika9xIeiKZboyIoX2vmZJYwG3BEem5airC916eOX
 BK5nQXEGmRMIgbky7z3kTY+ecw152JzZQ5NXAaDSD/3VsWJtGXdRsdBJ99ThWPfvo8m/
 qn5+KaXZ2elEc9YYPiAo2qW/tuLmuZxt9lY1Baiz8uFYMQ7V2Y5nhAqMnNH2NcZ3g+q1
 edPI1ex6eNet5mI875UA+mvuNEXgYx60Q2d8O+tmtxCwmcJvcIGC+KezIHxvrtzWey9j
 jIgDwJGDzeQEtI5rkYBtE5Mf9EOF1tmXdTCNvIUBfOu9IbdcZobxTKZ5HLqJIcGU5PQT
 zPWA==
X-Gm-Message-State: AOJu0YwWLJ2zyhZuCYjExbfgV3Zmfvaz5sU1c9obL0lMrzPC36ELPBDd
 By6uBKDTq80rxmTOiHP3lan5Elwwq2g2STXJYLAkPcqAvqB+Xgd5iO4VQ88xZaVo2oDKLg1PMLM
 eaIaqWxF+aJZbbwl0cKsqzJnV20qBPKvetseMP2MXIg99fQ7P1UJtqdg3bcu5Qex53IpHXicqm3
 9yaqbDOQ==
X-Gm-Gg: ASbGncuA3o5F7TlBrNRvr4bxPeSYHr3wAQCf8s5lOTxLQWUVwLqlWkeXEAnoSKIbCxw
 1Egk1TivccMcOZYxHKW98J6T9jRTVGlSWmRTj99ZZmBSJEWVHBcpaFo//018Vf+k0JaWjmN/DYb
 SpngrWyA/Z/iY4A0Dv8Uiowk2uzhEnDiUJM3hr2uy/43QV+Rkexnmf0ctPvwbor/TFtXu8r7lTm
 oSscnpJYQiqKBgy6NsGw2Jmt3OXzCS+w1GFoOTOhdjs4cYiw3xOG343vkPG0WcCPBA0efMD7A7I
 TR/LcibRwTeMk7Ql4RYh6Myqcvw1GGSs0KU6kRqUnagExWymzluULWld48lhLgPY/Xpj5h0=
X-Received: by 2002:a17:902:ce0a:b0:216:2bd7:1c4a with SMTP id
 d9443c01a7336-224289945b0mr253046935ad.26.1741655580897; 
 Mon, 10 Mar 2025 18:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgV5ihADACi1rF6wqdz1zfeDguZq+VPEhYDuB8x7loyHViPNzsip+6c26Lm3IiNLaX4yC3AA==
X-Received: by 2002:a17:902:ce0a:b0:216:2bd7:1c4a with SMTP id
 d9443c01a7336-224289945b0mr253046745ad.26.1741655580619; 
 Mon, 10 Mar 2025 18:13:00 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a7f93esm85075715ad.142.2025.03.10.18.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 18:13:00 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 10 Mar 2025 18:12:50 -0700
Message-ID: <20250311011251.2339837-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: call aa_map_file_to_perms just once
	for apparmor_file_open mqueue
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

aa_map_file_to_perms does not change the file, so the info extracted into
the allow variable can be used for the call to aa_mqueue_perm instead of
being computed again.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index d0facedb1cfd..11ace667cbbf 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -671,10 +671,10 @@ static int apparmor_file_open(struct file *file)
 		cond.uid = vfsuid_into_kuid(vfsuid);
 
 		if (is_mqueue_inode(file_inode(file))){
+			allow = aa_map_file_to_perms(file);
 			error = aa_mqueue_perm(OP_OPEN, file->f_cred,
 					       label, &file->f_path,
-					       aa_map_file_to_perms(file));
-			allow = aa_map_file_to_perms(file);
+					       allow);
 		} else {
 			/* will be intersected and reduced with each profile */
 			allow = ALL_PERMS_MASK;

base-kernel: Ubuntu-hwe-6.11-6.11.0-19.19~24.04.1
-- 
2.43.0


