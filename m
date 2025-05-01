Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF8AA647A
	for <lists+apparmor@lfdr.de>; Thu,  1 May 2025 21:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAZzq-00016L-FE; Thu, 01 May 2025 19:55:02 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAZzo-00014s-KB
 for apparmor@lists.ubuntu.com; Thu, 01 May 2025 19:55:00 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A2983F2A9
 for <apparmor@lists.ubuntu.com>; Thu,  1 May 2025 19:55:00 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-224191d9228so16392055ad.3
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 12:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746129299; x=1746734099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSy6+UfwsaD9dDlpEz0DTQCpOyYe6iBJ80TeNMiX8xU=;
 b=dIvloJ23sUBj5kGNDzHyHsyMRIrDTYRbMV/SA4LAXI4EJu0Bsx6HLTfHn1AMzk7imW
 UaZniiaCtr9I02dhK/GEmFiyPuAa2zMLhvPOqt0XJDFxkEyus+4AEqN9Mha+4btZJcmQ
 BzulG6OWsLpYRF2MHnOPDLu53Oq+mImWoC1jdxDMRLE9QgAJLRaGadIpWwNI0uf92jvR
 uNpaas9j83Tv5yFPrq8Bx+5Y5/Cg0sTSW8nBS1Fk/fL24+ncK+DvNGqxx6vWl2eDzloV
 EQTqVZa2YKNJthPxat3RTheYH4RLT08vdZzHpqzx7vv45KlgTeKWhBBTK5GSRYbgwMoR
 FDww==
X-Gm-Message-State: AOJu0YzSgisFOXhoNTGGgJ8iO7A+1Nb/calydlQzSBb5EtIVVFGzXaZA
 VhM9U2ZQ+IJ4MjGFoUPNS4U+PGFCccqFq5KJg9V7T5qtsoMle51sWwwgTV5p0DhtLbDw7G12Ywf
 BLOnU59tHuYYdacqclRsSijPclylSAs32Bd9+Q1+BcI8wrB2w/s2O6b8VeFHaBW5hnQxm8KISLH
 EVqYlgkNQH
X-Gm-Gg: ASbGncv7iZDZrP0f7J5yKQ3Mx2PSPGAWAUOfwJhCfx2bkjKWEhcdBYrT60kKktChZkk
 gRsNt9iQSWgxghzAQCk+ygh2+96sZX1JRd//K3YyxwgreH0Uolre5gOo7appSaO2WUp8E0W/73i
 tLLaRDOtuBqcdlZFzOCJdRWqTISkpmOffgVgVc0YCU+d3lh2xTE6haGtvzeSGzWw1g9vhgbNczf
 kATwOO9pu5Hdfpwnl6gi/zhjVxRlT4eRLlulhVaMfVL+sfOX4ZoCkJJopVzAK05kFje/ExWc/ek
 ab1II+dWVfjOsxRWtarK93bVt3UwW5Boh7gfx3i0Uixt4CtPoz/rQqHfRt/vJSkdSuNlYw==
X-Received: by 2002:a17:903:1987:b0:223:26da:4b6f with SMTP id
 d9443c01a7336-22e102cd20bmr5032915ad.14.1746129298882; 
 Thu, 01 May 2025 12:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZICpq4ky8k6yNdwMJ+pIpR8WBGyt0+cMfMGJRDmZ2ZIlPC/DwR2D7H00mqmV/E+ctXy7a6A==
X-Received: by 2002:a17:903:1987:b0:223:26da:4b6f with SMTP id
 d9443c01a7336-22e102cd20bmr5032715ad.14.1746129298590; 
 Thu, 01 May 2025 12:54:58 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1084dedfsm269275ad.27.2025.05.01.12.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 12:54:58 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 12:54:39 -0700
Message-ID: <20250501195440.372104-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501195440.372104-1-ryan.lee@canonical.com>
References: <20250501195440.372104-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: fix loop detection used in
	conflicting attachment resolution
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

