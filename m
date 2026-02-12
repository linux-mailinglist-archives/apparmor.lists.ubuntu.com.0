Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Mk5JERDjml3BQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:16:52 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 561521312F5
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:16:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqe3G-0000fU-DU; Thu, 12 Feb 2026 21:16:42 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqe3E-0000fI-VW
 for apparmor@lists.ubuntu.com; Thu, 12 Feb 2026 21:16:41 +0000
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD7D83F46B
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770931000;
 bh=uhgvpkjd7FaEumtYgCggk4y5L2tVVyR/5Cef4BLSqgI=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=gFqS4Z3dwCI3dRkN6wY82COGkZJQWU1dAfTLhdtIRbjcKZrp/uhywEOgZYWXmM/Df
 KhHUHtKt0KitQ1O15zifECfGWgyOEm2x0KsQdfc7o8pWaPssvhCUPfGisyxBuUIsi1
 wUuG6hkvosMUWQPN0Sj34P/imK0snRmwzioG8S6zOkdoBESi6tnBjVvB/B2tt2eBhH
 8HpIoPJOYut8lStUjzDI/zcXd2pm792lj7loAkabRDykI6Df6Swmpk9w1kh3MszBnL
 4jIEdfKhAPT3WUhLWR8XnYBm08z2V/kJlMdjvRBIxaXpOOaCdSXjQZe5za6kwgcCbv
 qvJzE5ow+RKD3qR75kPhRELnbtQ07pwjejOAkC7xQ0V5K8hINJ6XLdt0aOabWzYeGg
 5dxx2kuFHtNvN0pl0AGnA0cnCgNyjNOm1UraWnFccGrYgBK6+BasUziv4ci1XdAWru
 DLg96L/cRuisbkwDdgteCaKpZvuubkwhVKDi2Ym0VWAs92huqlWBK5sFVwLPVvRJzA
 FSQjgv6jEuOCPlK6M0asskHwnZwjaoloNmyd2TWo7Q2SOp12DP9guhZENC8+I21+3S
 d+bwbfYcQIztA7Rv0/4SeLxBifeZZiAfrJVNdUQ/9iCaM0izcWsfSDGToDT5MMoUNQ
 OTiD9y3xZIWAUdodmtoIPDDA=
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b7ef896edcso3864561eec.0
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 13:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770930999; x=1771535799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhgvpkjd7FaEumtYgCggk4y5L2tVVyR/5Cef4BLSqgI=;
 b=aeYoKf7c0wOa3P4EPDXPSF6+fZpcY0Ew5nB8r1a4o17SBv+Z6JCQJoFjdeeddEJP9R
 YSZRUoTjpZ+q2NKeKJsFfuhD7zB+a7qFAoLfsVZeZb/JgtcldgtdpVa6to5Sbw68gbIk
 oKZMkg06B/TQTvC96tT1wMP4bpFNQzCsw7gtt9ngnIQ3HI5J6SNGuwvshp0l/ADMgobO
 mRaDpymB37CXySYAFqK2nUA6FI0k+Egm4Db2q9mlR1mAe7VgQF/OtnC2G6+vrnY8h2YH
 /5bDmQnXwyx2fwBfcePjAcaVhprhv1s7uQXusi7Hl7sqI/DYOLv0EfR6zV6qXNQAvqKf
 9bGw==
X-Gm-Message-State: AOJu0YzGXn5XLPH0QBiYkGTZCKqRvIlScpmFs/sCbflBXMPpL3kZYnj5
 uyl5xoZ+ie7M3nyCI0YfkgPhuMB8m9KCq03PlNyD9u6+v3kNPGJEXEadF2Texm4LuCBryhCB99Z
 kHPDQpbaugU9x1CzrQgh5qWXEgafHbYTaJ/EEH9CNj5ESHCHaDc/ooN8gRpzWo0noWs5sGDICBm
 KJOJ5LoIfyqw==
