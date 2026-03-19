Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA+wCPxCu2mxhwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 01:27:40 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04B2C4196
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 01:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w31EY-0008ST-A2; Thu, 19 Mar 2026 00:27:30 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <daniel@quora.org>) id 1w31EW-0008SL-SJ
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 00:27:29 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ab232cc803so1428785ad.3
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 17:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773880047; cv=none;
 d=google.com; s=arc-20240605;
 b=fYcGJmsZYdvnKLnp1nDoSEf4EwSMt9KX1RErIFwJJsq+r52Kapj5M770AAyOjkNmzO
 4D7DeJqXx6BqXC4J6lLag1MJaQHpqNGR3ArDLNVe5O8cnV9MxnmwTTic4j07LfLox13n
 cyGAG1euV8py148TqHzckaJluhlP4y9OsyLm05i8fLl8RJifdGIo2DKcZw75AH+wNX6Z
 rIu7ia9uyodF6pkr3cmdx3npe66B3frVCy7fng6JPL1zRcQXWZIx3190Lk92M6qIf4/I
 yvqPLjhn7yW3PDPYfasfOLHDHeZ4blRaKiZRVUzYwdzluPQ3jrmZthNsJTgUIU5YZi26
 n0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=3bonJyRVvPe4SpXARABZBeXsyQcGj7StzlexevkATlg=;
 fh=IoVb6jRH0oofL3ZGQGeoEN60q5/EzafLlypDjiDAFDM=;
 b=amBAPNj9NDZ8w1P9Y94hXjIBcSbku/wJCFGWnfTUB38EHtH8DShN0hSxTQRUXnFAKI
 jhZbeSXU/S911dyEC5AzdmewMzf1tn7SQIkVLO19P4Rr4G8sHpyNkGmI/UHCG+YkVQfs
 xzYcy3Avq4S0NB57zgyc3OtgCTuRE4q1mx6DNnHt8WvmLK9o2whUi7VvY4gRNu5Qxthw
 Q/XSCyIM9cacyL/QUg1nN5b2bRGkcHLStPna6+e1aWR4CWLXBRx01UimITgaofwgs0gC
 i0JCZlJaj4Hq2cu7xeaQtIIIqDrFRB1ZFXujA5si7Tb93eX5HfIZKTzAtSwcJhR26eME
 n/fQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quora.org; s=google; t=1773880047; x=1774484847; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3bonJyRVvPe4SpXARABZBeXsyQcGj7StzlexevkATlg=;
 b=OrJPkjV9+dj5IoyReB5qepX+/8w9arhLx1+0fo67SuBTtRVJ55MYDomVaFuK3V9VKJ
 bIyHyd8v0xgwnkIvG0QsQpywEGa+LMr1JZ8ket14xfFWSxhl3ztSVuVMOug4Ozibn50x
 OIdpFa6HQQ5yWAczDGk4VSBu4n6TpbUsFQ+KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773880047; x=1774484847;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bonJyRVvPe4SpXARABZBeXsyQcGj7StzlexevkATlg=;
 b=JpoWKKDKlPq0cJ8vO5hHfiwbBxWFezw0pb39rW4eaFsKw5dFbNFaKtxuC/dA/hJFIw
 +z1bUmnoEh9ahloRMYTBYcco4LSLiwV6x+D0d+ud8m59scDZxI1qYTFJySIiR16S+kXO
 O/JvO739cXpkxWxliu0veHD4BmdlcnBFbHchuQwhXAjhTAcwNkWvKtLj7lQ8/EKElxUx
 M1MtncUq92823mlv21QsWKH+8Eb2TNuO2CbJFRFzjGUFZLhKLhBc0NnuitgJ05/vZ1oW
 2pQ/AfBo/jOiQOa3ur3ukTq4LL/XY8ySXcciQjldw7TrKafacfIUrmiJBc5sxX0L3g6k
 S0fQ==
X-Gm-Message-State: AOJu0YxDyQ0bTjv8daRdp1BEQLGa7Q0LregWB4OC+ER7Lnjd/8JP58Sj
 V8cRl3wrF5T81rhrJKDL+qXSVm6QDbYhwOuDDNDZwfr7HnomvDoVlLGI5bbBEWJoVhmE7L1lkdk
 Vhp59dfi5Wygq+rN36SSmqktCGqa6tEh2QwLXSrO0tzuBWgsmZTK9iStcnQ==
