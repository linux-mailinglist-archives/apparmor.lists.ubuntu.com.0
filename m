Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C964591E4D1
	for <lists+apparmor@lfdr.de>; Mon,  1 Jul 2024 18:08:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sOJZi-0005xW-Ug; Mon, 01 Jul 2024 16:08:18 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <aleksandr.mikhalitsyn@canonical.com>)
 id 1sNDfp-0007jf-Fh
 for apparmor@lists.ubuntu.com; Fri, 28 Jun 2024 15:38:05 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EE91541333
 for <apparmor@lists.ubuntu.com>; Fri, 28 Jun 2024 15:38:04 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-57ca45d7664so164688a12.1
 for <apparmor@lists.ubuntu.com>; Fri, 28 Jun 2024 08:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719589084; x=1720193884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MsEnv/M0byq8XC93iPUcxrjaR6EQLTcXh9kYUPdB+BE=;
 b=XR6STU2eRrCpoW4ZokAUkknwqOAJtB5OH3OTlSFzd57wQEh4FFBCOdK8+8dxEfQuOT
 zWph4QckCRzlYe+POoY6Ih2rWH4wxt3yJuI8ElDezB164mKHZWtl71malpP4twmFVLfx
 N88qBa9/wGEMUxiO2j/uZKI4TqMdFvBT7W0S3ehHEXJIc6AUL80KrZaunh3YpsgPNTIb
 u65AwUWaN9tSaBVBzL2ezxwsjpuDppCxrDHZCmwc2Xl0hWEiBZAegavYNz8VYXygLVi6
 ti54QYIx2CrVFshlOJQLNqtInxUtp0i+DHy5ZiYhzqJCju2y6IIWhbQIX6PsZvnsSfSO
 aVtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOo6EzJ/vrsqqubWrLO1bpmRVQwfS9BwAJIMWiMI6atH6zR3K1tR3SAjYLWHXdjTTQldWj6KTrYsgDD3YoP7hD/zNZ+RqnK2bf
X-Gm-Message-State: AOJu0Yyyn0Ok8L7rfz1KqtaVQEGW0q4bH34tDP7uG2zJ2y84YENGJS0O
 6N6tvZ7HtR9Z3/9iwgtNoX5EqiWPKWeOUDRN+6UWmP1NgVGwvYqQyCOarnT79IJIiD8Alqi9nwp
 g9NNLdMI7Zo3t+SX6AzAy1acgA3OclByjNGPkvRm5onZF7OgcQzFh+FARsA3qdZMDR14YjZVpsg
 ==
X-Received: by 2002:a50:9ea6:0:b0:582:6eb6:2526 with SMTP id
 4fb4d7f45d1cf-5826eb6b1edmr10770153a12.27.1719589084178; 
 Fri, 28 Jun 2024 08:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcMeBrqelm0UsCNdD0vrQxedxQWDUu+xpgEbL98RcEO1wN4zX2klzsubVREOWWNGw8QAgCTw==
X-Received: by 2002:a50:9ea6:0:b0:582:6eb6:2526 with SMTP id
 4fb4d7f45d1cf-5826eb6b1edmr10770133a12.27.1719589083838; 
 Fri, 28 Jun 2024 08:38:03 -0700 (PDT)
Received: from localhost.localdomain ([91.64.91.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d50593sm1164329a12.60.2024.06.28.08.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 08:38:03 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: john.johansen@canonical.com
Date: Fri, 28 Jun 2024 17:37:12 +0200
Message-Id: <20240628153712.288166-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jul 2024 16:08:15 +0000
Subject: [apparmor] [PATCH] apparmor: take nosymfollow flag into account
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
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
 stgraber@stgraber.org, brauner@kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

A "nosymfollow" flag was added in commit
dab741e0e02b ("Add a "nosymfollow" mount option.")

While we don't need to implement any special logic on
the AppArmor kernel side to handle it, we should provide
user with a correct list of mount flags in audit logs.

Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 security/apparmor/mount.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 49fe8da6fea4..bf8863253e07 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -44,6 +44,8 @@ static void audit_mnt_flags(struct audit_buffer *ab, unsigned long flags)
 		audit_log_format(ab, ", mand");
 	if (flags & MS_DIRSYNC)
 		audit_log_format(ab, ", dirsync");
+	if (flags & MS_NOSYMFOLLOW)
+		audit_log_format(ab, ", nosymfollow");
 	if (flags & MS_NOATIME)
 		audit_log_format(ab, ", noatime");
 	if (flags & MS_NODIRATIME)
-- 
2.34.1


