Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1YIZAvJm+Wmt8QIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 05:41:38 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B94C6327
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 05:41:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wK6ej-0000eO-Pn; Tue, 05 May 2026 03:41:09 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wK6eh-0000br-JR
 for apparmor@lists.ubuntu.com; Tue, 05 May 2026 03:41:08 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id EF4BDEC02B3;
 Mon,  4 May 2026 23:41:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 04 May 2026 23:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777952465; x=1778038865; bh=7p3xHxZlAT6r2LyAAEp2r
 y+Vd/di2uSV3KDSnnB3Czc=; b=GYpi0SAXBzS+3RtwmC6m5BUxKeF52HfOEWhEY
 HuZfhDTEsKIQa6rk5sBDkIU3usf4gcNJEdNJBhZY4/K4M9utvv57/I1i5tfLZP4C
 qEDAzPX7lLtJZFhO2Ix/yjwN75JJA2l6OrtVT4owtXrecn9g+OOQJ6TeX2Nfg8iX
 9YeZT5q9cwzTTre+IkpYesBPxTS1BAvbx434Ltp/x1FgGuw/zP09gTCHBYpGhGsN
 AIqv8IEI7qafVpTEMKqm0lV7RXTSJCuKPoWWKlSmX3bk2I/VrCdIB50hMDPhMSNY
 fxeGesct93Z0tR3nQs4s3oh7oB2ru0U6r/eh4zq7UKwcFiu0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777952465; x=1778038865; bh=7p3xHxZlAT6r2LyAAEp2ry+Vd/di2uSV3KD
 SnnB3Czc=; b=PRBCe7akQ2W+n3B2UieSfNv1Mljvvj4N+t2Rke+GQcHPwz9eg6J
 E/EdQHHvqBErmmgxsltMGnLpKlP5yQjfuSQwjC2MoyDiVOSqNO3TSBFdFqUP/xCC
 +XrcAlMasbyz4Sobfj55ruDNx118uhuP+ig1T0Dcc8SkZQm8mPByifDRSH3IEVBN
 sBl7t/wmfM4s7l8yzDDZaeGcptioa2hZt+6zVlS9nNxWMi0pZOwc1LGvNjhLyUJX
 AYGAmJIrfVAegRqIxnp2p2+Y+mIqCYYXOdE8y9ffXLRdbXwwuKeA2Gy82wVY+nUg
 fT8rJGslNNt/+fRjZBCV1ypU0erleScDBPA==
X-ME-Sender: <xms:0Wb5aTPRITYr4hP8fr9eJ78hf1ZBeBJ8nMvW437Zjoy4XQMGNdNdbA>
 <xme:0Wb5aT-E8Vtxc9k0XTT4LSDRnmAuTGqEW0Eql2g5LrcPxkGyI7a6eBDPlXld9a21t
 NQLVgurQLfISAe0_m5n7HjYV4oVRMM0y7cFJT7sZ7MytV9hDmyc>
X-ME-Received: <xmr:0Wb5af7eAuPiA3uJi4dtpdd4b_BB2hw9Gk_6A66TFauWhHW477OMYLgbDfrLZrtiE80tiuzperXrc5S24arwakyfzVciM3Xo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddtieeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhephfehhfefgfejueefteejkeeufeeutdfhledtke
 effeefkeetieetgfehheffjeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopedvpd
 hmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdr
 uhgsuhhnthhurdgtohhmpdhrtghpthhtohepmhgvseiihihgohhonhdrphhl
X-ME-Proxy: <xmx:0Wb5aS1vkzqyhDQkr2PWI9LGArdmE4T4WJgQHrwQQg7XN3CKlMNMQw>
 <xmx:0Wb5aeBB69N3HjYZ8m3VTYXhE3Qmv1pMd_-XbnRms0xTZuk2Jtrf9A>
 <xmx:0Wb5ac03cjC8OPHsAgr9nlNtqnKGyhs24he1yFcXP_mR2wjHDS2STA>
 <xmx:0Wb5aQujVFGr6FyzHCiremtxZlhANSamzokKnaPJc5W5jb2pnmAl3A>
 <xmx:0Wb5aazOR5nGNDZPxJbXAZqMEcMm2s6FfapalqhvXsNY-0gRJWvdYKHB>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 23:41:04 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Tue,  5 May 2026 05:40:53 +0200
Message-ID: <20260505034059.115997-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.146; envelope-from=me@zygoon.pl;
 helo=fout-a3-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: put secmark label after secid lookup
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
X-Rspamd-Queue-Id: 587B94C6327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[zygoon.pl:s=fm2,messagingengine.com:s=fm3];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[zygoon.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[me@zygoon.pl,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[zygoon.pl:-,messagingengine.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.498];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zygoon.pl:mid,zygoon.pl:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[]

apparmor_secmark_init() parses a configured secmark label to obtain its
secid.  aa_label_strn_parse() returns a refcounted label, but the success
path kept that reference after copying the secid.

Fixes: ab9f2115081a ("apparmor: Allow filtering based on secmark policy")
Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/apparmor/net.c b/security/apparmor/net.c
index 44c04102062f3..df9cb7c00cac8 100644
--- a/security/apparmor/net.c
+++ b/security/apparmor/net.c
@@ -354,6 +354,7 @@ static int apparmor_secmark_init(struct aa_secmark *secmark)
 		return PTR_ERR(label);
 
 	secmark->secid = label->secid;
+	aa_put_label(label);
 
 	return 0;
 }
-- 
2.53.0


