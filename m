Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0B98E934
	for <lists+apparmor@lfdr.de>; Thu,  3 Oct 2024 06:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1swDiX-0007tl-JA; Thu, 03 Oct 2024 04:45:33 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <simeddon@gmail.com>)
 id 1svvzV-00089C-S8
 for apparmor@lists.ubuntu.com; Wed, 02 Oct 2024 09:49:54 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-719b17b2da1so4725489b3a.0
 for <apparmor@lists.ubuntu.com>; Wed, 02 Oct 2024 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727862592; x=1728467392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tnihw3sb3VGmUZFwHxGrK3Lpf3WXe1bOQ5reZibKIGo=;
 b=LAtbMya9KG93Qm3l8eBWi3BLsfcl8luaeiM/GhC2HskLNFW7FwkqwQ1S2/BIK1KbI0
 0ePppJJx4zVPEvDPx4k9H79Kv+JnRsEZQcAq9vQGf5npedLRpxa5tMoSo5uEVbPq8lPz
 pTg9rB77L7G3Nr9gtW99jImnIskqMVej3IXJvpLOfTG9OHziADHQ7ONQ8aHyPH5TKtLk
 ybzrWUVrZzJyg4CETRFbF/MkoReWYG+InA8h63iEncxyZYANgi0rGSsuIxsWBOf9mwWL
 icH7OokKrVCo3y7m1Y8CL2v92ag6e5H3YsxFHPRjATRsS/ppR/ysWBupWYyGZI2MDkOJ
 OCmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+xIzw3QaoVaPD002Gb4uO7UsJmbuY3NRfuMlMedQkD8nkNZLEKsdTKQtL2orjkteSQYxSEGbrpQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyAe9wOJ8JcIJvugLckDwCT/ZDfhQTyfm/W2HEgDjOks51SIz2Q
 5QyWJ5F6iUxrk6NMyWu+go1CtA8Ky5XTlVMjybj3+8umVV5Iiwjx
X-Google-Smtp-Source: AGHT+IGlstoxziNyyA3CxGvU8FbKI2ebLTHoEA+l6SJ79nXW0FohJOxUzWVjDM4rFl2XiK+k4SrRFw==
X-Received: by 2002:a05:6a00:170d:b0:718:dc17:3b83 with SMTP id
 d2e1a72fcca58-71dc5ca935fmr4613007b3a.16.1727862592014; 
 Wed, 02 Oct 2024 02:49:52 -0700 (PDT)
Received: from BiscuitBobby.mec.ac.in ([210.212.232.142])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b2653717esm9400460b3a.204.2024.10.02.02.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 02:49:51 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-doc@vger.kernel.org,
	john.johansen@canonical.com,
	corbet@lwn.net
Date: Wed,  2 Oct 2024 15:19:40 +0530
Message-Id: <20241002094940.55644-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.182; envelope-from=simeddon@gmail.com;
 helo=mail-pf1-f182.google.com
X-Mailman-Approved-At: Thu, 03 Oct 2024 04:45:32 +0000
Subject: [apparmor] [PATCH V2 RESEND] Docs: Update LSM/apparmor.rst
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
Cc: Siddharth Menon <simeddon@gmail.com>, apparmor@lists.ubuntu.com,
 shuah@kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
to enable and configure AppArmor. Since kernel 5.0,
`CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not used either.
Instead, the CONFIG_LSM parameter manages the order and selection of LSMs.

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 V1 -> V2: Removed historical information and addressed review comments
 Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..47939ee89d74 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+The CONFIG_LSM parameter manages the order and selection of LSMs.
+Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
+in the list.
 
 Build the kernel
 
-- 
2.39.5


