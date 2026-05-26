Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGuTEQqtFWpkXwcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 26 May 2026 16:24:10 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C95D769D
	for <lists+apparmor@lfdr.de>; Tue, 26 May 2026 16:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRshJ-00013X-HX; Tue, 26 May 2026 14:23:57 +0000
Received: from m16.mail.163.com ([117.135.210.2])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <fffsqian@163.com>) id 1wRgkz-0003Cs-9D
 for apparmor@lists.ubuntu.com; Tue, 26 May 2026 01:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=DgFPBC3+jhQ9bBDRqs1m3w4YrWm9tSzf++kO9rEI2oM=;
 b=GpbwFpFRzcxBCWtbyepXqrf8XAq4jaCanLmIwpaulhG1kxdjxzsZPYXU+nB5v/
 BE/ldbvOxmZoyz71vOH3OJFrvCsAk4ePin6vB3dRaCQvU6IuAbzhzH7OSGsnI02F
 4ykplyz6cylZn+gB1VASwSFS+bBKXCct1EYaHGlNlBKL4=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wD3XyuV+RRqjt0eDw--.22442S2; 
 Tue, 26 May 2026 09:38:30 +0800 (CST)
From: fffsqian@163.com
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Tue, 26 May 2026 09:38:26 +0800
Message-Id: <20260526013826.399735-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3XyuV+RRqjt0eDw--.22442S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xGr4DGFWUtr1UJw4ktFb_yoW8WFy7pF
 4DKFZrGF4UAFWxZw1ktay3uryrK3y5GrWSqay3Cw4jyrn8JF4kXF13tr1Uury5Xws8Cr1a
 yw12qr4rZ3sFyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE2-e3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6RZDDmoU+ZYKdQAA3c
Received-SPF: pass client-ip=117.135.210.2; envelope-from=fffsqian@163.com;
 helo=m16.mail.163.com
X-Mailman-Approved-At: Tue, 26 May 2026 14:23:56 +0000
Subject: [apparmor] [PATCH v2 1/2] security: apparmor: fix two spelling
	mistakes
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
Cc: Qingshuang Fu <fuqingshuang@kylinos.cn>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:fuqingshuang@kylinos.cn,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fffsqian@163.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fffsqian@163.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,kylinos.cn:email]
X-Rspamd-Queue-Id: 089C95D769D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

Fix two spelling errors in comment:
- interated  →  interacted
- dont      →  don't

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Changes since v1:
- Split original single patch into two standalone patches,
  separate AppArmor and Smack changes for different maintainer trees.
---
 security/apparmor/domain.c | 2 +-
 security/apparmor/lsm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index f02bf770f638..7e097c40720a 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -135,7 +135,7 @@ static int label_compound_match(struct aa_profile *profile,
 	struct label_it i;
 	struct path_cond cond = { };
 
-	/* find first subcomponent that is in view and going to be interated with */
+	/* find first subcomponent that is in view and going to be interacted with */
 	label_for_each(i, label, tp) {
 		if (!aa_ns_visible(profile->ns, tp->ns, inview))
 			continue;
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3491e9f60194..51a388cfea11 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1493,7 +1493,7 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
  *
  * Note: can not sleep may be called with locks held
  *
- * dont want protocol specific in __skb_recv_datagram()
+ * don't want protocol specific in __skb_recv_datagram()
  * to deny an incoming connection  socket_sock_rcv_skb()
  */
 static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
-- 
2.25.1


