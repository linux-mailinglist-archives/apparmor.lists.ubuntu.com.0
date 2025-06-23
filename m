Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A4AE540D
	for <lists+apparmor@lfdr.de>; Mon, 23 Jun 2025 23:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uTpBT-0003Xu-HA; Mon, 23 Jun 2025 21:58:35 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uTpBR-0003X4-M5
 for apparmor@lists.ubuntu.com; Mon, 23 Jun 2025 21:58:33 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7D2C53F29A
 for <apparmor@lists.ubuntu.com>; Mon, 23 Jun 2025 21:58:33 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so4539246b3a.0
 for <apparmor@lists.ubuntu.com>; Mon, 23 Jun 2025 14:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750715912; x=1751320712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pedhyzpu3WdS2kMuV5kTAj4wilxyA14VUFJN53GFmBg=;
 b=cmvLN0h5G0gmwyFMSuqr68Nt3kkzZy9ItoUCC5uFyXtPmWLy0+h72l/fhv4FiU4vHt
 T5WmhQLWEXM7p2V05O1FhMAgcVWvAgNGG6AYzXPNhQ83DS/PiH4PGhjiBCdBf9qWjNfJ
 A6Wl+Yf4qFnUy3Aa4Fh8EjPqikMfJpMA2oQ8APy6TWYm+Z50s5mSIgPtd+NhGWIPYuZ8
 ZcTS7qea+V+QyHpUtfL0iP0pr39whJwyA/JQSUcKmlmaoXrQWNtJX/d/0LxeyNlIp86B
 kl2PAshmzPxn9hngmh9S4hkzZTU/fj+54vKPW1Th9XWY7WHFoVRF3R5SOrvNzcFozQ+t
 MNhA==
X-Gm-Message-State: AOJu0YxQPnaCiblsUdUqqSbRfBmuuvQQVXv4jn2X++3ltxgMObaR6VJy
 Fv9jfhJOMPd7L/civ6bds6GVKf/B/e63Np2LKRGx4yeELgsSvZZ7zkxJvg2LI6PuaClmUv76Xhc
 AkOZf25X4PhaJQFKFCABKizJEF3tejG+WMwpOdROpqg4S5RXV4SXjonTyYQbkiUuRynN2Yr03Bc
 onaZ39g7VxjA8H
X-Gm-Gg: ASbGnctRr3PW4C5f3htKp5kvUhv9hU/ZJbfKGFO1o3J06NdRAOZd3eXSh2EVCPnnNua
 G88Q+kAVyc0qBd/ZmVIuFmzl8Z82lUmex8XEdPM1ETesWcIaKbFpjWOd8jLbgP2G1o4Dn1H0CVo
 q6cbFbSygYNIahFmpDVS/dGwyyuE3NYSuezAhz2KFfrsHnlT0SoLaDyp75p9m1k7GinGYDX37kH
 ejbwKAB+PGtbGjAFPa4ZpzS3uz12f3SCDXBYHvPd2A6r++YcdUlJqVGPgMpjt4zxWLTZIFxYjjA
 gGjOoNdYPBz48PeZytLv7797fEcJb/ecxrvKFrnyE1vteGsRsNuq6Oi5EJ45Ja3pi/ftVH4BZBI
 7cF7j
X-Received: by 2002:a05:6a00:2e95:b0:746:3200:620 with SMTP id
 d2e1a72fcca58-7490d6a9d84mr19630286b3a.9.1750715911901; 
 Mon, 23 Jun 2025 14:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvmuC+unYfTmrZQ0DnAV01vkIBeqiSc/K4IXsS7o4fp3VBvXpctJM/sQ6fvxg4d04c1wV78w==
X-Received: by 2002:a05:6a00:2e95:b0:746:3200:620 with SMTP id
 d2e1a72fcca58-7490d6a9d84mr19630274b3a.9.1750715911547; 
 Mon, 23 Jun 2025 14:58:31 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8851b4csm117423b3a.121.2025.06.23.14.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 14:58:31 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 23 Jun 2025 14:58:00 -0700
Message-ID: <20250623215802.147652-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: remove redundant perms.allow MAY_EXEC
	bitflag set
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

This section of profile_transition that occurs after x_to_label only
happens if perms.allow already has the MAY_EXEC bit set, so we don't need
to set it again.

Fixes: 16916b17b4f8 ("apparmor: force auditing of conflicting attachment execs from confined")
Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
This is a follow-up to the patch sent here:

https://lists.ubuntu.com/archives/apparmor/2025-May/013613.html

The original patch I sent contained a missing braces typo that was fixed
in the version of the patch that was actually applied, but the applied
version still has the redundant bitflag set operation.

 security/apparmor/domain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index f9370a63a83c..d689597f253b 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -734,10 +734,8 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 			 * we don't need to care about clobbering it
 			 */
 			if (info == CONFLICTING_ATTACH_STR_IX
-			    || info == CONFLICTING_ATTACH_STR_UX) {
+			    || info == CONFLICTING_ATTACH_STR_UX)
 				perms.audit |= MAY_EXEC;
-				perms.allow |= MAY_EXEC;
-			}
 			/* hack ix fallback - improve how this is detected */
 			goto audit;
 		} else if (!new) {

base-commit: 1fdb22c54a5f64fb9c8a78b0dc36afea87245c15
-- 
2.43.0


