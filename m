Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOiHCt1Mr2noTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 09 Mar 2026 23:42:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E47ED2424AD
	for <lists+apparmor@lfdr.de>; Mon, 09 Mar 2026 23:42:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzjIw-0004Uq-1x; Mon, 09 Mar 2026 22:42:26 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vzjIv-0004Ue-A9
 for apparmor@lists.ubuntu.com; Mon, 09 Mar 2026 22:42:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1773096143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IAPnfvwI82KtySwMtMOUp5GIZTs7KwYrmI4bhGYfZSk=;
 b=Muuy1vrixo8y5QksXCaOfruiWdUAxZA24ZTz586RjMAgE/aYQ2DeENfHqk6CJywQcaqy1y
 +dXS57MOVZ2D+nnu8996TtWlwObLKZZTqDCwiyg7zp4kus/CX3uDsAH3ssBeSS0n+UH1J4
 lUSIVT1vc5DiWCzmJBiZUDMIU28BPfg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Mon,  9 Mar 2026 23:41:51 +0100
Message-ID: <20260309224150.84575-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=thorsten.blum@linux.dev;
 h=from:subject; bh=RUhFIUpE3q+j/RzplHM7utqXljK9ejAG8G3w/29/YpI=;
 b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrfdbxOEyNqdm8JfnF5C+VSo2H8lIv/e+5HZgk0Lb4R
 gwzk4xHRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExE7RLDX8G9Gs19D2ecktmt
 cr/3lnDM83cnZuzKeBfSI5o1IUZsxSpGhmeBvfFXBJ9IaNzYLFRRLpD7fSnLg6UvlsctL5l64hX
 zaUYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp;
 fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.183;
 envelope-from=thorsten.blum@linux.dev; helo=out-183.mta0.migadu.com
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
X-Rspamd-Queue-Id: E47ED2424AD
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[hallyn.com:email,linux.dev:mid,linux.dev:email];
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
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Action: no action

Use kmemdup_nul() to copy 'value' instead of using memcpy() followed by
a manual NUL termination.  No functional changes.

Reviewed-by: Serge Hallyn <serge@hallyn.com>
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

