Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEAWCGsyxWk98AQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 26 Mar 2026 14:19:39 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CAF335DEC
	for <lists+apparmor@lfdr.de>; Thu, 26 Mar 2026 14:19:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w5kcH-0000Jj-2n; Thu, 26 Mar 2026 13:19:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <dhowells@redhat.com>) id 1w5kcF-0000Jb-SB
 for apparmor@lists.ubuntu.com; Thu, 26 Mar 2026 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774531154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1w/tzujNq6shO/Yk27oYEh0iCXtTypElru3vLGpkYIY=;
 b=QeUtJ19YstWQaPt8qlZKZvpaEgkhsIVmzaBiPYplxJhrpJeq8eWtXnuDu/Iwqe1POW1BF5
 eKdkoWnMKlp+nysxFNm5wWmLdqvYnlwLIc2Khi6LOKyQD4nNshY9X45vl+/RMfRGheAYeS
 CoV2uk/lgZ9O5Bqada+Dqk/SBrOUnIo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-389-SRuUNOehMoCCTIHOHqYf1Q-1; Thu,
 26 Mar 2026 09:19:09 -0400
X-MC-Unique: SRuUNOehMoCCTIHOHqYf1Q-1
X-Mimecast-MFC-AGG-ID: SRuUNOehMoCCTIHOHqYf1Q_1774531147
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C57C19560B4; Thu, 26 Mar 2026 13:19:07 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.44.33.121])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 93EA6180036E; Thu, 26 Mar 2026 13:19:02 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 26 Mar 2026 13:18:29 +0000
Message-ID: <20260326131838.634095-5-dhowells@redhat.com>
In-Reply-To: <20260326131838.634095-1-dhowells@redhat.com>
References: <20260326131838.634095-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: XjOwz16rS9J1RfWyjOlH0E2JvVQrvMvZ6w3wxPLgYR8_1774531147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dhowells@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
Subject: [apparmor] [PATCH net v3 04/11] list: Move on_list_rcu() to list.h
	and add on_list() also
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
Cc: stable@kernel.org, linux-usb@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 David Howells <dhowells@redhat.com>, Minas Harutyunyan <hminas@synopsys.com>,
 Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dhowells@redhat.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:stable@kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:dhowells@redhat.com,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.874];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,synopsys.com:email]
X-Rspamd-Queue-Id: E6CAF335DEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unfortunately, list_empty() is not usable with an entry that has been
removed from a list with list_del_rcu() as ->next must be left pointing at
the following entry so as not to break traversal under RCU.

Solve this by moving on_list_rcu() from AppArmor to linux/list.h, and
turning it into an inline function.

Also add an on_list() counterpart (functionally, this is just an antonym
for list_empty()), but the name looks less awkward when applied to a
non-head element.  We probably don't want to use on_list_rcu() generally
because it requires an extra check as ->prev is set differently in the two
cases.

Further, rename the on_list() function in the Designware usb2 drd ip driver
to dwc2_on_list() to free up the original name.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
cc: John Johansen <john.johansen@canonical.com>
cc: Minas Harutyunyan <hminas@synopsys.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: apparmor@lists.ubuntu.com
cc: linux-usb@vger.kernel.org
cc: netdev@vger.kernel.org
cc: stable@kernel.org
---
 drivers/usb/dwc2/gadget.c          |  6 +++---
 include/linux/list.h               | 26 ++++++++++++++++++++++++++
 security/apparmor/include/policy.h |  2 --
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index d216e26c787b..04b6aef8ac13 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4306,11 +4306,11 @@ static int dwc2_hsotg_ep_disable_lock(struct usb_ep *ep)
 }
 
 /**
- * on_list - check request is on the given endpoint
+ * dwc2_on_list - check request is on the given endpoint
  * @ep: The endpoint to check.
  * @test: The request to test if it is on the endpoint.
  */
-static bool on_list(struct dwc2_hsotg_ep *ep, struct dwc2_hsotg_req *test)
+static bool dwc2_on_list(struct dwc2_hsotg_ep *ep, struct dwc2_hsotg_req *test)
 {
 	struct dwc2_hsotg_req *req, *treq;
 
@@ -4338,7 +4338,7 @@ static int dwc2_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 
 	spin_lock_irqsave(&hs->lock, flags);
 
-	if (!on_list(hs_ep, hs_req)) {
+	if (!dwc2_on_list(hs_ep, hs_req)) {
 		spin_unlock_irqrestore(&hs->lock, flags);
 		return -EINVAL;
 	}
diff --git a/include/linux/list.h b/include/linux/list.h
index 00ea8e5fb88b..d224e7210d1b 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -381,6 +381,32 @@ static inline int list_empty(const struct list_head *head)
 	return READ_ONCE(head->next) == head;
 }
 
+/**
+ * on_list - Test whether an entry is on a list.
+ * @entry: The entry to check
+ *
+ * Test whether an entry is on a list.  Safe to use on an entry initialised
+ * with INIT_LIST_HEAD() or LIST_HEAD() or removed with things like
+ * list_del_init().  Not safe for use with list_del() or list_del_rcu().
+ */
+static inline bool on_list(const struct list_head *entry)
+{
+	return !list_empty(entry);
+}
+
+/**
+ * on_list_rcu - Test whether an entry is on a list (RCU-del safe).
+ * @entry: The entry to check
+ *
+ * Test whether an entry is on a list.  Safe to use on an entry initialised
+ * with INIT_LIST_HEAD() or LIST_HEAD() or removed with things like
+ * list_del_init().  Also safe for use with list_del() or list_del_rcu().
+ */
+static inline bool on_list_rcu(const struct list_head *entry)
+{
+	return !list_empty(entry) && entry->prev != LIST_POISON2;
+}
+
 /**
  * list_del_init_careful - deletes entry from list and reinitialize it.
  * @entry: the element to delete from the list.
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index 3895f8774a3f..c3697c23bbed 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -57,8 +57,6 @@ extern const char *const aa_profile_mode_names[];
 
 #define profile_is_stale(_profile) (label_is_stale(&(_profile)->label))
 
-#define on_list_rcu(X) (!list_empty(X) && (X)->prev != LIST_POISON2)
-
 /* flags in the dfa accept2 table */
 enum dfa_accept_flags {
 	ACCEPT_FLAG_OWNER = 1,


