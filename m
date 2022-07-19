Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4AA5795A2
	for <lists+apparmor@lfdr.de>; Tue, 19 Jul 2022 10:55:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oDj0F-0005Kd-Hk; Tue, 19 Jul 2022 08:54:51 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jrdr.linux@gmail.com>) id 1oDcir-0002HD-5B
 for apparmor@lists.ubuntu.com; Tue, 19 Jul 2022 02:12:29 +0000
Received: by mail-pg1-f171.google.com with SMTP id g4so12260556pgc.1
 for <apparmor@lists.ubuntu.com>; Mon, 18 Jul 2022 19:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aRhy8Rk7/1ZItozla3K22lKSfcD7M6tNI4z2lxDBidw=;
 b=OcB/nGiC9Q4g9bPiZkQigDsUj0YDFnIk6LzaBks2JsoWbl8lRAYxDG6PYhQ6zmlv1e
 q91Rv31ftu5qB+3xQ25SPc7y1+WfPH0CsIs5Ls+8iS5bjRzo4OBfMnZlo7kz9okvShgd
 pcDqF4BDacSS3GrGSc9ngwLozVCIFoIbtye/NP0LmVa8vawbj8vxQMe2Eaw1xYG7YjrY
 BJo3ChcFRtZT2DBu/+U0KzQKRXtlat5ElflgTI2zIvxPhfx9VDYpy/XQkVGCnAcwzv95
 rNP7dQToYYXBuXjO/cnj4AIAmVfmozGblDpKC285h/TWjmoqaGh6048E5kCvP15Tln/+
 HS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aRhy8Rk7/1ZItozla3K22lKSfcD7M6tNI4z2lxDBidw=;
 b=RrUgPaRQsDcxMbIASVa5+89K6HCMO9xooJkmcSXAIb8CeLCugYUdcYYWKXRPmD6SW1
 87vG27RClmfY3t85RqZXNj+N/K7/EmMMPEldiao+R3dU9CfwoKuGRijMI9hdN6HJonw0
 H+Pfo+4nB3LyZXT7v+Kcgm+fRDH9Y75d5bXuyubeLCn762UEnMHMLRVvQ4u5q6cVHEpJ
 f8p37EjRGM1UtNjrRC2hjHJWe0GeFXY6cSGOw2dkj9ZL9zdLUO/0TD3gUR2aS2REX5da
 0BNGdzjm2HzJuaznvYIa0h3ICJLWc2V47gIuf0lp/NQEgYgszCIIMw+VakQO2jK/+37K
 kbIw==
X-Gm-Message-State: AJIora+Yp5gHt9hAVQUDHWjjvFvZs8cpikWMvxrRsv3wvxN2upaGb2bx
 nq7mkI8p/Z0fjJPTW3ffz1Q=
X-Google-Smtp-Source: AGRyM1sbhhHUQLbU0d4KdR1mTQEY20diT4IuABSzVSFi6zYCigkwV8JnNUSAgjEkCC9FORrFpGQgkA==
X-Received: by 2002:a65:6bc8:0:b0:412:9b2c:1700 with SMTP id
 e8-20020a656bc8000000b004129b2c1700mr27028216pgw.8.1658196747238; 
 Mon, 18 Jul 2022 19:12:27 -0700 (PDT)
Received: from localhost.localdomain ([122.171.73.195])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709027e0900b0016be9d498d0sm340779plm.211.2022.07.18.19.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 19:12:26 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Tue, 19 Jul 2022 07:42:18 +0530
Message-Id: <20220719021218.6807-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.171; envelope-from=jrdr.linux@gmail.com;
 helo=mail-pg1-f171.google.com
X-Mailman-Approved-At: Tue, 19 Jul 2022 08:54:49 +0000
Subject: [apparmor] [PATCH] apparmor: Mark alloc_unconfined() as static
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
Cc: kernel test robot <lkp@intel.com>, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot throws below warning ->
security/apparmor/policy_ns.c:83:20: warning: no previous prototype
for function 'alloc_unconfined' [-Wmissing-prototypes]

Mark it as static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 security/apparmor/policy_ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
index 300953a02a24..4f6e9b3c24e6 100644
--- a/security/apparmor/policy_ns.c
+++ b/security/apparmor/policy_ns.c
@@ -80,7 +80,7 @@ const char *aa_ns_name(struct aa_ns *curr, struct aa_ns *view, bool subns)
 	return aa_hidden_ns_name;
 }
 
-struct aa_profile *alloc_unconfined(const char *name)
+static struct aa_profile *alloc_unconfined(const char *name)
 {
 	struct aa_profile *profile;
 
-- 
2.25.1


