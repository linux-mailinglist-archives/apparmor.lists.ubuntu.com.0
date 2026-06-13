Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2+mGJf9K2p+JAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 12 Jun 2026 14:37:43 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 51660679624
	for <lists+apparmor@lfdr.de>; Fri, 12 Jun 2026 14:37:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=intel.com header.s=Intel header.b=SrFLgXye;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wY18S-0003Ov-L0; Fri, 12 Jun 2026 12:37:20 +0000
Received: from mgamail.intel.com ([198.175.65.20])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <junxiao.chang@intel.com>)
 id 1wXv61-0001Vy-JO
 for apparmor@lists.ubuntu.com; Fri, 12 Jun 2026 06:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781244625; x=1812780625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/pnmg4b6IbGgKPW95mtpYJMdXdq9qWFLslJWXAfkC98=;
 b=SrFLgXyeiwon19oQxob84G9yzHSMnPQIg75xMBgAhcOFH39zTf/EsprK
 2UKCltrovCvxVmAbcKC0A/WRxnD6kW2nM0BmIoHznGsbgHTyS/nrth6y1
 jZx3CJ7yuvm3n6fTTLpSvmktTz+mQVornWnM0P/x4CaVyvs851eVsIYIw
 oaWBCyeGiUuFPHrGcmwrQrlX1TW6NrPNHOhZhJ44oFtQzZD7xIzH01l4B
 GagUPDWjfTrmS3rUVU2R/IX5vWfR6vw+Mx79rkXOCxzD3TXAPWYShUj/V
 yOf/MfNwhxICZdgwwtX4nYeVZxF3C92To2oVaTaXQk7sFYGRW3+oK1Nxa Q==;
X-CSE-ConnectionGUID: AMtkPC+YSxSb+Wt+8SEZ/Q==
X-CSE-MsgGUID: zhC+2YI5SwaTGv2BSg+GUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81813402"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81813402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:10:18 -0700
X-CSE-ConnectionGUID: WKbNtLBQQ/2A+My/OUI1Mw==
X-CSE-MsgGUID: xT8M6QAgS+amg3Sgb4sgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="245633328"
Received: from junxiao.bj.intel.com ([10.238.152.69])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:10:15 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 13 Jun 2026 14:04:24 +0800
Message-ID: <20260613060424.2213712-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.175.65.20;
 envelope-from=junxiao.chang@intel.com; helo=mgamail.intel.com
X-Mailman-Approved-At: Fri, 12 Jun 2026 12:37:20 +0000
Subject: [apparmor] [PATCH] apparmor: fix use-after-free in policy
	replacement path
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
Cc: junxiao.chang@intel.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [9.49 / 15.00];
	DATE_IN_FUTURE(4.00)[17];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:junxiao.chang@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[junxiao.chang@intel.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_smtp,intel.com:email,intel.com:mid,intel.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[junxiao.chang@intel.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51660679624
X-Spam: Yes

A use-after-free issue can be triggered when running the
following stress-ng workload:

```
sudo stress-ng --apparmor 0 --timeout 30 \
    --oom-avoid-bytes 10% --skip-silent --verbose
```

The warning looks like:

```
refcount_t: addition on 0; use-after-free
aa_replace_profiles+0xbe5/0x12a0
policy_update+0xdb/0x170
profile_replace+0x4b/0xb0
```

The issue can be reproduced on both v7.1-rc7 and Ubuntu
6.17.0-35-generic kernels.

aa_get_profile_loaddata() requires the supplied loaddata object
to hold a valid reference. However, the loaddata reference count
may already have reached zero in the replacement loop, resulting
in a use-after-free condition.

Avoid calling aa_get_profile_loaddata() on loaddata objects with
a zero reference count and skip those entries instead.

Fixes: a0b7091c4de4 ("apparmor: fix race on rawdata dereference")
Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 security/apparmor/policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index b6a5eb4021dbd..98f84d4552697 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -1220,7 +1220,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 	/* check for duplicate rawdata blobs: space and file dedup */
 	if (!list_empty(&ns->rawdata_list)) {
 		list_for_each_entry(rawdata_ent, &ns->rawdata_list, list) {
-			if (aa_rawdata_eq(rawdata_ent, udata)) {
+			if (kref_read(&rawdata_ent->pcount) && aa_rawdata_eq(rawdata_ent, udata)) {
 				struct aa_loaddata *tmp;
 
 				tmp = aa_get_profile_loaddata(rawdata_ent);
-- 
2.43.0


