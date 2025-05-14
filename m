Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C9AB66B7
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 11:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF7zu-0004xK-5q; Wed, 14 May 2025 09:01:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <lbulwahn@redhat.com>) id 1uF6Jd-0006yL-8q
 for apparmor@lists.ubuntu.com; Wed, 14 May 2025 07:14:09 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-gVkMSOmQNrKUGi0C42pIgQ-1; Wed, 14 May 2025 03:14:06 -0400
X-MC-Unique: gVkMSOmQNrKUGi0C42pIgQ-1
X-Mimecast-MFC-AGG-ID: gVkMSOmQNrKUGi0C42pIgQ_1747206845
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5fba56df298so5619712a12.1
 for <apparmor@lists.ubuntu.com>; Wed, 14 May 2025 00:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747206845; x=1747811645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhtvBP/MCitR1ftSZRMeSHLdRQ2xIQHL23q4ybZlF48=;
 b=UsvRch4A6eWVERxtIWbjJ/OjWec1Kk43HDtafb8z3oxJ72AwTXf7I93smlnBth2BY9
 0qIgo75yDcbhAxldJ/ahwJCGT/825ljPUiDg9o23qcn0o9SC+iKNh9+XjNhQT/FIWW44
 aemP7vFdWOlmhXoIrheRR/LgsPfk2F9Qh3LM8bZD6VobYc38Su9LI44tunSO9gQ7KO/+
 bcSeo1sk1eXUR3DOir6dVR6JTkOE+ZsO08KGEMYQtlkEanBLYsc+ulcziyPoe8vqEUHo
 hHwCglToP5SXgGMkCaOQNyMSE3Jk7Xm8p245PYlojLCDTgKTeLuWXuZd4yp5Ywy3+yGl
 CCRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkAF4qFx5dQQvpa3cd8KoH1N6w6KZEj35wcGFBCrFUaB7HA4C+qwWgylyG/U5WQvpTTWWuj3Phcw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzCz0bV4VSQKo08xibTmQa+/NEGHvsQf9gto4p3FIHqy9I/yWDJ
 +mgzM0e8PJrhI9u52KeW1AvopNk++1g7us+K0CmP6SzH/5tf673oSBwbAXHd65/xyL7z5VahyhL
 KIvNVJYCm8Ob1xATHeQ6q85ooYALGvClMxFWjBgb0O88krBkOM98E9GAUOA==
X-Gm-Gg: ASbGnctqp7pzJihgavBL+xAQWMIeSJaEJCW5z1kh/8TCL9VBjzfkKiBJij3Rgbr3eQq
 k/HEJc5QqW23TrH35a4Lfv3/32fNd+772PCbU5oMLtlB//FaOvYTt2ag25/BWCK40vTY8lgokKo
 oDMpHHVdjgjfYdmHqlIyE3ywjYYhUdofUJoz/9E+nuo8lo7E3lA4ZEL6kjgAnd3U8k/pa6XzwwX
 /C+5Fi0+jDPNQ8+tWM4OttL9Xj1TJBGdgmkr7jNCHt4wx7WXRGfEVjzb9DphMMBUBWnrOVxD/r1
 vTfbjwvLITATIHLsPa1KXIUPU2g9BkVPq201BiHM3/ctdAXqJrYqzpNy/w==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id
 a640c23a62f3a-ad4f74c9000mr222005566b.49.1747206845222; 
 Wed, 14 May 2025 00:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxaAR2Q+5d92tWC9EC6K77qjGuYdoWqzESwAbtU31oqD51mMNX4L5oV+Owa01qzyfNoY/kiQ==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id
 a640c23a62f3a-ad4f74c9000mr222003266b.49.1747206844830; 
 Wed, 14 May 2025 00:14:04 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23f5f6fddsm653162866b.93.2025.05.14.00.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 00:14:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Wed, 14 May 2025 09:14:00 +0200
Message-ID: <20250514071400.465055-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z6IaZ7UrwAbSHLxDGTu4Mwx5YN6AdTFbrNeGsm_hj44_1747206845
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lbulwahn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Mailman-Approved-At: Wed, 14 May 2025 09:01:51 +0000
Subject: [apparmor] [PATCH] apparmor: Remove obsolete config
	SECURITY_APPARMOR_DEBUG_MESSAGES
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
Cc: Lukas Bulwahn <lukas.bulwahn@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 71e6cff3e0dd ("apparmor: Improve debug print infrastructure") makes
the config option SECURITY_APPARMOR_DEBUG_MESSAGES have no remaining
effect.

Remove the obsolete config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 security/apparmor/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index 64cc3044a42c..3cdea783b6df 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -35,15 +35,6 @@ config SECURITY_APPARMOR_DEBUG_ASSERTS
 	  points. If the assert is triggered it will trigger a WARN
 	  message.
 
-config SECURITY_APPARMOR_DEBUG_MESSAGES
-	bool "Debug messages enabled by default"
-	depends on SECURITY_APPARMOR_DEBUG
-	default n
-	help
-	  Set the default value of the apparmor.debug kernel parameter.
-	  When enabled, various debug messages will be logged to
-	  the kernel message buffer.
-
 config SECURITY_APPARMOR_INTROSPECT_POLICY
 	bool "Allow loaded policy to be introspected"
 	depends on SECURITY_APPARMOR
-- 
2.49.0


