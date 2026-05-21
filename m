Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A0QElXuDmqwDAYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 21 May 2026 13:36:53 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D210D5A41AD
	for <lists+apparmor@lfdr.de>; Thu, 21 May 2026 13:36:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wQ1hh-00069W-48; Thu, 21 May 2026 11:36:41 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <eduardo@eduardovasconcelos.com>)
 id 1wPxMJ-0006VK-8e
 for apparmor@lists.ubuntu.com; Thu, 21 May 2026 06:58:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id EC35F138027F;
 Thu, 21 May 2026 02:58:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 21 May 2026 02:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 eduardovasconcelos.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to; s=fm1; t=
 1779346697; x=1779350297; bh=8KKk4OstiZD1mRxwYz1AQFEeysiHg2heUSn
 DHuC1LuA=; b=YROikU3pH27BEfuvHGZWQcua54t9lJ+0ejva5hp6j3rpacbrOQI
 nUBY/MPr3GbWB1K4lUR4AFfKWtFiIUdpGecqqlewxQYG64VkBCntq58AZZFLEUzO
 /w1DuKhKi+xrhk3uBPCdAmLgZg2n4Y48eIVP5jFYCdFsIoNNAxTfHZ8TOYRX5GyB
 f7Z9USQ/I0/0raYeM3KUGKG+aRhhUaImszwxif96kF0aX+qidt5Lpxs4LApdgpMz
 ONMcSVi+1/7bU79SiMIjntf/hadPbfX5kmsEt8a66UWzKQMbcsIUYuTPAPar4bF1
 L9rk1V5xDAyKKgF20U9dGlIB5C4i81fBC1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1779346697; x=1779350297; bh=8KKk4OstiZD1mRxwYz1AQFEeysiHg2heUSn
 DHuC1LuA=; b=RBbvRLu2WNa2/BZb3XIg0Xtgigv5l84bG9GyQXthmqcGeI7bsQC
 tjz2nIiq/7T3sMK8uHqonOAE4ONuPPh3RZHahHSqfN2iMLrIp4ryhnnMKBHnYnkr
 MpF86arRkC6VRGbRe/HyBw8FYiD2bordRtehGJtSk1vA2fsMzNCdqa0Y82BxFzF8
 /gQuoV4zqzT+hk0hz2OW2O52T1UAeMUB/zQ7ENb94y2Fs8VHfHo+Qiw6n0obYmAi
 IeWC6gsCCZbEOuKBWMmrLRXMfPqrZbWqBpfvVhiLOwnNN4ykANWnAXJlRc0EaQpa
 +M1+a1NJsNurAA8SVr7kN1FNxGiwfUnYDLw==
X-ME-Sender: <xms:CK0OagdBpGDenSU-jKcodHXLgtGPJJN8Sq41vTflZTcOS52lymH12Q>
 <xme:CK0OauP3h52P7pf6vc2hdDLqsyh6kdqc1ujUSsAeWi_xvsJ7JsNyIJaJk7UvmmbbR
 sM5cJs5NokMdwkjc1A4zpJ2HF2D0l4XVWqVIPac-NQhX5h20FdMNiU>
X-ME-Received: <xmr:CK0OajvOoR25JvWNTt0eOXHu1msEhGP5YE43GwXkFgqS81mYdNzGp2o2R2YXXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeeikeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefgughurghrughoucggrghstghonhgtvghlohhsuceovgguuhgrrhgu
 ohesvgguuhgrrhguohhvrghstghonhgtvghlohhsrdgtohhmqeenucggtffrrghtthgvrh
 hnpedutdeuffehveeguddugeefffejveevueeggeejuedvleehgfekueejgffghfffueen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvughurg
 hrughosegvughurghrughovhgrshgtohhntggvlhhoshdrtghomhdpnhgspghrtghpthht
 ohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhohhhnrdhjohhhrghnsh
 gvnhestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehprghulhesphgruhhlqdhm
 ohhorhgvrdgtohhmpdhrtghpthhtohepjhhmohhrrhhishesnhgrmhgvihdrohhrghdprh
 gtphhtthhopehsvghrghgvsehhrghllhihnhdrtghomhdprhgtphhtthhopegvughurghr
 ughosegvughurghrughovhgrshgtohhntggvlhhoshdrtghomhdprhgtphhtthhopegrph
 hprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhmpdhrtghpthhtoheplhhinhhu
 gidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:CK0OanCxRXjwszm_Kx9GvCOVbVkRijYM8eD3-aC8l2nE9j-r9C757g>
 <xmx:CK0OaqYBdQ3n_v-A_iqtmW-9HH3QInlbE8Q3-Cq3pcwBKD89ujLiYw>
 <xmx:CK0OaiWN4WBhgzfSpM6dFN3FZFSN4zZ8RSD-qM3bZ_X7bSjqWP24IA>
 <xmx:CK0OapOGdJoQO0dRAdkaV7mOmcxDfTebHjcaqt6Ap_9Sq9ap8-Iwgg>
 <xmx:Ca0OajhlSpA3-u7jJ0hAKqBf8IPj2Sqon8iZ6G36UikUEtnVr5xYCusj>
Feedback-ID: iac1e4b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 May 2026 02:58:13 -0400 (EDT)
From: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
Date: Thu, 21 May 2026 03:57:24 -0300
Message-ID: <20260521065731.6888-1-eduardo@eduardovasconcelos.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.138;
 envelope-from=eduardo@eduardovasconcelos.com;
 helo=flow-a3-smtp.messagingengine.com
X-Mailman-Approved-At: Thu, 21 May 2026 11:36:39 +0000
Subject: [apparmor] [PATCH] apparmor: Fix inverted comparison in
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
X-Spamd-Result: default: False [0.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[eduardovasconcelos.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:eduardo@eduardovasconcelos.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[eduardo@eduardovasconcelos.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eduardo@eduardovasconcelos.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[eduardovasconcelos.com:mid,eduardovasconcelos.com:email]
X-Rspamd-Queue-Id: D210D5A41AD
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

Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
---
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


