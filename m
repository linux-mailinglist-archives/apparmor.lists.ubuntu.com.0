Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 44509A61977
	for <lists+apparmor@lfdr.de>; Fri, 14 Mar 2025 19:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tt9qx-00017V-0T; Fri, 14 Mar 2025 18:33:51 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tt9qv-00017F-6p
 for apparmor@lists.ubuntu.com; Fri, 14 Mar 2025 18:33:49 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D08E63F342
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 18:33:48 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-223d86b4df0so42218095ad.3
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 11:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741977227; x=1742582027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mtMOvgTNHME6IuhPNcHtpmK0U9do03xcGSim09ZxHwQ=;
 b=tVvNb4wn0r5QYg3aTOGhwO+OXtXYOrkgPCwwQzyUXs3/QunoukOLhg0cyZUOyJFPhA
 m3dHa2X7IXgFwkcSwZlr70qRFb6HZqL6GY9dRymoKImY7tc1TklaCh60CzaGEy1q6J9X
 nRNqbe9YbXphCWnmyWWDiCTLeaydefeJ/79AsuMWoKXyk5NanJuSlz4WHzgtU43L2GPe
 DyTuK3T1yP6Mqkmij4+X1lCqv17PiBZxbJvOl3Ls5SIgEsAjcfpTZUq37cLxEedpmWVO
 qQNcbPnYfFZ0EeYZcE9A+y7AbNv6OaqqcsL4ruJ/foptcnsTK0IR6HgQ9xj+Dv/EK1bw
 gGmw==
X-Gm-Message-State: AOJu0YyTklM21DMbGMDF6KPoHeLWL6ne0mJjwEQQyPkreKolTaOCZAU/
 6l/LFvajksGmfvVI+NO50aiycYgjtc17R3XNYtj4idaa1Jwckcnz5jGerUEABcZQfOr74XIf1As
 kWALPIKQ5vHZmNnurFZkyKVbZAKHUaF1JhKRaxFv8l1IEEvwWQTpRfjpiFi4cZOtmdneQds7Ne7
 UDjDjHJA==
X-Gm-Gg: ASbGnctV5wKfNJR8VoRf1z4zxKbxSL1l0nWfbmajaZHjaMpHjNUDt2vTYdauVbequGq
 e7rNbKkT539ao5xHOEzhJIeRgQ4Wu+9ngQ8YRMrZRipTGuosbPQVwq52rSi/0mABO7IOxdsbssS
 omRwFuSLKmTuhc61OqW3wQ9gSRXXQtbocwKH2oaiOmKcTtmjAI+gPCaUm+2eQ4sLWdyql2e5XA6
 7dwrFlluPpj4hLVZ3Oi3qOY1qoDDU2+lSRkVXMy8un2ipWQm41olZWJ+U1cxsUgaCk1IZsVv8Jt
 DqcFWQiw4iHOPHmbddvQcqZF2cfFpVcUP0RxpYmBMR84HE6BFAIeJwr9Zk9Q8BZKV2FTQRk=
X-Received: by 2002:a05:6a21:6d95:b0:1f5:6680:82b6 with SMTP id
 adf61e73a8af0-1f5c134c4famr3888154637.38.1741977227434; 
 Fri, 14 Mar 2025 11:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcaSIZEBHxIn9qnVL3r9ti3pozGdgNVg62Aph7KTqs1Kl0hDAudKz4LDt4mUs1srQFRp3nSg==
X-Received: by 2002:a05:6a21:6d95:b0:1f5:6680:82b6 with SMTP id
 adf61e73a8af0-1f5c134c4famr3888142637.38.1741977227160; 
 Fri, 14 Mar 2025 11:33:47 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7bcc0sm3039161a12.56.2025.03.14.11.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:33:46 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 14 Mar 2025 11:33:37 -0700
Message-ID: <20250314183340.681554-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314183340.681554-1-ryan.lee@canonical.com>
References: <20250314183340.681554-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/2] apparmor: create an
	AA_SFS_TYPE_BOOLEAN_INTPRINT sysctl variant
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

This is a variant of AA_SFS_TYPE_BOOLEAN that gets printed to userspace
as the integers 0/1 instead of as the strings "no"/"yes", for backwards
compatibility with userspace applications expecting integer values for
semantic booleans.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/apparmorfs.c         | 4 ++++
 security/apparmor/include/apparmorfs.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index b16756e7b8a8..92f034f369c2 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1210,6 +1210,10 @@ static int aa_sfs_seq_show(struct seq_file *seq, void *v)
 	case AA_SFS_TYPE_BOOLEAN:
 		seq_printf(seq, "%s\n", str_yes_no(fs_file->v.boolean));
 		break;
+	case AA_SFS_TYPE_BOOLEAN_INTPRINT:
+		// Allow printing the boolean as 0/1 for backwards compatibility
+		seq_printf(seq, "%s\n", fs_file->v.boolean ? "1" : "0");
+		break;
 	case AA_SFS_TYPE_STRING:
 		seq_printf(seq, "%s\n", fs_file->v.string);
 		break;
diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index a21855ad7fb8..61d37ab9ee4b 100644
--- a/security/apparmor/include/apparmorfs.h
+++ b/security/apparmor/include/apparmorfs.h
@@ -15,6 +15,8 @@ extern struct path aa_null;
 
 enum aa_sfs_type {
 	AA_SFS_TYPE_BOOLEAN,
+	// Boolean that gets printed as 0/1 for backwards compatibility
+	AA_SFS_TYPE_BOOLEAN_INTPRINT,
 	AA_SFS_TYPE_STRING,
 	AA_SFS_TYPE_U64,
 	AA_SFS_TYPE_FOPS,
@@ -43,6 +45,10 @@ extern const struct file_operations aa_sfs_seq_file_ops;
 	{ .name = (_name), .mode = 0444, \
 	  .v_type = AA_SFS_TYPE_BOOLEAN, .v.boolean = (_value), \
 	  .file_ops = &aa_sfs_seq_file_ops }
+#define AA_SFS_FILE_BOOLEAN_INTPRINT(_name, _value) \
+	{ .name = (_name), .mode = 0444, \
+	  .v_type = AA_SFS_TYPE_BOOLEAN_INTPRINT, .v.boolean = (_value), \
+	  .file_ops = &aa_sfs_seq_file_ops }
 #define AA_SFS_FILE_STRING(_name, _value) \
 	{ .name = (_name), .mode = 0444, \
 	  .v_type = AA_SFS_TYPE_STRING, .v.string = (_value), \
-- 
2.43.0
base-kernel: Ubuntu-6.14.0-7.7
target: Ubuntu-kernel

