Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JCCNKSj8mm3tAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 30 Apr 2026 02:34:44 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B392949BC40
	for <lists+apparmor@lfdr.de>; Thu, 30 Apr 2026 02:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wIEyu-0004cy-IT; Thu, 30 Apr 2026 00:10:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wIEys-0004bT-Ni
 for apparmor@lists.ubuntu.com; Thu, 30 Apr 2026 00:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5680761141;
 Thu, 30 Apr 2026 00:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D21FC19425;
 Thu, 30 Apr 2026 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777507435;
 bh=/R5+/PxtQNMd/Wp2NSDozPYyHupAuMJV+79tR525jzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kUz2TDf5Q/zBsZF/E+T2vY+kPl77uXpNTmk356QwMu1OWhCnKvYPPhfXZmbJloq0Y
 o8D0CJciLljPT5HUdDI3iQIiOJxiJC5nOTJai/2MTA3SH9aWkoO5CWKta5wIeGEpBZ
 JAZJrtXuyXfex7vjes+ZrBpRPM+qbHDAKVsQ1yxr1x+mHAmfzlpTks6aBXwaq8pPbP
 MHspX83R5RTNbYi8q43aVkjf8k1vldLsbk+aFRAnnZwFyZkC5KM6eqS/9CPzE8xFoR
 q+D2jeVZDwY0I8RJXfxFNIkXzgf5tGatkwepK39sb3/vJjasvQkJs4TPiz6YgIw5lm
 WwQBoG/9ckQtA==
From: Song Liu <song@kernel.org>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
Date: Wed, 29 Apr 2026 17:03:10 -0700
Message-ID: <20260430000315.918964-3-song@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260430000315.918964-1-song@kernel.org>
References: <20260430000315.918964-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: [apparmor] [PATCH v2 2/7] apparmor: Remove redundant MS_MGC_MSK
	stripping in apparmor_sb_mount
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: B392949BC40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_SPAM(0.00)[0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]

path_mount() already strips the magic number from flags before
calling security_sb_mount(), so this check in apparmor_sb_mount()
is a no-op. Remove it.

Code generated with the assistance of Claude, reviewed by human.

Signed-off-by: Song Liu <song@kernel.org>
---
 security/apparmor/lsm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3491e9f60194..4415bca5889c 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -705,10 +705,6 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
 	int error = 0;
 	bool needput;
 
-	/* Discard magic */
-	if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
-		flags &= ~MS_MGC_MSK;
-
 	flags &= ~AA_MS_IGNORE_MASK;
 
 	label = __begin_current_label_crit_section(&needput);
-- 
2.52.0


