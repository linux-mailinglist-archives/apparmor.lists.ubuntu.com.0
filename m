Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJQ6FwrYb2n8RwAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:22 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D814A702
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1viHRU-0000zz-Fk; Tue, 20 Jan 2026 19:31:08 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1viHRS-0000zj-9V
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 19:31:06 +0000
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B5613FBD1
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768937466;
 bh=zsQsyBCejB/Fvx8zDTMnZxaLwgNvLvHWb04mK5Y+/mc=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=Pdj/NfMZqmCmqrb6cj+3mYojdOnnob58+nbIP8r5h8DgI0TmdBKPC7WnbYCTLCutE
 S+grDQkDGqcTOYDRZGoLnbjpDN8QO1Bx3rKEhN5MEluEnfDK6+7NSE3nC6tuv1kaA0
 WiEN58V4w2JKIoKi6srwKVRPdRJLK/NHHzV2Bmdf29gpStqhHVBAc6cYhCjncXu/iX
 oA4dNKdsyiA+YORKqhEhUoxV512/JYYqgq9XcVa4eVTsHvgnC0lLRp+hkRzhk9yooI
 3ftvu+j4GH08oCx4qVuuta+gNFdG9ZG2N6BrGF4r0sroyk9BzIn607dbUrsvUBF3op
 47kK0IQ4e167H+S0IBkdjSstiusHzOWiSg5tD41UyEgd7FQQZvafMmeYAqmLiWd05S
 FUvQlrFSoI/3pEqrGYFxemNyrRJai05RxOQqXA4TTe0uqb//GCeG7HPtrzSYL/vpWT
 DbDv/Npu4cTmNjffodxhnYREe/V1LM4Ge2D2O977HwZihH1oNgRuPpG4iSyq5BDL38
 xvKKAXPMI5b3zD227lB7sRFfnstSH+tVMbgSyV9+CS9zDJAYHGKChrosw2A8UD9F8V
 N03K/G/QwG1EVYR7jIkC4fzg/ITEmtYcH+AsJ/VTg/tcppdIdF2N1APFgZUDwkHFmD
 dNjTFOrRIjoNCds/ByGxEmqw=
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b6be90b6d1so192561eec.1
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 11:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768937465; x=1769542265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zsQsyBCejB/Fvx8zDTMnZxaLwgNvLvHWb04mK5Y+/mc=;
 b=S16iLnuiDBp39yGAOV/utioYCFdxHiPmp3zfqqbeqL/mAV9qnfUhNkLD3x/yXYA4se
 s4OUD+o7ivuK1dbmUrbd8bNsmmkifH4FOXUXZpGd9hsy3/PFJ8Nr7L9tbN9HfFnaHE81
 mRTAQzwkCDQYkHN6CLR25w4ZihlyUPiyzBxWcRsHqkaGSVgMbHemSCgmUCpy5pidpS/X
 6r49HTZTlhcq1KTrFc2G+0K3fHeU9VjH55IUi4Wd3n72ZQF6XIv3B+4Q2SMtXXozb2Gc
 XAC00Nr2prXwDL6STbYyvS15pURmgzJ1lEO6fZ3vsFOxTebSVuyPVjdC8ECZB5vaxKwf
 H63g==
X-Gm-Message-State: AOJu0YxvnyuIxzl1aMZx3cD822njy6WsE3aEOavAH3VguFLkNcbzSiST
 0NzYzm+ZgHI8pXPbswgL1Ub1wnrdF79FgdY1uy8o2T/wwVW/yd3v10eeUCXm4NrkI+KjKdRio44
 ywQUl14maMPZLg42Yd6Yvv8Pm/baylLi2VyARs0AAF8eu/JqFQCzKvXWTbcaIHgABIzoicQe+rN
 Mg5WJM0jx3Bg==
