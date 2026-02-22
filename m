Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPJhKWprm2m1zQMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 21:47:38 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 823311705CE
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 21:47:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuGMN-00037j-CL; Sun, 22 Feb 2026 20:47:23 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vuGMM-00037W-Bp
 for apparmor@lists.ubuntu.com; Sun, 22 Feb 2026 20:47:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771793241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mBVBsImbL6slcvq/bXMQF+c3KE7+jBmOhTTFhlYXES4=;
 b=RFeDAnE1BDzOShOlYu9gVb7MkFhI6CYiUipRBouuSikKLlBdIuxuem8IQxQYlE5kT7fIkj
 IVLhHIAItba5CB5dGypdhLWnP6393A0KsQJw8Fzx5KptEAv3LEbHvcAfYKxoZcsW31wNml
 xwO8jdpiGkUQdQduyh7StYT7kXKW8Hw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Sun, 22 Feb 2026 21:46:44 +0100
Message-ID: <20260222204645.285727-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.189;
 envelope-from=thorsten.blum@linux.dev; helo=out-189.mta1.migadu.com
Subject: [apparmor] [PATCH RESEND] apparmor: Replace memcpy + NUL
	termination with kmemdup_nul in do_setattr
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
 Thorsten Blum <thorsten.blum@linux.dev>, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:thorsten.blum@linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: 823311705CE
X-Rspamd-Action: no action

Use kmemdup_nul() to copy 'value' instead of using memcpy() followed by
a manual NUL termination.  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/lsm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..49aa6ad68838 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -858,12 +858,9 @@ static int do_setattr(u64 attr, void *value, size_t size)
 
 	/* AppArmor requires that the buffer must be null terminated atm */
 	if (args[size - 1] != '\0') {
-		/* null terminate */
-		largs = args = kmalloc(size + 1, GFP_KERNEL);
+		largs = args = kmemdup_nul(value, size, GFP_KERNEL);
 		if (!args)
 			return -ENOMEM;
-		memcpy(args, value, size);
-		args[size] = '\0';
 	}
 
 	error = -EINVAL;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


