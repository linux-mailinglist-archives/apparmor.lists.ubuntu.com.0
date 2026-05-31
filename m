Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKc1KHV/HWotbQkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 01 Jun 2026 14:47:49 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E461F823
	for <lists+apparmor@lfdr.de>; Mon, 01 Jun 2026 14:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wU23J-0002dl-AW; Mon, 01 Jun 2026 12:47:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <rppt@kernel.org>) id 1wThzY-0007l7-Kt
 for apparmor@lists.ubuntu.com; Sun, 31 May 2026 15:22:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 11B2D601DE;
 Sun, 31 May 2026 15:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B248B1F00893;
 Sun, 31 May 2026 15:15:59 +0000 (UTC)
To: John Johansen <john.johansen@canonical.com>
Date: Sun, 31 May 2026 18:15:56 +0300
Message-ID: <20260531151556.1467596-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=rppt@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Mon, 01 Jun 2026 12:47:31 +0000
Subject: [apparmor] [PATCH RESEND] apparmor: replace get_zeroed_page() with
	kzalloc()
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
From: Mike Rapoport via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Mike Rapoport <rppt@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [-0.91 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:rppt@kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.455];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rppt@kernel.org];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Queue-Id: 485E461F823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

multi_transaction_new() allocates memory with get_zeroed_page() and uses
it as struct multi_transaction.

The usage of that structure does not require struct page access and it is
better to allocate multi_transaction objects with kzalloc() that provides
better scalability and more debugging possibilities.

Replace use of get_zeroed_page() with kzalloc().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 security/apparmor/apparmorfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index ededaf46f3ca..e5c99c71e7ca 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/slab.h>
 #include <linux/security.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
@@ -904,7 +905,7 @@ static void multi_transaction_kref(struct kref *kref)
 	struct multi_transaction *t;
 
 	t = container_of(kref, struct multi_transaction, count);
-	free_page((unsigned long) t);
+	kfree(t);
 }
 
 static struct multi_transaction *
@@ -947,7 +948,7 @@ static struct multi_transaction *multi_transaction_new(struct file *file,
 	if (size > MULTI_TRANSACTION_LIMIT - 1)
 		return ERR_PTR(-EFBIG);
 
-	t = (struct multi_transaction *)get_zeroed_page(GFP_KERNEL);
+	t = kzalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!t)
 		return ERR_PTR(-ENOMEM);
 	kref_init(&t->count);
-- 
2.53.0


