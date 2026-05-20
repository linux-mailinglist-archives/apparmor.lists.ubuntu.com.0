Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF0NL9uADWrUyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:31 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB858AE5B
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wPdMV-0007bT-RS; Wed, 20 May 2026 09:37:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <rppt@kernel.org>) id 1wPcHU-0006Dp-Ew
 for apparmor@lists.ubuntu.com; Wed, 20 May 2026 08:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 608214069A;
 Wed, 20 May 2026 08:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D39A1F00893;
 Wed, 20 May 2026 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779265164;
 bh=z/4rfPWQ5HkZJZbwpLmw5R+Mmu26rwOzXYpZdnVV9Dk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dhrtBEWShLy1GXu88WxKJts8sqyBs3VBaS/0WLRV9zaUqdWgXLHfayljVW97Fzzt4
 7RtyF7wImuoFzhQU2h1L/9hdvim4iIBcz+tYzmJARLjMnGtyMGEVbK6TanLVgv5ezd
 pl2W90AdTAhfQYtdHrNc/ZaD6QYOJsb+tmCa4s+FcbkkL1YVX+LulzmbDC0pnq4PMo
 DOm/1SfLkw4tBV6zjcUB1mSnHQb6DFgEY8+1JAf3u3TUVlgsOTyhBBEs84dzpl+0hv
 Io6iD2BfJBbqMYv94X1UXa0e+rWghxaGSLk/NiWOlAMkORwV4u37I9g6gA5eJAi3h2
 jYSNBO2FU/hAg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 20 May 2026 11:18:57 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-security-v1-3-831bd8e21dd0@kernel.org>
References: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
To: James Morris <jmorris@namei.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=rppt@kernel.org;
 h=from:subject:message-id; bh=+ey+joQwrn1qEqiykmTx8dcM/5TMNFhXgYB3MVPrqgk=;
 b=owEBbQGS/pANAwAKATkDhibLDv2RAcsmYgBqDW58nz384TTzPZOUrhMG7PeyvhDRvKQD8RIHd
 PLEfs78XJeJATMEAAEKAB0WIQR45VhVpZkvn3TRr+k5A4Ymyw79kQUCag1ufAAKCRA5A4Ymyw79
 kTbyCACtJ9ZYDN3YybRMNR2UBnLXfQyIAs1SRXhO192EBvmpN0Vt1m1sNk+uZlH2OVV5dTRBzer
 ZUVu6/sROZL71OF1VFySzWa2xD3gLaKVlDyPHe7gMBIdFhQXjQSEkzNGbSjvJOMChXiBsUYfHoP
 8/amlGCtmTomdv0rSvCj0jqMgMKqzQRqkZNjEH90UwnQthW1EMjaZxKlluFPBguq2912ZX3N37M
 39ADj+W0iqAhCINM5YCk/d6G5x1kKmOGD0cVEdms7dn/8CLb7b/5BGRj4tIG1uoK+Yn+hh31hYu
 1+YvsR3KShRortBO77alQvQ9eR/1ZUROdSNcuV07i91Ita/k
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
Received-SPF: pass client-ip=172.234.252.31; envelope-from=rppt@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Wed, 20 May 2026 09:37:07 +0000
Subject: [apparmor] [PATCH 3/3] apparmor: replace get_zeroed_page() with
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
Cc: selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[namei.org,canonical.com,redhat.com,paul-moore.com,hallyn.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jmorris@namei.org,m:john.johansen@canonical.com,m:omosnace@redhat.com,m:paul@paul-moore.com,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-security-module@vger.kernel.org,m:rppt@kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 9BBB858AE5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


