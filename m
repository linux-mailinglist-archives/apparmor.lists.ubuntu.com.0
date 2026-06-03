Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xZ0TAMeRIGqw5AAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 22:42:47 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 803C363B299
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 22:42:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=linux-foundation.org header.s=korg header.b=XWgIp57G;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=none
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wUsPy-0007jA-E5; Wed, 03 Jun 2026 20:42:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <akpm@linux-foundation.org>) id 1wUsPv-0007he-Kh
 for apparmor@lists.ubuntu.com; Wed, 03 Jun 2026 20:42:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 470606008A;
 Wed,  3 Jun 2026 20:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03761F00893;
 Wed,  3 Jun 2026 20:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=korg; t=1780518847;
 bh=xtTSzgRwJ7MBU7J/igkfjEFnQoQONrvwyluGo/CeVbU=;
 h=Date:To:From:Subject;
 b=XWgIp57GgkoIFjSvXp6OX+6gsDGqnpRfl9JYMKW0P4+IrNvhwAEloiUz8B58uyqCs
 vONlPw05zmVoiC/R09yWHTd6ThKdxOpCkZWw2SMt79DOeEoRByRGKpTkeyEegRlD0w
 iY7YdOpGkGWZVXOlLbJO5Ge9qTrb9CYpWxQURYrE=
Date: Wed, 03 Jun 2026 13:34:06 -0700
To: serge@hallyn.com, paul@paul-moore.com, john.johansen@canonical.com,
 jmorris@namei.org, akpm@linux-foundation.org, apparmor@lists.ubuntu.com,
 akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <20260603203406.E03761F00893@smtp.kernel.org>
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=akpm@linux-foundation.org; helo=tor.source.kernel.org
Subject: [apparmor] [patch 1/1] security/apparmor/apparmorfs.c:
	conditionally compile get_loaddata_common_ref()
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp];
	R_DKIM_REJECT(1.00)[linux-foundation.org:s=korg];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:serge@hallyn.com,m:paul@paul-moore.com,m:john.johansen@canonical.com,m:jmorris@namei.org,m:akpm@linux-foundation.org,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,hallyn.com:email,namei.org:email,linux-foundation.org:from_mime,linux-foundation.org:email];
	DKIM_TRACE(0.00)[linux-foundation.org:-];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,apparmor-bounces@lists.ubuntu.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 803C363B299

From: Andrew Morton <akpm@linux-foundation.org>
Subject: security/apparmor/apparmorfs.c: conditionally compile get_loaddata_common_ref()
Date: Wed Jun  3 01:30:46 PM PDT 2026

Some config did this:

security/apparmor/apparmorfs.c:177:28: warning: 'get_loaddata_common_ref' defined but not used [-Wunused-function]
  177 | static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)

get_loaddata_common_ref() is only used if
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y.

(Or of course move the function into that block if maintainers perfer)

Cc: John Johansen <john.johansen@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 security/apparmor/apparmorfs.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/security/apparmor/apparmorfs.c~security-apparmor-apparmorfsc-conditionally-compile-get_loaddata_common_ref
+++ a/security/apparmor/apparmorfs.c
@@ -174,6 +174,7 @@ static struct aa_proxy *get_proxy_common
 	return NULL;
 }
 
+#ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
 static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
 {
 	if (ref)
@@ -181,6 +182,7 @@ static struct aa_loaddata *get_loaddata_
 						      count));
 	return NULL;
 }
+#endif
 
 static void aa_put_common_ref(struct aa_common_ref *ref)
 {
_

