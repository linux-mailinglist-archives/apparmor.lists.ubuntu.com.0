Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEdoINKADWrUyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:22 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FBB58AE44
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wPdMT-0007at-W2; Wed, 20 May 2026 09:37:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <rppt@kernel.org>) id 1wPcGf-0005a5-Jq
 for apparmor@lists.ubuntu.com; Wed, 20 May 2026 08:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 69B406012B;
 Wed, 20 May 2026 08:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBAD1F000E9;
 Wed, 20 May 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779265161;
 bh=zQRjpjIyAer953PPORKHqLJlFZ+L04n/ATscYla4KeM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Fcgnwf+NkTvhc7Mit+rAGitTzJZDlSEN/uHXD+gkXTB4npyMOpLlukZugq5ohxYtX
 lp6Azi92eVPhKV2Of6k/TAuTwG5evXZE5iWXANKE368n2gb20O7Yk1D8poK4bptGLN
 gKe8i674mGmddBOIeCjCdBQZB++cVpQ3pABKGDDtYv1sDVGuBJybOROagMRccDcSYN
 IOJ+03oCmUzYmIeuCTV917LSALVXG/MOjKC37dj+ruYComBK3Zm/MddcvAxEHycf0d
 5NeR4M53U0lDs0Dt7niUyxN8BHwvrWRr2eCyzFovqPzYoGX+jRtPZSSK5eflbyRre6
 JMGR0/leTjL/g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 20 May 2026 11:18:56 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-security-v1-2-831bd8e21dd0@kernel.org>
References: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
To: James Morris <jmorris@namei.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=rppt@kernel.org;
 h=from:subject:message-id; bh=F5N75Y8mUQYU1TgbgAwnzxz6xj0Y0zUFBQbr3qsftFc=;
 b=owEBbQGS/pANAwAKATkDhibLDv2RAcsmYgBqDW55/xeAuypW72Duwu823AN1y512GZtlik/jj
 f9D/szH8CKJATMEAAEKAB0WIQR45VhVpZkvn3TRr+k5A4Ymyw79kQUCag1ueQAKCRA5A4Ymyw79
 kZuWB/43kQ89qeDN/5ULkrNOC7BisGyehYajp/+I5dGOiekEQFVDn0eaXHd2QTlf2f+hnv9BbpS
 fupeiqIj/Ou0trjtruRc0roPfmTRWNl9OxfhUuaSxc9GbFpfOSSmDFlvcmAvuVfqHGwLIFMFssG
 8mm454MTwB23N3EFSGJSY2MNo4gGywEW6qmCrvBydmM27UydkD17stPOyxleOIbhjcFw9EU+Tbb
 +ElbtkFJ9OCCiKpoaEQ2mt0A6m1jr7ibLlu4TaUUYxaBcV2k/0oDtw0F6cQCRfH5oKGirJnU7/p
 mu1k/3MeSbO7pTCcTcyGil3l1Jnug1PwZNhjPyZbODCzEwv3
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
Received-SPF: pass client-ip=172.105.4.254; envelope-from=rppt@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Wed, 20 May 2026 09:37:07 +0000
Subject: [apparmor] [PATCH 2/3] selinux: hooks: use __getname() to allocate
 path buffer
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
Cc: selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[namei.org,canonical.com,redhat.com,paul-moore.com,hallyn.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jmorris@namei.org,m:john.johansen@canonical.com,m:omosnace@redhat.com,m:paul@paul-moore.com,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-security-module@vger.kernel.org,m:rppt@kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 75FBB58AE44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

selinux_genfs_get_sid() allocates memory for a path with __get_free_page()
although there is a dedicated helper for allocation of file paths:
__getname().

Replace __get_free_page() for allocation of a path buffer with __getname().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 security/selinux/hooks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0f704380a8c8..05b84b3781e0 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1336,7 +1336,7 @@ static int selinux_genfs_get_sid(struct dentry *dentry,
 	struct super_block *sb = dentry->d_sb;
 	char *buffer, *path;
 
-	buffer = (char *)__get_free_page(GFP_KERNEL);
+	buffer = __getname();
 	if (!buffer)
 		return -ENOMEM;
 
@@ -1361,7 +1361,7 @@ static int selinux_genfs_get_sid(struct dentry *dentry,
 			rc = 0;
 		}
 	}
-	free_page((unsigned long)buffer);
+	__putname(buffer);
 	return rc;
 }
 

-- 
2.53.0


