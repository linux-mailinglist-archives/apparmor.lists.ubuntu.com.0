Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060554BAB6
	for <lists+apparmor@lfdr.de>; Tue, 14 Jun 2022 21:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1o1CQO-0003DK-01; Tue, 14 Jun 2022 19:42:03 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1o1CQM-0003Cd-AA
 for apparmor@lists.ubuntu.com; Tue, 14 Jun 2022 19:42:02 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C3C093F1AE
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 19:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655235721;
 bh=GhoDxNy27TYuidQH2OBWrA8BYKZorOQ4PPb3lAieumQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=IFbx1JL9tMHMKrZc4m4B+eAb3rkXEKjWnXPovY2Tj9tvgaGqGS30xGCJnMH810nyA
 d3Z5q8YzQxDISVvt9DxukbTaFouHVVJh0M9M5K8cKwKSfnZc/WRugH6BlitwCAbpDk
 RiUSk9BvTZOftSFI1VAR8UVxPo9JdbQ2CDfYy3Q3Vgj8djRufbscN1enGntCcnRKgT
 HUMltjc1weHh4ffZ8BBfm1rnat3PQ+6vaWNFIWSO3MmuQNb61lgrW1DBErBDSZ7cPn
 /WMJWcdPGVfk+YgEjE8ksrOgiHcLKU8E5e+1PS9cJpPZrYSzyd+zqmykN6AtL+JPQr
 Y3BJjACEAvYTA==
Received: by mail-qt1-f199.google.com with SMTP id
 y20-20020a05622a165400b00305f23e6744so2375057qtj.10
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 12:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GhoDxNy27TYuidQH2OBWrA8BYKZorOQ4PPb3lAieumQ=;
 b=YqsTNjV0U6toU7Skc03wWuVDJlRXkROBlo+hZlj+e5iUb9Z2Y/n8p691lCH0M0Mo0J
 Dr7jGdJU1A7FInIGofpWywnt0Ng3OOO84Gj/pYlcjo2jlt8qbcnI+9Ls/WsXUenfFHJ7
 mttzHxGuHOFMKAIB/MxUJVeHBs1ufNJtqcT658sZKMdy6am0RDJj3MieebXgQMPk3FKQ
 nYTnamANOFX+nmF/6aKVaVAgnzaz5HlJEed3Nv1DEdwTsctvnbAdcGmRq7FOt8Py/bPF
 5ApD7BzE1+RERhGtfZznaI2kzMRBYFLz9XKO1H75oe47BVCwF3ev6c1a6KpyZewKCGje
 ij1A==
X-Gm-Message-State: AOAM533Wc0K4fv8d9p29dQgbNEMXT/Ur3hWAecMOwvasmWpL6OcokxuC
 ehIDQrjM48JqtovzmznJgt3bJCTQoX8vDX7BrG5oe4J3n0DXUuTfJ5YA6L/eFpcdTupxvMuot32
 W6nr5D+F2W4eAJrh4ZYAxbOY2HAS1596XeZ8ITA==
X-Received: by 2002:a05:620a:4548:b0:6a7:5e8c:b7be with SMTP id
 u8-20020a05620a454800b006a75e8cb7bemr5221170qkp.423.1655235720022; 
 Tue, 14 Jun 2022 12:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU/+d4krSjYaacUjca8HFT8M7GTItoY0oWED6ycJXiHUCJlvOa7ebguetbS+E/eIR9wuLc9Q==
X-Received: by 2002:a05:620a:4548:b0:6a7:5e8c:b7be with SMTP id
 u8-20020a05620a454800b006a75e8cb7bemr5221156qkp.423.1655235719774; 
 Tue, 14 Jun 2022 12:41:59 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05620a424b00b006a6a7b4e7besm10626389qko.109.2022.06.14.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:41:59 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 14 Jun 2022 14:40:52 -0500
Message-Id: <20220614194052.1833833-3-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614194052.1833833-1-jon.tourville@canonical.com>
References: <20220614194052.1833833-1-jon.tourville@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 2/2] apparmor: expose compression level limits
	in sysfs
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
 security/apparmor/apparmorfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index bb6cb1abf0d3..136bc64f796d 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1194,10 +1194,34 @@ static int seq_ns_name_show(struct seq_file *seq, void *v)
 	return 0;
 }
 
+static int seq_ns_compress_min_show(struct seq_file *seq, void *v)
+{
+	struct aa_label *label;
+
+	label = begin_current_label_crit_section();
+	seq_printf(seq, "%d\n", zstd_min_clevel());
+	end_current_label_crit_section(label);
+
+	return 0;
+}
+
+static int seq_ns_compress_max_show(struct seq_file *seq, void *v)
+{
+	struct aa_label *label;
+
+	label = begin_current_label_crit_section();
+	seq_printf(seq, "%d\n", zstd_max_clevel());
+	end_current_label_crit_section(label);
+
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
@@ -2368,6 +2392,8 @@ static struct aa_sfs_entry aa_sfs_entry_apparmor[] = {
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


