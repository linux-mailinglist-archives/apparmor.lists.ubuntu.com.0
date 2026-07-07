Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4pEgMO1BTWq8xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17571E886
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIy-0007zt-G7; Tue, 07 Jul 2026 18:14:00 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIx-0007yq-Fu
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:59 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 648F93F600
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:59 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-388b404eaa4so421536a91.0
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448038; x=1784052838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5UHXheqXq3IdftVa12M8+AnZ74qdghkDQ9Fev6RdqbU=;
 b=Ny/OurdEExWP3JB3HG/d2k/TSdx/ZHi/OSmOxDbqz71j6ucrbujoywSv1yrAcidyDQ
 TRGm+mnYeM8dpiBe909JMesr1gbX4XKlQbxYLEYdxT3FeJwrFsRpo8OhGZERIIXFPGMo
 N4+cf8mw46WVD8mAya3VwobPW75zK60UI3KdKHAJ+DyJyR0EBb0Yj35FOKCO4ypq4dR5
 Ub/OdYR3I5/aMVc2W7JCYn0cjCcJ7Vn2qGqpcz3R6Iy9/PjkkWvHbvDq93LD50PYONzx
 1HDm5wbbQXd7gobkRK0ITx/jSO1jlQVRRtHscEOdc8wCzR+XSdbUKlLc13cgA6vKWNTB
 wB/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqORaXLKRprphZybPXXk1ukE4Go7riJ//pDVERR7bvh4lgiCJv1nTuB8PN4+l9asazVNY78dmRSRw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxA3dV/kj7lz9sPuCP11AGyCGiQAW+QAcA0elTm+ee2gddrvpGn
 Fgh+a39+GMvZFarsqy17KM92hsfmTSmaA+AzksgZbjYJHUQIcnCfC38w0ZqJ5wmntX+hYdQ8WBd
 imwxJ4c2oSaRQBZ74t/WYjUYSoH9aUjSpr9BTK4ckrcT6eGlFA1D7S0lF9ryQAvMNr/1005Sg83
 U9xsqpnVYXsg==
X-Gm-Gg: AfdE7ck6uMxJUthvSVB4rLCJb0RyDJiBQYBYm4h85ZKyX43WwtCfo89kCwOUfoUDQsZ
 MmmZYo7pJJDYcdVQCBwbJTo+RsAqn7WIq8lEr0MWD5LkSo2r3e+LurVIOH8OLgHvONV8mlq/RrZ
 6/V84xoQ8dcR4XMZVgss+1aoNnaU+tC2vu1SnGQD9wEwUrVpG8aSv6olYa4QIEZV1L7WDraXx2G
 djgRw4z0jYTPb1f2djJZbPtvwAK0o6A4DCpiG1HD9JkCRRBu+vHv18CgmI5as71ZsfLFq4lyRzj
 4e8pLmfvRz03pAca5mphnxroPggM2v6CVojgQm+Jq3drlrTD8cGbodhOxrajhNqNFgmuVn4oZcs
 qe+FSAvLDT82dUGTWir0k7yU4LDejcnIkTkw4BI7xe1RZBzILCVdRSRShDXsu+dUb2CnmY0fW4e
 f/jT/DNNFSP5MqxlHOljT1AqYoyGGZ8gy6sI44UJe6NYdyD3c=
X-Received: by 2002:a17:90a:dfc6:b0:381:1b66:4734 with SMTP id
 98e67ed59e1d1-3875528acb3mr6547645a91.6.1783448037944; 
 Tue, 07 Jul 2026 11:13:57 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc6:b0:381:1b66:4734 with SMTP id
 98e67ed59e1d1-3875528acb3mr6547614a91.6.1783448037529; 
 Tue, 07 Jul 2026 11:13:57 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:57 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:24 -0700
Message-ID: <20260707181326.968650-11-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 10/10] apparmor: explain why apparmor_getprocattr
	cannot use the condref helpers
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
X-Rspamd-Queue-Id: AC17571E886

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3168063e8eda..aafd91692aef 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -827,6 +827,13 @@ static int apparmor_getprocattr(struct task_struct *task, const char *name,
 	int error = -ENOENT;
 	struct aa_label *label = NULL;
 
+	/* Because __task_cred and task_ctx pointers are RCU protected,
+	 * we need to obtain a refcount to them under the RCU read lock
+	 * to prevent them from being cleaned up as an RCU callback.
+	 * Thus, we cannot use the condref versions without moving
+	 * aa_getprocattr into the RCU critical section and reworking it
+	 * to avoid e.g. GFP_KERNEL allocations.
+	 */
 	rcu_read_lock();
 	if (strcmp(name, "current") == 0)
 		label = aa_get_newest_cred_label(__task_cred(task));
-- 
2.43.0


