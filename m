Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D757BF2D
	for <lists+apparmor@lfdr.de>; Wed, 20 Jul 2022 22:26:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oEGGq-0005Z6-J6; Wed, 20 Jul 2022 20:26:12 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lukas.bulwahn@gmail.com>) id 1oE8Ro-0008AB-1K
 for apparmor@lists.ubuntu.com; Wed, 20 Jul 2022 12:05:00 +0000
Received: by mail-wr1-f54.google.com with SMTP id n12so12970466wrc.8
 for <apparmor@lists.ubuntu.com>; Wed, 20 Jul 2022 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=wpY8Fn5dD5ki3izlk7rpyV14VYuNyQSG8TlGbXhx8No=;
 b=E1yjOeYEWLfJi/4H5c4TezE+AA1j/db/ERei6jUfneCjFxtZ5eq/tgZqAsg6lyTHy9
 NWKwPHBrkVSB/ow8jBMNCTJbW56JYv4iDWxyQJzkdZewQmKa+LJaeqIRydoy7CMll2A8
 +HfyVR+DmLsWNOXxst+zhPjZFg4/Tm2YBMxUtFHxmxn337we06kWQGhS6thzNCUs5Kgh
 tdqpRW2bLvRkO/kd8S4s4e60x2NFQ31n3XgjA1DAIPtas1GPAKRFZq7UfOQ1Eng0VDxf
 wmPGp/uRWx/s27Lib1fQb3mFlD00vprSrj2+JW0BjdJefZUlm0gXdONB1Xcu3hHqjFFa
 0pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wpY8Fn5dD5ki3izlk7rpyV14VYuNyQSG8TlGbXhx8No=;
 b=4QuSy2uZsSMCNLqFAIHIRSf6khd7W/T7CGyqhYN78eJ6O4VA+tsGG+qDWDHknE+uGa
 +/qYml2MePYFm7JMcVCb9lvfVSD2TrbTSlrCdWFlseTYpP3/lhpzdWIso83p6u6td0f8
 +Db85Yetw8auZoqeY/HeLkxMjXwT1Bku+P2QtEqXLenLCMnsrzkUfFRDepuGC15Rcj2H
 SS8KLV4C3NURFoGf4Hi0EoK1uEZw77wWe266so2MVBTfYBE38PZwnwJdpkmgp10HWuGk
 6fKmAB0PCy2Pye5UHLK8u4BV/Uti2hmh1H2m++/9Gs13Eb4EHdtDDhivu/QW3/2wPD7f
 /Owg==
X-Gm-Message-State: AJIora8wSa4wZRgEdBWPai8vBRW6WDI2VU6ZXVZv8FJ7yBV8lkjchOtT
 IIaH4JxIMBIBX6tlFChyCNE=
X-Google-Smtp-Source: AGRyM1sWSLteQUScsqfZ5Bz9P7W9wCqZ6Bc9liATh6PJxssCgIl6il4d8JhIZC8unswcIy7qtIR40Q==
X-Received: by 2002:adf:fcca:0:b0:21d:68ff:2e5a with SMTP id
 f10-20020adffcca000000b0021d68ff2e5amr31936301wrs.453.1658318699075; 
 Wed, 20 Jul 2022 05:04:59 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826a11f008020c2fc6e115b3e.dip.versatel-1u1.de.
 [2001:16b8:26a1:1f00:8020:c2fc:6e11:5b3e])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm2177090wmn.47.2022.07.20.05.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 05:04:58 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Wed, 20 Jul 2022 14:04:43 +0200
Message-Id: <20220720120443.16518-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=209.85.221.54;
 envelope-from=lukas.bulwahn@gmail.com; helo=mail-wr1-f54.google.com
X-Mailman-Approved-At: Wed, 20 Jul 2022 20:26:11 +0000
Subject: [apparmor] [PATCH] apparmor: correct config reference to intended
	one
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Commit 5bfcbd22ee4e ("apparmor: Enable tuning of policy paranoid load for
embedded systems") introduces the config SECURITY_APPARMOR_PARANOID_LOAD,
but then refers in the code to SECURITY_PARANOID_LOAD; note the missing
APPARMOR in the middle.

Correct this to the introduced and intended config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 090a20805664..e29cade7b662 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1402,7 +1402,7 @@ module_param_named(path_max, aa_g_path_max, aauint, S_IRUSR);
  * DEPRECATED: read only as strict checking of load is always done now
  * that none root users (user namespaces) can load policy.
  */
-bool aa_g_paranoid_load = IS_ENABLED(CONFIG_SECURITY_PARANOID_LOAD);
+bool aa_g_paranoid_load = IS_ENABLED(CONFIG_SECURITY_APPARMOR_PARANOID_LOAD);
 module_param_named(paranoid_load, aa_g_paranoid_load, aabool, S_IRUGO);
 
 static int param_get_aaintbool(char *buffer, const struct kernel_param *kp);
-- 
2.17.1


