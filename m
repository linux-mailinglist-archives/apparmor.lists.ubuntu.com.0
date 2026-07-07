Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N2F1Fe1BTWq5xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1071E87A
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIs-0007tI-EY; Tue, 07 Jul 2026 18:13:54 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIr-0007sr-Rl
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:53 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9CFD3F442
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:53 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-381ed6616f7so6799597a91.1
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448032; x=1784052832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aT9kPzgaifMf3hFcKazrxQlwrAl00q4obBYA0YuKf0s=;
 b=SN6D77N4SwSK29PmbCXrt9meCKE5Wf1DLSqCD9G1FBZTCl8nrYfkliEeQN7rs3Lpby
 zKXySD4lTbxTPz1HieYHNGWkh/+kcjLqr7/Un9HjFOAW+S6ar07GWgbWo/4k1xhzKAFr
 AN5CTk/C97bq5eC7WGGRbVBq4/CrwUUgUBgH8LmBW/IDat7bZ60n2VVOhLBZDa7iypZB
 C/FaH87WeA7D/qj6L2Uj/BovJ+qq/tuI4p4ftwM3jFxraWmM7FZUaPr96SVGIfJVbV9z
 gENfoOsB6xjq5eMGqtNgxS8mMba9KCt05ez82q9wKDrLFJsXrV2B9VkFb4ninFr11FXx
 CjCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoM3yy/GHMVv1H4N3BdupFf73bfdciG3iftB3eGTGepbNjjD7GntAgLjaS7QkvS6CqOtBwXGWBpHQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz91uSxRgnNEkX/ammc8QYVvvjdEWfZtaVKv8lA6ZsdjMnroLq+
 uJ3l/wAKyZxA7OwItIVWOwex9Gs7SijD8pV4vRTJAA3timjKvCF8xVIr7LspI0F0q+vabsD/y/3
 nlmLB24heZzOwcjBWxHJlF8cPaCk6v1E7Z1g55nAArf4sZ66+QkwF2QHTwwjJQ0zBbeF0dDep5E
 +FGw==
X-Gm-Gg: AfdE7cmN/ZOP761PeXqZn6An5FU8WIkYrB8nCU9o3mHRG+hWXGwMjvjzXVNcYf0mVbi
 gbHzsn91DKb2vxChZ0uyrxATS1T5rww+l1QdU+Uk0cwjase06fF6CKzSLDkyghdxpNCYFwYFXkG
 xuENrlsSVyQjW8rsNsYdC7p0C//dRQOOXVhUt8tir+YGWOT0IPmaGwhH+kywITzX4H+xuorr/mu
 r7vrmHdwMD8uQsvFiN4s97QOAmfMmHrrssVwL1Wv5+t32W64QzZ/1h+dQU4RgXOa7Q+m/ABTr9e
 cePhOc6o5aAxvsWWeEn3v9OuuZVhybpwpIGn0R1tpblEI2ENQ5sVt8XQQeRPAg9My/7DbG02Ty5
 wGJdjBB3G+QSS5+qacrMdG9P0viICenFK2bj+cCh6P7PzgFHYavFXd+ffnYNu/Dr/7e2opaGCJb
 PdGGiXcTUSS4rQBrl08z3zhyqKBFP5YGbHFkoybuDVP/t8/ks=
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id
 98e67ed59e1d1-387575abe72mr6565195a91.24.1783448032230; 
 Tue, 07 Jul 2026 11:13:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id
 98e67ed59e1d1-387575abe72mr6565162a91.24.1783448031856; 
 Tue, 07 Jul 2026 11:13:51 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:51 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:18 -0700
Message-ID: <20260707181326.968650-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 04/10] apparmor: use
	aa_get_newest_profile_condref helpers in update_to_newest_parent
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
X-Rspamd-Queue-Id: 40B1071E87A

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/policy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 9475f6455542..be939a8332f6 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -1138,21 +1138,22 @@ static void share_name(struct aa_profile *old, struct aa_profile *new)
 static struct aa_profile *update_to_newest_parent(struct aa_profile *new)
 {
 	struct aa_profile *parent, *newest;
+	bool needput;
 
 	parent = rcu_dereference_protected(new->parent,
 					   mutex_is_locked(&new->ns->lock));
-	newest = aa_get_newest_profile(parent);
+	newest = aa_get_newest_profile_condref(parent, &needput);
 
 	/* parent replaced in this atomic set? */
 	if (newest != parent) {
 		rcu_assign_pointer(new->parent, newest);
 	}
-	/* Unconditionally put the parent:
+	/* put the parent instead of newest, if necessary:
 	 * If parent != newest, we aren't using the parent anymore
-	 * If parent == newest, we got an extra ref to it, so put it and
-	 *   retain the other ref we have to newest
+	 * If parent == newest, we may have gotten an extra ref to it,
+	 *   so put it and retain the other ref we have to newest
 	 */
-	aa_put_profile(parent);
+	aa_put_profile_condref(parent, needput);
 
 	return newest;
 }
-- 
2.43.0


