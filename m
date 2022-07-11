Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952E570872
	for <lists+apparmor@lfdr.de>; Mon, 11 Jul 2022 18:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oAwP3-0006Al-SQ; Mon, 11 Jul 2022 16:36:57 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1oAwP1-00069D-Jd
 for apparmor@lists.ubuntu.com; Mon, 11 Jul 2022 16:36:55 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5A8A43F8D8
 for <apparmor@lists.ubuntu.com>; Mon, 11 Jul 2022 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1657557412;
 bh=c9RWQFag0pTRzZ7ib5EjTtatGf/sGtlzFwTIA1OA1T4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=L848tbD0dwl2NH16hTcGZdjMzWO8oN5/lTMrW2Z13spZptWrn37KkoX7xi8+NiDxQ
 PHxDkD+fvl2t/yXOvFyY3U8hwdPPJFYTNIY48PtyGNm8WItoP4imo34Hf0rolk1tPl
 8OiNypCutruf7u3PxnvNAjcW9ouxZHQD/HPM83QQXYSEKiKDHM2E/J62PF/dq/ju2W
 Pt45wktS3igOwjiAgNUTdp+ZaE3FuBicK18xdR2hl+G22bln/f/0YvsGg3pQ4kvjdD
 sgWW+2HOYtgBjS4ES6oyFxqdDXI95lfW5LU0k38jUnzUkqDtmdq5OnPZsySuSmJKSP
 L5XsMDYI6aHyQ==
Received: by mail-qk1-f197.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so5680802qkb.9
 for <apparmor@lists.ubuntu.com>; Mon, 11 Jul 2022 09:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9RWQFag0pTRzZ7ib5EjTtatGf/sGtlzFwTIA1OA1T4=;
 b=SIowBwKcEVPpM79RC/5x6WiLWugJs7JA/ZfOOyusfb2V/tDC+Tan073P0IubdP0vPC
 H/EnWzh7dPotQcUBdwQf7q3wLXsYogopqffmHVVUpn8P42bhAmpo/Mfamgi4rbwIhd0E
 pcFFDtHf/CVqcecVh3IGyH90JvRbPyA6ztdHgq+hXARCCO/7lldmQSOMBsZUDhsdDpPU
 WOW6KCi7OCZWR96TH6tskyV3CIPsvKabkAR8BrmHT+Plh6yea4jf7w/RnMExRmLIlvWp
 sE1Amd8eO9d80fgxHfYXi4R6WuMPp1tL2KG/mAwWveYr6WTyu9YdOriBIToYounkD5Ny
 IUmg==
X-Gm-Message-State: AJIora/36e0woJVZSPv4W5iLLOhsj0x3DYmA/Y7iyoCf411Zu6bn6IIw
 6qk/g9giUcDwkZxiOJqtntxUOHoBfzQnK4kdD0VQSEFuzLidWVkDV1vNpp0unD0ZyX1BTr3svWo
 HT+h4awjkg92w+Ql78fnFgFdLRXHkzJ6fi2ZUfg==
X-Received: by 2002:ad4:5ca4:0:b0:473:4d5b:5af3 with SMTP id
 q4-20020ad45ca4000000b004734d5b5af3mr10274324qvh.12.1657557411202; 
 Mon, 11 Jul 2022 09:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4GFRa33dPbZ4KklsnkYTMj6nacIohbobtxvgFO8uV4B07GcBnbkBKJgQ1l8S8w9Xv9JAR/A==
X-Received: by 2002:ad4:5ca4:0:b0:473:4d5b:5af3 with SMTP id
 q4-20020ad45ca4000000b004734d5b5af3mr10274306qvh.12.1657557410953; 
 Mon, 11 Jul 2022 09:36:50 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 w27-20020ac84d1b000000b003051ea4e7f6sm5569400qtv.48.2022.07.11.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 09:36:50 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 11 Jul 2022 11:36:09 -0500
Message-Id: <20220711163608.2244985-3-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711163608.2244985-1-jon.tourville@canonical.com>
References: <20220711163608.2244985-1-jon.tourville@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: expose compression level limits in
	sysfs
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Create two new files in apparmor's sysfs:

/sys/kernel/security/apparmor/raw_data_compression_level_min
/sys/kernel/security/apparmor/raw_data_compression_level_max

These correspond to the minimum and maximum zstd compression levels
that can be assigned to the apparmor module parameter
raw_data_compression_level.

Signed-off-by: Jon Tourville <jon.tourville@canonical.com>
---
 security/apparmor/apparmorfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index bb6cb1abf0d3..3a69a1c77efd 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1194,10 +1194,24 @@ static int seq_ns_name_show(struct seq_file *seq, void *v)
 	return 0;
 }
 
+static int seq_ns_compress_min_show(struct seq_file *seq, void *v)
+{
+	seq_printf(seq, "%d\n", zstd_min_clevel());
+	return 0;
+}
+
+static int seq_ns_compress_max_show(struct seq_file *seq, void *v)
+{
+	seq_printf(seq, "%d\n", zstd_max_clevel());
+	return 0;
+}
+
 SEQ_NS_FOPS(stacked);
 SEQ_NS_FOPS(nsstacked);
 SEQ_NS_FOPS(level);
 SEQ_NS_FOPS(name);
+SEQ_NS_FOPS(compress_min);
+SEQ_NS_FOPS(compress_max);
 
 
 /* policy/raw_data/ * file ops */
@@ -2368,6 +2382,8 @@ static struct aa_sfs_entry aa_sfs_entry_apparmor[] = {
 	AA_SFS_FILE_FOPS(".ns_level", 0444, &seq_ns_level_fops),
 	AA_SFS_FILE_FOPS(".ns_name", 0444, &seq_ns_name_fops),
 	AA_SFS_FILE_FOPS("profiles", 0444, &aa_sfs_profiles_fops),
+	AA_SFS_FILE_FOPS("raw_data_compression_level_min", 0444, &seq_ns_compress_min_fops),
+	AA_SFS_FILE_FOPS("raw_data_compression_level_max", 0444, &seq_ns_compress_max_fops),
 	AA_SFS_DIR("features", aa_sfs_entry_features),
 	{ }
 };
-- 
2.34.1


