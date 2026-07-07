Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ThIMOpBTWqwxQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5971E85F
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIv-0007vs-Rg; Tue, 07 Jul 2026 18:13:57 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIu-0007um-Rq
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:56 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 790773F600
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:56 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38001e788d6so6563019a91.3
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448035; x=1784052835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpoEQE+YBguvuoVuFsXYA3Hq1mOgptqA/t0mzNmwLVU=;
 b=OdiV0Hs+nUvonTRt8JtqT57qxqT5Kom4jxmgfoyAw89uAAHehFipGu56iC3LTUX6ff
 xWyqfsGa49OAtOzMvDTyiCdUvAlmwV8ey3L66p9gz/f79gZaqCuOe1pL8i55je7OVpmr
 wFeCFcpAiRS7sf9RFDhIXEykpboWfdSzsGwgKSltvz+8jCLJyhmFpWiAJEI36jDSUTMg
 GsxD79mzmQ33A6JGrRMuKabiQiRWmQWNnLUijiQ1K6GLStcHIEy9ZEhKS/zJybRAMMOS
 mhbZ//XIEXirOmWwu2jtkhM3Rd5+LCGirchw/re305jIuBof9cRImMWa602F6TbrFh4S
 91xA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLjztN7ok7Fy1rVQLiTYiqAU8pQXKi7/sbTs1qspZ7xJDwKXRQlSlYrfwrGBA747LewNgv2L9B2A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzxD/SO72EkCRUW1COes3hdgaN4d0YizQJSOdzm22j+ae3cbMci
 yQCmqOYzYbm88qSKrRSwA6n8/it1qHRuPVm0ml9uf98WF76IaHtBikarrPPrEvct71gE3ED2M0i
 9TerjFb2whCYdvXnuUNCRHUUbmx06upJiOYD+su49PnQKoiCcMzj3hoBmpxntHvJV8CyCNn6eu0
 IcN2WQd6Vd8w==
X-Gm-Gg: AfdE7cm3eZ7rYc0Xnf2QrVvWwwPe1iWL0R6ChImNvCR/z9dMv+jsfKpXmFpVIiIfZvR
 t4o1InJr2y99srLqPd5Il/GNFbZREsfV8aTkS7GGRz7mfHt47sdMJ7mNeRnpNc+y7KhMDXN5tWy
 bcSaTdkBw2DT/MgYvkCh7J16t9g43lz2JEZTondA1mtdCvbkBgWex5/cPARtrawnmIIn04a1CRy
 2JxxqeR4hznRTRV4DXHuDixUegjPmYrPKQDSIXR3Ycb3RNBYLG4JrGNs6OD3SGobK8CXWJIcWai
 lozjfU1Vva+ASkLAe81tZScyjOFZ5xihVwYqr5cuMR8BBunYLoceJuVbm+3ceSPHq2sMe7ltB9r
 FVkTu8n5GKasV9ei0hTQGYMqBxRJ84qKLV3DIxx8neGWsWukIuvAzU6ww4dLcec65RLP4bDt2Wu
 Ut8cfvLXOQJL09MGUnHgvtPdnfv5XbeacQu6bH2mIbW4ONwqI=
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id
 98e67ed59e1d1-3875854e02amr5810034a91.33.1783448035034; 
 Tue, 07 Jul 2026 11:13:55 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id
 98e67ed59e1d1-3875854e02amr5810011a91.33.1783448034658; 
 Tue, 07 Jul 2026 11:13:54 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:54 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:21 -0700
Message-ID: <20260707181326.968650-8-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 07/10] apparmor: switch to
	aa_get_newest_cred_label_condref variants in apparmor_getselfattr
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 60E5971E85F

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index d158c5108f0e..a30a17afe4b3 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -786,19 +786,20 @@ static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
 	int error = -ENOENT;
 	struct aa_task_ctx *ctx = task_ctx(current);
 	struct aa_label *label = NULL;
+	bool needput = false;
 	char *value = NULL;
 
 	switch (attr) {
 	case LSM_ATTR_CURRENT:
-		label = aa_get_newest_label(cred_label(current_cred()));
+		label = aa_get_newest_cred_label_condref(current_cred(), &needput);
 		break;
 	case LSM_ATTR_PREV:
 		if (ctx->previous)
-			label = aa_get_newest_label(ctx->previous);
+			label = aa_get_newest_label_condref(ctx->previous, &needput);
 		break;
 	case LSM_ATTR_EXEC:
 		if (ctx->onexec)
-			label = aa_get_newest_label(ctx->onexec);
+			label = aa_get_newest_label_condref(ctx->onexec, &needput);
 		break;
 	default:
 		error = -EOPNOTSUPP;
@@ -813,7 +814,7 @@ static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
 		kfree(value);
 	}
 
-	aa_put_label(label);
+	aa_put_label_condref(label, needput);
 
 	if (error < 0)
 		return error;
-- 
2.43.0


