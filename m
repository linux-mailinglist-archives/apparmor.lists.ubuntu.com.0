Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C9B26EAF
	for <lists+apparmor@lfdr.de>; Thu, 14 Aug 2025 20:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1umcUq-0001hV-Nn; Thu, 14 Aug 2025 18:16:16 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <chandramohan.explore@gmail.com>)
 id 1umbDb-0007fP-8o
 for apparmor@lists.ubuntu.com; Thu, 14 Aug 2025 16:54:23 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2445818eb6eso8921745ad.2
 for <apparmor@lists.ubuntu.com>; Thu, 14 Aug 2025 09:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755190461; x=1755795261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bzAUOwpAWoQpgwAW5jB4MGjXOdEDxLQtc2FXn4/gdjw=;
 b=nctfF3zERrbCzaIt/1D1QyIXp8Rp8XxvQCMbJ4s1oQjoMx/5lq5ulkZdz2f492LB6P
 KLBtX1r/w8dLrzs80Ej+QS2AqvUQ7jhuK4+Awums4Rg2sZOma1836G7RyRW+Gl6EX0od
 Jxbq7ki4xQ4WjaomnEydVNHTwqPKby3wfiinBDD8YNs1QdNIsCkx/9cWuH7BdEjGMp2X
 8IuoOhnsTw66dfA5ZWqejtdQOTETpHD+6HyTjq81GVUBQyspD2rdRnf/8Ou7bVHtiljZ
 x/BbdzFQWrBCO1hmdBgLJ/6VEhuqFYsbD/xhKR9oWOOMjY50kWhAqnxHY/5JHGPAU5j/
 bZxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPETsNy3hDoSgRsGX5BtCfFW59Pr1I2K9zuN4J3SZv66WcUxxCCDEIpk4VGM4rf4o/6OycDvAGJw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyNc9fZUyBxr1ZiydvSsHQUFw77s8KatbdfN1AZetzizEm3LKJ0
 154PGRvCt/w95lkbEOvyPChFTbCszxequduAPOojA8luPmuhFveqZfg1
X-Gm-Gg: ASbGncumjZfr0vSl1yFcFW+AeeWEfE2CTHibUAgIdZCH+xxKUXl2/VUFCtYoF0IGTmk
 wVAzyKTscIVrqoYumKeDc3Dw3d4N1tUvceJwEhVuyB9dIsGeoET726O/LpZwCxHulvEwFYsX6Hf
 5x5JwDfQthGbXtyyM/cwZpPgc3KctrswUwHJVCDNFtErdLhLlZu7hmua6rnCR+yKZk+an1D/+6c
 J+Auoa4Mtwaq6UKdvQI3OaIr2bJ8IfAUw9Q6ttGecvtztsQkXRzfeiW6INPRe7lc6lx7GJWkdxb
 u44w9LF7eVR5318B1/a89f7QCJzSq/W4btGiMtQZHI/sH2RftEvuFcHGCFL86jpmd0+UPA96d5O
 tP9TV29GXQ0YUBFItCtq6aDCD+unluCVGeayvDkU70xji/Ru4nSI3Tm9StxVhJH4GPcwOVu4CfO
 M=
X-Google-Smtp-Source: AGHT+IEqMpZO5u/tm/cwn+0YsGs4tZglauzhONrWB/FV5p8lGP3iOxI6+izHLFRBqWNEDG3eBmVaBw==
X-Received: by 2002:a17:902:c952:b0:234:ba37:879e with SMTP id
 d9443c01a7336-244586bf29amr53951435ad.38.1755190461424; 
 Thu, 14 Aug 2025 09:54:21 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com
 ([2401:4900:1cb8:7b85:37eb:c20:7321:181])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24244f5c1c0sm310205985ad.45.2025.08.14.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:54:21 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org
Date: Thu, 14 Aug 2025 22:24:01 +0530
Message-ID: <20250814165403.616195-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.172;
 envelope-from=chandramohan.explore@gmail.com; helo=mail-pl1-f172.google.com
X-Mailman-Approved-At: Thu, 14 Aug 2025 18:16:14 +0000
Subject: [apparmor] [PATCH v2] apparmor: Remove unused value
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
Cc: linux-kernel-mentees@lists.linux.dev,
 Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The value "new" is being assigned to NULL but that statement does not
have effect since "new" is being overwritten in the subsequent
fallback case.

Remove the unused value. This issue was reported by coverity static
analyzer.

Fixes: a9eb185be84e9 ("apparmor: fix x_table_lookup when stacking is not the first entry")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
Changes since v1:
    Fixed the commit message and Fixes tag message formatting.

 security/apparmor/domain.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 267da82afb14..9c0c7fa8de46 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -592,7 +592,6 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		if (!new || **lookupname != '&')
 			break;
 		stack = new;
-		new = NULL;
 		fallthrough;	/* to X_NAME */
 	case AA_X_NAME:
 		if (xindex & AA_X_CHILD)
-- 
2.43.0