Conflicting attachment resolution is based on the number of states
traversed to reach an accepting state in the attachment DFA, accounting
for DFA loops traversed during the matching process. However, the loop
counting logic had multiple bugs:

 - The inc_wb_pos macro increments both position and length, but length
   is supposed to saturate upon hitting buffer capacity, instead of
   wrapping around.
 - If no revisited state is found when traversing the history, is_loop
   would still return true, as if there was a loop found the length of
   the history buffer, instead of returning false and signalling that
   no loop was found. As a result, the adjustment step of
   aa_dfa_leftmatch would sometimes produce negative counts with loop-
   free DFAs that traversed enough states.
 - The iteration in the is_loop for loop is supposed to stop before
   i = wb->len, so the conditional should be < instead of <=.

This patch fixes the above bugs as well as the following nits:
 - The count and size fields in struct match_workbuf were not used,
   so they can be removed.
 - The history buffer in match_workbuf semantically stores aa_state_t
   and not unsigned ints, even if aa_state_t is currently unsigned int.
 - The local variables in is_loop are counters, and thus should be
   unsigned ints instead of aa_state_t's.

Fixes: 21f606610502 ("apparmor: improve overlapping domain attachment resolution")

Co-developed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/match.h |  5 +----
 security/apparmor/match.c         | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
index b45fc39fa837..27cf23b0396b 100644
--- a/security/apparmor/include/match.h
+++ b/security/apparmor/include/match.h
@@ -140,15 +140,12 @@ void aa_dfa_free_kref(struct kref *kref);
 /* This needs to be a power of 2 */
 #define WB_HISTORY_SIZE 32
 struct match_workbuf {
-	unsigned int count;
 	unsigned int pos;
 	unsigned int len;
-	unsigned int size;	/* power of 2, same as history size */
-	unsigned int history[WB_HISTORY_SIZE];
+	aa_state_t history[WB_HISTORY_SIZE];
 };
 #define DEFINE_MATCH_WB(N)		\
 struct match_workbuf N = {		\
-	.count = 0,			\
 	.pos = 0,			\
 	.len = 0,			\
 }
diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 0172c06f6078..3c17f8802d7d 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -680,35 +680,35 @@ aa_state_t aa_dfa_matchn_until(struct aa_dfa *dfa, aa_state_t start,
 	return state;
 }
 
-#define inc_wb_pos(wb)						\
-do {								\
+#define inc_wb_pos(wb)							\
+do {									\
 	BUILD_BUG_ON_NOT_POWER_OF_2(WB_HISTORY_SIZE);			\
 	wb->pos = (wb->pos + 1) & (WB_HISTORY_SIZE - 1);		\
-	wb->len = (wb->len + 1) & (WB_HISTORY_SIZE - 1);		\
+	wb->len = (wb->len + 1) > WB_HISTORY_SIZE ? WB_HISTORY_SIZE :	\
+				wb->len + 1;				\
 } while (0)
 
 /* For DFAs that don't support extended tagging of states */
+/* adjust is only set if is_loop returns true */
 static bool is_loop(struct match_workbuf *wb, aa_state_t state,
 		    unsigned int *adjust)
 {
-	aa_state_t pos = wb->pos;
-	aa_state_t i;
+	int pos = wb->pos;
+	int i;
 
 	if (wb->history[pos] < state)
 		return false;
 
-	for (i = 0; i <= wb->len; i++) {
+	for (i = 0; i < wb->len; i++) {
 		if (wb->history[pos] == state) {
 			*adjust = i;
 			return true;
 		}
-		if (pos == 0)
-			pos = WB_HISTORY_SIZE;
-		pos--;
+		/* -1 wraps to WB_HISTORY_SIZE - 1 */
+		pos = (pos - 1) & (WB_HISTORY_SIZE - 1);
 	}
 
-	*adjust = i;
-	return true;
+	return false;
 }
 
 static aa_state_t leftmatch_fb(struct aa_dfa *dfa, aa_state_t start,
-- 
2.43.0


