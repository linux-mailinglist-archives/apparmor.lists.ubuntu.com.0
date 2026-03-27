Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLkJOxdxxmmkJwUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 12:59:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 95923343E3A
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 12:59:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w65qF-0001gX-RK; Fri, 27 Mar 2026 11:59:07 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <daniel@quora.org>) id 1w65qD-0001g2-Ci
 for apparmor@lists.ubuntu.com; Fri, 27 Mar 2026 11:59:05 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2aecc6b0861so12825975ad.2
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quora.org; s=google; t=1774612744; x=1775217544; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hug4SpL7ksBzJoom/vOpWbZH8sETbbkswMlMAN0QIos=;
 b=XvP7tYaqD2mJaatnrZcJistUSXpUe9gwlhtlq0qaDs8UFj4Ltk7dh1tzqQ4Vvv4zRM
 8fAFCDxmvvpuvU9ubWJ40CtvYhTyIVSizvt/wOgNhKMrHeOnSBOK5ez5gNzCcnvLzhn2
 EfbBBrgnybDBl8eGNyqiZ6GN1Jeex1GOczsaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774612744; x=1775217544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hug4SpL7ksBzJoom/vOpWbZH8sETbbkswMlMAN0QIos=;
 b=Puidib+lZmWVH/PopAPmothQ/ioC5Sje/82EZ7xE76E4l9/hqLr+xkJ39vZbdukYmh
 8/00IBVTJC/nBO42s+KquppYg42zgve+7rYLFSaFg1e8PW+tK5z8SWd2U0LBCF1omzE0
 C6jJmM6RNsgG73e0axoIKH0hLelvSiPKkvgpFlwTIqQyNaju6e+8aqoQnONiBsQ21qf3
 jceaoJKikj336Z7uu6BGFnFoJENifc1ZYwOrvwqfNC+A9fpdVrFqORyp8nRaxzs0Mbg3
 qcLsb/URlDUQyX/KM92uxjvtawJhRpqVfgCav5y6B77aS0GnxoWQQUUcUisZlOExY715
 7M9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1V9FybypZh0STNY2L3RVSneSwgptmdyQrwt0VxrZiwwNbu/jZVVaS8iss/j111WCzggk9HeK9GA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwTMWNhlVofwPZSfeYqiEwC1AkhHBGGmK/EWjxky3F1UWv/GMPw
 I7+jxmb6fF4MVcsD/usco5L5xeo4n91k4U1M7jPAWpsfxkEdPSHQJJ7HYNTnqVi+OeI=
X-Gm-Gg: ATEYQzwUUqUfoeFd/aAgC9qh9RKpLqD2kB48C++6kXy8vCg2Mt5eZMmJnAn8h7ADHY1
 ckwgYp5HaETVBByyqNoA9qrriUH9LfaFq9Vb6D2lIP3s4Mou+2A/WeduJ6blbH5tu4Rr+pY+a45
 bdAy39SvpEW1fw9pb8aa2nOdxTFlx50jMjhkGe1uwfYCqdt7300kCaaI6hShidzIAkMy4m6CPwc
 wqKjp3RcJgZ0PPk+ii2w8fheyVWj5ZCQVmTBHGK1f9aZECL65fCvSrwLY4DOATTHytgVy9aIt/8
 X8pZZvqm2zsKqXCVcVI0ikvQmu3NO64OkEZx7VM+gZizrQ3p62ENg2FnCVjCvtCilsxj8Kp0KsF
 pXdKMLFRnoF7m9kf+il+GCI1N6cLcGokCVcW6wLWp9d7rayKw6TR8m2pFtfVjv2nMMxf/+0Bn7X
 Wd0XSP5aZ6+vQKrLOYcs/YM5bWyGByaqFWLrD+1KHBkpFf+5GxY4cNxiZCpTgCYYiWLqclVZzpw
 aXCjVPFNC491cRz7712JRChwuE0SXgD/u0et9IBCSWZGBHWwH92ph9RlIAvh8BAehvbQHlXHs/o
 vmaFiMNoagnFfG9tivteY9r6Zj0bhhy794eVZ1T+IkNZAXjCKW5a4ClKM0eJTVpM
X-Received: by 2002:a17:903:8c8:b0:2b0:6945:7dab with SMTP id
 d9443c01a7336-2b0cdd224a1mr25925275ad.46.1774612743743; 
 Fri, 27 Mar 2026 04:59:03 -0700 (PDT)
Received: from aegis ([2001:fd8:4d01:cc02:98a4:1c09:c7c4:e19a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc87e820sm58443435ad.50.2026.03.27.04.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:59:03 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Thorsten Blum <thorsten.blum@linux.dev>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Fri, 27 Mar 2026 19:58:32 +0800
Message-ID: <20260327115833.7572-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.176; envelope-from=daniel@quora.org;
 helo=mail-pl1-f176.google.com
Subject: [apparmor] [PATCH RESEND] apparmor: Fix string overrun due to
	missing termination
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:thorsten.blum@linux.dev,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
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
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Queue-Id: 95923343E3A
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

Cc: stable@vger.kernel.org
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


