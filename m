Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KORkJOxBTWq2xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33E71E86D
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIs-0007tB-Bb; Tue, 07 Jul 2026 18:13:54 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIq-0007sb-6o
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:52 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1CD033F600
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:52 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38869800848so1009972a91.0
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448030; x=1784052830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lPQuVurTltKBcYfTNmrRFTzs0Wsecj01pfL/NT7uECo=;
 b=OE3WWX+0ZcaEEpfrTayp+nqedaEbjVWq6XBdYYBGC6+B3UnkbOmiahnyFTNZrt4X8R
 3fPFHuXsCohKPfmWfqzBvv1cErQjtRVwsjZNuzIGCLPWALCcYwq1C9xteiCESQdWn7zh
 qZ+/aTyg4wDg8Ht0a9pezYsyuSzOOV3xE/2YTE5cEVlmY1dF/enfBrERscWSuz629+2l
 YGE/PRQssQDimFJW3ZcMAvT6si3vLOgZNmiFyoDFIy92zrik25q1HO78mEoi9i9QwM1R
 GRohvcuVvSfoQwn2TywEABvxOb3o4IMtz1q9pU49EW7E2Y5K81tcXT/401dbFbyLlXEA
 4bSw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqdLuApBThILKVXB4+wk/3HT953fNOdkDV74myg9vKjNlDtjbWEVY9cM0YXBXS5eR93NfXqQg9xwA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwsWtlG7XdUH8tGqpYVCfwtbgRBJoYhT1xcOmhMlmH9JzioS3OI
 vpcCXeD+BGb8BZ24bK/NSyf1lTK0yEL7SGaqPceQAWvfBJ9w65nexFe3JfZiBKmdCtKWLtHngxv
 iyjfXuOWyBvcM7HfNICVmclgtLALfuJkOEKAIRavAVfn8fBbSckN8bHUaKmnVX3f6QdCo5QSVkC
 cfQQ==
X-Gm-Gg: AfdE7cmZllCD6NWrZliNZFLx32qLzLiRER1/zYoD8r9poNp9wuZQbJIKuqjgOhw3+bF
 rstCMQPGSbdoz6jzFtPqa4QBluMK38ZAvm8J9oBaVtMgiJDZ/VLolwb9VOSXXLfEuweh4jwfOet
 TgzEy+RrE6q4rZuxH0yy+ZK/iRJfPEj22UpQgt2mefvjsIPgF4se3pPcMhSfqHmTCz1uACS9EhO
 0LTnDJY1nleCIUIz1HYaGWlReNoR5mVgbKkRqQp4ziA76Q9i1hHH+dfXhOvfkBgCq0APo4ye4Id
 6G6NLtUvCxA1CKlRdYchZBsA9RrWO8zLXwxu1oVlYrijqCwTdtvntb4ymJcQiweT0Vf2HjGV+fb
 iKiuNf7S4LAint6EykZ7hMPC9A76IvPN8H1PtaYEpI3C9PzNub0Ep07T0+v8uLyxSlh1y10OEfu
 Y6N/RJideI5wZdBj/5FjB08BCoIkbHse8ulOCuPEfTSh1pe3M=
X-Received: by 2002:a17:90b:4a0c:b0:380:873:49cb with SMTP id
 98e67ed59e1d1-387572b380cmr6006784a91.21.1783448030490; 
 Tue, 07 Jul 2026 11:13:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0c:b0:380:873:49cb with SMTP id
 98e67ed59e1d1-387572b380cmr6006768a91.21.1783448030132; 
 Tue, 07 Jul 2026 11:13:50 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:49 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:16 -0700
Message-ID: <20260707181326.968650-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 02/10] apparmor: simplify update_to_newest_parent
	cleanup logic
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
From: Ryan Lee via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Ryan Lee <ryan.lee@canonical.com>
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_FIVE(0.00)[5];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:replyto,canonical.com:mid,canonical.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E33E71E86D

This is a preparatory cleanup for switching to a condref version of
refreshing the parent label.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/policy.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index f6f1b72d7c3d..9475f6455542 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -1145,10 +1145,14 @@ static struct aa_profile *update_to_newest_parent(struct aa_profile *new)
 
 	/* parent replaced in this atomic set? */
 	if (newest != parent) {
-		aa_put_profile(parent);
 		rcu_assign_pointer(new->parent, newest);
-	} else
-		aa_put_profile(newest);
+	}
+	/* Unconditionally put the parent:
+	 * If parent != newest, we aren't using the parent anymore
+	 * If parent == newest, we got an extra ref to it, so put it and
+	 *   retain the other ref we have to newest
+	 */
+	aa_put_profile(parent);
 
 	return newest;
 }
-- 
2.43.0


