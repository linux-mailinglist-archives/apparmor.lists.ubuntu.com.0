Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2FDA81A33
	for <lists+apparmor@lfdr.de>; Wed,  9 Apr 2025 03:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1u2JpY-00037d-Hx; Wed, 09 Apr 2025 01:02:16 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1u2JpX-00037R-JK
 for apparmor@lists.ubuntu.com; Wed, 09 Apr 2025 01:02:15 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 430DD3F6BB
 for <apparmor@lists.ubuntu.com>; Wed,  9 Apr 2025 01:02:15 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff6943febeso206975a91.0
 for <apparmor@lists.ubuntu.com>; Tue, 08 Apr 2025 18:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744160532; x=1744765332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ha5xSNWKoIottjhngNstJ9Z4QT3dWqxVRRrNO8MJFYo=;
 b=q4cNgns/5ssfiW5JyqbGGDwTPmUJ+mpXdVQau0bBPa7CDbTmD6DDELizajmGd4uPSI
 OleISEzoyVPo2hv2JFvuQ6ZZZhb4Q8ChPaRVniS+3IPRc+dYwYuAhoAACHC50/xUX5eu
 Nhvn5wqlHTbrtPOSNKmh/ARP/fLDwlWriET3lgkDW56VM/N1VhzRil41fwVxHJiJnIzp
 GMaaoV5Xhzd0fw2jYoG5RuoDJuW95YUoHF3RfGQu0XVVGOpxdsAomNCtYjNi5oPk7iU/
 chFFXukfcLowGWcJWXCcJKYM9fSUC8qVVTA/yXVGrmkPb1nklq2e/vZw4apkwI7OLJKE
 veSw==
X-Gm-Message-State: AOJu0Yzf0OJxV5cm/wl2rVt9Xc0kbkBq0QlHY/GUkVJuL0+nCcHD85Ge
 Bkk/FPRqqEJdoe4Ohek2zgQshXj6hkKAI4hBsZBtZ4r6H2TiDcAPQFmIbRN+39FNbSuWGZ6Hdg8
 o2yLN5jy8BQk31E3YZXnD2Ihurq6+PuKxEe5eP/Bpfb+sic2ZWnajPq8GOerWDlfJfVBMr/F8/d
 ElxC1QRwhB
X-Gm-Gg: ASbGncvoOcugqOwew3CXxE1zuhPhZYra5C9KG6OFrY1aaiqr+Q21DEADXSAQFfntlGR
 5AuTmtP2EpTGMcLECqYHsoiRaWVWkF4q3SCEz7l3JG92qHOqQEi0Q2u2k+wVb8cPSrd9HNfYhNZ
 3nXXoSzbeqkEs/roC14J2Bf/NU1/jDeFVuH4QpklIEGNAWy/JHE9lxVWPy2koyJyvm8oWuEIy9o
 V1ndfla2dg2OJ0qP9kTxYIer5AGBbIwB37ItssfksyJeD6biUX+SegiK+0GthIalpOjK1H2KS7X
 +iycUE6EXHP9ughpj9xQfNXAdYKKTieYYJQJrlTkcInCW+75sLPgB+rKkXZTec34rgstGPZxGg=
 =
X-Received: by 2002:a17:90b:2cc4:b0:2fa:3b6b:3370 with SMTP id
 98e67ed59e1d1-306d0d37593mr7338123a91.16.1744160532523; 
 Tue, 08 Apr 2025 18:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE68RP3ogZ8b3JybuLkIgMUgn5CToJX4IRK6+/TgV/zPcam2ie18eksajrWos7A54Y2dKaYzg==
X-Received: by 2002:a17:90b:2cc4:b0:2fa:3b6b:3370 with SMTP id
 98e67ed59e1d1-306d0d37593mr7338092a91.16.1744160532170; 
 Tue, 08 Apr 2025 18:02:12 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306df2fb097sm74399a91.38.2025.04.08.18.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 18:02:11 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  8 Apr 2025 18:02:00 -0700
Message-ID: <20250409010201.231215-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: make all generated string array
	headers const char *const
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

address_family_names and sock_type_names were created as const char *a[],
which declares them as (non-const) pointers to const chars. Since the
pointers themselves would not be changed, they should be generated as
const char *const a[].

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/Makefile b/security/apparmor/Makefile
index be51607f52b6..12fb419714c0 100644
--- a/security/apparmor/Makefile
+++ b/security/apparmor/Makefile
@@ -28,7 +28,7 @@ clean-files := capability_names.h rlim_names.h net_names.h
 # to
 #    #define AA_SFS_AF_MASK "local inet"
 quiet_cmd_make-af = GEN     $@
-cmd_make-af = echo "static const char *address_family_names[] = {" > $@ ;\
+cmd_make-af = echo "static const char *const address_family_names[] = {" > $@ ;\
 	sed $< >>$@ -r -n -e "/AF_MAX/d" -e "/AF_LOCAL/d" -e "/AF_ROUTE/d" -e \
 	 's/^\#define[ \t]+AF_([A-Z0-9_]+)[ \t]+([0-9]+)(.*)/[\2] = "\L\1",/p';\
 	echo "};" >> $@ ;\
@@ -43,7 +43,7 @@ cmd_make-af = echo "static const char *address_family_names[] = {" > $@ ;\
 # to
 #    [1] = "stream",
 quiet_cmd_make-sock = GEN     $@
-cmd_make-sock = echo "static const char *sock_type_names[] = {" >> $@ ;\
+cmd_make-sock = echo "static const char *const sock_type_names[] = {" >> $@ ;\
 	sed $^ >>$@ -r -n \
 	-e 's/^\tSOCK_([A-Z0-9_]+)[\t]+=[ \t]+([0-9]+)(.*)/[\2] = "\L\1",/p';\
 	echo "};" >> $@
-- 
2.43.0


