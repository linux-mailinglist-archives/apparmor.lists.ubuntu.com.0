Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 249127308D9
	for <lists+apparmor@lfdr.de>; Wed, 14 Jun 2023 21:55:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q9WaA-00024a-QA; Wed, 14 Jun 2023 19:55:06 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.carpenter@linaro.org>) id 1q9Q8Y-0003t5-0Z
 for apparmor@lists.ubuntu.com; Wed, 14 Jun 2023 13:02:10 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3f7e7fc9fe6so7659085e9.3
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jun 2023 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686747729; x=1689339729;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7T3D+U9Tv7RD5rlwhyON4ZX6lWyCUG2JeI56Mpz4QY=;
 b=fiOcD3GIvmcxkkhumrwmL1Dx/vREL2TWO+wMhUCmVU2LjhZCa3T51wDWX8jSoB0yme
 /G9uDrfhR7hiVi0+dKt8qhukzdlZtaLikPRJ9nriGS0PJjtL3AD0Z1uhSjQNvCF5TCmh
 AXs8C/I/4CWWqLho94Vty4qntxnOjK/G7NdtyuQBrjD3/eO0X6+IlMO70aTfzX2Gh/v3
 NCaDHeThx+px5y9rBIgVyOSxFUF8wUkz3/0rbcEAj6cTQtUcleUv1KCwdGvdlQ3CJnOu
 38NLJQdfEgjNG5wobQVD8puPeoDH9HwpMIftbM5Sc14w0B0OKrM7mF17RV1WhXSU+JAI
 oJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686747729; x=1689339729;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7T3D+U9Tv7RD5rlwhyON4ZX6lWyCUG2JeI56Mpz4QY=;
 b=YIlNLzUaNLJJaa4FdKVmiCC0dWrUIYTUcfu8sHIeQUs7szq3pcjgiNVRfg0nxMYrDt
 MZJ3lsJO/CTsuOH7PWg28PnBh7s//4Bkl7xhuvD6GTzaZFV8yNFmPWAz5UElT33aC0pP
 utwcW4e9vq+eEFMVD0E0s0Sf+jUPpouuUOFYCr6YplO853TrIz4a6Sw5zODM5Z1ily8R
 eXOtzqVyhelh6PZ8V++sY3Ti9ZAwH9jU+q+Yc6o9N05NIkv0JwF+scgdJaDG+FBl8l85
 c7PCEYz6mDOekiI6fPQkil521v8bbY7ICtSqWWrQfrG7o7nilcHwYpy4OBI6ueW6Ue6R
 I9tg==
X-Gm-Message-State: AC+VfDyms4gyFjT8KGdl5esUVdfsdbIFHoNn1sT5US6uhZUkJm5/yhcW
 AMrnzq/fSUcwM99uc1k++4uoZA==
X-Google-Smtp-Source: ACHHUZ6V6uwFBRhwQLKnYQL5hBOnhcEekAqbA/gVaO6DLEIlckv+ePm7LR9zaCegdOFXynCOex+zzQ==
X-Received: by 2002:a1c:6a18:0:b0:3f7:e34d:33c4 with SMTP id
 f24-20020a1c6a18000000b003f7e34d33c4mr11481733wmc.10.1686747729569; 
 Wed, 14 Jun 2023 06:02:09 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y22-20020a7bcd96000000b003f7f2a1484csm17493492wmj.5.2023.06.14.06.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 06:02:08 -0700 (PDT)
Date: Wed, 14 Jun 2023 16:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <bf35a5d2-db9f-47cb-a2f0-ea23e407f36d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Wed, 14 Jun 2023 19:55:05 +0000
Subject: [apparmor] [PATCH] apparmor: use passed in gfp flags in
	aa_alloc_null()
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
Cc: Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

These allocations should use the gfp flags from the caller instead of
GFP_KERNEL.  But from what I can see, all the callers pass in GFP_KERNEL
so this does not affect runtime.

Fixes: e31dd6e412f7 ("apparmor: fix: kzalloc perms tables for shared dfas")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 security/apparmor/policy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index b38f7b2a5e1d..715fe1b66d12 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -589,12 +589,12 @@ struct aa_profile *aa_alloc_null(struct aa_profile *parent, const char *name,
 	profile->label.flags |= FLAG_NULL;
 	rules = list_first_entry(&profile->rules, typeof(*rules), list);
 	rules->file.dfa = aa_get_dfa(nulldfa);
-	rules->file.perms = kcalloc(2, sizeof(struct aa_perms), GFP_KERNEL);
+	rules->file.perms = kcalloc(2, sizeof(struct aa_perms), gfp);
 	if (!rules->file.perms)
 		goto fail;
 	rules->file.size = 2;
 	rules->policy.dfa = aa_get_dfa(nulldfa);
-	rules->policy.perms = kcalloc(2, sizeof(struct aa_perms), GFP_KERNEL);
+	rules->policy.perms = kcalloc(2, sizeof(struct aa_perms), gfp);
 	if (!rules->policy.perms)
 		goto fail;
 	rules->policy.size = 2;
-- 
2.39.2


