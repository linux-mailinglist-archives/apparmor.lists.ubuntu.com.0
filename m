Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E47A18D6A
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpL-00041J-7R; Wed, 22 Jan 2025 08:11:07 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <dheeraj.linuxdev@gmail.com>)
 id 1taBEa-0002uk-Dp
 for apparmor@lists.ubuntu.com; Tue, 21 Jan 2025 10:11:48 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2163dc5155fso101172695ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 21 Jan 2025 02:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454306; x=1738059106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4GhAgdGPJao5oBQSTGd+M55EpKH1+oHBv+vxevMflk=;
 b=jbBSaGn4uCpo4Lq3jsAcYbsOX1FqV5yLEFtX4L/VWaAxsgfkJSf1/MYIwYTyHcSxV6
 Ci+Sf/jHFpdaJfaglj2oGbx+KKYQSVsXk6YoB3dmtDXEQ9wwrp3XrmVNgSDkabeAsCw6
 W3+WaeZI4Nno9BO6jnPUh5oksZPEHUik35KO1MlcY2w7xShagVMimKNYAowFG2kTO+gh
 zZ22b0Og84QKko48ddBJKbffc0eXPWc18xAi1l40s9jrKXFegAp0uo+lreFSpcuJ0xrV
 NTSkYl87pKNdvopmdDv5x+jrtLQtpen4OiPERGpLEl/Itt7Inv0cHs+n51xdviHPmtTv
 SLXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLqVj9XFVMRQ3f3pxt8OFD51kkOvD+XAUuz8s7kzlnG7PhGApqWzBl8JnVeU5QiH3LFpWHmstKeg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwZRhNhTA1REx0Wmn6pMBn+F8oEEWsz2SokvcB71i3aV7GHBVkD
 e6aRKQ7moUoNn3Ax++uW+BBBEQL7uWKU2S7KX4Ecy1BYe0jHJoaO
X-Gm-Gg: ASbGncuyE0gcvgB/XgIj3ca371Xb9/gemF4lXr5zg6h6A4Ee/2YjrLwgdehzeplm836
 6i70Y4Kpc83av1KDlbX19MAE2CHd1Zp7uXv7VdQ+21uxwiu4k0hnJFkrQ1XSGfES1WiWQiCb5mQ
 uRII+36+4Bph8o3omPFlxoNucLlZ9UedkNF7Hzk3hwmkP5emnVytSbp68ousIaNrvf7w7mqL89j
 ggkLwIloNG8cF85b8JcMNyk4MPp/WSQCv9SRyP6bx9qKY+nB13AS5h9uVSRkpyvR+t8EbktUw==
X-Google-Smtp-Source: AGHT+IF6jOOijDRlgAzivw8DReYi5rs58LTDAI7B2+ElM37sm5S/cFLuCYJWzorRK9MfaRj2u+IjKQ==
X-Received: by 2002:a17:903:1ce:b0:216:4a06:e87a with SMTP id
 d9443c01a7336-21c355dc64bmr254887485ad.40.1737454306461; 
 Tue, 21 Jan 2025 02:11:46 -0800 (PST)
Received: from HOME-PC ([223.185.135.17]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d402d61sm74580295ad.229.2025.01.21.02.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:11:45 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: john.johansen@canonical.com,
	apparmor@lists.ubuntu.com
Date: Tue, 21 Jan 2025 15:41:38 +0530
Message-Id: <20250121101138.116675-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.181;
 envelope-from=dheeraj.linuxdev@gmail.com; helo=mail-pl1-f181.google.com
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:04 +0000
Subject: [apparmor] [PATCH security] apparmor: fix logical error in signal
	range validation
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
Cc: paul@paul-moore.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org,
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix logically impossible condition in unpack_profile() that made the
signal validation code unreachable. The function was using && instead
of || when checking if the signal value is outside the valid range,
making it impossible for both conditions to be true simultaneously.

Update the condition to ensure proper range validation.

Fixes: 84c455decf27 ("apparmor: add support for profiles to define the kill signal")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 73139189df0f..e643514a3d92 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -919,7 +919,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 
 	/* optional */
 	(void) aa_unpack_u32(e, &profile->signal, "kill");
-	if (profile->signal < 1 && profile->signal > MAXMAPPED_SIG) {
+	if (profile->signal < 1 || profile->signal > MAXMAPPED_SIG) {
 		info = "profile kill.signal invalid value";
 		goto fail;
 	}
-- 
2.34.1


