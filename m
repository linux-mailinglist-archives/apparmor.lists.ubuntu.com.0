Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKw0LtiWu2nwlgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 07:25:28 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE762C6C02
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 07:25:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w36on-0000tU-Q2; Thu, 19 Mar 2026 06:25:17 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <daniel@quora.org>) id 1w36om-0000t9-72
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 06:25:16 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82a15b44c3cso386527b3a.0
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quora.org; s=google; t=1773901514; x=1774506314; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7i2hgB7wzWd0GpL7ZbSfJdBzEQ6VsuZDuvwguDkWp8I=;
 b=fKFqncOmEDlbDOuwC6zDhDMxeLGv1RsSIB3unYEkIg4O4pwCyuJ2FGOVkuMiVWgldf
 1X1DqSogae4awvbblo5Bf0BZ07P6OaTsmA9jbQvRwGY+9X23DK9APHynFpQWmMp6u78j
 WIw98c/nP4c7fsxU88mRsNmUabW2r3A7Nsyd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773901514; x=1774506314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7i2hgB7wzWd0GpL7ZbSfJdBzEQ6VsuZDuvwguDkWp8I=;
 b=jX+oXMWmYzzVC6Rj0r9zstHCtkrqrozZIIweJrdjQ07iruTA/jakcLtHkFHlk74nQt
 kOc4d7F3U1fClQ19lGQNKD/P85PH80VC4HtVQQokvJ/N0VHiZyRiPOmYkCSlkO88RzDv
 XKlhLUSZNpP2yddkbsn35SJ3n4cQ0Zqx7Nr/VDjOmdP4nQZ4I6UKBNVRt2TtDk5G9QTj
 HsbND6emSnj34e7D+78DhMh1L0zSigGuFwjsovZ/GcS59ccllBQwpRJqdaOtXTUwBnUe
 66qGpIWlC+Oh695qgczDsrqtwBu6RE/lUmLHBXzfufei6kYimW0Jv8kJiX1Ll8cJ4P62
 Oq9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEy6nzRT1uZORWmY+d4UBToUcfwT1uTmwz7WdRxYgiJRWro5FQIYBpDCwk+XF3k8lsBRcvRDE3Gw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwfZxvFQfs9zQLUCt1DOC1TlN/seTO7h0RaeoZ8gwQhMnHMDJmm
 EDpMvSQmNYU3bhjUXl/A1jL8cFVI1/H1+6opCzxcV0b1DHMLkLJSyD2ZLWnt1lGDM7o=
X-Gm-Gg: ATEYQzz6fVTIzFRv58r/zD4FjazNbeE3Nhb+2rXXwd3vEAT5USCKmPjTUjwaYTlMsp9
 r13GE4gfLplbmfFDHx6tpl+vaP/eIj/iEg2MJDYlajup4VInIS9daAEcjuFB1KliLleA19F/mht
 2zhjdKBOY3RX7mH9ok7M+9u2h1cGAqVAMCWcVQarphuWfgBSoehEd0kSB6ul2bndvtqsi6LIOU1
 Sst6rt38SIKP6QbClHmyzX6O8d6fUB1oIYVwuqFN8ut67fh8LiwzsFWu6Bd/9HozoZBjKZIkeK9
 xABOEJkxMQkMD4NR0N5/3Nk4lMWpr8Dc+wV+RacVXIWXPPeDInXZxeQ2gZqy4YLauIdn3EdGtlD
 PFOE0qLpe+DXjMza2oRU0SIWsDyeowoJim+2OiZmUzfLKis5zdqbPlgkrv1uhPyF7TH6sni499x
 NfJPXYmVVVf5YUPlasJ5CvcfF+eK21SLJes5ABvl6BcCG0YhBH0SAIhhwzcaq7OC43kEMoxBxK9
 zf7cK3yVyxYOX3STkoyXs3nQHnARCq1NCIvfQvulDu8Ti2pWsNLKOMpRBR7vKKCNeMPmBNOGJjz
 usyplsIn3oQjatG2xOhYv9ILZt/VYkIkG/2+7RM4R9U6mtIucH7ye2GfRJ9CjtZLDNcJoXQ6b2Z
 84VhTWhr0
X-Received: by 2002:a05:6a00:1793:b0:821:a7b6:10a3 with SMTP id
 d2e1a72fcca58-82a6aed86ebmr5705451b3a.34.1773901514187; 
 Wed, 18 Mar 2026 23:25:14 -0700 (PDT)
