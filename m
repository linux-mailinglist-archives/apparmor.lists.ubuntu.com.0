Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJutAtMO6mn4sgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:21:39 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48B451E58
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFt3a-0003OT-Tx; Thu, 23 Apr 2026 12:21:22 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gongruiqi1@huawei.com>)
 id 1wFkEr-0006gO-Nh
 for apparmor@lists.ubuntu.com; Thu, 23 Apr 2026 02:56:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=cI9EPb4U3rIy4OPkKYa2Khl98cSKaAlG52wx2V3maNo=;
 b=b59gjuSnw3qXHrJD0ddTyZp9qxJ4U5G+qvsWphgK1DqsCqxIxHFuzHQWCGMONsPV437r7R+Tw
 eqp/pVfALebDc/Ex2B413mcOCSOehPJXZZE2L3L0ipebc2MnnvX52yNbp9ul0k3jlPoMVq+QeJB
 lHtAT09iPASjBnBsZ/R7y4k=
Received: from mail.maildlp.com (unknown [172.19.162.92])
 by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4g1LD60kcbzLlSv;
 Thu, 23 Apr 2026 10:49:58 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 6636E40562;
 Thu, 23 Apr 2026 10:56:20 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Apr
 2026 10:56:19 +0800
From: GONG Ruiqi <gongruiqi1@huawei.com>
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn"
 <serge@hallyn.com>, Georgia Garcia <georgia.garcia@canonical.com>
Date: Thu, 23 Apr 2026 11:10:56 +0800
Message-ID: <20260423031056.563527-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk100018.china.huawei.com (7.202.194.66)
Received-SPF: pass client-ip=113.46.200.222;
 envelope-from=gongruiqi1@huawei.com; helo=canpmsgout07.his.huawei.com
X-Mailman-Approved-At: Thu, 23 Apr 2026 12:21:20 +0000
Subject: [apparmor] [PATCH] apparmor/lsm: Fix aa_dfa_unpack's error handling
	in aa_setup_dfa_engine
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
Cc: zhaoyipeng5@huawei.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com,
 linux-security-module@vger.kernel.org, gongruiqi1@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:georgia.garcia@canonical.com,m:zhaoyipeng5@huawei.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,m:linux-security-module@vger.kernel.org,m:gongruiqi1@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: EE48B451E58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

aa_dfa_unpack returns ERR_PTR not NULL when it fails, but aa_put_dfa
only checks NULL for its input, which would cause invalid memory access
in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.

Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
---
 security/apparmor/lsm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..ead2f07982b6 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2465,6 +2465,7 @@ static int __init aa_setup_dfa_engine(void)
 			    TO_ACCEPT2_FLAG(YYTD_DATA32));
 	if (IS_ERR(nulldfa)) {
 		error = PTR_ERR(nulldfa);
+		nulldfa = NULL;
 		goto fail;
 	}
 	nullpdb->dfa = aa_get_dfa(nulldfa);
-- 
2.43.0


