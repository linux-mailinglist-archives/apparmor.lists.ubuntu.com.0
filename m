Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83AA5E673
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:23:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXX-0000dV-V1; Wed, 12 Mar 2025 21:22:59 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXW-0000aW-Pi
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:58 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 40AF83FCEE
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:56 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff8a2c7912so450384a91.1
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814574; x=1742419374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yf0KmmK+2JCiuqTR1dE5uJSectdXjdHO7BaOi/Ze5/Q=;
 b=FfOshIcnQx7WSdwiu0V23HzWnpW+u4aBLch0wT2yd1DB9EGfW0uFLxHzamjmwDcq2I
 5slKZVzE91RTJeU0OzejgV2e9ktKt1Mj5LjrXQp0cLDPyuYDx1mDtV3s44YLE3IaiL6U
 RcxZiU6jXsMT0udRPxlWhcMkaevUKXEQDO57XaUuUb9hFvRjEHs2GHvqXkAQc9ufnPCF
 Nabb9UkuKqRj1W/1fnlRp0ckjQRbl7FnKBMvZxVowT1W58hwkveSruoIlCG77z/1nemG
 ENJx92ZtSdxHp5Eh3byLikWZRKTwdHQ2WIztfKxGZEPRZ/PFFxZft1RH5LLbIAEg1CF5
 U5mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWJ//YZudmyV8XmuWYLNkhNcitzXJa9j2vs8cfGOZQQAuvYP2xTWr1J/NgoFKLxB8Ou7spzQd/lA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwbbnZHw4eMT8o0F8X30TEGPrzIDglSlGEHY7QVJmULRJf+lp6k
 RXSTL8gBd9wOVgOxkVKD9sBa8NuMF7VRjB2HfnzDp8dW9hHzHhLb95OxZOp2Ogn7HVsfmImv5K3
 4jjDylbkLq9SpCncPxUtu2lqjpfuRIhKsAdMZqJBvgWfWxVJEGjNByImezSGhr7Zff6la4UdK/Q
 ==
X-Gm-Gg: ASbGncsnl9ow5mVgTQ3w7NoXfniOxW7/LiqedJzOYvjRmhJx/HYNL0AmTy/34XlVQmT
 YxKAofAywfxdDE6nSglS2NRHhY6ed+P+hAn+HLb0iHVpF9qUAPo0uO525YBYy1nzwP/8am/pAlK
 jjH/GNckyq0O1PFQF7p0asw4wY3adxerASuqIr+unBsmUbgZAPaSZPe1Bb0kWzkrprTVvGqRF5f
 8Q8owYwQbSrz9Q+CfOV5/hD7t8xMemGjhl92WVFW5+DxdEvHa/RhGFROWtqUcmVs3PpXzbLy70u
 w89yxh1Y0/yDCeyhRrotpUIERUNbycKEvg6o7UxV8Y5SkfusBumauz3A/0FP4V/G/Av89AI=
X-Received: by 2002:a17:90b:3bce:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-30135f6037cmr88380a91.15.1741814573783; 
 Wed, 12 Mar 2025 14:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwAw+1MiMC/B8BNZEJ4oppU1sIELS1vCTl7SNsacHdi/KdGlgg9CgoB/KGdKxX2Zf2vFxSyQ==
X-Received: by 2002:a17:90b:3bce:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-30135f6037cmr88319a91.15.1741814572564; 
 Wed, 12 Mar 2025 14:22:52 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:52 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:45 -0700
Message-ID: <20250312212148.274205-6-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 5/6] smack: explicitly skip mediation of
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
 security/smack/smack_lsm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 2f65eb392bc0..c05e223bfb33 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -2062,6 +2062,10 @@ static int smack_file_open(struct file *file)
 	struct smk_audit_info ad;
 	int rc;
 
+	/* Preserve the behavior of O_PATH fd creation not being mediated */
+	if (file->f_flags & O_PATH)
+		return 0;
+
 	smk_ad_init(&ad, __func__, LSM_AUDIT_DATA_PATH);
 	smk_ad_setfield_u_fs_path(&ad, file->f_path);
 	rc = smk_tskacc(tsp, smk_of_inode(inode), MAY_READ, &ad);
-- 
2.43.0

base-kernel: v6.14-rc6

