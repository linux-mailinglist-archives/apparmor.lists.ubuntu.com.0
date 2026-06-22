Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICWaNOmlOWrlvwcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 22 Jun 2026 23:15:21 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FE6B26EC
	for <lists+apparmor@lfdr.de>; Mon, 22 Jun 2026 23:15:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wblyx-0004yq-QM; Mon, 22 Jun 2026 21:15:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <devnull+hexlabsecurity.proton.me@kernel.org>)
 id 1wblrk-0003j3-3H
 for apparmor@lists.ubuntu.com; Mon, 22 Jun 2026 21:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F58E601F8;
 Mon, 22 Jun 2026 20:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 050BAC2BCB4;
 Mon, 22 Jun 2026 20:57:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EF26FCDB46F;
 Mon, 22 Jun 2026 20:57:38 +0000 (UTC)
Date: Mon, 22 Jun 2026 15:57:38 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-b4-disp-aba401c6-v1-1-9d74343c7ced@proton.me>
X-B4-Tracking: v=1; b=H4sIAMGhOWoC/x3MPQqAMAxA4atIZgM11Fq9ijj0J9UsKi2IIN7d4
 vgN7z1QOAsXmJoHMl9S5NgruraBsLl9ZZRYDaTIKEOEXmOUcqLzTqsuGEyKrKZgaRx6qNmZOcn
 9L+flfT/zOldgYgAAAA==
To: Ryan Lee <ryan.lee@canonical.com>, 
 John Johansen <john.johansen@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782161857; l=3633;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=e2t5bp4l0ZsG/vhIPuFXcseb3OvyeXAly/te6D921wY=;
 b=c2u7zxjk1psh1+GEDQpUgJx2ZUR+fEinuqAMbCLImRETnNGXUO1+VZ2sxlUo+UWeog5PgYsY0
 40TH6DrS5hzA01zjyU5PD0xy3IFNR/aO1+2Ampv+zvCzfZOAQugY6p0
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=devnull+hexlabsecurity.proton.me@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Mon, 22 Jun 2026 21:15:03 +0000
Subject: [apparmor] [PATCH] apparmor: mediate the implicit connect of TCP
 fast open sendmsg
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
From: Bryam Vargas via B4 Relay via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: hexlabsecurity@proton.me
Cc: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Matthieu Buffet <matthieu@buffet.re>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
 Mickael Salaun <mic@digikod.net>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.lee@canonical.com,m:john.johansen@canonical.com,m:devnull+hexlabsecurity.proton.me@kernel.org,m:paul@paul-moore.com,m:stephen.smalley.work@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:matthieu@buffet.re,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ivanov.mikhail1@huawei-partners.com,m:mic@digikod.net,m:serge@hallyn.com,m:devnull@kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,paul-moore.com,gmail.com,lists.ubuntu.com,namei.org,buffet.re,vger.kernel.org,huawei-partners.com,digikod.net,hallyn.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor,hexlabsecurity.proton.me];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B5FE6B26EC

From: Bryam Vargas <hexlabsecurity@proton.me>

sendmsg()/sendto() with MSG_FASTOPEN is a combination of connect(2) and
write(2): it opens the connection in the SYN. apparmor_socket_sendmsg()
only checks AA_MAY_SEND, so a profile that grants send but denies connect
lets a confined task open an outbound TCP/MPTCP connection that connect(2)
would have refused, bypassing connect mediation.

Mediate the implicit connect when MSG_FASTOPEN is set and a destination
is supplied. Add it to apparmor_socket_sendmsg() (not the shared
aa_sock_msg_perm() helper, which recvmsg also uses) and call aa_sk_perm()
directly, mirroring the selinux and tomoyo fixes. sk_is_tcp() does not
cover MPTCP fast open, so the SOCK_STREAM/IPPROTO_MPTCP arm is explicit.

Fixes: cf60af03ca4e ("net-tcp: Fast Open client - sendmsg(MSG_FASTOPEN)")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
This is the patch and reproducer requested in [1]. A userspace regression test
(tests/regression/apparmor/net_inet_tcp_fastopen) follows separately to the
apparmor tree, as suggested.

Reproducer (behavioral; the bypassed value is policy, not bus state, so no special
hardware). Under a profile that grants inet/inet6 stream send but denies connect, on
the current Debian security kernel 6.12.94 (apparmor active):

  [TCP ] connect(2)=EACCES   sendto(MSG_FASTOPEN)=OK   -> connect bypassed (listener accepted)
  [TCP6] connect(2)=EACCES   sendto(MSG_FASTOPEN)=OK   -> connect bypassed

The kernel audit shows the connect(2) denial and no connect record for the fastopen
sendto:

  apparmor="DENIED" operation="connect" profile="egress_restricted" comm="lsm_tfo_ab"
    family="inet" sock_type="stream" protocol=6 requested_mask="connect" denied_mask="connect"

With this patch the fastopen sendto hits that same connect denial. Full reproducer
available on request.

Same-class fixes: selinux [2], tomoyo [3]; the original cross-LSM report (landlock,
the first instance) is [4].

[1] https://lore.kernel.org/r/20260619011138.264578-1-hexlabsecurity@proton.me
[2] https://lore.kernel.org/r/20260618175513.112443-2-stephen.smalley.work@gmail.com
[3] https://lore.kernel.org/r/20260619002207.61104-1-matthieu@buffet.re
[4] https://lore.kernel.org/r/20260616201615.275032-1-hexlabsecurity@proton.me
---
 security/apparmor/lsm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3491e9f60194..e01efdf50efa 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1422,7 +1422,21 @@ static int aa_sock_msg_perm(const char *op, u32 request, struct socket *sock,
 static int apparmor_socket_sendmsg(struct socket *sock,
 				   struct msghdr *msg, int size)
 {
-	return aa_sock_msg_perm(OP_SENDMSG, AA_MAY_SEND, sock, msg, size);
+	int error = aa_sock_msg_perm(OP_SENDMSG, AA_MAY_SEND, sock, msg, size);
+
+	if (error)
+		return error;
+
+	/* TCP fast open carries connect() semantics in sendmsg(); mediate
+	 * the implicit connect so it cannot bypass the connect permission.
+	 */
+	if ((msg->msg_flags & MSG_FASTOPEN) && msg->msg_name &&
+	    (sk_is_tcp(sock->sk) ||
+	     (sk_is_inet(sock->sk) && sock->sk->sk_type == SOCK_STREAM &&
+	      sock->sk->sk_protocol == IPPROTO_MPTCP)))
+		error = aa_sk_perm(OP_CONNECT, AA_MAY_CONNECT, sock->sk);
+
+	return error;
 }
 
 static int apparmor_socket_recvmsg(struct socket *sock,

---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260622-b4-disp-aba401c6-f02842c82975

Best regards,
-- 
bryamzxz <hexlabsecurity@proton.me>



