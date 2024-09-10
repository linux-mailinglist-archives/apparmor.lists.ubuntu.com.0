Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A397436D
	for <lists+apparmor@lfdr.de>; Tue, 10 Sep 2024 21:24:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1so6Tm-0002be-CE; Tue, 10 Sep 2024 19:24:46 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@toblux.com>)
 id 1so4zj-00014F-Rv
 for apparmor@lists.ubuntu.com; Tue, 10 Sep 2024 17:49:39 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42ca5447142so6673785e9.2
 for <apparmor@lists.ubuntu.com>; Tue, 10 Sep 2024 10:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725990579; x=1726595379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEMKhoKz265xTr0h6063lsKQJW8lu4nWZPLj+dKg/ak=;
 b=ETecAKHcS/4q60nvmrgbImboXgctqkPc7B7n8AwupN6fjT9p7riNoTaUBTZ5Jm4a3a
 nwmHjOyo0s16VhaKkYerkVw1hWj4Rn1A0S6gCTiABFRITmrpsrmGxth20mCKZtIqDYZy
 ymF2kzd4ZCZWLIfNAR3pkCzKh3GilrWtMaBz2P2Vr/m9LHDnZI8oOKmvDAZ4cVNDU5q3
 Cvaer5fC/fS4nVp3diB5GhkLLLRLKFwgvPrGednT6OV1fYkPrPRmAJ9KmdBX2lXV6H2T
 4b3Qm/rQSCmdC73G4xNZYiSuHEvwMH6ciJ7w3JaYnwuCRHWzwfPPScrIHNEFxTUk/LdB
 0Sdg==
X-Gm-Message-State: AOJu0YzgQ0Z4TsGL4jGi3f7Q3ADPBmIlH8Rfxsi/MgsNwITwMon1VWm9
 EOWoz1c884jL0aw8wSWtsAEpv0LsQXjoU6Lk5Vm8y7iNlDKXIThqaRI9Z7whgFs=
X-Google-Smtp-Source: AGHT+IHelw/uYw52OYmIixy02tvwb5mK2pkTzmGN8qQjLqO8V8gMqDEZAl0lSTYgOrrjILVgYICXyg==
X-Received: by 2002:a05:600c:4506:b0:426:6cd1:d104 with SMTP id
 5b1f17b1804b1-42c9fa0c6fbmr55373495e9.4.1725990578992; 
 Tue, 10 Sep 2024 10:49:38 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-91.dynamic.mnet-online.de.
 [62.216.208.91]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956dddacsm9399741f8f.107.2024.09.10.10.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 10:49:38 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Tue, 10 Sep 2024 19:48:37 +0200
Message-ID: <20240910174836.8966-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=209.85.128.43;
 envelope-from=thorsten.blum@toblux.com; helo=mail-wm1-f43.google.com
X-Mailman-Approved-At: Tue, 10 Sep 2024 19:24:44 +0000
Subject: [apparmor] [PATCH] apparmor: Remove unnecessary NULL check before
	kvfree()
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
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Since kvfree() already checks if its argument is NULL, an additional
check before calling kvfree() is unnecessary and can be removed.

Remove it and the following Coccinelle/coccicheck warning reported by
ifnullfree.cocci:

  WARNING: NULL check before some freeing functions is not needed

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 security/apparmor/policy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 14df15e35695..ce1c96cb2aed 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -103,8 +103,7 @@ static void aa_free_pdb(struct aa_policydb *pdb)
 {
 	if (pdb) {
 		aa_put_dfa(pdb->dfa);
-		if (pdb->perms)
-			kvfree(pdb->perms);
+		kvfree(pdb->perms);
 		aa_free_str_table(&pdb->trans);
 		kfree(pdb);
 	}
-- 
2.46.0


