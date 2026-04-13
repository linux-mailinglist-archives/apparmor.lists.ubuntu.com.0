Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGXuHrrj3GnBXwkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 14:38:18 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14D3EC0D8
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 14:38:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wCGYJ-0003Yv-Nn; Mon, 13 Apr 2026 12:38:07 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phx0fer@gmail.com>) id 1wCDCU-0003r9-4w
 for apparmor@lists.ubuntu.com; Mon, 13 Apr 2026 09:03:22 +0000
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c76cce85bd9so1578979a12.1
 for <apparmor@lists.ubuntu.com>; Mon, 13 Apr 2026 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776071000; x=1776675800; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DiKoqOCdxPg06BqZFq9Ct5oqVqz6+Krm+gLL5i6mvQo=;
 b=Kw2zPO2zVd9Ugb569eylQIL3j8c2GDI+y1Lhc0ry0Ms8iezK8m8mXQLAiQsJbfM9/i
 guIZzN3lpqHVfN3WYQupm1srjAoMNIjHSvjGFq+9s38WmLio6dvcYr4hxyOoD16rvedO
 J0MO0Vs92yrJOAa1kmpKzSwvfu2WaRfh7NhDe5SmC9y9YdGXUMVKhsLQ70+2ZkygZgHq
 4bXtfIv5x4+K/pGcFL1IIE5kirFkKNlT3Plka8Pc0E2IUBPivOZCFSIz893H0CF+C0jq
 k88cU2RhlbuMTK/v0YgEqj24eMSrsO7bd/2Nlb98pddeApVrsvRWNuMDBXTNQgm60Uy7
 YMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776071000; x=1776675800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiKoqOCdxPg06BqZFq9Ct5oqVqz6+Krm+gLL5i6mvQo=;
 b=XTerStXPX9l/5pXD/Ij+ol0rMHp4AWwky2HSDPB2D4CnDgi1CYldDYCChTIIbAU5fo
 gl/t02fQIYa2D3/HLPwL0HQf6+REk2s/57diplAwmSsundTVREJqEN655Q6EOqU/Cw7o
 qrJWPV7I2lrq4Jp1foOHmVHqErWTuhlKo1MOcD7qROJKRbkmaW3YCN2GbhSSr+QHNAvT
 HqM1Iazvpt7WhKCEZDZaGj0YPlUPDAFjBffBiLWC8GyAcc0oVBYPe+fh4UktmmHZKR63
 rVyec2xYD/orQW+m5bAbTqrsPThnW+IbNyT6vx0GvQZs/vVaV2s6cVoda51B4bdf5/GG
 LRMg==
X-Gm-Message-State: AOJu0Yzlwwhu9N4yRKuvfdFf1qulCT8SZKUqgAkK8v0VfPqRjwW9qiYW
 HZL4nA9lnVAzwIKbVE2825oDci2+8U1+QudM9XL7W+m6PPwQGCThVvz7Pv+m7w==
X-Gm-Gg: AeBDieu1CI9ed4dLDRm8lxEd5Gg/q0NN8GNUTirLtTijKHaxpcTcblOxkwp/h6jlMGE
 jNrZs6ZYcVr1jR6Ao9R7xCQCoIcqHpDGYU90+AxZCL6JPrUAyZA5b2zNXr50ekH5Yk+BEG03vrl
 rDW2uLRHJsuRhmrLDrYQ4R9MnIpdnkeV4OMxTyyKaZHD+pQSzPRCUVevcT4xKxBjpp68KdTQb5J
 FbZ8+dLasLZmAMFt0kEdL7IujoNmYMwsunRIZpL3QHUjhwzGF0uPASnz63WYtx0kykeMY1Y4OVf
 zu7+UOOJCVcYn+EmMWEaZCHv5EIr17kEpb1J4D3HMw+95ECzYvwbmgjolZzgaMy6+RHtlfyJXb2
 5tHjkeCrx9pf2qN3Z4Krm4kKoSwSzRelUW39YWoCWajCaCUNNEiuU50ORBJcpJLsmFk6/sfuj8J
 6PmreeiY+QPao/TRv1GQafaTBf82jlsTB4fZI/GXbwYllBkvshPMavignHDV0Bp3XG
X-Received: by 2002:a05:6a20:9389:b0:398:7855:1596 with SMTP id
 adf61e73a8af0-39fe3c64b7amr12937774637.10.1776070999582; 
 Mon, 13 Apr 2026 02:03:19 -0700 (PDT)
Received: from gmail.com (69-172-89-235.static.imsbiz.com. [69.172.89.235])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c79216ffa72sm10075364a12.6.2026.04.13.02.03.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 02:03:19 -0700 (PDT)
From: Dudu Lu <phx0fer@gmail.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 13 Apr 2026 17:03:13 +0800
Message-Id: <20260413090313.79315-1-phx0fer@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.180; envelope-from=phx0fer@gmail.com;
 helo=mail-pg1-f180.google.com
X-Mailman-Approved-At: Mon, 13 Apr 2026 12:38:05 +0000
Subject: [apparmor] [PATCH] apparmor: Fix wrong dentry in RENAME_EXCHANGE
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
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phx0fer@gmail.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FREEMAIL_CC(0.00)[gmail.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.981];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-]
X-Rspamd-Queue-Id: 2D14D3EC0D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


