Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9JeqFu1BTWq6xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4587771E87B
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIz-000825-Lv; Tue, 07 Jul 2026 18:14:01 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIw-0007wm-Jq
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:58 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6AB4F3F301
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:58 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cc88e22f92so59370575ad.1
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448037; x=1784052837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9KYHbeV3oUQaG3m0Dc/S7pd4UaFlD0J9cNSkXLVIAHc=;
 b=i7+e5PR8Rr6b+RE5CusNmM87g849KOX9Qk+wGDFSXDV4rrcKdYpyYJnNXFDPN5U0V3
 LZdX1sQFJxgjrmPcYblL7e8Oqd+yF9XsUrWzJGvAIdgEvnVw/Cwr/IKmuFr17MJLlLm6
 alc2CR1KhfVPBXl1rXdKTW5GL9fjCb5pWnOoXverzjh6rEyXBpFhHi4G8/PLxisYZaKP
 lPq40Udsa7So9amL8CwvIKbmS3jH/msygrHGGykhaSzuY3ZeJDrReCJ/ybZW9iSnY2i2
 dGRZjgT8/a5zmd6KEwKqxyIAaiR1IOuRETemUs6UPW7EGFrJ6W/YR4QogX9Ww5Rsq2Gs
 2AFg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrmsEjLnm0hzZzHjnGEbyOM9wKK4DudiOF1zrgZ69AZDlwQ8r84+qMVI4/nHGlzt4yjA0O0v9pyQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw/py+ayBCo6/fcPovF0QZWC15LACrikRiQ/mIQPk1tssvAwcRM
 qGV37F72C7AMK1M03enc3MVLhGMC2S8MANFh6GnhLAUUp0X6tWLJZcVAEVJWG18d4898Pt+AT5o
 GYzZuKqID6ybRtEbTJyEPM69++6FIC7lFtSLGV/cjSC+ss2nQliXKRbMOik4y+jJxHgPwV+K6X5
 1XKw==
X-Gm-Gg: AfdE7cmv0Wluq7gKGPw/BDy9HE4aBaM1iFCsMnvGb71IScMMbxFe4xz7fDyVqH6yiMv
 VLGFy8u/Bapixx3LuAnX0ML7u0DK7kb5pX7PcCTNAFo+2PvRErwhqIIwDmYe0PaXcmF0vbmSOhr
 epxX18mrpjEFhItzSDkXZJJ7brlQK61HY/cwQJgK1y4YJumu65QZ1n4XGILAd1Fru0EhwUNo9fL
 vS9PMhpN9la1yADqMPpTPABOpjQX1Veha/4qMG3fRGh4pw6iEkjc6W7jfMd/gGwT2X5VwtIY/2W
 F5+874QoS2NB2Pb1JTqDOmloPgx9lcNaB29Rv/zQLiiaSRRkXIGW4w9HjNp+GCgpIUrFvSq+vc1
 TJxdQagEW5+RlkjW8HUvadivr5YnY2czhLG+ib7EaMkCGV+Cl7JTRBCklM3zXlWG/etnpyRrJpC
 2wKShmsYzbzrNlHROlDNJFwcu9n57FNvKLXWjPfYRompaXj4U=
X-Received: by 2002:a05:6a21:6450:b0:3c0:9c19:65b2 with SMTP id
 adf61e73a8af0-3c09c19698dmr4154639637.74.1783448036940; 
 Tue, 07 Jul 2026 11:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:6450:b0:3c0:9c19:65b2 with SMTP id
 adf61e73a8af0-3c09c19698dmr4154614637.74.1783448036577; 
 Tue, 07 Jul 2026 11:13:56 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:56 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:23 -0700
Message-ID: <20260707181326.968650-10-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 09/10] apparmor: also use condref variants for
	apparmor_task_kill's tc cred label
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
X-Rspamd-Queue-Id: 4587771E87B

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3c2fc6daa75f..3168063e8eda 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1021,23 +1021,23 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 	const struct cred *tc;
 	struct aa_label *cl, *tl;
 	int error;
-	bool needput;
+	bool needput_cl, needput_tl;
 
 	tc = get_task_cred(target);
-	tl = aa_get_newest_cred_label(tc);
+	tl = aa_get_newest_cred_label_condref(tc, &needput_tl);
 	if (cred) {
 		/*
 		 * Dealing with USB IO specific behavior
 		 */
-		cl = aa_get_newest_cred_label_condref(cred, &needput);
+		cl = aa_get_newest_cred_label_condref(cred, &needput_cl);
 		error = aa_may_signal(cred, cl, tc, tl, sig);
-		aa_put_label_condref(cl, needput);
+		aa_put_label_condref(cl, needput_cl);
 	} else {
-		cl = __begin_current_label_crit_section(&needput);
+		cl = __begin_current_label_crit_section(&needput_cl);
 		error = aa_may_signal(current_cred(), cl, tc, tl, sig);
-		__end_current_label_crit_section(cl, needput);
+		__end_current_label_crit_section(cl, needput_cl);
 	}
-	aa_put_label(tl);
+	aa_put_label_condref(tl, needput_tl);
 	put_cred(tc);
 
 	return error;
-- 
2.43.0


