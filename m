Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yISdKRCCjGkYqAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 11 Feb 2026 14:20:16 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FCE124B45
	for <lists+apparmor@lfdr.de>; Wed, 11 Feb 2026 14:20:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqA8J-00061c-6v; Wed, 11 Feb 2026 13:19:55 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1vqA8H-00061R-2c
 for apparmor@lists.ubuntu.com; Wed, 11 Feb 2026 13:19:53 +0000
Received: from sec-noble-amd64.. (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr
 [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C875D3FE76
 for <apparmor@lists.ubuntu.com>; Wed, 11 Feb 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770815992;
 bh=4eWzH2gPjKk7UxO+9zkl7oVbYenlwPVpY2iSfwRQl8k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=EMKc46RxnETXiQEaNANWMD3HfpTM83Vt3TqDhuH/dq92SWVMvOSJryQmhd/u56FRi
 ek/fca3Y2QVzQ/kzETutLCkLkqXyXNNkvJ1AUa4doNWtMq8JLHWfI1s9XD3Xmrj5w/
 YvOasOUf5/0Z7UwepQLurBBYNTNhCskTnQNy+qmOHkg7gkBMOpfHP7y4ViCBZcAP7W
 kbSDiGvNr/FaqrqixPBKobjp+kRvDgK2VwCcKo8s/9z5rE/Bmhyq1ZSuDQm+uFE3IV
 NywrDc5K2tgjzxa7htwqKKz9nYPUfZ/v7+m0tow9ARSPQGp1fOgzbofpnqvS+nCKIf
 hYYCtOg2sYsEfHqkHnsP/iQLAQQP/v/C+mKjEa14cjpcQX7a40p6sqp4Raie/lAlec
 87nChKAPmQapgZ71cqGW6hK/ZqHaAS6rC6RYTcv1oBYinIFwln1Qa9xCsNvU085RJU
 68APQNjApTNYWUdpcTp4FbMwtcWGjRle3c+v4x7L5LgAuRYcD1WKRWUp9vefFbSnVW
 YEcusnOxQrCg8m2p0cZpzFG9oeolTFBAQj3/8GVnVLxCFArgdYd7nIq+A2V+uSxXaz
 bHAf2xgGZxLu+u5GV/hW5qa+mIQxboBvstGALHVcBZDXyD/BmiFnPyJhrDe4qwC7oN
 Fmsk2/38x9ZNpVgxg2GvpTz8=
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 11 Feb 2026 14:19:32 +0100
Message-ID: <20260211131952.391532-1-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: propagate -ENOMEM correctly in
	unpack_table
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[canonical.com:-];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[maxime.belair@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 31FCE124B45
X-Rspamd-Action: no action

Currently, if the `kvzalloc` in `unpack_table` fails, it returns NULL.
This is masked by `aa_dfa_unpack` which interprets NULL as a -EPROTO,
leading to confusing error messages in `apparmor_parser` [1].

The fixed behavior correctly propagates -ENOMEM on allocation failure.

[1] https://gitlab.com/apparmor/apparmor/-/issues/592

Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
---
 security/apparmor/match.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index bbeb3be68572..6cca29c1f209 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -33,7 +33,7 @@
  */
 static struct table_header *unpack_table(char *blob, size_t bsize)
 {
-	struct table_header *table = NULL;
+	struct table_header *table = ERR_PTR(-EPROTO);
 	struct table_header th;
 	size_t tsize;
 
@@ -74,20 +74,21 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
 		else if (th.td_flags == YYTD_DATA32)
 			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
 				     u32, __be32, get_unaligned_be32);
-		else
-			goto fail;
+		else {
+			kvfree(table);
+			table = ERR_PTR(-EPROTO);
+			goto out;
+		}
 		/* if table was vmalloced make sure the page tables are synced
 		 * before it is used, as it goes live to all cpus.
 		 */
 		if (is_vmalloc_addr(table))
 			vm_unmap_aliases();
-	}
+	} else
+		table = ERR_PTR(-ENOMEM);
 
 out:
 	return table;
-fail:
-	kvfree(table);
-	return NULL;
 }
 
 /**
@@ -343,8 +344,11 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
 
 	while (size > 0) {
 		table = unpack_table(data, size);
-		if (!table)
+		if (IS_ERR(table)) {
+			error = PTR_ERR(table);
+			table = NULL;
 			goto fail;
+		}
 
 		switch (table->td_id) {
 		case YYTD_ID_ACCEPT:
-- 
2.51.0


