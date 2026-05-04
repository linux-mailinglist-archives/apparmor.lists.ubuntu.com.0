Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HjvF7E9+GkxrwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 08:33:21 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C447F4B8F02
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 08:33:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJmrJ-0002DN-QT; Mon, 04 May 2026 06:32:49 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJmrI-0002DC-4p
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 06:32:48 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id A8BE4EC0038;
 Mon,  4 May 2026 02:32:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 02:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777876366; x=1777962766; bh=Xz/BNt78NdHuOixRV+HJZ
 kHIJXFAu72tfTZngAf/mgw=; b=Sl4PzTgBW3EVNzfafaU9MFp8jS9gkk55tlXfr
 NltJjo6hCt/b4BNs6PhwW69Y2RA0vo2sZUMnrOqbcruwxPMYpJt9/AiaR+A1TsfA
 bSP7QWoO6b4ONGMljeO4sjhLJQ4O+YMM3Qa8wlRlJMxgUn//ONn3QxOrDcf5XXnS
 4TUrpNIohKE4dpfnyugocxThyXbnv6X7sv745L97JW4gRDDp81wiP4cRFpi7ZyEs
 y4p42qC3ddukvC6PywK2VvBhhnqW5zQ+uIVfpliOrXlsrLiCd+sGqnYTb+Pe/r6l
 Qiu/k/qeJhLgPXkX/hpO1w6jojwnj1pfxb2BLlmRxjuEJ/dyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777876366; x=1777962766; bh=Xz/BNt78NdHuOixRV+HJZkHIJXFAu72tfTZ
 ngAf/mgw=; b=r3y10azezy2AEWNeqpPKlj3Br1cY9h597Skalhy4Sx6I26m/uBZ
 UNarAvRzvtxgSxLbACn4wGXnYjamKeaEWd9bw0qGLuGLKMaM9yIopP0FmX8+6F7d
 XNqufhSI/4EH+3mBLs+vCKPglvQ1rDKX8GI7T1skF9+q6MnNTWZYZGRkYMeE9pPK
 ljuVCqfyWfGnqRS6P96cej09s7/J5SdYeSI1JXgDH7c4eRIJz6RyznSI7ksJQjDI
 W+nCSeULqn9G/5bw2S5pN3t0Nks7aAXi+zXOmdS369++6h9uiFgpY+BcdZ0qU0nO
 6gPL+Nu109JCgFgnKzM/fclR4dcGZjsl53w==
X-ME-Sender: <xms:jj34acwRXTiMteQf7zAKzr4IYBZ3g68UoBF6OuFK2YMt7nsGGHpYoQ>
 <xme:jj34aWR7QcZAln-UuDo5lexhvm_E60maXgKoVGhNb1rqTBsDd45dJ_qRc8n8-QytM
 1K3YTQdaIu2t4Vs3-LNhXTF-QHWLC6DMSStLLh3LGWzrQor4HSaKOs>
X-ME-Received: <xmr:jj34ab9XNuu-3oToe-UFztzSy1BI89uBe7_DI-MvDThhWILMQKxOoMcIzdg8_Ky_8_-9_7i0gcTU_gXGK8ylemSnl3ML0asG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkedufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepkgihghhmuhhnthcumfhrhihnihgtkhhiuceomhgvseiihihgohhonhdr
 phhlqeenucggtffrrghtthgvrhhnpefhhefhfefgjeeufeetjeekueefuedthfeltdekfe
 effeekteeitefgheehffejueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepvddpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhu
 sghunhhtuhdrtghomhdprhgtphhtthhopehmvgesiiihghhoohhnrdhplh
X-ME-Proxy: <xmx:jj34aVo_56aEUc2VRB4UXgN2oZzw-e1FFbtB73yu7JG487mopGhbfg>
 <xmx:jj34aQlTHzCAkzBWTqyPC4VmZqb-zmXgweDkrL0Op7GgXE5y1d_xrA>
 <xmx:jj34aUJc1Jk1FhhW_piDNhZl0s5wxLYM-189--EcUmdl7y6E04ENvg>
 <xmx:jj34adxGu26QF6TCxB9aCBE3WJZFPm9wIW-OvP4IWavU7NkdgDD6qw>
 <xmx:jj34ad3ZP0aCiUQpvoJ_QD-THDyfj_5BOfSi0-bhRoRe-CLBTjmSoT2e>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 02:32:45 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Mon,  4 May 2026 08:32:37 +0200
Message-ID: <20260504063241.368579-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.148; envelope-from=me@zygoon.pl;
 helo=fout-a5-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: fail policy unpack on accept2
	allocation failure
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
X-Rspamd-Queue-Id: C447F4B8F02
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@zygoon.pl,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.533];
	DKIM_TRACE(0.00)[zygoon.pl:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]

unpack_pdb() may need to allocate a missing ACCEPT2 table for older policy
data. If that allocation failed, it set an error message but jumped to the
success path, returning a policydb with the required table missing.

Return -ENOMEM through the normal failure path when the ACCEPT2 allocation
fails. Remove the now-unused out label.

Fixes: 2e12c5f06017 ("apparmor: add additional flags to extended permission.")

Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/policy_unpack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 9f45d5513d2ca..9084d3d0cffdc 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1054,7 +1054,8 @@ static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
 		pdb->dfa->tables[YYTD_ID_ACCEPT2] = kvzalloc(tsize, GFP_KERNEL);
 		if (!pdb->dfa->tables[YYTD_ID_ACCEPT2]) {
 			*info = "failed to alloc dfa flags table";
-			goto out;
+			error = -ENOMEM;
+			goto fail;
 		}
 		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen = noents;
 		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags = tdflags;
@@ -1079,7 +1080,6 @@ static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
 	 * - move free of unneeded trans table here, has to be done
 	 *   after perm mapping.
 	 */
-out:
 	*policy = pdb;
 	return 0;
 
-- 
2.53.0


