Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5vwdCAkgTGpzggEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 23:37:13 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B4022715C1C
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 23:37:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgqzt-0001yF-28; Mon, 06 Jul 2026 21:37:01 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wgqzr-0001y6-Eu
 for apparmor@lists.ubuntu.com; Mon, 06 Jul 2026 21:36:59 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4408A3F290
 for <apparmor@lists.ubuntu.com>; Mon,  6 Jul 2026 21:36:59 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3810fcd9adbso5364542a91.3
 for <apparmor@lists.ubuntu.com>; Mon, 06 Jul 2026 14:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783373817; x=1783978617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UMOJKInPNfhZY08tQk/YlWULOR7MXa/HYsBQQtaKEg=;
 b=Dz6JA2ZmX0YoEaqXy253CYoMyMKM6jRpeT1kYxZYBSHRRk4oqinx4AdZc+8gElS699
 qWnOvnXd7uTLXSnargdZ2o/8s/eSFmbtm5jQ7LpGIvbHs6IfvT08drfM3YZ8wGQmq/vq
 BI8ahsOdfnAhzPxTVc8Ll/dbrSbVplC5XKEbA9OwB0XCr6Z/bLFqyNfkwYryr5LU5xdk
 /gPSPpdSyf91tqRcOJmN2ubuiuQ0sO54erY4gw1fw7XNblT6gNgSowveePD4g0sMshT7
 35WYUpJe0kvr5Q6jdOC1g+Tit8sE+49TjArqZ0IfsClz4k94V83MVbfTL21UAsTpcgMG
 26JA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9PpKP9cvdLTI8WWzqhtb0OW4QHQ8a8iS+0YSIxOyG2xvkZS+lV1zDIMJtuyYGJdzhhlSmigoTng==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyfrHkStBOVPgBxf47Mbgg2+bfHAUwIwdtfivWccKR3M+iGOY0O
 bp17/oyPBEpR0j52aZuV4PSeRYTmlX6JR2aR/UU6MUL82Ili2J4LqunB/+PjMsyyAjzdgwBx9pk
 jytWqwfhhN5if/FR557NMg2FJBVqm2tPkjIPr/AuKLM6RtcQXqlfSMHRJUcNG7q/tW98EcrqMFY
 0R5cs8Qb+YOQ==
X-Gm-Gg: AfdE7cm+ufi5Xb4NMeDzEuS4qTcuTM/Q5IMOggLzbOIMSn53HBXxV/9hFt5a0s0ntne
 11VuhiIRd95Knn+M4LPCJNI5YoJetjlansM4FNj+g9PG3DDJUDvibL1JDw/dUznYRuanKC4s6eq
 NaCU2yKOjbGCJQYWBIyrOBpuCr364b0cJgfwbQhPLn0iOkU/V/AyEeoYyOlnNU8fuaOWIXe70R1
 U729ab5ZlvQIqLkzaFJ9WnTBXZ2lCtpMfUV/v8JJ+THMnJl6Kg1BKDZeSLa6krQJOXkz1zZIEGZ
 PRDlcJBvJuBrLSqQVJzArGnDBzwpdZaS+iClJTf7rGBIgad1dXQ8OyMLd1ovdoh1X+oqp5DnRRR
 P96sg2nEaOh5xoS4excQwm++VcUDAmI3/d9cwtAV+XbxQ7mNpJeCdw8W1Sfksvc+A98/dTpHiRs
 3TN+vBzDOz12IdsQMWkn9jDm8j+uciY3Ly8l8zm8NhUMWd+fKru18kGGQq
X-Received: by 2002:a17:90b:5291:b0:37e:1c8f:3dff with SMTP id
 98e67ed59e1d1-38755a562ffmr2557727a91.11.1783373817481; 
 Mon, 06 Jul 2026 14:36:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5291:b0:37e:1c8f:3dff with SMTP id
 98e67ed59e1d1-38755a562ffmr2557690a91.11.1783373816950; 
 Mon, 06 Jul 2026 14:36:56 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd..
 (access-63-249-67-94.static.cruzio.net. [63.249.67.94])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f5982sm696099eec.5.2026.07.06.14.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 14:36:56 -0700 (PDT)
