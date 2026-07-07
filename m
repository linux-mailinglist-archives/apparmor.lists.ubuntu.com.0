Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5bLCMepBTWqyxQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CA71E860
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIu-0007ul-LM; Tue, 07 Jul 2026 18:13:56 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIs-0007tQ-Sa
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:54 +0000
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A7F423F301
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:54 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c856470fe9fso3736845a12.2
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448033; x=1784052833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9rRm61RzrQIGYFjT441ZbXpVUyo5Z/+gcKnChy59bvc=;
 b=CtYNanYn2dCtjj/HuXg88YynQ0PbUq5ZtLiOL+4sk93unxz+BmYsd5UieV/otT4HF/
 21aqG5XtxqMaK56JZNrJePuo0Xvcdo4VECkw8AjM1sLuqYXCZ7XWDhK+I5OSIkD6wn3S
 RZN7dbKdh0Dk+aCc/t1DRuU96muN0CPq4ngq6WPAEIRaHz457YC0s0gDn1eT8NmRJH2O
 fVizjbmmDNuIhWnNh22JeQUHgw2LYowIa47X+/CXhd5QTliOMyvlULOy8Uq75b09qQP/
 zU9qB5VqZiCg9zujZNJJ6m7j58jT0uU3XnSJJWVurwxhEJZ8jAxUJO1GoCCoaDMUVdbs
 w9IQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RprjQHB4ANMeOJdFalPL8/zR+KY+ScGh1pL9BPTg0PW3OXZ4oxfo8JGrtDep3gp6yrLILZyB/D5EA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxYkCxZqJ3bp4mBGrQmX8q5lXjOEPwmh1+3V0fglHZESbAuPIdj
 /GcNpzxowW0X8uHcftQgjVZRCL/hWSM+mAWirT/0Y5zyZfDFkle1cjKb/LboDZYKUy4O3NrBAIC
 lzFO0c2K7py0tCkIzOI1HrK+bQlTQhoCuWJdg2BZXIcfSpuADsb1+MM9XhZCyVI47mDWd2DWaar
 kO3ERRmZsMtA==
X-Gm-Gg: AfdE7ckJDRZTPuq5v8//Je78TH9isfSy37ZcPlNaSJFhHiQ3Ii171zPg7jwG3htGLmd
 PPa9H7O9woLLMfD+oygAxmnRsgCNJ1eOdejZtxAmgvMk1Necnrx1RWTeAdY4yiL/MfPs91Ee26X
 ivHPPehrCt5qlDSUubYb8iwBmT5drIEQiHk4G8EjUTp0zfOdX8t1B0mCbAHdXtBVy8BF5oOef0Y
 3HVWKvzd566+tdVb2kHn0GsDwGNKVl7jR9KORMhFWSnp0RcFKsMV1goCE2Evw8NjJ5+dJeBz5Tr
 2JQd5Kn2SS8cbUha9glpLGr9hSJJHKAX1NdmxDdG34XjbQKUBfx8ghx06bFaHhNSdHMts/rI4Kj
 fzZM4C8uTnmJpGGSaLMOTDimQt1Qg4ckD9Hj4t8+I1qQyiyOg5jLI5VzZJ8UYw7XgmBwKd79y4u
 pP62GaFGIFGJ477Dmqdm5IZd3PonaxxmoTl/NAGcFl6UFrcME=
X-Received: by 2002:a17:90b:4f45:b0:37f:9cdf:f039 with SMTP id
 98e67ed59e1d1-387572b4606mr5036639a91.28.1783448033201; 
 Tue, 07 Jul 2026 11:13:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4f45:b0:37f:9cdf:f039 with SMTP id
 98e67ed59e1d1-387572b4606mr5036628a91.28.1783448032833; 
 Tue, 07 Jul 2026 11:13:52 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:52 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:19 -0700
Message-ID: <20260707181326.968650-6-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 05/10] apparmor: use aa_get_newest_label_condref
	in aa_replace_current_label nnp refresh
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
X-Rspamd-Queue-Id: 7E5CA71E860

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/task.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index b9fb3738124e..4c6112ba63b7 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -64,9 +64,10 @@ int aa_replace_current_label(struct aa_label *label)
 
 	if (ctx->nnp && label_is_stale(ctx->nnp)) {
 		struct aa_label *tmp = ctx->nnp;
+		bool needput;
 
-		ctx->nnp = aa_get_newest_label(tmp);
-		aa_put_label(tmp);
+		ctx->nnp = aa_get_newest_label_condref(tmp, &needput);
+		aa_put_label_condref(tmp, needput);
 	}
 	if (unconfined(label) || (labels_ns(old) != labels_ns(label)))
 		/*
-- 
2.43.0


