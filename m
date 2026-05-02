Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qkpgEwni9WnNQAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 02 May 2026 13:37:45 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0F4B1D0B
	for <lists+apparmor@lfdr.de>; Sat, 02 May 2026 13:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJ8fA-0007gY-J9; Sat, 02 May 2026 11:37:36 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJ8f9-0007gN-1x
 for apparmor@lists.ubuntu.com; Sat, 02 May 2026 11:37:35 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1DD8A1400143;
 Sat,  2 May 2026 07:37:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sat, 02 May 2026 07:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777721854; x=1777808254; bh=u7F2+w5a9LNhRsOZQwxA4
 qSEGkpjtCQLXXX+b3Bo++8=; b=MNa9f6dVRcm0/Y09Hlonqusp+im9axLCWmdbn
 Dqm1YJqhtNKtVRRJpHzYyUd+m6O5kUM3ls9dfnVTHUKjb96vRVR3S7I2dLfL31nz
 8T43/+bKuEmkD8PXVOyCFT1X+SyNH8KbqzwmT73HzWbTSw27IXv4Yu+1u6uiLP9S
 hDqUS9hiLWmyI/LYyLdVboazMIzT7nee5ql/Ce/9qINVXGKp32F8cOkmD9/ezb8X
 EzEoqbXOssHNuvITY5waMJSzHUFZLJTxXvClRy/cZLvO84Z8ADKcn9NAyJSjhmeQ
 EL7X7uDI7XLSFa69IkYygic3Mj/JXN4eRVozCIV4ZwaKQHwdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777721854; x=1777808254; bh=u7F2+w5a9LNhRsOZQwxA4qSEGkpjtCQLXXX
 +b3Bo++8=; b=qe5GA6+hjt71DgBa2LbmNrA7hYbV7hgQrWld1Kst+RJkWzKXAfU
 7/u4sQKim9FqAIRPBbAf0Ykqi9P/bh8BueWAmq1A/yy/pDaaIQwTayx48AGv80/C
 llrxu32F6rod8zRKcGDUfrFZab49NYyqSht0tNEmg13lHGqgp9hQn0C12EnkOKOp
 vx+gJadJohcJWCyniimdfU8/bEtPLUJccR0y5/LrBICioZbrEkJ9ABHEeE1csZBa
 pG96eiA+9d08JgFx4yfSzzx6P0nAhbGp8KSeVxrGELsL4QImkIPsvPMBsxae4g8d
 bWOAGBM8TjjK7wkAxLtuR7Z4iDEJNU4UMWw==
X-ME-Sender: <xms:_uH1aRKBmmRFsdMm2Mc_L575ywhO11qMGyxQWijWD3vIkWFFhFWqmQ>
 <xme:_uH1aTLA6hacasv1d7Nm6LJl1L8Bd2OirROewPOY-L-g8NsbeklmcEu9Mr7mPeRUS
 MEf2PSfXZWEdwtuR-qXi-sgZ_2lD9fK4qFUeSyrj-sXZZsdPb5h>
X-ME-Received: <xmr:_uH1aXW3AWk5srViAbH6oBstqDwRx_SluJHDwoAx_HmKm8fHZy2Sm4GBAtBVGdwfWUL8dx7bNmbaE9GlVFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelvdelkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepkgihghhmuhhnthcumfhrhihnihgtkhhiuceomhgvseiihihgohhonhdr
 phhlqeenucggtffrrghtthgvrhhnpefhhefhfefgjeeufeetjeekueefuedthfeltdekfe
 effeekteeitefgheehffejueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepvddpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhu
 sghunhhtuhdrtghomhdprhgtphhtthhopehmvgesiiihghhoohhnrdhplh
X-ME-Proxy: <xmx:_uH1adiDRP5B3Rutira32c62HcJAwUh_ic1ROTW2Z5xVpvMfjWDYdg>
 <xmx:_uH1aa-whpbMYg5SXL2z6vncOVwHiJnPVGkSizRusJRqDqmcTx-7aA>
 <xmx:_uH1afBfAluozEJBPEi_X7_I5QnldEaBDK9EXvc9NdsMQCqW4YI7Ew>
 <xmx:_uH1afIrCU-VYKczCE2OQ42SjrSL6ctnXyeR9FALv4_mcuvm0KX2aw>
 <xmx:_uH1aTMtaY8KpzkWgSxghxxgp3HlWhYXk8yipMtq45EbQ9pEB0pGIiHv>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 May 2026 07:37:33 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Sat,  2 May 2026 13:37:14 +0200
Message-ID: <20260502113720.185194-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.155; envelope-from=me@zygoon.pl;
 helo=fhigh-a4-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: aa_getprocattr free procattr leak on
	format failure
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
X-Rspamd-Queue-Id: DEC0F4B1D0B
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
	NEURAL_SPAM(0.00)[0.920];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zygoon.pl:mid,zygoon.pl:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]

aa_getprocattr() allocates the output string before rendering the label
into it. If the second aa_label_snxprint() call fails, the function
returned without freeing that allocation.

Free and clear the output pointer on the uncommon formatting failure path
before dropping the namespace reference.

Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/procattr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/apparmor/procattr.c b/security/apparmor/procattr.c
index ce40f15d4952d..c07b6e8fd9c93 100644
--- a/security/apparmor/procattr.c
+++ b/security/apparmor/procattr.c
@@ -54,6 +54,8 @@ int aa_getprocattr(struct aa_label *label, char **string, bool newline)
 				FLAG_SHOW_MODE | FLAG_VIEW_SUBNS |
 				FLAG_HIDDEN_UNCONFINED);
 	if (len < 0) {
+		kfree(*string);
+		*string = NULL;
 		aa_put_ns(current_ns);
 		return len;
 	}
-- 
2.53.0


