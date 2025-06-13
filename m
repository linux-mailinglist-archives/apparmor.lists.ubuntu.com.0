Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61EAD92D9
	for <lists+apparmor@lfdr.de>; Fri, 13 Jun 2025 18:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uQ7LD-0008Mm-Sc; Fri, 13 Jun 2025 16:33:19 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uQ7LB-0008Mf-So
 for apparmor@lists.ubuntu.com; Fri, 13 Jun 2025 16:33:17 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 93AD6446FA
 for <apparmor@lists.ubuntu.com>; Fri, 13 Jun 2025 16:33:17 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23632fd6248so22018565ad.3
 for <apparmor@lists.ubuntu.com>; Fri, 13 Jun 2025 09:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749832396; x=1750437196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j49VH1YexVjnWypBLxrENAFMma/uSIAoM86AnpJdRGE=;
 b=jOYegiRDCoJc6gt4H6fek1r+hmSzFdnibOP715JDTDJpl2DfKBb75sNmywlzcKAAPK
 5Day3fu8qxfY+CZBjRyizooivpAvzlHKxv/sXKnKFEafCdZ80hrcbZAskbPK6MvuDbeY
 DThNDyKGNJMrvmYZq3L87M0CdGC8uFHB1bOtsUUf4rLVk/rQ0vvy/Vt9HBLFUEEJdk9d
 wgFnzJ503vBUglDIVkif/OgrCLABNUfxlH0uHuE7/IU9IPfd2375ekiCEKZhc7swgjir
 nqINeQ0Cx6oP1nAHl0Cl5gnpMU/mXkhBVB09kasDYAYXinRBLm0qua9F+Lo5IuNmmmHN
 OdHw==
X-Gm-Message-State: AOJu0Yw2Mlm3YKsM03dcHP3rFbAlI8X+J8/G3HN3MAqaFr9WkVTkQiAv
 OXR2qR3d4GUqHA74AFCuEMNnglKtbX9vTqUoJx4/gLEaISF10MB/2tUmqA7si3Ef1v++ig2x2Xy
 GcXyAZ42w/4qpiAoo0wejW3BPUFv1RLEiY0zCtXPdEV86qN/QkX4eaiTVgMPI4zSgl5MVVrnMYN
 sWk4eipPeyKxv5
X-Gm-Gg: ASbGncvU3975Dhqe6SNmmyw2Ux9WVt2aWjbiGN0mu1CojS19qTTRQV3TXY55RZ+ye6X
 7jOMaoxdNYt8bdAUud22VGBkDeqJ4baS6dMDLSjN4ZweNlxoS1Swql9P8n3oKeK3gH038elrevx
 PkVNJwPt+1pWrcaxa2Ptxb5nrpu2O6m6BvtI5mIw5b5954F3FTxkDLlnvA1rGGUMb4tmyNhQeKW
 baJp2cUK7bu/+4E6rugszIx+z4LyQ5nDDaNYbi24oMsdFb79oWguCv8FZCY/gM4g38AuQFVcLUe
 8J3okQQ1ARmVfHtoxaqzC8/wKfmUTJAYf4KrQ/WR2kN9wlczkWszgvb13yRtpT+cRL4EVBQCWIC
 V0rJn
X-Received: by 2002:a17:902:d48c:b0:235:ed02:288b with SMTP id
 d9443c01a7336-2366b3c5af4mr1876595ad.30.1749832396003; 
 Fri, 13 Jun 2025 09:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFFQ79MFOfYIn2+YEuLM/Vd0QMjoDkLhQteelY6c63aM80FZgj7CH+p6w4QG+A0znilG6oDA==
X-Received: by 2002:a17:902:d48c:b0:235:ed02:288b with SMTP id
 d9443c01a7336-2366b3c5af4mr1876205ad.30.1749832395592; 
 Fri, 13 Jun 2025 09:33:15 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de783f3sm16299865ad.130.2025.06.13.09.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 09:33:15 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Jun 2025 09:32:51 -0700
Message-ID: <20250613163253.125756-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 4/4] apparmor: force auditing of conflicting
	attachment execs from confined
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

Conflicting attachment paths are an error state that result in the
binary in question executing under an unexpected ix/ux fallback. As such,
it should be audited to record the occurrence of conflicting attachments.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---

This is a v2 of https://lists.ubuntu.com/archives/apparmor/2025-May/013613.html.

v1 -> v2: remove redundant perms.allow |= MAY_EXEC (which was also incorrectly outside of the intended conditional)
 security/apparmor/domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index e8cd9badfb54..b33ce6be9427 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -724,6 +724,14 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
@@ -727,6 +727,16 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 		new = x_to_label(profile, bprm, name, perms.xindex, &target,
 				 &info);
 		if (new && new->proxy == profile->label.proxy && info) {
+			/* Force audit on conflicting attachment fallback
+			 * Because perms is never used again after this audit
+			 * we don't need to care about clobbering it
+			 *
+			 * Because perms.allow MAY_EXEC bit is already set
+			 * we don't have to set it again
+			 */
+			if (info == CONFLICTING_ATTACH_STR_IX
+			   || info == CONFLICTING_ATTACH_STR_UX)
+				perms.audit |= MAY_EXEC;
 			/* hack ix fallback - improve how this is detected */
 			goto audit;
 		} else if (!new) {
-- 
2.43.0


