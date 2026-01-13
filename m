Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 30843D1AA96
	for <lists+apparmor@lfdr.de>; Tue, 13 Jan 2026 18:36:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfiJI-0003Ao-Jl; Tue, 13 Jan 2026 17:36:04 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vfiJH-0003Af-Tj
 for apparmor@lists.ubuntu.com; Tue, 13 Jan 2026 17:36:03 +0000
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BB0A73F5D4
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jan 2026 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768325763;
 bh=UUNHIGx5sCEeYoHHzEXPjr6dKeY/IlJZFZ9b3VMGpaA=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=lY+xaFStjgjh6eoVMkmmHsZiJTVj2LpykuqvKZ+shmKjMpqZks+LVB9d8BJEZ5VOF
 v7Xrd/Iz6tHRRCjmsecn/XvofJW+TUj8ZWlzNd1fmoDLbiKIUyg86pqLDwoQaLgoFV
 fs0k9iM9p/s4Y/Clxyng2GYW9DeTQGUMmALJRPVdrHX9ymH7Rl2FiAg57q+z/FTOGQ
 j5oX16hrLSLZ86X8r5S7pkNAoLaEcXDhtyL0Oc8fe7oP+3Y7NBkqHvo+aEfoJEMmth
 g9UY9inXDWXJPWvnr5OdczOqfoCgMqQOrVv4Yw/3Jxqd31pQtDcg6NKsf/dwCkZEI8
 1vKh+++oHpTUE+VOXbeMJwF64HGc3sD/831rm9eUec6KJ8GevJ/NMbKJS1ELynIqLT
 mSoc8zGeY4cmUr1M0V5bnai9IxRUwx8T8H1Ep96pXjukwYC7+he2cnKf/uOnFlnIZh
 sr1b1WlGU58c+W8wA+4XOPU+HcQu4smbDooAKZAVbYCkgvpHDXsWjbK8XPkhwzkySW
 scB6Q0GtoqWxDbH6f+HVZ95V2yVIkMUve0zC5i6XIDjj2gXepjGRNl7sdrTvTv+YWo
 5KlxSTV6JEpPVPE2fzBf4fuOzkGaB0qdNhFg0tnrllOf2LKUtkVXhA64H4OsRTpXvN
 gzkHWD8I+lDoMqBsRueGHFv0=
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-11f3b5411c7so29334141c88.1
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jan 2026 09:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768325762; x=1768930562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUNHIGx5sCEeYoHHzEXPjr6dKeY/IlJZFZ9b3VMGpaA=;
 b=uh3aI1BPBEtMj1DiCIT8w+HBzw8/UewAGV9JhWxQZortU8VCPadu98258nwPksGfAn
 04f8xpz7mZs3Q40D6mVlKm7ilI1L8gX0cnOf/F5LioYvMmOI0U7O429x2uO2tVO4flOa
 QeLHacfLCOKFMLoqpzOXCAJOdjEGqnJIoyx1RsnrLpkQyqF35MQHi3x8nhc3ZzwIOH9H
 AJlZBBtF71+DuKBbmQAOL00oXnUSJSnOv+T6qNktmipfxmkJClvpa0fwCe/6DDl3Tr77
 8POvaaTDT8vWoH3uNI6ZfFIWG3EAD2/zL+yB+rhAC9Bajeg/tJ9ObFiEtPFmuAUasF1N
 ZMGg==
X-Gm-Message-State: AOJu0YwTKJPSPcNnSUkEQuaHTRtwsX6Eu5gNMFHE/bgSsqxhPiMEZsgs
 y3Cq5iQbeSAkDbqE6FLAbMEY+csubejHuDUjPLuj7WY6g1vMtURLuDz3jOu+Y0hdZwtmVw/Y3//
 CxgMFCorPqpqABdRy1cGDPvGjHm+HLQA1kZo2sG8nPLHU1jay0TA3tBX1n5J9L64iiQokbktx6s
 Ou1rDu3N3Zrg==
X-Gm-Gg: AY/fxX5Af3PqZM/hGZR9ER4kpEXxK2ORF3VsU8pY6h5VjrpEsYzTPtWA6pmQRzoltTB
 bVabpaWHotUuGHQYvPpCveJdthZmOLYmzlEO6YKky8R/ixfdoSeBk2NTVDZf/Ov0+I5FhOa1aqJ
 OcjJcsPp4TUd36ImakWmNCqZKZXT2fseNS2Fk6IjbymaJ5OiI592wj8Cxhu4R/XXEPrrrhTCrj7
 zol4TRFsxJ6UgGNMQpoy8IGMnwbn5rGH1k5G5iXdQXuH7fCuufEprn0r4k4Xi8lCZ5gsgSLyf9P
 Iw3gON0Gc9ehbqxtGQwHREZRSBhk2vYjkEMRoJFTb2Io92r7rfGvhR+UH22oQKotNYtZY2+z3bR
 qieszx0oglkmMnkfqsP0Qmkh+Si9wu2gIvwqHr86+kbKGSH7Yand3Tlk+mvyp1JkW2O8=
X-Received: by 2002:a05:7022:5e0b:b0:11b:9386:a3c9 with SMTP id
 a92af1059eb24-121f8b5a404mr17923529c88.42.1768325762260; 
 Tue, 13 Jan 2026 09:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElwWrIimgMyxNC4a9Hkuwqit1NXXFP5yZwIkbT4LNsnxLQUN7CYb2W95+c7acuriV1r60tzg==
X-Received: by 2002:a05:7022:5e0b:b0:11b:9386:a3c9 with SMTP id
 a92af1059eb24-121f8b5a404mr17923498c88.42.1768325761794; 
 Tue, 13 Jan 2026 09:36:01 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121f243f6c7sm22271898c88.7.2026.01.13.09.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:36:01 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 13 Jan 2026 09:35:57 -0800
Message-ID: <20260113173558.15401-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: return -ENOMEM in unpack_perms_table
	upon alloc failure
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
Cc: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

In policy_unpack.c:unpack_perms_table, the perms struct is allocated via
kcalloc, with the position being reset if the allocation fails. However,
the error path results in -EPROTO being retured instead of -ENOMEM. Fix
this to return the correct error code.

Reported-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Fixes: fd1b2b95a2117 ("apparmor: add the ability for policy to specify a permission table")
Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/policy_unpack.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 019430225e4a..2280a8f7a843 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -700,8 +700,10 @@ static ssize_t unpack_perms_table(struct aa_ext *e, struct aa_perms **perms)
 		if (!aa_unpack_array(e, NULL, &size))
 			goto fail_reset;
 		*perms = kcalloc(size, sizeof(struct aa_perms), GFP_KERNEL);
-		if (!*perms)
-			goto fail_reset;
+		if (!*perms) {
+			e->pos = pos;
+			return -ENOMEM;
+		}
 		for (i = 0; i < size; i++) {
 			if (!unpack_perm(e, version, &(*perms)[i]))
 				goto fail;
-- 
2.43.0


