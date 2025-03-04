Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1FA4D091
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 02:12:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpGpN-0003Wu-JL; Tue, 04 Mar 2025 01:12:09 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpGpL-0003VR-UH
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 01:12:07 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1241B3F5B5
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 01:12:07 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-22348343f5aso91786285ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 03 Mar 2025 17:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741050726; x=1741655526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K6uZuyCxHTuFD3DZCHKXM/GqEGEyBVlWoZeDqzKYlP0=;
 b=grx3vZL1mVMYYrgzZw2ca0YiL2s3TC9tR3JLApdQWqjvfBgoPiZZqbwI/2FCS2qIMQ
 x3LJQ4/+GACvi4bs4HU4w8FjUCPq2+gRmn9glI7/w2fy9ByVnYWCcN5B+LzDgBO+qQ99
 7mcWuLYowxTuFvXgIOum6K4XstjEvZZ22BnOqrorLMiQoHREHAXzUAhhjnRULjulGRS6
 DO00n5itrw0hXolNKnCfZoz2FtCp/92BTaKBAfYTLOH5mlQ/5pcqvMR2THcqMMlM7vfk
 3JYxzGXuOl6JqDlzadWXwKSZOEfAUljcW1aPaGzypaKp7NVTB+N+U5aoF+SJ8EEw/eNu
 fWcg==
X-Gm-Message-State: AOJu0YxrMdRRnvCT4+iw+d7Ewwx+P/yuuhsfn8t41rOIwuxtFnIGeYTF
 DsX0xMz4WWcOULiwWdFpWSMEf5wPe88n6WpXhTaSuOrwHqrX/kHBNL3xp8zY7XGWpUu+TURijce
 uh/C0jMxEDHbbEECzybtyjKHB/evcF24C5jX9WQJPF0br7EWQc8v39GFoxnXDDkC8uJfTb+wI/P
 +l21pMPg==
X-Gm-Gg: ASbGnctjasz6ffGW2KaSm7VbUcyqoC8nGZomETijzxmg6kTzRmlQCEfpcUGiIWNsov0
 6tIUfK/86BYO/uqu4bKfdlnlh0ZcuDITuu9DWjosDxNbzHUYgh4FiWZoX+P2Lprft/phKo9Nm6E
 fEzuBNCYZDQJ2VfL404JVJ7Ysvop6QcW7SG58aWq9G+Kk0qMdSOM1tYldsM5CNjKWpTzwWfcAna
 qQ7fAosaMN9IM86NxuzoY0K2/6SA2fLDKrJ610UhsXqOO9tdkvjmJ79afmdREuwezp0oL9E5+Av
 iYlWxaSWrxEMCafHW5z1HkjKMfd07meBt8b05wgI3t0tgQHYx1uFU80udQoIpfGUfGUdzaI=
X-Received: by 2002:a17:903:fa3:b0:220:ea90:191e with SMTP id
 d9443c01a7336-22368f6a660mr220215905ad.4.1741050725713; 
 Mon, 03 Mar 2025 17:12:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPhunmQgro1DMW9ei3sJyIUVH8b7uHpqyJ6o6kxdNSGB4ZuxPhifFLdKZOiskhaLiMj/E9Ig==
X-Received: by 2002:a17:903:fa3:b0:220:ea90:191e with SMTP id
 d9443c01a7336-22368f6a660mr220215655ad.4.1741050725425; 
 Mon, 03 Mar 2025 17:12:05 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052c806sm84056955ad.235.2025.03.03.17.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 17:12:05 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon,  3 Mar 2025 17:11:40 -0800
Message-ID: <20250304011144.31433-4-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304011144.31433-1-ryan.lee@canonical.com>
References: <20250304011144.31433-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 4/5] apparmor: constify pointer arguments for
	verify_* in policy_unpack.c
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

These functions are not supposed to change the profile struct (or
component thereof), so make the pointers passed into them const.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/policy_unpack.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 22af940a5f58..813bcbdfc773 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -60,7 +60,7 @@ static void audit_cb(struct audit_buffer *ab, void *va)
  *
  * Returns: %0 or error
  */
-static int audit_iface(struct aa_profile *new, const char *ns_name,
+static int audit_iface(const struct aa_profile *new, const char *ns_name,
 		       const char *name, const char *info, struct aa_ext *e,
 		       int error)
 {
@@ -1257,7 +1257,7 @@ static int unpack_and_verify_header(struct aa_ext *e, int required, const char *
  * @dfa: the dfa to check accept indexes are in range
  * @table_size: the permission table size the indexes should be within
  */
-static bool verify_dfa_accept_index(struct aa_dfa *dfa, int table_size)
+static bool verify_dfa_accept_index(const struct aa_dfa *dfa, int table_size)
 {
 	int i;
 	for (i = 0; i < dfa->tables[YYTD_ID_ACCEPT]->td_lolen; i++) {
@@ -1267,7 +1267,7 @@ static bool verify_dfa_accept_index(struct aa_dfa *dfa, int table_size)
 	return true;
 }
 
-static bool verify_perm(struct aa_perms *perm)
+static bool verify_perm(const struct aa_perms *perm)
 {
 	/* TODO: allow option to just force the perms into a valid state */
 	if (perm->allow & perm->deny)
@@ -1290,7 +1290,7 @@ static bool verify_perm(struct aa_perms *perm)
 	return true;
 }
 
-static bool verify_perms(struct aa_policydb *pdb)
+static bool verify_perms(const struct aa_policydb *pdb)
 {
 	int i;
 
@@ -1319,7 +1319,7 @@ static bool verify_perms(struct aa_policydb *pdb)
  *
  * This verification is post any unpack mapping or changes
  */
-static int verify_profile(struct aa_profile *profile)
+static int verify_profile(const struct aa_profile *profile)
 {
 	struct aa_ruleset *rules = list_first_entry(&profile->rules,
 						    typeof(*rules), list);
-- 
2.43.0


