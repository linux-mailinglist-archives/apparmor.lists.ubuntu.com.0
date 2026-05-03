Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJFiGFvx9mk/agIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 03 May 2026 08:55:23 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78E4B4A5C
	for <lists+apparmor@lfdr.de>; Sun, 03 May 2026 08:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJQiy-0005Pm-Db; Sun, 03 May 2026 06:54:44 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJQiw-0005OQ-T2
 for apparmor@lists.ubuntu.com; Sun, 03 May 2026 06:54:43 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5121B1400095;
 Sun,  3 May 2026 02:54:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 03 May 2026 02:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777791281; x=1777877681; bh=x4woJ69WADaz5hl08+FnD
 2N9E4INQOR4i+qT2eSSrnE=; b=Rt+Cm5L/E4hAuiqsu7AcSm14Vt0KoOKkswAC8
 0Mv4Qo5vyLNIukh7XrUbK7qYuIw74k+swulRfKT81jE1uFDyq/TEjSewXm1ayHN6
 /bWVv/IHiqN9sQRiTl76R3+csp3b6HeqTIBIkkdL+tXib8ByAS/72Mt6DAT1wMdg
 B9SqaOYYUnjpiDmUEuuyQdFWK3/tOXGqsT4LTsB+ejjt/yR2b7SUaiMCwU/gpXgn
 NP8qW4bfkowLHjCX5DxyUJqskcpQB8ZVbltjnR0yniMzXo65JzTzrn6MlLfA+s/f
 ZYS9aSZgpixz7UCe9FAbKr5o+lHe8n8tSQMn9WRrJWLaHTa6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777791281; x=1777877681; bh=x4woJ69WADaz5hl08+FnD2N9E4INQOR4i+q
 T2eSSrnE=; b=VC44DJB5DJKAl1pfcnkmG+gXilHL6tjElCNfF/QPsKv2pWjWL5s
 LmtOJ6WaTrk7PtDesJOgChlJCY34a48eENjpEXIN3R7vTE12mAzcUOBNHb4mKAUz
 TGBiOM/XnyXv3+veU9tHbl9xjtyvvek1d+trFYFtjSyPHRQDfMK3H7H3xoYOTkrc
 hw6GA6+/LpQ1v31Va/lkL7HL3Scdgu4cfEaGhRX0Jni26MrjUkgDbvI2L1sWBxxt
 NUImLzqhmOb0puCAn/3UmU/rts+0FjxSJ9g73cf0ioRMkiMA6msGeUaMG0zmw7C6
 Ji3wjX7XHhDaRKPpR7DrVElmZedY6eNJ2Nw==
X-ME-Sender: <xms:MPH2aQ0-tn1YACPXvHinYEEaaYdmWkPfXEZ8QaBrG3GDJfQmONU2Kg>
 <xme:MPH2aRG555T_N9hUQ7cMIo5rWln85tLEQ-fQQJsCOZwJC9FS6ZKPT_ZKpDmqRzHqy
 HXS0cnP_73G7eh4xjJINTiyrtx3KenB12_-aSDP2ZzE2Zx3_e_Gxg>
X-ME-Received: <xmr:MPH2aWgI5CTc2x4tFCD9dWS9CZqa6l_R-hi1bTNcgfaKwlLWPqs117SjrGXH6TxYWElcXw3ivYmlvPB6F8i8buOoeEOtj2A_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelhedvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepkgihghhmuhhnthcumfhrhihnihgtkhhiuceomhgvseiihihgohhonhdr
 phhlqeenucggtffrrghtthgvrhhnpefhhefhfefgjeeufeetjeekueefuedthfeltdekfe
 effeekteeitefgheehffejueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepvddpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhu
 sghunhhtuhdrtghomhdprhgtphhtthhopehmvgesiiihghhoohhnrdhplh
X-ME-Proxy: <xmx:MPH2aU9NX6x7TwKc6Pc_8u8-c28mscldLw_TETYHDkPXe9go6y0E5w>
 <xmx:MPH2aVpio7TXwe5bkT1o6_TXuw79GpFMzmmWcdCHyX-2e4ewAq3jmA>
 <xmx:MPH2ab-nfQjsTP-0MtQp2Vz3q6IguX14NYMqhnxW5j5KqgA9P9rEPw>
 <xmx:MPH2aRW53qNxMfn41yTG8ajAlchmh5CbrUbeUsWJ6oaRHzO9hqPv0g>
 <xmx:MfH2aXbCnEXWBl41PTv9aUOu6UBAieI5L838lyIDovNhnY0RvzCxBZ4O>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 02:54:39 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Sun,  3 May 2026 08:54:32 +0200
Message-ID: <20260503065436.141917-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.154; envelope-from=me@zygoon.pl;
 helo=fhigh-a3-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: fix leaked peer label in unix file
	checks
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
X-Rspamd-Queue-Id: CC78E4B4A5C
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

aa_unix_file_perm() has an outer plabel variable that is released at
function exit. The only assignment re-declares plabel in an inner scope,
thus shadowing the variable from an outer scope. The reference returned by
aa_get_label_rcu() is then assigned to the inner scope variable and leaks
when that scope ends.

Use the outer plabel so the existing exit-path aa_put_label() releases the
peer label reference and the successful cache update sees the same label.

Fixes: 88fec3526e84 ("apparmor: make sure unix socket labeling is correctly updated.")

Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/af_unix.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index fdb4a9f212c3b..d7b1461a69635 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -758,7 +758,6 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 			   unix_fs_perm(op, request, subj_cred, label,
 					is_unix_fs(peer_sk) ? &peer_path : NULL));
 	} else if (!is_sk_fs) {
-		struct aa_label *plabel;
 		struct aa_sk_ctx *pctx = aa_sock(peer_sk);
 
 		rcu_read_lock();
@@ -796,4 +795,3 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 
 	return error;
 }
-
-- 
2.53.0