Received: from aegis.localdomain ([49.148.247.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6bbb2f34sm4862353b3a.30.2026.03.18.23.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 23:25:13 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Thu, 19 Mar 2026 14:24:32 +0800
Message-ID: <20260319062433.17648-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.170; envelope-from=daniel@quora.org;
 helo=mail-pf1-f170.google.com
Subject: [apparmor] [PATCH] apparmor: Fix string overrun due to missing
	termination
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
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-security-module@vger.kernel.org,
 Thorsten Blum <thorsten.blum@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[quora.org:s=google];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:thorsten.blum@linux.dev,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:email,quora.org:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.855];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Queue-Id: 7CE762C6C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When booting Ubuntu 26.04 with Linux 7.0-rc4 on an ARM64 Qualcomm
Snapdragon X1 we see a string buffer overrun:

BUG: KASAN: slab-out-of-bounds in aa_dfa_match (security/apparmor/match.c:535)
Read of size 1 at addr ffff0008901cc000 by task snap-update-ns/2120

CPU: 5 UID: 60578 PID: 2120 Comm: snap-update-ns Not tainted 7.0.0-rc4+ #22 PREEMPTLAZY
Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
Call trace:
show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
dump_stack_lvl (lib/dump_stack.c:122)
print_report (mm/kasan/report.c:379 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:597)
__asan_report_load1_noabort (mm/kasan/report_generic.c:378)
aa_dfa_match (security/apparmor/match.c:535)
match_mnt_path_str (security/apparmor/mount.c:244 security/apparmor/mount.c:336)
match_mnt (security/apparmor/mount.c:371)
aa_bind_mount (security/apparmor/mount.c:447 (discriminator 4))
apparmor_sb_mount (security/apparmor/lsm.c:719 (discriminator 1))
security_sb_mount (security/security.c:1062 (discriminator 31))
path_mount (fs/namespace.c:4101)
__arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361 fs/namespace.c:4338 fs/namespace.c:4338)
invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35 arch/arm64/kernel/syscall.c:49)
el0_svc_common.constprop.0 (./include/linux/thread_info.h:142 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
do_el0_svc (arch/arm64/kernel/syscall.c:152)
el0_svc (arch/arm64/kernel/entry-common.c:80 arch/arm64/kernel/entry-common.c:725)
el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:744)
el0t_64_sync (arch/arm64/kernel/entry.S:596)

Allocated by task 2120:
kasan_save_stack (mm/kasan/common.c:58)
kasan_save_track (./arch/arm64/include/asm/current.h:19 mm/kasan/common.c:70 mm/kasan/common.c:79)
kasan_save_alloc_info (mm/kasan/generic.c:571)
__kasan_kmalloc (mm/kasan/common.c:419)
__kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5260 mm/slub.c:5272)
aa_get_buffer (security/apparmor/lsm.c:2201)
aa_bind_mount (security/apparmor/mount.c:442)
apparmor_sb_mount (security/apparmor/lsm.c:719 (discriminator 1))
security_sb_mount (security/security.c:1062 (discriminator 31))
path_mount (fs/namespace.c:4101)
__arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361 fs/namespace.c:4338 fs/namespace.c:4338)
invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35 arch/arm64/kernel/syscall.c:49)
el0_svc_common.constprop.0 (./include/linux/thread_info.h:142 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
do_el0_svc (arch/arm64/kernel/syscall.c:152)
el0_svc (arch/arm64/kernel/entry-common.c:80 arch/arm64/kernel/entry-common.c:725)
el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:744)
el0t_64_sync (arch/arm64/kernel/entry.S:596)

The buggy address belongs to the object at ffff0008901ca000
which belongs to the cache kmalloc-rnd-06-8k of size 8192
The buggy address is located 0 bytes to the right of
allocated 8192-byte region [ffff0008901ca000, ffff0008901cc000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x9101c8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:-1 pincount:0
flags: 0x8000000000000040(head|zone=2)
page_type: f5(slab)
raw: 8000000000000040 ffff000800016c40 fffffdffe2d14e10 ffff000800015c70
raw: 0000000000000000 0000000800010001 00000000f5000000 0000000000000000
head: 8000000000000040 ffff000800016c40 fffffdffe2d14e10 ffff000800015c70
head: 0000000000000000 0000000800010001 00000000f5000000 0000000000000000
head: 8000000000000003 fffffdffe2407201 fffffdffffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected

Memory state around the buggy address:
ffff0008901cbf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ffff0008901cbf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff0008901cc000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
^
ffff0008901cc080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff0008901cc100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

This was introduced by previous incorrect conversion from strcpy(). Fix it
by adding the missing terminator.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
Fixes: 93d4dbdc8da0 ("apparmor: Replace deprecated strcpy in d_namespace_path")
---
 security/apparmor/path.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/path.c b/security/apparmor/path.c
index 65a0ca5cc1bd..2494e8101538 100644
--- a/security/apparmor/path.c
+++ b/security/apparmor/path.c
@@ -164,14 +164,16 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
 	}
 
 out:
-	/* Append "/" to directory paths, except for root "/" which
-	 * already ends in a slash.
+	/* Append "/" to directory paths and reterminate string, except for
+	 * root "/" which already ends in a slash.
 	 */
 	if (!error && isdir) {
 		bool is_root = (*name)[0] == '/' && (*name)[1] == '\0';
 
-		if (!is_root)
+		if (!is_root) {
 			buf[aa_g_path_max - 2] = '/';
+			buf[aa_g_path_max - 1] = '\0';
+		}
 	}
 
 	return error;
-- 
2.53.0


