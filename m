Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y24XNOpBTWq1xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A348B71E862
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIx-0007y3-6J; Tue, 07 Jul 2026 18:13:59 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIu-0007uk-Fp
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:56 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7D0333F442
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:55 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-37fc66ee6a4so8603031a91.3
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448034; x=1784052834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=t3gZr+Hk9AmptS4K55Ky4SVOCvtYsTL3lJkgi0jkldk=;
 b=dv62Djfx6vFyoDTWpb0XpfWQEuAiizoXW+GCDG7AMxLai+8DqzZOYAzv0at/BKxRXX
 7NDtr+upVMKdDuz85gicsf6WNfkorYf+4uf9Cm527ChmtvW4iWDOFB0rAuFmgvkJLx7S
 3n71O95Hc6Slkjh/IK29q5SFhkfyc6g5v7PlWksR3CGVSiuKZl7BfOo8wCZFpkin095a
 czlSoSlt6iNY3M6yQKTXIYDIoOUqDPYInNCZqZCJZlKT4+DtVELSSHZ0CQddnO5NwTnJ
 rOEC62JXGoHp0H5DkSW9fo03RwUwal5/xGICZ3POM1nW9LwDrtLjNs8/FxWKOk2gySzb
 pRIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoV/9VinlDdkTz1drp/Ju2o7dh6Mx+3tzMcqFMz3KpUOuExY4J1Hy1tR8iQ3W+pokN36na3+rrj9A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxP78M7OG58G7O0+rrhEO+oo2bILSxhsIEKkEjc2iXZR2EDJuAl
 EtzDE8WlkX4VXWD88jusLM+eY+4M/8FN8NKmA4qftGlN7KiMj/uxIKX80nE4HzkYzjZ0PIogIjK
 g6OyJistSnzL/9/+YcW9cqVQw+j6G5BmTwJBAsPabPzDbfubriIsi+xvxXkjcRV4KMJevV0AXSX
 QTrA==
X-Gm-Gg: AfdE7clt+T1kSdQsjCSDIf/idtAMhj5iSB7JJSSMTEdHUgTA0BXM+wE4vAtD+QFXee9
 Uno/vSULZqF0LYiUz0gOPyJhhGj80bgY1Xwu3O2HnPuC4D+DqFvm6aKo3qqsSEC04tvbHHW313V
 MVUZIIzCnZW3QQQzmcpmMq4Wo2Wj4xmDtL7UEGW/R6QJ74XBCcrxnly197dgWd1aCO3snKEom2z
 jOjSaLPsaLIa6fXFQAB6WbY4ukOkiN59cEZCFxEoeGabpnUz6ciKoxw4oMmnS22JKhA+KlXqV86
 BKv7Rauy2QISnDl3eh7ibhiQVvWwGBFDUj/NPH6wqpGJObEJRiOGpJVjxGSrOAYx3xBqk0dRKDj
 bDiY1rYovMg4DuVhLmZ5RKNYLmp/2i8ofHrT56j1PCV3o8TgkskQpW2UEkQPUXVdfBZivYQ5gjf
 Cdc+6cQW0qY0RSVhGWIeLIvkmmp+xWbLgfKX8lMoWmm8a/uU0=
X-Received: by 2002:a17:90b:55cd:b0:381:193e:7869 with SMTP id
 98e67ed59e1d1-387568fea4emr5784635a91.12.1783448034018; 
 Tue, 07 Jul 2026 11:13:54 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:381:193e:7869 with SMTP id
 98e67ed59e1d1-387568fea4emr5784619a91.12.1783448033722; 
 Tue, 07 Jul 2026 11:13:53 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:53 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:20 -0700
Message-ID: <20260707181326.968650-7-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 06/10] apparmor: switch to
	aa_get_newest_cred_label_condref variants in apparmor_capget
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
X-Rspamd-Queue-Id: A348B71E862

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 88d12e89d115..d158c5108f0e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -167,10 +167,11 @@ static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effec
 {
 	struct aa_label *label;
 	const struct cred *cred;
+	bool needput;
 
 	rcu_read_lock();
 	cred = __task_cred(target);
-	label = aa_get_newest_cred_label(cred);
+	label = aa_get_newest_cred_label_condref(cred, &needput);
 
 	/*
 	 * cap_capget is stacked ahead of this and will
@@ -189,7 +190,7 @@ static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effec
 		}
 	}
 	rcu_read_unlock();
-	aa_put_label(label);
+	aa_put_label_condref(label, needput);
 
 	return 0;
 }
-- 
2.43.0


