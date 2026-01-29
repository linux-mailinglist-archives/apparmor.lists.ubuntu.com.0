Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDgbJRaue2lOHwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 29 Jan 2026 19:59:34 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B364B3BFC
	for <lists+apparmor@lfdr.de>; Thu, 29 Jan 2026 19:59:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vlXEa-0005Fx-0S; Thu, 29 Jan 2026 18:59:16 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1vlXEY-0005Fn-FE
 for apparmor@lists.ubuntu.com; Thu, 29 Jan 2026 18:59:14 +0000
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DB043FB98
 for <apparmor@lists.ubuntu.com>; Thu, 29 Jan 2026 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1769713154;
 bh=zNpdn97ShgqvSUE0b8lvb3XrEc9UbDAiU7iRpwoTWy8=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=CEy+9sZQvGhKhHrNUUTRgaHz2fahIKP26HdLeqPFj21bweBIusEut343wI34EA+Ka
 Qxmlkjn4krNpM66MF/aaMxb6yRI/86ej6xA26wdCEeqInt9BQ9GMqG3wWW2LhTlUJN
 aZ8wFNSv18Hc14jUOmmtLVsinu+Kxwvkw0GiqvLZ5XOVL2MuRsmR7j4ZGf2wSUYCVn
 BRxOcR22LbDnXtW3pkO8poZ5kuU7XGIZeOgniTybpsP/gdsUfJafVYnLtjDFacT9Vj
 RcArT1X7dhXqQvRzxh8FC7CSgE+bpAR5CPU2LSRKdJFxQfvtBjW7/zJhGeQH3bRsn1
 Y+BfvrOknEK1UOywkE7Inm56k0LYukA4qNLzKLTd6x6olMEeIXHFI3Y7yEQomOCp07
 FSbu1/tl9NXw0cr21Ow3UgAhsPCo4yAAR5UU6O8+4iGvXbsIOGHUeOKHpOeNeoza/5
 4ROADH7zknaaRuvZC9gXSAXc+yfrBRtNbyrr2nbzjihEhfjwNCTUB0WX3H4Gjv6Gn0
 ut5n3Q+JSwyflnjcbdPrMzwDDkMSnGz+K1Rqr1VXmcyEE90YiDrBOXo+HQmm4xU0Ko
 q/od922PWwfpRuc3K0OrKgKo4BVUWlwa1l0wilE0PkPV1HsmhN6tz1+cp/LaqDai3d
 jy4I1WSgobtCcxCrvGeY2UB8=
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b724ff60e6so1498829eec.0
 for <apparmor@lists.ubuntu.com>; Thu, 29 Jan 2026 10:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769713152; x=1770317952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNpdn97ShgqvSUE0b8lvb3XrEc9UbDAiU7iRpwoTWy8=;
 b=pC6PlScQWLmVZCTrCvfoq/C1wN3gDTI7JU3OYDy+f95vl/+gs/Rsd1dhWN7uybmDhp
 DWMvnOS1lfRSbE6oEa8+gEIqugayExzxhjjoyLu6Ka6iiCLYJi9aIBAz7TKl++TRY6yd
 +30DWD3K57bg8g4cEkJ85O0pEojGCEGPfWtwVsTw9gBU7GC2crNRyPcXTco4BgRTs2V8
 8k5S4l4bW++ngIf1T16lGvPUT/ChkGFCd6pzU+vfGELr8jpStSRMOZH3qDOT4b+TS5zL
 Ndei3EwbXTSiahL4uLVVopbO9jsOzSBvJQaa/o4HOB/zfW9XYVbb/Sbgnv0CbKCKjQbh
 c2Ow==
X-Gm-Message-State: AOJu0YyAxX7ji1ZVO6RvaiOfz2FTUI6QCOORFNvw3lKDVCFJmMpttXrm
 W9E/KKMOjkxq0jXjom6HxKvdCb9CrkSnaGf4UwUlPph8Bnw7Q1SKfTttB1cnSgYlgA661rq5JEM
 BSb5WyoEVkRPBH1Rb730q7egP+g2Jb+wQFTYmdLvRMWmNqlZ8vR2/xJ8Qfxs7xe6p4xiD/o6ljh
 Zjy+/yLGGEKw==
X-Gm-Gg: AZuq6aK5dntZx782SPM1PE1wYD8JJL1pd9oSVv/PLgsTpIArObbEiZZYbWtNv0p1wem
 BSkgE06ctsZ2je2mYpfK99bAYfe5Rg0k/GXFkYZ+mrKLRLSLA3znKFs7DYaWHgAC8g8zz30NrbA
 pqpQNid+ayJQNTqCGVCTlLQHUkvMY3x7gKKIFYvzEbQKAVfH6x93vYQTjCGWeBz85m2fglOHMSW
 V9qtzgQZ9fkWFpDDzIDLunAC9l3m27mbFKwN6N2FkLNxJvuqm8Ojse2J1Kp7jjHuGecWkZOiGow
 GFqOqIo5sbRXRQMe6z0vMPnw7CgG0Xg41Nb/3DY8dgxR0tHe11hxpHS/FWQGzpzP4ULiWKLx1dk
 2fZM/Kml3Dc5nDdqvUCkt8A==
