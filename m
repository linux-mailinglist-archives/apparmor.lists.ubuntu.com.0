Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F123C577AFE
	for <lists+apparmor@lfdr.de>; Mon, 18 Jul 2022 08:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oDKH4-0006sG-IB; Mon, 18 Jul 2022 06:30:34 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yang.lee@linux.alibaba.com>) id 1oDKH0-0006s7-Fg
 for apparmor@lists.ubuntu.com; Mon, 18 Jul 2022 06:30:30 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VJe-3rM_1658125823; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VJe-3rM_1658125823) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 14:30:24 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: john.johansen@canonical.com
Date: Mon, 18 Jul 2022 14:30:22 +0800
Message-Id: <20220718063022.129998-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] apparmor: Fix some kernel-doc comments
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
Cc: paul@paul-moore.com, Abaci Robot <abaci@linux.alibaba.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Remove warnings found by running scripts/kernel-doc, which is caused by
using 'make W=1'.
security/apparmor/policy_ns.c:65: warning: Function parameter or member 'curr' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:65: warning: Function parameter or member 'view' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:65: warning: Function parameter or member 'subns' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:65: warning: expecting prototype for aa_na_name(). Prototype was for aa_ns_name() instead
security/apparmor/policy_ns.c:214: warning: Function parameter or member 'view' not described in '__aa_lookupn_ns'
security/apparmor/policy_ns.c:214: warning: Excess function parameter 'base' description in '__aa_lookupn_ns'
security/apparmor/policy_ns.c:297: warning: expecting prototype for aa_create_ns(). Prototype was for __aa_find_or_create_ns() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/apparmor/policy_ns.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
index 300953a02a24..0ef268d6554d 100644
--- a/security/apparmor/policy_ns.c
+++ b/security/apparmor/policy_ns.c
@@ -54,10 +54,10 @@ bool aa_ns_visible(struct aa_ns *curr, struct aa_ns *view, bool subns)
 }
 
 /**
- * aa_na_name - Find the ns name to display for @view from @curr
- * @curr - current namespace (NOT NULL)
- * @view - namespace attempting to view (NOT NULL)
- * @subns - are subns visible
+ * aa_ns_name - Find the ns name to display for @view from @curr
+ * @curr: current namespace (NOT NULL)
+ * @view: namespace attempting to view (NOT NULL)
+ * @subns: are subns visible
  *
  * Returns: name of @view visible from @curr
  */
@@ -200,7 +200,7 @@ struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name)
 
 /**
  * __aa_lookupn_ns - lookup the namespace matching @hname
- * @base: base list to start looking up profile name from  (NOT NULL)
+ * @view: namespace to search in  (NOT NULL)
  * @hname: hierarchical ns name  (NOT NULL)
  * @n: length of @hname
  *
@@ -285,7 +285,7 @@ static struct aa_ns *__aa_create_ns(struct aa_ns *parent, const char *name,
 }
 
 /**
- * aa_create_ns - create an ns, fail if it already exists
+ * __aa_find_or_create_ns - create an ns, fail if it already exists
  * @parent: the parent of the namespace being created
  * @name: the name of the namespace
  * @dir: if not null the dir to put the ns entries in
-- 
2.20.1.7.g153144c


