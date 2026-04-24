Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHBXDN1f62kCMAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 14:19:41 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F274345E51D
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 14:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wGFVK-0004pE-V7; Fri, 24 Apr 2026 12:19:31 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phx0fer@gmail.com>) id 1wGDG2-0001ei-TB
 for apparmor@lists.ubuntu.com; Fri, 24 Apr 2026 09:55:35 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-35d99bae2ebso6888427a91.3
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777024532; x=1777629332; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1T1x+L7IhncD5ZnteL/angAEjhqfpbRDWQ7kgFrGqQc=;
 b=YNP9GQv2Jnzj1AlsqS4SbgROVrr10sX6+mmUMWMagizuY491sXNCmgH6895K3PFBuQ
 SWv32VNgg95ggL/5SDO5gYedBjOY5pFH3QPVGF8aPvVYGEXNncZKW//ohScy8qw275Jr
 9V2lP6GniNHvL5RzvnhIzBRMysxHDCblNM+1P+tHYOkamx3/UjPDAcrhGX75xNn6sqaT
 3zGwHTDEBcwONh/KSdTuoGuNMQEiER6rgeNwu68ylecr0Xq2B4v6tJmr0J5JhwqbpNgX
 xDE0AmjgOGWErUUcRdxih0XX8yjUhf2N9mIzhVsXT0x8TetzFX2cqukNKeCXQaCalKTl
 SAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777024532; x=1777629332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1T1x+L7IhncD5ZnteL/angAEjhqfpbRDWQ7kgFrGqQc=;
 b=jeMZePBRskx7hGHG1RpsiqN7McmQID31a9QpnlHiWNo7etk2sgIXfwxMWm/PrjxoFd
 nBd88lmxj4NzGvtjm6XzL8gYpqOM14T4zK6b6s1Ii7Z8SR4TqaaY7iyqnppW/eClSMtI
 /l1i7JfIkFA9lb9vlyUvRdjSkknejmFyCiKzg1o3ZQ0PSObgdoRgVURryy9EDJvwhynq
 JP5R1xDWIOLXO8tkJeBb/5l5D1oXMc78ygtLAUnDYlK2y8Skb5vYKHek/UBP+aRdQBqA
 /z5VYTxfHHU3bSKkc+McdAkf+5CksFHHGwX6sESkmcmZEhdJTgyvGyQi9v3D6ty96BoH
 1CGw==
X-Gm-Message-State: AOJu0Ywa92u4aVzbpVZIz6/XVb0RL9dl/WvxqUbRV3UCOa9IKca8yCOV
 8CY77AbQxd3tVXOFQgQt0x+rP3BGKxNV4ETDJLklAp3PIA9LNXd0pFaJz33sSY4x
X-Gm-Gg: AeBDies8XX9kNdFI+NNLjjm+vWuQrbECyEzKg3Mh+0jEw+qHTleoZfY6q48z6QIz+lx
 BBkkQ7Y27EgIeF9QE3fg4r3+JPewbGOJS+GcDxeR8YDPu7FaVCKguc6dRWWpve/iwFsbA/Rmsjk
 O/YE1JZ2DAJQenwfXIlx/Amr1MZDgDgxrdXSsYR6toF2LOSo35hGAWxepmv9Db3TC8G0+tjB+Rs
 mOL7JYRadJ43V0xyQ++Pn5s6qm+mLWSoBmOFVrCpsh7Sbpoj6bKGOJNYNwGJ9KxFfMryQmyagPK
 qHhrx2S4fs3j5GIgg460WOOzdOUaeers1kXp+/SmfHyGxQYS2lmrTcovEQVF+3QtRrjpzoZSIFO
 LeNOLU9o5LIDmLx2kTZin0sgm9a5CqBE909rM4gKLHADxX76SELBjKeo97kQEciK9bbKRK/ij/f
 YaUl2e9MDITT3OR1AaZCYyq8HvhUvcCo3d7hFfN30rCe2QYFynXeGJ
X-Received: by 2002:a17:902:ce0c:b0:2b7:88f9:9c3d with SMTP id
 d9443c01a7336-2b788f9a2bcmr172400995ad.12.1777024532410; 
 Fri, 24 Apr 2026 02:55:32 -0700 (PDT)
Received: from localhost.localdomain ([180.172.12.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa3073asm211016825ad.27.2026.04.24.02.55.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Apr 2026 02:55:31 -0700 (PDT)
From: Dudu Lu <phx0fer@gmail.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 24 Apr 2026 17:55:21 +0800
Message-Id: <20260424095521.33655-1-phx0fer@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.41; envelope-from=phx0fer@gmail.com;
 helo=mail-pj1-f41.google.com
X-Mailman-Approved-At: Fri, 24 Apr 2026 12:19:29 +0000
Subject: [apparmor] [PATCH] apparmor: fix wrong dentry in RENAME_EXCHANGE
	uid check
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
Cc: Dudu Lu <phx0fer@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: F274345E51D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phx0fer@gmail.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.969];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-]

In apparmor_path_rename(), when handling RENAME_EXCHANGE, the
cond_exchange structure is supposed to carry the attributes of the
*new* dentry (since it is used to authorize moving new_dentry to the
old location). However, line 412 reads:

    vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));

This fetches the uid of old_dentry instead of new_dentry. As a result,
the RENAME_EXCHANGE permission check uses the wrong file owner, which
can allow a rename that should be denied (if old_dentry's owner has
more privileges) or deny one that should be allowed.

Note that cond_exchange.mode on the line above correctly uses
new_dentry. Only the uid lookup is wrong.

Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call.

Fixes: 5e26a01e56fd ("apparmor: use type safe idmapping helpers")
Signed-off-by: Dudu Lu <phx0fer@gmail.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c1d42fc72fdb..e8de919fbea6 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path *old_dir, struct dentry *old_d
 			struct path_cond cond_exchange = {
 				.mode = d_backing_inode(new_dentry)->i_mode,
 			};
-			vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
+			vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(new_dentry));
 			cond_exchange.uid = vfsuid_into_kuid(vfsuid);
 
 			error = aa_path_perm(OP_RENAME_SRC, current_cred(),
-- 
2.39.3 (Apple Git-145)


