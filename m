Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbwsNOpBTWq0xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30471E861
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIx-0007xX-1r; Tue, 07 Jul 2026 18:13:59 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIv-0007vW-Ha
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:57 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70A0C3F600
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:57 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c88ad1558f4so7323757a12.2
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448036; x=1784052836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dz9WVWjYUyZo2gFfLnAUohN0tOVpPuhhUTGV2TTwQcw=;
 b=FB+bDhwpn5qiJxnf8JPf3gKdCsogym0smSxWhEw8kq+6SOOpKj99GvQlMZp8tJbBMq
 fA0jsGo+bhJ49UWm9ZY3SM6XywVEc5Z0YMk5fuidTeqrH56cQKEDocmd7XA1mu1bkWDQ
 bmf4A3bFjbMEdoZa4yrc4RziW0L9aD1Yw1avk2+ety2mQveJZyiDr/K7WU6ilIHWMHkm
 OY8mZW9f80sJdOHKgRP/QEwYsFPu+G36YKIS+wLwCfTe9BBqhotYCsSK9dAlGJiwfHkR
 1mcRM8v2CbG30qXCTCEZmkgStcDaPFRiwvvd991u/fkRLFezBRttC26bJmbDCgBNgcCH
 RLtA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUX+NBreAcrqZLwONjK5SbMTBcVJOOfsw4kEMEb13YKxmvQzoRYDZ9jEJVgIbq76agkzfR+Ys2yA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxs1zwcnAWEMsPbu4YYt1aAJ3RVrj6IDJ16sUjyd7h+g4dhQZk3
 cnhI3zO7Rr6oGOVVNlJv5/X/w3Yl+UV+CcxYsGEpZ5iiQdIV65Q0v/ujcGWer+sqKWmKsyI/r8v
 P6burYPh83gdZxR/0LD7fREZZC/7c7f8vVhwSTCvrVENSbWuD//dX15+ZNRITKzH4rNwBegoZV6
 jkn+Vh1J9CWg==
X-Gm-Gg: AfdE7ckc4sBXwzWQyiZDejcg12fUMD4tyTk/cCJFTW3/R5IbdXLrNZW2fK44nuWtRsq
 d/veag6uAWg5aVnQ/a5bf6Pud2UnKwUwg4PhuDp0PlIhZljnVGKY2LLl/1AAJFdd4NkMhRVF6xh
 f0k+eHS/KGDphWl1lA0uCA4CR6OOA+ysVtlWwgyqsorNcS6JfSSppznCmaUcdpQJsI1AIWH3Ol5
 zsxcsiH0Zv/OHGqZ7J/rN7ze97FBQe2SO5WjenW1Aq+uqPKvIRZ1nSfYmoiKBHcRlg9R3TMa9Ac
 u/rOmw6CDiDry8az90Wzh1SkuT9QcU3hKKmoWTE1GvfIA4oKz+jyyTE8PTwRRM0n1esuBAYmiLL
 tPzErvLOmLAgpdv8QX8huCQZHpeHuSZWh98IbHffL3hJaVErxy+cL403QtFOnensZziBSzAMWdz
 2UeHhGgH0nIBTfpSdvcLa+OGE+oYeZBroea3wfLrK3NAVeLBc=
X-Received: by 2002:a05:6a21:32a2:b0:398:8870:b58f with SMTP id
 adf61e73a8af0-3c08edc8ec2mr8832512637.14.1783448035996; 
 Tue, 07 Jul 2026 11:13:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:398:8870:b58f with SMTP id
 adf61e73a8af0-3c08edc8ec2mr8832472637.14.1783448035619; 
 Tue, 07 Jul 2026 11:13:55 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:55 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:22 -0700
Message-ID: <20260707181326.968650-9-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 08/10] apparmor: also use condref variants in
	apparmor_task_kill USB branch
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
X-Rspamd-Queue-Id: 8F30471E861

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index a30a17afe4b3..3c2fc6daa75f 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1029,9 +1029,9 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 		/*
 		 * Dealing with USB IO specific behavior
 		 */
-		cl = aa_get_newest_cred_label(cred);
+		cl = aa_get_newest_cred_label_condref(cred, &needput);
 		error = aa_may_signal(cred, cl, tc, tl, sig);
-		aa_put_label(cl);
+		aa_put_label_condref(cl, needput);
 	} else {
 		cl = __begin_current_label_crit_section(&needput);
 		error = aa_may_signal(current_cred(), cl, tc, tl, sig);
-- 
2.43.0


