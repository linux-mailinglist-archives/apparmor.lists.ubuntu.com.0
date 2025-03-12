Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A507EA5E675
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:23:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXa-0000gg-Eq; Wed, 12 Mar 2025 21:23:02 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXY-0000e0-Nq
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:23:00 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BE0EE3FCCF
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:59 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff799be8f5so517156a91.1
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814575; x=1742419375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxXlT+NKuH/R8o+IpND8qEtQPr3+MVFoHvHlcLQeNOw=;
 b=mwMd/2n8PbnSADc6Kw/xQjHtcTI+Vzkj9/Xh4E+RvqxgH1shQXsHHGIu4WufUoxCMq
 PTHselLRZHaXgfWGuX9Qbvlgmc5HvFyVnH4Zq6gofoxIles3gACjKbGczPAfNxY0t3N0
 SIV9HcbScdLP+zmlswIEw4fjIuf3NOvALzteCNdzXKacIW2HwWfaU97UPrcPyItShEH6
 xu9lmTqOVVVaV0hTjP4wfmIUeOfZzApUWO9DgyWuyysyAtyc7v0oe2GcdknTfbk5FVY4
 K+ZR/zPI8G+VyeSEciFXCxfheFAPJHXDVKDHKFM5tNsID8ulhdcZ0C02JuCj+65Q97TL
 QEmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa8E3q3oqn9j2gaxjlGVmfnwkpCS0ZB6MlXw5laqDhqbGvH0xuHSEp2SvdhCURJyp0UgTDuYf0Pg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxTdToyKlffMzqjmV1Olk0FSMWz3y6airNGYzPWroJSFRBGN19U
 cRPfbHm/W2IgmTGojyU9aii1mT8R8Eg+bwZ74914zOXflvwZgeQ4IMtkKGFapVYPLymHqPq8dHz
 aXvz7XaeR2Y8mF65knM8DHdVwM1ci4lbsATpYvrzMHrB2/UGG2T7Bt/+ykh0C0EtXKDLwyGoRLg
 ==
X-Gm-Gg: ASbGncs6iXWzirCN8xm18APAkfhwB+wQvFWalOTzzB0qDxBf36LmfMaJedB8IS6Qtn6
 nWwfnWfEA+mMwCVWJluHBvM50SNk9drJOoIwGxPMKLkj87yZcT52fb9QJxDp3LQDp3y5FaU/enH
 FPVQymaqXKbQECdok0mvD7pfovbHPar1lCfPeYMropVlC1cJLDIv7mvdx5SfFUQ43kygkVlXNei
 F185bTymnHNBN/bCxChXwV26IvxvmQUquTKUGN4VClI4zIVIJrJVaA0WbEE+1SewHjEQpc3cUAI
 +EOzXmEJgDFcI7PNvXVA55dSb4iJhq+4GINaXUvDjvQwUJe2LEb7mmQU4T7l52VdzsP/Veg=
X-Received: by 2002:a17:90a:7345:b0:301:1bce:c255 with SMTP id
 98e67ed59e1d1-3011bcec36fmr4989227a91.27.1741814575231; 
 Wed, 12 Mar 2025 14:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7VJ3I6Ag0U5c89zoKAvdV8xkokC+gkGPKK5VTC7ZbVdDme14D+x+zHYl4u3ZWPKhOLxMFvA==
X-Received: by 2002:a17:90a:7345:b0:301:1bce:c255 with SMTP id
 98e67ed59e1d1-3011bcec36fmr4989199a91.27.1741814574931; 
 Wed, 12 Mar 2025 14:22:54 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:54 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:46 -0700
Message-ID: <20250312212148.274205-7-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 6/6] tomoyo: explicitly skip mediation of
	O_PATH file descriptors
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Now that O_PATH fds are being passed to the file_open hook,
unconditionally skip mediation of them to preserve existing behavior.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/tomoyo/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/tomoyo/file.c b/security/tomoyo/file.c
index 8f3b90b6e03d..efecfa7d15b2 100644
--- a/security/tomoyo/file.c
+++ b/security/tomoyo/file.c
@@ -762,6 +762,10 @@ int tomoyo_check_open_permission(struct tomoyo_domain_info *domain,
 	};
 	int idx;
 
+	/* Preserve the behavior of O_PATH fd creation not being mediated */
+	if (flag & O_PATH)
+		return 0;
+
 	buf.name = NULL;
 	r.mode = TOMOYO_CONFIG_DISABLED;
 	idx = tomoyo_read_lock();
-- 
2.43.0

base-kernel: v6.14-rc6