X-Gm-Gg: AZuq6aKfTXlVQIdz+UWSsFp2oB8FncxUZ6KItWQG6RsHrNZoKdqO8U+uFjzslFA6rNH
 rcSk1Vzgo6rmSGT4tQtf4kDE1QAPSFjD3i8xFd74Se//omYDTWskXRSiM01++dm2f5uCSs5USLy
 epejR3mf66AyLhbFiEek9poWqrwng+sYK2Mv421LPbPC/UeqpFoTHzEW3vkn+1jpQu4or9QE4oc
 7loTL/aja/ifVSll7c8MbRNBRf2lOQ2SspktiWcUB/hbN1aVTcHW9icXrd7LUnyZko9o9sq6ukR
 AgmMRAJqqv1XpTuaxNyPqe4X1bJ7UrDw102HC22EcLDyQSE7+RJ8i9LTaNsUtFWluYA24FrGO43
 UbPCHa4267mhoxxJdkBIuDJKhm4xit0ttibtbk1P1Jd9MSp5fPdmGtRsakhEPjrfN/PAJH/UWKj
 M6qY5uBE32BXSj1iHOKg4l1jhZcgtfv/n6LFZ57fWICylSKVEX73NfNujC0Yt/QMj5jw==
X-Received: by 2002:a05:693c:3742:b0:2ba:9b30:37f3 with SMTP id
 5a478bee46e88-2bab9ff5aa2mr157291eec.6.1770930999365; 
 Thu, 12 Feb 2026 13:16:39 -0800 (PST)
X-Received: by 2002:a05:693c:3742:b0:2ba:9b30:37f3 with SMTP id
 5a478bee46e88-2bab9ff5aa2mr157282eec.6.1770930998990; 
 Thu, 12 Feb 2026 13:16:38 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba9dbe127dsm4084689eec.11.2026.02.12.13.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 13:16:38 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 12 Feb 2026 13:16:33 -0800
Message-ID: <20260212211635.396422-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: fix net.h and policy.h circular
	include pattern
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 561521312F5
X-Rspamd-Action: no action

While the #ifdef guards prevent the circular include from blowing up,
policy.h does not actually need anything from net.h. Remove, that include
and instead include net.h in the other files that need it.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/af_unix.c        | 1 +
 security/apparmor/apparmorfs.c     | 1 +
 security/apparmor/include/policy.h | 1 -
 security/apparmor/policy.c         | 1 +
 security/apparmor/policy_unpack.c  | 1 +
 5 files changed, 4 insertions(+), 1 deletions(-)

This patch applies cleanly to upstream master, excluding the af_inet changes
because security/apparmor/af_inet.c does not exist upstream. 

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index f8f7d17a61ca..543f18121be3 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -20,6 +20,7 @@
 #include "include/apparmor.h"
 #include "include/file.h"
 #include "include/label.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/cred.h"
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 6b18775705f9..2253f4b7fd48 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -33,6 +33,7 @@
 #include "include/crypto.h"
 #include "include/ipc.h"
 #include "include/label.h"
+#include "include/net.h"
 #include "include/policy.h"
 #include "include/policy_ns.h"
 #include "include/resource.h"
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index e3cf1a03f79d..855657b3d2b9 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -26,7 +26,6 @@
 #include "file.h"
 #include "lib.h"
 #include "label.h"
-#include "net.h"
 #include "perms.h"
 #include "resource.h"
 
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 7fa346000aa9..9ae858a203bc 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -81,6 +81,7 @@
 #include "include/file.h"
 #include "include/ipc.h"
 #include "include/match.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/policy_ns.h"
diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 74cdfdd43d7e..7d4dd17a97be 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -25,6 +25,7 @@
 #include "include/crypto.h"
 #include "include/file.h"
 #include "include/match.h"
+#include "include/net.h"
 #include "include/path.h"
 #include "include/policy.h"
 #include "include/policy_unpack.h"
-- 
2.43.0