X-Gm-Gg: AZuq6aLErMF2faoGSHbqnZX67ehsafS9zSTBYUEH98uSxuUWLaNGbYozQc0OaVcmsvv
 c4TyYZTtS20hx5lzABDZjDgtnBN0O1D7gsAxWxkP53PLroLhFs2dLM7gSX07IT92mAMpzQmWxYa
 pYcHdbAEp3R1lsej39dCLP9ShEeLm8D2I+g+9IG6U0ULLDQ2+oTvhdAiasaQMtpVJ5GcfpGAMSA
 J2SbJKETBXZeDB/4SMtOToJyNc28byMjMhWrsmxI0o3AxZo7vfyBtQ/SCImsXN0Fr8/xrlBfpDS
 9Kk6xO1Qe5cVNDZ7sjt26lplIFoVtnmB+V1wfLivlDf/Wfbjx1wH2PFf9L67rIeNekyh/e5w+lc
 2cq5lmTX1+9VbUwXkyzHbOueUUOtr0l3GBPKAafGMMm5ouhsV/vzp1R2VDubd9blidbs=
X-Received: by 2002:a05:7300:fb94:b0:2b6:bd8c:4903 with SMTP id
 5a478bee46e88-2b6fd7ed928mr1767801eec.1.1768937464675; 
 Tue, 20 Jan 2026 11:31:04 -0800 (PST)
X-Received: by 2002:a05:7300:fb94:b0:2b6:bd8c:4903 with SMTP id
 5a478bee46e88-2b6fd7ed928mr1767778eec.1.1768937464175; 
 Tue, 20 Jan 2026 11:31:04 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm3641399eec.35.2026.01.20.11.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 11:31:03 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 20 Jan 2026 11:30:47 -0800
Message-ID: <20260120193050.78700-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120193050.78700-1-ryan.lee@canonical.com>
References: <20260120193050.78700-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/2] apparmor: introduce
	adaptive_current_label_crit_section helpers
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
X-Spamd-Result: default: False [3.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 02D814A702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These helpers encapsulate selection logic that chooses between the atomic
and the non-atomic versions of the current_label_crit_section helpers,
allowing dynamic selection when atomicity is conditional.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/include/cred.h | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index b028e4c13b6f..d5e7d4203ac5 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -142,6 +142,24 @@ static inline void end_current_label_crit_section(struct aa_label *label)
 		aa_put_label(label);
 }
 
+/**
+ * end_adaptive_label_crit_section - end crit section begun with begin_adaptive...
+ * @label: label obtained from begin_adaptive_label_crit_section
+ * @needput: bool obtained from begin_adaptive_label_crit_section
+ * @in_atomic: whether we are in an atomic section
+ *
+ * Adaptively calls either the atomic or nonatomic version of
+ * end_current_label_crit_section depending on in_atomic
+ */
+static inline void end_adaptive_current_label_crit_section(
+	struct aa_label *label, bool needput, bool in_atomic)
+{
+	if (in_atomic)
+		__end_current_label_crit_section(label, needput);
+	else
+		end_current_label_crit_section(label);
+}
+
 /**
  * __begin_current_label_crit_section - current's confining label
  * @needput: store whether the label needs to be put when ending crit section
@@ -196,6 +214,26 @@ static inline struct aa_label *begin_current_label_crit_section(void)
 	return label;
 }
 
+/**
+ * begin_adaptive_label_crit_section - current's confining label
+ * @needput: output bool of whether label should be put
+ * @in_atomic: whether we are in an atomic section
+ *
+ * Adaptively calls either the atomic or nonatomic version of
+ * begin_current_label_crit_section depending on in_atomic
+ */
+static inline struct aa_label *begin_adaptive_current_label_crit_section(
+	bool *needput, bool in_atomic)
+{
+	if (in_atomic)
+		return __begin_current_label_crit_section(needput);
+	else {
+		/* Value is not used in this case but still initialize it */
+		*needput = false;
+		return begin_current_label_crit_section();
+	}
+}
+
 static inline struct aa_ns *aa_get_current_ns(void)
 {
 	struct aa_label *label;
-- 
2.43.0


