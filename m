Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 50453A21BBA
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5t9-0004eV-HB; Wed, 29 Jan 2025 11:05:43 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1tcW7g-0004JL-0l
 for apparmor@lists.ubuntu.com; Mon, 27 Jan 2025 20:54:20 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aa66c1345caso218903766b.3
 for <apparmor@lists.ubuntu.com>; Mon, 27 Jan 2025 12:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738011259; x=1738616059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5S+oczGlbkqFclKhQnfKDCJ4c9QxcLjwIDgTTGQqSEI=;
 b=R/na/Q3W4UEXw6uJScUdjU3B95NLxglcBrh0qjSVXJ2Tg6WGGLky+vCi5dRdZm3vZW
 rGL7WMTqTRQ/9X5ThTed/ycsGKky6z4FRB0NPN8UrctsD3qwfV8UexpYDnqF7ABAKSnc
 fo2YP4sK33jlaIHC5GY53nSSGfwjRRTtocLXQcqTLIBizxmKuX6nlxt/egKFc9GPEDN+
 0f+wGKgj/g1SXpEWg3ZFFCewp4adfsamNe8iLm0i6K0vv380bbnExzgGOrhddsQl/0So
 RvEUu7ON7lMK6zfXRhGvHVKtgJl0FSVluZ7iB/jkqEqHSOWtb2DXAZVxb7ejVYtiSZ3p
 3bQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOxU6dyCZx+i4DhutBYxILdByC6ZIApLSV7oi/LDLSFM44PSRRkqLWUOQOq2IlaRBlbQEMFOra0w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx5CkvMS2zoy6h0FlHEpWLPpFNDf0iiWbMmGb+kFO7uEZEKil7W
 WXlcjeS4Gq2pUsVpj2oJIrqYK1Dtlu6g8ZNtgkDLULPA4c2isUtI
X-Gm-Gg: ASbGncvoK4/I/+nCVU2FKJsqPXScECm9It0izGdlMIboG0U9aQDyLN7rYpLs5UZdagj
 Hf3a3ksPnBryDXY4rHABaS+hloWVEu/ml35YnekQbvyb533Ftd0fK68c14Dj+pFrZ4KfCkH0Ei/
 GEjf3pcaaK18vaGshThTvr9J1l1f1C+Rl8mUFsRO9wYCcaRr1kW8VXAtEET6MU1m2GWYJFrxJR/
 t2P157um291NdcM+uF/ff8GcHiyV9nzruAz0I5rjcAwRViokGZJDn/O9tOu7WGO+N1vjPrTur4z
 ZPJUpIWGHMjYOl8E1SvR8rJBNhvAJVs=
X-Google-Smtp-Source: AGHT+IGSybohYJwJF4LlLHrCwkHM4EjS8F85YxhhPGJdtoaLijjuxVEoGxvQZHZbt+LA/sSLfVSMqA==
X-Received: by 2002:a17:907:7e82:b0:ab6:6017:6442 with SMTP id
 a640c23a62f3a-ab6601764c8mr1998793066b.35.1738011259040; 
 Mon, 27 Jan 2025 12:54:19 -0800 (PST)
Received: from f.. (cst-prg-86-17.cust.vodafone.cz. [46.135.86.17])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e12090sm638908266b.29.2025.01.27.12.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 12:54:18 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: john.johansen@canonical.com
Date: Mon, 27 Jan 2025 21:54:04 +0100
Message-ID: <20250127205404.3116679-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.49; envelope-from=mjguzik@gmail.com;
 helo=mail-ej1-f49.google.com
X-Mailman-Approved-At: Wed, 29 Jan 2025 11:05:41 +0000
Subject: [apparmor] [PATCH] apparmor: use the condition in AA_BUG_FMT even
	with debug disabled
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
Cc: linux-security-module@vger.kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 apparmor@lists.ubuntu.com, paul@paul-moore.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This follows the established practice and fixes a build failure for me:
security/apparmor/file.c: In function ‘__file_sock_perm’:
security/apparmor/file.c:544:24: error: unused variable ‘sock’ [-Werror=unused-variable]
  544 |         struct socket *sock = (struct socket *) file->private_data;
      |                        ^~~~

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

Plausibly the sock var wants to be eliminated altogether, but I just
want this to build.

 security/apparmor/include/lib.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/lib.h
index 256f4577c653..d947998262b2 100644
--- a/security/apparmor/include/lib.h
+++ b/security/apparmor/include/lib.h
@@ -60,7 +60,11 @@ do {									\
 #define AA_BUG_FMT(X, fmt, args...)					\
 	WARN((X), "AppArmor WARN %s: (" #X "): " fmt, __func__, ##args)
 #else
-#define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
+#define AA_BUG_FMT(X, fmt, args...)					\
+	do {								\
+		BUILD_BUG_ON_INVALID(X);				\
+		no_printk(fmt, ##args);					\
+	} while (0)
 #endif
 
 int aa_parse_debug_params(const char *str);
-- 
2.43.0


