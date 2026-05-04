Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGt8F6B/+GmXwAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 13:14:40 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEA4BC44D
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 13:14:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJrFZ-0006RO-8J; Mon, 04 May 2026 11:14:09 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJrFX-0006QV-HZ
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 11:14:08 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 87642EC00AE;
 Mon,  4 May 2026 07:14:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 04 May 2026 07:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1777893246; x=1777979646; bh=tiG8mybx1Eia2d5EM/vxa
 QTq9dwNak6QiSsJolTJO2g=; b=Hlcme+3X2uSrtUO8tu0sOn0k30VFemjLfOuet
 K4WsF9KiOb1GS2qsUZeCreM0TnJK615HcoHOJ9MfE97Kzt2kDXEY6ewnz7pMG5Aa
 vjgqEVL1IvL9XjG2GJV/UtBKN7gNPojsrpfpb0zzaiwKfI8B7bRCKWAyAN44TsEu
 cWd1ti1UILPHsKKMAz6ZRWRri78KwFA1S9dbuBn13xOVBYOWZToCjmC6LT6c8az6
 K4FmsJgHxXylcsvXfzb+dfDeSMNe51a+racEPz7qxs10I+WrNzNlogatm/ZfLpZb
 Is8wY0gg+1HMx4VR94URzhJfHB5qfYViLQmaWWdGIJ0Puuu6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777893246; x=1777979646; bh=tiG8mybx1Eia2d5EM/vxaQTq9dwNak6QiSs
 JolTJO2g=; b=OyXvDaL/QA89IOSdM4Vu9yJgr8Hn7dzar5RGA/lA06kisLPe5EI
 CIjIJ8FnVYCZNCx49IIF5Cm0S/1PeAJFYyGQG+8IPyn6Tc7lodr/Hu3cn85HaZRB
 y0hereh+B4HUjPdyqnDQTkhiHMX8eXEJcmTLKMcTGAcXRI85zh+0zlmAxBM/a81E
 Wvb29Bl8YYwK/bwxf5E2ERxqWhklN3xMI/9lRk0NbyinX6X1hMbqWb60qHJE2Wvq
 Y7Wxvpby0GyogoCUGbMD1w00YBtagGEO/uLHHqq4DUYiUjj4h/pulU1NXjeZcwlE
 jtEsHfs36rlt/8SozZvFG0J9GPALHYLW30g==
X-ME-Sender: <xms:fn_4aUu5TpujUQ0BB_ExJhhm-3y28_vzSNWzCQOnES2RVSn0xZEWAA>
 <xme:fn_4aXfmtY6KLPlLTBppqD5DNRGtUDi9O8Njhh032T78MYY5nFa4dzvs2nKcw4gRa
 QNNkfl23-KkVKFYbOAAz75sXknTQDvEPPfBg6kc16h84VJ0PFCIIQ>
X-ME-Received: <xmr:fn_4adYAfww2S7G7SIspUbzJgw4MFaY3hawjbsT2KoPNyMGmFzw7l5FU7O7aT5-h039HeiLB-yR90R-ncAmFdN0MYDp7hG7Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeeilecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepkgihghhmuhhnthcumfhrhihnihgtkhhiuceomhgvseiihihgohhonhdr
 phhlqeenucggtffrrghtthgvrhhnpefhhefhfefgjeeufeetjeekueefuedthfeltdekfe
 effeekteeitefgheehffejueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepvddpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhu
 sghunhhtuhdrtghomhdprhgtphhtthhopehmvgesiiihghhoohhnrdhplh
X-ME-Proxy: <xmx:fn_4aSXo9e2t8Cld2VhkAddCniCRC70NoCCLMUDg3rX2KMUeKCbl1w>
 <xmx:fn_4aXiTJ0JLhSRFmRfb8lc_bw7PJRObJr22XDYFptMP5BoxiZgMcA>
 <xmx:fn_4aYWFj1kO2gauE06hV3LFLCgqpSIYYRL7K4KZ7EdkktU1IWurMw>
 <xmx:fn_4aWMKQlzIMf45jLSVfJ0yFREG6IUZ3sT_5oFsf_swdX3pTjI6Mg>
 <xmx:fn_4aQQPHWE9r1rT0PMydeltYJ7CX4v2xIp3HC7-KSMuxz-7JseKbj4T>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 07:14:05 -0400 (EDT)
From: Zygmunt Krynicki <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Date: Mon,  4 May 2026 13:13:24 +0200
Message-ID: <20260504111402.18714-1-me@zygoon.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.147; envelope-from=me@zygoon.pl;
 helo=fout-a4-smtp.messagingengine.com
Subject: [apparmor] [PATCH] apparmor: release exe file resources on path
	failure
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
X-Rspamd-Queue-Id: 91EEA4BC44D
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
	NEURAL_HAM(-0.00)[-0.535];
	DKIM_TRACE(0.00)[zygoon.pl:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]

get_current_exe_path() takes both an exe_file reference and a path
reference before resolving the path name. If aa_path_name() failed, it
returned immediately and leaked both references.

Route the failure through the common cleanup path so fput() and path_put()
always run after the references are acquired.

Fixes: 8d34e16f7f2b ("apparmor: userns: Add support for execpath in userns")
Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
---
 security/apparmor/task.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/task.c b/security/apparmor/task.c
index 0db0e81b46001..6445cb5f85266 100644
--- a/security/apparmor/task.c
+++ b/security/apparmor/task.c
@@ -313,9 +313,12 @@ static const char *get_current_exe_path(char *buffer, int buffer_size)
 	p = exe_file->f_path;
 	path_get(&p);
 
-	if (aa_path_name(&p, FLAG_VIEW_SUBNS, buffer, &path_str, NULL, NULL))
-		return ERR_PTR(-ENOMEM);
+	if (aa_path_name(&p, FLAG_VIEW_SUBNS, buffer, &path_str, NULL, NULL)) {
+		path_str = ERR_PTR(-ENOMEM);
+		goto out;
+	}
 
+out:
 	fput(exe_file);
 	path_put(&p);
 
-- 
2.53.0


