Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56678305A
	for <lists+apparmor@lfdr.de>; Mon, 21 Aug 2023 20:37:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qY9mZ-0000Jh-Sw; Mon, 21 Aug 2023 18:37:43 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1qY9mX-0000JI-Vp
 for apparmor@lists.ubuntu.com; Mon, 21 Aug 2023 18:37:41 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C43793FA6E
 for <apparmor@lists.ubuntu.com>; Mon, 21 Aug 2023 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692643061;
 bh=g50eGSQ6BTA4hpkG2bIzEeeGEV60+SZB5dTWyCEganE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=AlUEXqM2r8UNXvVHOuS9aY/BuxynLT7qsaoWy1NBQZdZ0FIh23d5lx4k1LQ+7iqip
 qUi1OLV4ZY22gpa0xvYBpkvDP1sl82+w1uzW93rXXxBbgMpj0HK1mIL2eoW7De0p4N
 1Sg8ajevYqmyebIj98ifQwe/K/F/aBkuEkeGbl60NiVMhicoeQNGU1NnkpyfoN9hqy
 JSt/4lZHeuHpTOjr3nPWp5vgIY2UnRi+PGAjJd6wMLNjKm2FIFQZVTLeAN41DcA3mZ
 SaBB8pGWOePfBOp+eHiSOQJuPn36Jt3UIG+jYV0TW25YcYxXpPLefb/IKNMhbVOO4J
 i056HvXl0OagA==
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1c8f14ed485so4539672fac.1
 for <apparmor@lists.ubuntu.com>; Mon, 21 Aug 2023 11:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692643060; x=1693247860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g50eGSQ6BTA4hpkG2bIzEeeGEV60+SZB5dTWyCEganE=;
 b=J8IeQQjslAiFcaZNWQ/iYSim5Nq72N5lG8oUDccnqKJcJdeLDbQ8IVQVIIkTfALPT+
 85+hUSzU8rIGNrSfRp/bfQRZ+gcLUMemV9t5eI23IxWkzF+9ZaHrCOpcpJXGEN5MCedF
 c7QSKYImH+s9u8WlBkUlVRX2nwNiFPWJeiMxS107ch+xJkFa0NtdTt+PWwU362r6kmUg
 ksjtuLqILDjAiHwssdSB+ejEcNu2S86L6p/ZE10vZdUgNKYpc7OvvfHmb+HJeA507geB
 DP4+TavwOFFyC7PnK0M2LWj8+oWt4sKBYidVuQHuio4D8SYSCY/y9GR2Hqr2usIZ8r75
 uKPw==
X-Gm-Message-State: AOJu0YwcXEwOewE7pysOlyzTIBu0L73ECxIFexBb7tBIJCTTqIFkOF8L
 ZmVc0AwAeRSe1XwAdyfsnL3ddKEBkuUGMFoWRi66urimiD5uZygd4bErnFHSOF+GPi0RA3neKxc
 wQmr2xg4yzMELiVt4xuazAzeJE0OZL7tAR22dAA==
X-Received: by 2002:a05:6870:d113:b0:1bb:bcc3:c96 with SMTP id
 e19-20020a056870d11300b001bbbcc30c96mr10246906oac.33.1692643060667; 
 Mon, 21 Aug 2023 11:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAYoizZAygS15JxTiKYa56NAJVE/MywrgRuf2vTJ1VkPRyhhxlHdBrQgZy979n4fx7S/ze0A==
X-Received: by 2002:a05:6870:d113:b0:1bb:bcc3:c96 with SMTP id
 e19-20020a056870d11300b001bbbcc30c96mr10246896oac.33.1692643060317; 
 Mon, 21 Aug 2023 11:37:40 -0700 (PDT)
Received: from georgia.. ([2001:1284:f01c:1de7:5d6:de43:2bb3:198])
 by smtp.gmail.com with ESMTPSA id
 eb40-20020a056870a8a800b001cc6edc0177sm2297884oab.7.2023.08.21.11.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 11:37:39 -0700 (PDT)
From: Georgia Garcia <georgia.garcia@canonical.com>
To: john.johansen@canonical.com
Date: Mon, 21 Aug 2023 15:37:24 -0300
Message-Id: <20230821183724.2588567-1-georgia.garcia@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] apparmor: fix invalid reference on
	profile->disconnected
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

profile->disconnected was storing an invalid reference to the
disconnected path. Fix it by duplicating the string using
aa_unpack_strdup and freeing accordingly.

Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
---
 security/apparmor/policy.c        | 1 +
 security/apparmor/policy_unpack.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 4817c1b30105..d7525f228c43 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -255,6 +255,7 @@ void aa_free_profile(struct aa_profile *profile)
 
 	aa_put_ns(profile->ns);
 	kfree_sensitive(profile->rename);
+	kfree_sensitive(profile->disconnected);
 
 	free_attachment(&profile->attach);
 
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index d2d740bb5618..8b2ad42c80ba 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -804,7 +804,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	const char *info = "failed to unpack profile";
 	size_t ns_len;
 	struct rhashtable_params params = { 0 };
-	char *key = NULL;
+	char *key = NULL, *disconnected = NULL;
 	struct aa_data *data;
 	int error = -EPROTO;
 	kernel_cap_t tmpcap;
@@ -870,7 +870,8 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 	}
 
 	/* disconnected attachment string is optional */
-	(void) aa_unpack_str(e, &profile->disconnected, "disconnected");
+	(void) aa_unpack_strdup(e, &disconnected, "disconnected");
+	profile->disconnected = disconnected;
 
 	/* per profile debug flags (complain, audit) */
 	if (!aa_unpack_nameX(e, AA_STRUCT, "flags")) {
-- 
2.34.1


