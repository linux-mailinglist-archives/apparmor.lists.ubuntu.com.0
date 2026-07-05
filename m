Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6yuLNwGhS2pLXQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:13 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87671097C
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgiXI-0005s5-PH; Mon, 06 Jul 2026 12:34:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <oleg@redhat.com>) id 1wgQ5S-000832-Iz
 for apparmor@lists.ubuntu.com; Sun, 05 Jul 2026 16:52:58 +0000
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-wq6eaybtNaayAyYa6immrw-1; Sun,
 05 Jul 2026 12:52:53 -0400
X-MC-Unique: wq6eaybtNaayAyYa6immrw-1
X-Mimecast-MFC-AGG-ID: wq6eaybtNaayAyYa6immrw_1783270372
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D09121956052; Sun,  5 Jul 2026 16:52:51 +0000 (UTC)
Received: from fedora (unknown [10.44.32.112])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 90E6C1686; Sun,  5 Jul 2026 16:52:47 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun,  5 Jul 2026 18:52:51 +0200 (CEST)
Date: Sun, 5 Jul 2026 18:52:45 +0200
To: John Johansen <john.johansen@canonical.com>,
 Georgia Garcia <georgia.garcia@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <akqL3YWi28ZUzca3@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: hKVXlVUY_ju0FEHkHFWvzx6NMCa0IUZpd9xNCK9gpOA_1783270372
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=oleg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Mailman-Approved-At: Mon, 06 Jul 2026 12:34:55 +0000
Subject: [apparmor] [PATCH] apparmor: use SEND_SIG_NOINFO instead of NULL in
	aa_audit()
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
From: Oleg Nesterov via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Oleg Nesterov <oleg@redhat.com>
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:georgia.garcia@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[oleg@redhat.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD87671097C

SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passing
NULL works, but:

- this works "by accident" and looks as if the caller doesn't understand
  the signal sending API.

- more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
  and this is really bad.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 security/apparmor/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
index 4a60b6fda75f..15e42e96b163 100644
--- a/security/apparmor/audit.c
+++ b/security/apparmor/audit.c
@@ -192,7 +192,7 @@ int aa_audit(int type, struct aa_profile *profile,
 	aa_audit_msg(type, ad, cb);
 
 	if (ad->type == AUDIT_APPARMOR_KILL)
-		(void)send_sig_info(profile->signal, NULL,
+		send_sig_info(profile->signal, SEND_SIG_NOINFO,
 			ad->common.type == LSM_AUDIT_DATA_TASK &&
 			ad->common.u.tsk ? ad->common.u.tsk : current);
 
-- 
2.52.0