X-Gm-Gg: ATEYQzzF7nT0l7M7Gn4WDiz6oolRIpEsmbgpuTbpizwtRvq+A6Ua54UFAeQKOkAMJbF
 bQduBZfZpP2PGzskH1+bH1Bla+vBSKJZgMB9+W81WyNLUuA51sAmFKwwel4NhzgHCapqW4xHwUh
 Rf5YAqN6O1QZsARdHaWvaHwuJukWKP8cNNUrWbqafoUV0aKlS2e+8ycx08tJesU6SgE/wp5YyWK
 eowE79dy53ghp880JihmVcPHHLyUVzX4tY2Bhm4Z75VMMw+Jbn86vmv+5g62jMTPwfbhEJwA+E2
 itWT30598ZP8cyqodUESnxAnDPIvF/57mh6NPsl6BSkgUSPyY2JwSh/W6QviePuF7JSmzNZ3k9+
 /IMVYQyKfzVU5MMf5Iec+hSDh9gfsOa6KGW6JtmmC08V52K4BQWEmlFzCyABBqTAnWnC0MoxDSz
 /dl86MnpYaXz3z739fgLrgIutpY9RbneoHh5h6s7pfhmDy3g3m
X-Received: by 2002:a17:902:ec87:b0:2ae:bf32:20c8 with SMTP id
 d9443c01a7336-2b06e39c5admr50230985ad.31.1773880047193; Wed, 18 Mar 2026
 17:27:27 -0700 (PDT)
MIME-Version: 1.0
From: Daniel J Blueman <daniel@quora.org>
Date: Thu, 19 Mar 2026 08:27:15 +0800
X-Gm-Features: AaiRm50y5_U8l8tupWFIbR42Z9lnXqIU9fTEHoVnLxuVmapWRnaHhjq36Usxlfo
Message-ID: <CAMVG2sugUxyKTRSprMLeHSVxqBGsjT9=RDBf76+76ZdFao9BYw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.214.171; envelope-from=daniel@quora.org;
 helo=mail-pl1-f171.google.com
Subject: [apparmor] Linux 7.0-rc4 aa_buffer overrun
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[quora.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:-];
	NEURAL_HAM(-0.00)[-0.491];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: CE04B2C4196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With Linux 7.0-rc4 on ARM64 Ubuntu 26.04 (Qualcomm Snapdragon X1, 4KB
pages), we see Apparmor overrun an 8KB union aa_buffer *aa_buf when
snapd starts [1].

Thanks,
  Dan

-- [1]

BUG: KASAN: slab-out-of-bounds in aa_dfa_match (security/apparmor/match.c:535)
Read of size 1 at addr ffff0008901cc000 by task snap-update-ns/2120

CPU: 5 UID: 60578 PID: 2120 Comm: snap-update-ns Not tainted 7.0.0-rc4
#22 PREEMPTLAZY
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
__arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361
fs/namespace.c:4338 fs/namespace.c:4338)
invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35
arch/arm64/kernel/syscall.c:49)
el0_svc_common.constprop.0 (./include/linux/thread_info.h:142
(discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
do_el0_svc (arch/arm64/kernel/syscall.c:152)
el0_svc (arch/arm64/kernel/entry-common.c:80
arch/arm64/kernel/entry-common.c:725)
el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:744)
el0t_64_sync (arch/arm64/kernel/entry.S:596)

Allocated by task 2120:
kasan_save_stack (mm/kasan/common.c:58)
kasan_save_track (./arch/arm64/include/asm/current.h:19
mm/kasan/common.c:70 mm/kasan/common.c:79)
kasan_save_alloc_info (mm/kasan/generic.c:571)
__kasan_kmalloc (mm/kasan/common.c:419)
__kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5260 mm/slub.c:5272)
aa_get_buffer (security/apparmor/lsm.c:2201)
aa_bind_mount (security/apparmor/mount.c:442)
apparmor_sb_mount (security/apparmor/lsm.c:719 (discriminator 1))
security_sb_mount (security/security.c:1062 (discriminator 31))
path_mount (fs/namespace.c:4101)
__arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361
fs/namespace.c:4338 fs/namespace.c:4338)
invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35
arch/arm64/kernel/syscall.c:49)
el0_svc_common.constprop.0 (./include/linux/thread_info.h:142
(discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
do_el0_svc (arch/arm64/kernel/syscall.c:152)
el0_svc (arch/arm64/kernel/entry-common.c:80
arch/arm64/kernel/entry-common.c:725)
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
-- 
Daniel J Blueman

