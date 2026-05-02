Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAVoElne9WljQAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 02 May 2026 13:22:01 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A28654B1C04
	for <lists+apparmor@lfdr.de>; Sat, 02 May 2026 13:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJ8Pl-0003GB-Hr; Sat, 02 May 2026 11:21:41 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJ8Pj-0003F3-KD
 for apparmor@lists.ubuntu.com; Sat, 02 May 2026 11:21:40 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 732EB1400037;
 Sat,  2 May 2026 07:21:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Sat, 02 May 2026 07:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777720898; x=1777807298; bh=bCMaTR7eZbG/eHYkFvczm
 ux361LN46ExUSQcewW/q5c=; b=jKspS+wHhmweKK0TTAmQSq+cQb2dcbVNIJ49e
 SXsDKWN7LkPyln3Xw1Wi41egVdh6Fqv1CuIa8MpMrEDkVzYQIVROeFDNJzcbEXd8
 qRRShNVFBgEwH9O9cIKjmCC9DrCGX9S9TdJCcIc73pmuvh+sYOPiECgBokiCRwei
 Ee0aKFidPoRdZ511nzwzJ614vPNnrNtPvVaSDkrYutXCGsh9L1693KYEOnyh5hd6
 zQfIoWBDsYnnzd169i6BsAlSkohmFcwyFiV6M4KEI/+vKBNAumsJIb+OCBg9iooN
 3g8D+IDOsA+U7r0yxJ5AKNA4X74eyqxVjEkMBZaCzI71yMx/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777720898; x=1777807298; bh=bCMaTR7eZbG/eHYkFvczmux361LN46ExUSQ
 cewW/q5c=; b=lcP6iKpeM+tqvGjNmXPYpDIF03dNRAi2iDGXQlK/YYX2OR1bBxU
 cziRj+Wfgi31fNl91sUlVuN5PJ8HJptgQcoYt6BXv5oX7TlyH6itBmsJigtjatvC
 I0/nJIwpJCLDielGpiOxM7qXFTzskhs1x5OdizVpE3vcKw1uL3XWjT0tMrHTIIwu
 WF+dpAYBaIWpR9u4miSXUwtA5/QRSBS+8/6sCTKc1jvtjXU6GFg8SXX4QTwcAMxR
 qmy+wP66X6UFEIaNh25IE+uthYnYOhtZ5JKqUM0D+UOpQCShR9v2RUNj2TtaRidE
 af/UM5FvyYYAWIPTE9ANnXD5wpTMatfqvtw==
X-ME-Sender: <xms:Qt71aZOrJ48rzMzwg8reAGTO-PSM3F3WeNom0trKam01NS3IYwXrcQ>
 <xme:Qt71aR-_IRaJSVSn6_Qn8t972ympLPXRidvREJWafcsi_JIx2w4Fx01AbxpwK6obL
 3cCThnxuTybq8vH8nN2J03eYcfIectAtyRVK3FJ0rkbGUs6uLGgFcU>
X-ME-Received: <xmr:Qt71aV4w8QS0XOJmvwDKKKmzV-nl3ubDu-ltp84vhbFWO2_PvFhCSJbkEPR8v_NA-MLvdUj_zG76h4NTQAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelvdelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepkgihghhmuhhnthcumfhrhihnihgtkhhiuceomhgvseiihihgohhonhdr
 phhlqeenucggtffrrghtthgvrhhnpefhhefhfefgjeeufeetjeekueefuedthfeltdekfe
 effeekteeitefgheehffejueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepvddpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhu
 sghunhhtuhdrtghomhdprhgtphhtthhopehmvgesiiihghhoohhnrdhplh
X-ME-Proxy: <xmx:Qt71aQ1VqA5lh3Uuy4r7emIUqmiKboIluMFUnpGOJGcqLiwa0VbbHQ>
 <xmx:Qt71aUBi2BFj_7hE_QMHfNreVlFq8wT7OhNTTlC7ysR7ASXW8Ti6Zg>
 <xmx:Qt71aa1A_7HbbgTeHSxeyTgxI337J4S55kMZUG3a2Klj0P0JMx1D4g>
 <xmx:Qt71aWuq2p5KUOcZFmbOs5LABqv_VqWsgryMgdoUzqsbMe8XkavYXg>
 <xmx:Qt71aQz6jjRWzY0nsDtUswlEu5iQ7nl8xf1v3eRgIt-Y9pGVhmxxDJmF>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 May 2026 07:21:37 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Sat,  2 May 2026 13:21:33 +0200
Message-ID: <20260502112134.182049-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.155; envelope-from=me@zygoon.pl;
 helo=fhigh-a4-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: aa_label_alloc use aa_label_free on
	alloc failure
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
X-Rspamd-Queue-Id: A28654B1C04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[zygoon.pl:s=fm2,messagingengine.com:s=fm3];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zygoon.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@zygoon.pl,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[zygoon.pl:-,messagingengine.com:-];
	NEURAL_SPAM(0.00)[0.930];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zygoon.pl:mid,zygoon.pl:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]

aa_label_alloc() allocates a secid before allocating or taking the label
proxy. If the later proxy step fails, the error path only freed the label
memory, leaking any resources initialized by aa_label_init().

Use aa_label_free() on the failure path so partially initialized labels
release their secid and other label resources before the backing memory is
freed.

Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 3a721fdf18339..c6a96355e8d9e 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -458,7 +458,7 @@ struct aa_label *aa_label_alloc(int size, struct aa_proxy *proxy, gfp_t gfp)
 	return new;
 
 fail:
-	kfree(new);
+	aa_label_free(new);
 
 	return NULL;
 }
-- 
2.53.0


