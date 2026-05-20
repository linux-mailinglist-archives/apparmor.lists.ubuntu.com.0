Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBpHGNaADWrUyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:26 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115958AE52
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wPdMU-0007bB-Bj; Wed, 20 May 2026 09:37:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <rppt@kernel.org>) id 1wPcHU-0006Do-Cn
 for apparmor@lists.ubuntu.com; Wed, 20 May 2026 08:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F015643BF8;
 Wed, 20 May 2026 08:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3794C1F000E9;
 Wed, 20 May 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779265154;
 bh=tJOszf5ccvQ8Uj34Ns+l0JyEoj1luDQ1JSgscLEUjH8=;
 h=From:Subject:Date:To:Cc;
 b=oqb6SkS5YytIpVTUQsjo2xHQ4SS571cAqH37sjtk3n5/2i0pUW5fADVVxvUdkIAgo
 Ei/YzX4Stje++RmND/Sxw+GgF8GkC2YAKmsKtBKgIidtQ3Lnh/GOV8qbAUxWGtMSXM
 lArDAXrc0inMaKNgo1ea/d6dZqCLBG03ZFePlkMmRKxUhrbFQqPPJeix9ku4CUhHB0
 Sb1SCaw6Q9oKG7uzDNy2Bu9C/uFTiFz7SA1od/3QLL1sWK+kuQhsseNWJtZvEY8AeV
 VAb9otpjpJ9Mf2ht2E7QfZB0sMJDWaA2FxwHg9a7aiS1369hhwS97doRMt9y3pWb2V
 arJKoZ/lAdSrA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 20 May 2026 11:18:54 +0300
Message-Id: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5uDWoC/yWM0QrCMAxFf2Xk2WJXtKK/Into0ugiUiXZRBn7d
 1t9PJdz7gLGKmxw6hZQfonJo1ToNx3QmMqVneTKEHyIfh+8M6ZZZfq4SDlHn9OhD0eo+lP5Iu/
 f1Xn4s814Y5pa3wxMxg41FRrbhLvtXRDW9QtMxMJyhQAAAA==
X-Change-ID: 20260520-security-6cdd60da7129
To: James Morris <jmorris@namei.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=rppt@kernel.org;
 h=from:subject:message-id; bh=8sDsVcUg45SCDAbOd4Qy+nlWe7vZVoKzJPYWNem4zG4=;
 b=owEBbQGS/pANAwAKATkDhibLDv2RAcsmYgBqDW5yZa7B7j3ohKSc2JgmRG/bo7d/2fltrRWB+
 SeIMUzfGumJATMEAAEKAB0WIQR45VhVpZkvn3TRr+k5A4Ymyw79kQUCag1ucgAKCRA5A4Ymyw79
 kfc/B/4uBqwgyaoh4EWczWSCvk4YvrDw+P5GIcZkmNuCZQCZgn2Hx05kpDcm+rYUwU39QhN7JvA
 tgMGPGR88/BwX8R27raP67u6j1ETp4W+lZ1idGU+icFaOpOgkAUJhNMnoaD/AYaSMcNJIZk5CIr
 dg5H160CUyvtcCaHO7sCSGKOxTBqqG1Qb8w0Dw+ZWEDuplwxznqiP/VegbHSKV8nw60H6hitxX/
 +WYSMij90yhsivt8xYrlLro5YpMLv+Emy4CxwBnYAAtGzmsSjY2kRashqG5odUQ+sRifrYPPbgs
 qiubvcrUP21lk5w02frOGk4LnKpN/uDysCVOPUN4MSQ1pdt1
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
Received-SPF: pass client-ip=172.234.252.31; envelope-from=rppt@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Wed, 20 May 2026 09:37:07 +0000
Subject: [apparmor] [PATCH 0/3] security: replace __get_free_pages() call
 with kmalloc()
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
X-Rspamd-Queue-Id: 4115958AE52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a (tiny) part of larger work of replacing page allocator calls
with kmalloc:

Also in git:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/security

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
Mike Rapoport (Microsoft) (3):
      selinux: use k[mz]alloc() to allocate temporary buffers
      selinux: hooks: use __getname() to allocate path buffer
      apparmor: replace get_zeroed_page() with kzalloc()

 security/apparmor/apparmorfs.c |  5 +++--
 security/selinux/hooks.c       |  4 ++--
 security/selinux/selinuxfs.c   | 12 ++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260520-security-6cdd60da7129

Best regards,
--  
Sincerely yours,
Mike.


