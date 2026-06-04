Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4T1NGbC7IWobMwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 04 Jun 2026 19:53:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3B6426E8
	for <lists+apparmor@lfdr.de>; Thu, 04 Jun 2026 19:53:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wVCG4-0006tH-Jp; Thu, 04 Jun 2026 17:53:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wVCG3-0006s5-Q2
 for apparmor@lists.ubuntu.com; Thu, 04 Jun 2026 17:53:31 +0000
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8840A3F9C2
 for <apparmor@lists.ubuntu.com>; Thu,  4 Jun 2026 17:53:31 +0000 (UTC)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30761ab3483so2929853eec.0
 for <apparmor@lists.ubuntu.com>; Thu, 04 Jun 2026 10:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780595610; x=1781200410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HE/4asX54oYxI92qmXNmiLTcQ22hpCo0wdJNODvWXi0=;
 b=qLTL/DHltd8gCIe+et/UkWgOPmsvE0raZvs4Gan9w8Ta6STw2UNRospudrm9PgVYux
 /Ig+8eMlFjNmSVCFN2sQiNngZFYJiGDDhi/lbLabR6chsLB5XcS1vEy51a/AdHlnQMcB
 FfcvV0fwFsTazj1fqovRJRMDD3L+hG+p3CJJNYk96y3OfWOeJVgCn5Lx3AtddS/xCUgH
 0nQfqdAH0+O6wWKQVPZQrrMvTBhxM+RPLnFRluxXQ8dbbq8iknWGAfPzJJHRVZbBH2kF
 XCvKhPGXYJkLLuuGuFYcFkXlKr/0+zcSDLUmZcuRogyPMaL3eNOw6SGW0E/dhsUmvRui
 3dsw==
X-Gm-Message-State: AOJu0YzZouWpi3msFjPwGOQISFPbrFWih8uG+6nVrstjHd/ackTYskb7
 RXv7ID/8iYhHyYR3hpQgcgMHjGOy3bF3GD8EgONZqiErpiyjrgWilS0Qj+O5vziQrkifQX9+ifL
 OULW2n1v7aicMFOqGztK/pN0FKKiBS1i11jeFEuJZRlsEMRsZ6rAAMnYdRBjkXvVk197xcJKY0f
 Oaxt1xK/ocJQ==
X-Gm-Gg: Acq92OEtnXGq+6LwCL1Qd3316uO1c7Ehml8wr2IHh2bVlPFVnyVb7PAVvWFiqZpqDtS
 pE4cOEGFsyTagmxST9U8SF80vhyq7KaHjrrDn5Lk6PZ5VnxU0X4BLZnR3WzGKoZSiEsc2dp1EMO
 LYPj9yKMEMmHG+CS6J5Um7top8kWXF1jFf/A24lq9f1TmFS3F+3hzM8EmrY20VLfgYY7akOWKHN
 Cywcyra4VXz6dyXhB+wgcOmGEZpspXhYY+KheaL3rjtcunOgvQ7qnVdmLYMzUzvoGA4qLLPFlA5
 ZX7dUgPnlh7pDYxCzQwKrYEKvYr6S79+0I39QMryrqzHXlsleP642AcfGpQr7S75F7lfK1+9Agr
 qR6YEAe/eXI71MnO39iz49sGThB05erty/ViXNJEEbJ53RxtdZkw7u9uSRnACz4mG+fBSfw4Kq9
 rVNleAI1EvxMXWRtxIlgu6aNqOZYn+QqnzMaldTewFDqBGjHyo6PiByiW8PaHVJQXZW2dzlqHrs
 7Ql
X-Received: by 2002:a05:7022:6298:b0:137:e77f:f53e with SMTP id
 a92af1059eb24-138067564damr45047c88.42.1780595609829; 
 Thu, 04 Jun 2026 10:53:29 -0700 (PDT)
X-Received: by 2002:a05:7022:6298:b0:137:e77f:f53e with SMTP id
 a92af1059eb24-138067564damr45034c88.42.1780595609123; 
 Thu, 04 Jun 2026 10:53:29 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm4382208c88.14.2026.06.04.10.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 10:53:28 -0700 (PDT)
To: apparmor@lists.ubuntu.com
Date: Thu,  4 Jun 2026 10:53:18 -0700
Message-ID: <20260604175319.190379-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH] apparmor: fix premature refcount put in
	aa_unix_file_perm socket handling
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:url,lists.ubuntu.com:from_mime,lists.ubuntu.com:from_smtp];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,lists.ubuntu.com:from_smtp,canonical.com:mid,canonical.com:email,canonical.com:replyto,ubuntu.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05C3B6426E8

Commit

[Zygmunt's patch posted to https://lists.ubuntu.com/archives/apparmor/2026-May/014620.html]

uncovered a latent refcount issue in that plabel was unconditionally put at
the end of aa_unix_file_perm, even if update_sk_ctx transferred ownership
via rcu_assign_pointer. This would result in plabel being prematurely freed
while still in use. (Without the patch, the plabel seen by update_sk_ctx and
the aa_put_label call would always be null, turning those calls into no-ops.)

To correctly avoid freeing plabel prematurely, change update_sk_ctx to
return whether or not it transferred ownership and condition the
aa_put_label call on this boolean.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
This patch was tested against the Ubuntu 6.17 kernel. The latent issue was
exposed by Zygmunt's patch, but it the patch should apply cleanly regardless
of whether Zygmunt's patch was applied or not.

 security/apparmor/af_unix.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index 3dce3c9c360e..8574ed59251e 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -642,13 +642,16 @@ int aa_unix_peer_perm(const struct cred *subj_cred,
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
@@ -657,7 +660,7 @@ static void update_sk_ctx(struct sock *sk, struct aa_label *label,
 	  !__aa_subj_label_is_cached(label, rcu_dereference(ctx->label));
 	rcu_read_unlock();
 	if (!update_sk)
-		return;
+		return false;
 
 	spin_lock(&unix_sk(sk)->lock);
 	old = rcu_dereference_protected(ctx->label,
@@ -675,13 +678,16 @@ static void update_sk_ctx(struct sock *sk, struct aa_label *label,
 
 		if (old == plabel) {
 			rcu_assign_pointer(ctx->peer_lastupdate, plabel);
+			plabel_used = true;
 		} else if (aa_label_is_subset(plabel, old)) {
 			rcu_assign_pointer(ctx->peer_lastupdate, plabel);
 			rcu_assign_pointer(ctx->peer, aa_get_label(plabel));
 			aa_put_label(old);
+			plabel_used = true;
 		} /* else race or a subset - don't update */
 	}
 	spin_unlock(&unix_sk(sk)->lock);
+	return plabel_used;
 }
 
 static void update_peer_ctx(struct sock *sk, struct aa_sk_ctx *ctx,
@@ -718,6 +724,7 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 	struct path path;
 	bool is_sk_fs;
 	int error = 0;
+	bool plabel_owner_transfer = false;
 
 	AA_BUG(!label);
 	AA_BUG(!sock);
@@ -790,8 +797,15 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 
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


