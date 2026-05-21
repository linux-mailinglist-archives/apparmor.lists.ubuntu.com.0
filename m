Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCjKHqwZE2oi7gYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:30:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E35C2E01
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:30:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRAMv-000808-6L; Sun, 24 May 2026 15:03:57 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <eduardo@eduardovasconcelos.com>)
 id 1wQ58G-0000Cx-Ck
 for apparmor@lists.ubuntu.com; Thu, 21 May 2026 15:16:20 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailflow.stl.internal (Postfix) with ESMTP id B005A1300D58;
 Thu, 21 May 2026 11:16:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 21 May 2026 11:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 eduardovasconcelos.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to; s=fm1; t=
 1779376578; x=1779380178; bh=VlREViZVwVWezytnhlvlcYEa6W7KUthVxEO
 CdcP2j1g=; b=oDzFJx5IGPPOEYirRi3TtY/phXLgGfii8V3tGXzm9fyXMHALkIT
 LzMk47xD/of7e9xGQ+mRuQyfmaIzVjXcxRuB9iOX/9q4HKu3xHnPh2d5t/1lRdAe
 //hqRz6pfOOhjFumRoYEzloxpDL0/ztX1aZpNjazcwU7ZneXkS4Qi+S4pb+m74BF
 0yloa2pR/1GyKtsCzKDVcvaMw7UWV3Wgq7IbR90DkvWjn2Dnf0e0ZI4CFOJbt3Ud
 6xIRbiwgWB0Tgv4APDPKKdt+1AWoBJt2dB/0dq9SYzluqSytxsWmOeQ+RKGCYWA7
 odTxzU9jHcDJeuPY4dFbqZhjA0Rr5E7UQGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1779376578; x=1779380178; bh=VlREViZVwVWezytnhlvlcYEa6W7KUthVxEO
 CdcP2j1g=; b=eTz1+3KSBGFWkeKf5SEcZevM4gr0SnW+vzZ4C8ElspJz0V8VEyx
 C1KDRDKqge44yztY9n5sO/C7befMSOmk1OXZHXs95AK0PExhCoFd9K5Vzq/hwk3H
 uiZW6fxbnMIe+H56F7S02IG5Dh6hUvWY4EVw20C0L2gbXpohUN/KV945NQb9UUbe
 Vm3fdO/NMqrXiKtaYIyxHFsn40wzpDGapoJj0X6FihEk//x0Yo6eOtCtk89x+VaX
 NTTMMQRHfNDDPHvNUuwMdwdzIL0GV6W1cne79mKutY9df9U0ni0sY4h1EjLBSNyS
 Wg6nIEJG7y4z3lt1hG1rwi2kNcnPoxj/YIg==
X-ME-Sender: <xms:wSEPapJ7Eq531YWJkqe5sb_R0Om6UrNjEGKhSFmuBF2YhgogN4IcGQ>
 <xme:wSEPahLHMyC9E4n55uzuSldl5F-kB57cUdhV2fVyyTPnEVZYOe141PbRBU-HY49LM
 vX1nydjMadP967_HT-Uk9tNiMkhWoxdDNx7HV_JxCf6ODDSVR4hrQ>
X-ME-Received: <xmr:wSEPaj4_Qd5y4QvRMD7IvpRKSwWxfgS9J0l5H0NH-QNrN13YYbcPBRAwlKnePw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefgughurghrughoucggrghstghonhgtvghlohhsuceovgguuhgrrhgu
 ohesvgguuhgrrhguohhvrghstghonhgtvghlohhsrdgtohhmqeenucggtffrrghtthgvrh
 hnpeevffetffegkeetleejfeevkeeihfffueeitdekkeekkedvudegjeeivdeutefhieen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepvgguuhgrrhguohesvgguuhgrrhguohhvrghstgho
 nhgtvghlohhsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuth
 dprhgtphhtthhopehjohhhnhdrjhhohhgrnhhsvghnsegtrghnohhnihgtrghlrdgtohhm
 pdhrtghpthhtohepphgruhhlsehprghulhdqmhhoohhrvgdrtghomhdprhgtphhtthhope
 hjmhhorhhrihhssehnrghmvghirdhorhhgpdhrtghpthhtohepshgvrhhgvgeshhgrlhhl
 hihnrdgtohhmpdhrtghpthhtohepvgguuhgrrhguohesvgguuhgrrhguohhvrghstghonh
 gtvghlohhsrdgtohhmpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghu
 nhhtuhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsvggtuhhrihhthidqmhhoughulh
 gvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
 vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wSEPareBdYRZq-TYEGiJ6l1g8CO6AojzQOZJ2iW43HibMWg9Y6GpcQ>
 <xmx:wSEPauF5ZMY07ltuXSCv78VaeKcdZaPxT7ly_nnvpbng9-hH15BoqA>
 <xmx:wSEPakTAQEWKYi5gv4l-ZhvyMnYuoOc8G-aIfZkmeDtU2YntLUyuEA>
 <xmx:wSEPasYkf2HObQ1Sjj2BPXFDfySkr2NGFnYjQM06_C-9ELDu9KJslg>
 <xmx:wiEPaqcI0gi1hxnoLaKN9UVx5Us_FKndQOzRY9ZxbhKannS8VVq2qO1b>
Feedback-ID: iac1e4b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 May 2026 11:16:15 -0400 (EDT)
From: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Thu, 21 May 2026 12:13:06 -0300
Message-ID: <20260521151314.8683-1-eduardo@eduardovasconcelos.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.136;
 envelope-from=eduardo@eduardovasconcelos.com;
 helo=flow-b1-smtp.messagingengine.com
X-Mailman-Approved-At: Sun, 24 May 2026 15:03:45 +0000
Subject: [apparmor] [PATCH v2] apparmor: Fix inverted comparison in
	cache_hold_inc()
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
 linux-kernel@vger.kernel.org,
 Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	DATE_IN_PAST(1.00)[72];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[eduardovasconcelos.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:eduardo@eduardovasconcelos.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[eduardo@eduardovasconcelos.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.803];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,eduardovasconcelos.com:mid,eduardovasconcelos.com:email];
	FROM_NEQ_ENVFROM(0.00)[eduardo@eduardovasconcelos.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 3E3E35C2E01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cache_hold_inc() prevents the per-CPU cache hold counter from
rising above MAX_HOLD_COUNT, but the comparison is inverted
(> MAX_HOLD_COUNT instead of <), so the counter never rises
above 0.

This breaks the cache mechanism because since the hold counter
is always 0, the global pool is always attempted first before
falling back to the local cache. The decrement also never occurs,
thus the hold counter is effectively dead.

Fix by changing > to < in cache_hold_inc().

Fixes: 0b6a6b72b329 ("apparmor: document the buffer hold, add an overflow guard")
Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
---
Changes in v2:
- Add Fixes: tag
- Link fo v1: https://lore.kernel.org/all/20260521065731.6888-1-eduardo@eduardovasconcelos.com/

 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3491e9f60194..b7c19805a216 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2129,7 +2129,7 @@ static int param_set_mode(const char *val, const struct kernel_param *kp)
  */
 static void cache_hold_inc(unsigned int *hold)
 {
-	if (*hold > MAX_HOLD_COUNT)
+	if (*hold < MAX_HOLD_COUNT)
 		(*hold)++;
 }
 
-- 
2.54.0