X-Received: by 2002:a05:7300:8b24:b0:2b7:1e86:35ee with SMTP id
 5a478bee46e88-2b7c88dd706mr173131eec.28.1769713151863; 
 Thu, 29 Jan 2026 10:59:11 -0800 (PST)
X-Received: by 2002:a05:7300:8b24:b0:2b7:1e86:35ee with SMTP id
 5a478bee46e88-2b7c88dd706mr173118eec.28.1769713151202; 
 Thu, 29 Jan 2026 10:59:11 -0800 (PST)
Received: from georgia.. ([2001:1284:f514:a75f:96bd:694f:ef02:428a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a1af898asm8797661eec.33.2026.01.29.10.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 10:59:10 -0800 (PST)
From: Georgia Garcia <georgia.garcia@canonical.com>
To: john.johansen@canonical.com
Date: Thu, 29 Jan 2026 15:58:45 -0300
Message-ID: <20260129185846.3169624-1-georgia.garcia@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/2] apparmor: fix invalid deref of rawdata when
	export_binary is unset
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 3B364B3BFC
X-Rspamd-Action: no action

If the export_binary parameter is disabled on runtime, profiles that
were loaded before that will still have their rawdata stored in
apparmorfs, with a symbolic link to the rawdata on the policy
directory. When one of those profiles are replaced, the rawdata is set
to NULL, but when trying to resolve the symbolic links to rawdata for
that profile, it will try to dereference profile->rawdata->name when
profile->rawdata is now NULL causing an oops. Fix it by checking if
rawdata is set.

[  168.653080] BUG: kernel NULL pointer dereference, address: 0000000000000088
[  168.657420] #PF: supervisor read access in kernel mode
[  168.660619] #PF: error_code(0x0000) - not-present page
[  168.663613] PGD 0 P4D 0
[  168.665450] Oops: Oops: 0000 [#1] SMP NOPTI
[  168.667836] CPU: 1 UID: 0 PID: 1729 Comm: ls Not tainted 6.19.0-rc7+ #3 PREEMPT(voluntary)
[  168.672308] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  168.679327] RIP: 0010:rawdata_get_link_base.isra.0+0x23/0x330
[  168.682768] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 41 54 53 48 83 ec 18 48 89 55 d0 48 85 ff 0f 84 e3 01 00 00 <48> 83 3c 25 88 00 00 00 00 0f 84 d4 01 00 00 49 89 f6 49 89 cc e8
[  168.689818] RSP: 0018:ffffcdcb8200fb80 EFLAGS: 00010282
[  168.690871] RAX: ffffffffaee74ec0 RBX: 0000000000000000 RCX: ffffffffb0120158
[  168.692251] RDX: ffffcdcb8200fbe0 RSI: ffff88c187c9fa80 RDI: ffff88c186c98a80
[  168.693593] RBP: ffffcdcb8200fbc0 R08: 0000000000000000 R09: 0000000000000000
[  168.694941] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88c186c98a80
[  168.696289] R13: 00007fff005aaa20 R14: 0000000000000080 R15: ffff88c188f4fce0
[  168.697637] FS:  0000790e81c58280(0000) GS:ffff88c20a957000(0000) knlGS:0000000000000000
[  168.699227] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  168.700349] CR2: 0000000000000088 CR3: 000000012fd3e000 CR4: 0000000000350ef0
[  168.701696] Call Trace:
[  168.702325]  <TASK>
[  168.702995]  rawdata_get_link_data+0x1c/0x30
[  168.704145]  vfs_readlink+0xd4/0x160
[  168.705152]  do_readlinkat+0x114/0x180
[  168.706214]  __x64_sys_readlink+0x1e/0x30
[  168.708653]  x64_sys_call+0x1d77/0x26b0
[  168.709525]  do_syscall_64+0x81/0x500
[  168.710348]  ? do_statx+0x72/0xb0
[  168.711109]  ? putname+0x3e/0x80
[  168.711845]  ? __x64_sys_statx+0xb7/0x100
[  168.712711]  ? x64_sys_call+0x10fc/0x26b0
[  168.713577]  ? do_syscall_64+0xbf/0x500
[  168.714412]  ? do_user_addr_fault+0x1d2/0x8d0
[  168.715404]  ? irqentry_exit+0xb2/0x740
[  168.716359]  ? exc_page_fault+0x90/0x1b0
[  168.717307]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
---
 security/apparmor/apparmorfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 907bd2667e28..4fb251a7e85a 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1644,6 +1644,14 @@ static const char *rawdata_get_link_base(struct dentry *dentry,
 
 	label = aa_get_label_rcu(&proxy->label);
 	profile = labels_profile(label);
+
+	/* rawdata can be null when aa_g_export_binary is unset during
+	 * runtime and a profile is replaced */
+	if (!profile->rawdata) {
+		aa_put_label(label);
+		return ERR_PTR(-ENOENT);
+	}
+
 	depth = profile_depth(profile);
 	target = gen_symlink_name(depth, profile->rawdata->name, name);
 	aa_put_label(label);
-- 
2.43.0


