Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CJkEEjwuWkYPwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 01:22:32 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0422B49D0
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 01:22:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2eg2-0007UV-Lw; Wed, 18 Mar 2026 00:22:22 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1w2eg0-0007UC-NI
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 00:22:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1773793340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LYrTWkMGCKrpA8IrsJjMpH8fxJVD7iCjwytC6Lqm7Gw=;
 b=KUcn6oU7qb52hbAcj3i7M+X/dJDQ1QuCRHTKI7yGIOd04Qijqw/QyyDUjnNIx9MfSNtcz6
 TxoXDZSCGVQDe06lKBCHl8T87OvsFJFchxcmEHtVeR+LWZ6py8bsMNojmThvrOTL+OsctT
 fUzeA7AZj1ez5TGwTdQzZcn2y/hakFY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 18 Mar 2026 01:21:42 +0100
Message-ID: <20260318002141.3362-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=thorsten.blum@linux.dev;
 h=from:subject; bh=Cfqb+dT+sV7Drhf0B62x56MjyNJAVQHkRuZsqES+AAU=;
 b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk7P4jWnNSeOWlS+5SzjLbvOn58UpzSu6uMTUT/Dff3/
 1sbljT1dJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEWiwZGWYcevJNYotPxrzX
 UVyp6wwbixzum519vWbeZ9Ubni5dRXsZ/sq+9TAJO3p+s5TntIUR2zbpz70Y/MDrZ+096+rDrI8
 +5bIDAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp;
 fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.181;
 envelope-from=thorsten.blum@linux.dev; helo=out-181.mta1.migadu.com
Subject: [apparmor] [PATCH RESEND] apparmor: Remove redundant if check in
	sk_peer_get_label
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
 Thorsten Blum <thorsten.blum@linux.dev>, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:thorsten.blum@linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: AD0422B49D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the redundant if check in sk_peer_get_label() and return
ERR_PTR(-ENOPROTOOPT) directly.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/lsm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..f7bcfed40222 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1528,15 +1528,11 @@ static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
 static struct aa_label *sk_peer_get_label(struct sock *sk)
 {
 	struct aa_sk_ctx *ctx = aa_sock(sk);
-	struct aa_label *label = ERR_PTR(-ENOPROTOOPT);
 
 	if (rcu_access_pointer(ctx->peer))
 		return aa_get_label_rcu(&ctx->peer);
 
-	if (sk->sk_family != PF_UNIX)
-		return ERR_PTR(-ENOPROTOOPT);
-
-	return label;
+	return ERR_PTR(-ENOPROTOOPT);
 }
 
 /**