To: john.johansen@canonical.com
Date: Mon,  6 Jul 2026 14:36:46 -0700
Message-ID: <20260706213647.266177-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: transfer refcount in update_sk_ctx
	instead of taking new one
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
X-Rspamd-Queue-Id: B4022715C1C

Commit
6d25e7b47616cb2db43351210929c8f19dc305a3 ("apparmor: fix refcount leak when updating the sk_ctx")

fixes a refcount leak by unconditionally getting and putting a reference
to plabel in update_sk_ctx. However, update_sk_ctx can instead inform its
caller (aa_unix_file_perm) whether or not it persists a reference, and
then conditionally put the reference if it is not used. Semantically, this
involves update_sk_ctx now conditionally transferring the refcount, and
informing aa_unix_file_perm whether the refcount was used (and thus
whether it should be put as part of cleanups).

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/af_unix.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index 9ca9d1b890ba..2730f4ad08d3 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -643,13 +643,16 @@ int aa_unix_peer_perm(const struct cred *subj_cred,
 			      peer_label);
 }
 
-/* sk_plabel for comparison only */
-static void update_sk_ctx(struct sock *sk, struct aa_label *label,
+/* sk_plabel for comparison only
+ * Returns whether plabel was assigned to a pointer
+ */
+static bool update_sk_ctx(struct sock *sk, struct aa_label *label,
 			  struct aa_label *plabel)
 {
 	struct aa_label *l, *old;
 	struct aa_sk_ctx *ctx = aa_sock(sk);
 	bool update_sk;
+	bool plabel_used = false;
 
 	rcu_read_lock();
 	update_sk = (plabel &&
@@ -658,7 +661,7 @@ static void update_sk_ctx(struct sock *sk, struct aa_label *label,
 	  !__aa_subj_label_is_cached(label, rcu_dereference(ctx->label));
 	rcu_read_unlock();
 	if (!update_sk)
-		return;
+		return false;
 
 	spin_lock(&unix_sk(sk)->lock);
 	old = rcu_dereference_protected(ctx->label,
@@ -675,16 +678,17 @@ static void update_sk_ctx(struct sock *sk, struct aa_label *label,
 		old = rcu_dereference_protected(ctx->peer, lockdep_is_held(&unix_sk(sk)->lock));
 
 		if (old == plabel) {
-			rcu_assign_pointer(ctx->peer_lastupdate,
-					   aa_get_label(plabel));
+			rcu_assign_pointer(ctx->peer_lastupdate, plabel);
+			plabel_used = true;
 		} else if (aa_label_is_subset(plabel, old)) {
-			rcu_assign_pointer(ctx->peer_lastupdate,
-					   aa_get_label(plabel));
+			rcu_assign_pointer(ctx->peer_lastupdate, plabel);
 			rcu_assign_pointer(ctx->peer, aa_get_label(plabel));
 			aa_put_label(old);
+			plabel_used = true;
 		} /* else race or a subset - don't update */
 	}
 	spin_unlock(&unix_sk(sk)->lock);
+	return plabel_used;
 }
 
 static void update_peer_ctx(struct sock *sk, struct aa_sk_ctx *ctx,
@@ -721,6 +725,7 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 	struct path path;
 	bool is_sk_fs;
 	int error = 0;
+	bool plabel_owner_transfer = false;
 
 	AA_BUG(!label);
 	AA_BUG(!sock);
@@ -799,8 +804,15 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 
 	/* update peer cache to latest successful perm check */
 	if (error == 0)
-		update_sk_ctx(sock->sk, label, plabel);
-	aa_put_label(plabel);
+		plabel_owner_transfer = update_sk_ctx(sock->sk, label, plabel);
+
+	/* If plabel ownership was not transferred, plabel can be either null
+	 * (we never got a ref) or non-null (we got a ref and nobody else will
+	 * use it, so we need to put it). Either way, aa_put_label will do
+	 * the right thing.
+	 */
+	if (!plabel_owner_transfer)
+		aa_put_label(plabel);
 
 	return error;
 }
-- 
2.43.0


