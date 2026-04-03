Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIJOIO5T1Wkf4wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 20:58:54 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 733243B31C5
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 20:58:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wABG8-0004G9-KH; Tue, 07 Apr 2026 18:34:44 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gongruiqi1@huawei.com>)
 id 1w8VLF-0002c1-KV
 for apparmor@lists.ubuntu.com; Fri, 03 Apr 2026 03:37:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=wOVp4eov60EWNuICi4DIGcfBecJjzeAODZJh0cY7OCs=;
 b=tRwCfA7F0raCaUeV8sh/y1pn1hw7S1ldQTQzrFLq9WAaZ4kcuXOx+3v8qiCRJpLtVhYp//vUW
 0vT9AesSPAzXvvffSUVyBr3Hf6X+FmIaW+K5b8mDx5kkvoEYJG/IbYobwO6cqpVFI3/I8DUMhra
 2rrmIbdzo/SZX0qDmqUEvCo=
Received: from mail.maildlp.com (unknown [172.19.163.200])
 by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fn44T4mVWzKmVj;
 Fri,  3 Apr 2026 11:30:49 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 634FB4056C;
 Fri,  3 Apr 2026 11:37:02 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 3 Apr
 2026 11:37:01 +0800
From: GONG Ruiqi <gongruiqi1@huawei.com>
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn"
 <serge@hallyn.com>
Date: Fri, 3 Apr 2026 11:51:19 +0800
Message-ID: <20260403035119.2132418-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100018.china.huawei.com (7.202.194.66)
Received-SPF: pass client-ip=113.46.200.226;
 envelope-from=gongruiqi1@huawei.com; helo=canpmsgout11.his.huawei.com
X-Mailman-Approved-At: Tue, 07 Apr 2026 18:34:42 +0000
Subject: [apparmor] [PATCH] apparmor: Fix two bugs of aa_setup_dfa_engine's
	fail handling
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
 linux-kernel@vger.kernel.org, lujialin4@huawei.com, gongruiqi1@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.89 / 15.00];
	DATE_IN_PAST(1.00)[111];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,m:gongruiqi1@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,huawei.com:dkim,huawei.com:email,huawei.com:mid];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 733243B31C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

First, aa_dfa_unpack returns ERR_PTR not NULL when it fails, but
aa_put_dfa only checks NULL for its input, which would cause invalid
memory access in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.

Second, aa_put_pdb calls aa_pdb_free_kref -> aa_free_pdb -> aa_put_dfa,
i.e.  it will free nullpdb->dfa. But there's another aa_put_dfa(nulldfa)
after aa_put_pdb(nullpdb), which would cause double free. Remove that
redundant aa_put_dfa to fix that.

Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..be82ec1b9fd9 100644
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
@@ -2486,7 +2487,6 @@ static int __init aa_setup_dfa_engine(void)
 
 fail:
 	aa_put_pdb(nullpdb);
-	aa_put_dfa(nulldfa);
 	nullpdb = NULL;
 	nulldfa = NULL;
 	stacksplitdfa = NULL;
-- 
2.43.0


