Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC13A4D092
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:12:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGpO-0003Y2-P9; Tue, 04 Mar 2025 01:12:10 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGpN-0003X3-MH
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:12:09 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 910113FCC9
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:12:09 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2237f73c669so46690605ad.1
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741050728; x=1741655528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMhNekH3Gn8ZWOvh9jZaxESjSCjYZpAEL4j2VUdLK9I=;
 b=h8Ak2c45A1S04oN3Dpy/ttdgsYXlb65Kc8YPBrN8da2FtrKPStkcS1Wj87Q2p75tL4
 oH8h9u/NAHvHGAsAQGNXRchuEp9nxAeiPx78RQliXj/vhbl0sNMLUgwxFnwQIOwyobMH
 cVS8/JTLnlwN01JgCWs1Cvoq52J3t/NqZX4f0HsOV2Ecgu1KqQ5G6i3uUAlygR8BtNSb
 ARO00LZ4sYfMm1Qw2wxp+Dfcc/nA7NZc3uZVypciHBTN5wSZKobAxyoVmRjbK7U7itY1
 uG6mt4ZbE5yG2Z0esg6r2rtngaSdc4smILpjZFesLna/ye0VEEbzmr4HmE1BiMwajAYC
 Qc1g==
X-Gm-Message-State: AOJu0YzYeKTqMm9J0Pz0pWxb9gCDDLh0Eo2ViozPE+k2EQ6R7w+pyMJ7
 G0IsbXx4VVHT3V06Aow67+49lFS1eJezDVhOAXHBXhfGr3gzkIw1JvK/dfgarhwT7/Pxtd7e/HR
 0np4oZxSH994sIFqLRQKUkn7Ey1sWs2iptS3CrofiLIJmrYxgkKKrAe2mCSIko1EBLp2TRbnD4B
 Kh5PopKA==
X-Gm-Gg: ASbGncuEEN3nYw04Ufs4ZZzNcBhxFme3nmxSp2FOttv3YV8AsyXgC49RpQM4Yx+KYUL
 xgf17wsHYewKHw/u7Opt262Iozfl+RRBwLYp6EyAAiAuQXUSoz5jfqJrAC17YaKvhf2ABuJMAH7
 rptx7M1MNXfOT20FqI+eib43C5DxZydsWlAUSGse2rmoSNFLk9v0pLF+3abzga8UrSqxDERqhK7
 xiaU4lbamFQ7mkB0ClG3vnTtBZMzde66LI4m5dwlcZia7eAJfaBopbPVfWnNhSoB8FPwmLhMt8S
 HpqJ6Ypy+TxFCTltekRdUo7Dt5loM0/dAAXW3W3qbVk9A8HUJOcwceoKKBYmJ9G9gZngA7Q=
X-Received: by 2002:a17:902:cf0d:b0:223:46b8:5611 with SMTP id
 d9443c01a7336-223690e0228mr276620425ad.24.1741050728267; 
 Mon, 03 Mar 2025 17:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3LXUUPGCb2q0zWvpXVsskhroWBNgmyoFbXbaHfdZPdeu+3wSScZuxtaEJ1Phbb2KixBlVRg==
X-Received: by 2002:a17:902:cf0d:b0:223:46b8:5611 with SMTP id
 d9443c01a7336-223690e0228mr276620155ad.24.1741050727996; 
 Mon, 03 Mar 2025 17:12:07 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052c806sm84056955ad.235.2025.03.03.17.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:12:07 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:11:41 -0800
Message-ID: <20250304011144.31433-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304011144.31433-1-ryan.lee@canonical.com>
References: <20250304011144.31433-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 5/5] apparmor: constify the allperms value to
	prevent inadvertent changes
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

allperms represents a permissions set that allows everything, so it should
never be changed by any of the code using it. Making it const will allow
this to be enforced or warned on at compile time.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/perms.h | 2 +-
 security/apparmor/lib.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/include/perms.h b/security/apparmor/include/perms.h
index a8c43f4f6da0..76a39f7ea204 100644
--- a/security/apparmor/include/perms.h
+++ b/security/apparmor/include/perms.h
@@ -97,7 +97,7 @@ struct aa_perms {
 
 #define ALL_PERMS_MASK 0xffffffff
 extern struct aa_perms nullperms;
-extern struct aa_perms allperms;
+extern const struct aa_perms allperms;
 
 /**
  * aa_perms_accum_raw - accumulate perms with out masking off overlapping perms
diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index e69db6499321..8e735f3945b5 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -21,7 +21,7 @@
 #include "include/policy.h"
 
 struct aa_perms nullperms;
-struct aa_perms allperms = { .allow = ALL_PERMS_MASK,
+const struct aa_perms allperms = { .allow = ALL_PERMS_MASK,
 			     .quiet = ALL_PERMS_MASK,
 			     .hide = ALL_PERMS_MASK };
 
-- 
2.43.0


