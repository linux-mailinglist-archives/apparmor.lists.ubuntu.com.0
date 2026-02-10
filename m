Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGGrJ0ppi2k1UQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:22:18 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2911DD55
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:22:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vprRB-0006Ev-Hm; Tue, 10 Feb 2026 17:22:09 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mpellizzer.dev@gmail.com>)
 id 1vprRA-0006ES-Eb
 for apparmor@lists.ubuntu.com; Tue, 10 Feb 2026 17:22:08 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so55843385e9.3
 for <apparmor@lists.ubuntu.com>; Tue, 10 Feb 2026 09:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770744128; x=1771348928; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SmyYHYkCf6isXqHI8LRLyQfyBIoea8jRfojSGa+OYoI=;
 b=R3rpxpIaS3Vh26sPncYWdUB4dSkfnVUHL0CkxSERbCe5hChqOXyXZigZZGC26gpgjb
 MSJOkg7tYloZE3fT99BnNpQyyJadvVYkXqfg9V3OZoMTLqD55i3E4iMoEuAhTshSJP/k
 uFbILyIxekYFXUxFg2xOpk8yBr945Y7tHq5DN2AUuqBXGKL3CcHjRGCI8w4A8ra9wkif
 BVqxEJxs/Vso5OL+668Qd2FPFypI0MCGzN1wOlb+vFqch6gyt7dYvdaEHe65qaqg4kDx
 zUTbb60qXxgxdwd+xi+o2tXLUjVIAUYZ1D1CsCEGsJSXLJJnV6ABVUy/GTC6C3zJUHEL
 9ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770744128; x=1771348928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmyYHYkCf6isXqHI8LRLyQfyBIoea8jRfojSGa+OYoI=;
 b=waBRNkLQVc14nhkXsO4ngn+alB6VhW18XbxtjUi5zAOrIe1rtsoME6jz7/TkQ3cBMf
 WoLHrCqDprqrtDlcX1mi0DtQjs70zR4mO+wZRpF54vwruWBEOvm4+mTqs6uh1zQ3frr2
 D8m8MN9kAzBdlKg5bq58aoo4is8dcUSZ3ID3+Cyk/BVgw24mg38xoHYnXqtTMKp62x0D
 S1sKat3T5QALW9S6rj/+3r+9e4IBbFnEX2SPe5fL9lZJ7HODR72YoiKBH1qvCSECaOH9
 ftx1MKi0o5Gz9tiiV1uvoxrhuenSUB0yh0c1zXoIGoTOoKKvqrELgu4XO+0cabl15oSJ
 2DRw==
X-Gm-Message-State: AOJu0YwLOa+zg2wEKkNyAalwxf0AEDUm8cOc7sC88xSKJT30SfT1Vuxt
 atX6GWlZu2jL5AW7/VqVs2m3FwPi1hsxHQLgRrM+8vm3jGQ3Mwf61oHs
X-Gm-Gg: AZuq6aKJObcWtBYmd7UbGtmG6PFVbUtva2g8T2kHkeQ3d5LnbKOo5Ixx/8cY0xUDBLr
 2KldIYpFaNs+GcUmqq09prhMOQmSRxFjYPXbJO0yZizpdzqcz+LYT/qwqmOzgu+TOV3sXtZg1e3
 f3MSG7LE5/d+niihZr5tkHQGMHMpum9FI6H+b5oVyFuIwV5KvoNvFl0ZDwfJYLCKMD5ZISKXvX4
 k7tLh+s5XpuLTAq/L0qnf3UAMg9UTziwULEu8yQN+Rw80ec4Ds6XHbV8GMKnXTP8FSltwzog8Mx
 Q9NRxB64YFnRQeVV9CgI1uhe1bHPtirxoq3XbfBZPE0gGf7oHPpfgZzYnWl0kM4cvqiQazEAJ9S
 J91UkrAcMPE21T+W0axjzzsXRHwTf89AVP40uFuAW+IMmwVgKGEyCJxsx2k3ZXQ3SWgtS7QWzS0
 sySUuIOb4jOn+e/8IuH2j1lULvSj1ZgJ5POEZsjD3kv9bP5KD5rz02OrD6FVAWhQ==
X-Received: by 2002:a05:600c:8116:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-4832021c74cmr239650605e9.26.1770744127455; 
 Tue, 10 Feb 2026 09:22:07 -0800 (PST)
Received: from geekom-a8 (net-93-66-82-32.cust.vodafonedsl.it. [93.66.82.32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d480530sm118237175e9.0.2026.02.10.09.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 09:22:07 -0800 (PST)
From: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
To: john.johansen@canonical.com
Date: Tue, 10 Feb 2026 18:21:24 +0100
Message-ID: <20260210172159.535137-1-mpellizzer.dev@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.46;
 envelope-from=mpellizzer.dev@gmail.com; helo=mail-wm1-f46.google.com
Subject: [apparmor] [PATCH] apparmor: fix incorrect success return value in
	unpack_tag_headers()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FROM_NEQ_ENVFROM(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Queue-Id: 64A2911DD55
X-Rspamd-Action: no action

unpack_tag_headers() returns `true` (1) on success instead of 0.
Since it's caller unpack_tags() checks the return value with
`if (error)`, a non-zero success value is incorrectly treated as
a failure, causing tag header unpacking to always even if the data
is well-formed.

Change the success return in unpack_tag_headers() from `true` to 0.

Fixes: 3d28e2397af7 ("apparmor: add support loading per permission tagging")
Signed-off-by: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index dc908e1f5a88..221208788025 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -825,7 +825,7 @@ static int unpack_tag_headers(struct aa_ext *e, struct aa_tags_struct *tags)
 	tags->hdrs.size = size;
 	tags->hdrs.table = hdrs;
 	AA_DEBUG(DEBUG_UNPACK, "headers %ld size %d", (long) hdrs, size);
-	return true;
+	return 0;
 
 fail:
 	kfree_sensitive(hdrs);
-- 
2.51.0


