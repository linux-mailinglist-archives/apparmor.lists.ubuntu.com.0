Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 37057911EE5
	for <lists+apparmor@lfdr.de>; Fri, 21 Jun 2024 10:36:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sKZkX-0004aB-No; Fri, 21 Jun 2024 08:36:01 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1sKMdg-0005rx-8z
 for apparmor@lists.ubuntu.com; Thu, 20 Jun 2024 18:36:04 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-35f06861ae6so960494f8f.2
 for <apparmor@lists.ubuntu.com>; Thu, 20 Jun 2024 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718908563; x=1719513363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aYg/fQs2+kuc4laJDOi7nR98E30rR5KMEuEzLwwwI/U=;
 b=kK3PKEmwJ4orBeBIdZFBdil7XuL0kuHen5ZGKTkumnyuKR+v+LhPfgILM/6xkas1Gu
 RaxIWYbsgKTHPPHi6mvJw9MhOJuhsnEJz2KrtYJ0VNMT6kLXYk5nD+fo7w4jYXqJ+/1M
 JNFuCVNBmrLhuRj9FYW3FecGd8nlr310L4PNUJbWjPzH70CTEdN/tySiWvL+UPUgyOHS
 WIVWDFnzejiUMU/kTgFrAZYcfRnBi6gM6kHZjfu9K5R93bV3WyhEAnN9BHOUZBBNiZRF
 tGfjDZounkdxnjldt6t5lQvY2vHKE9vSRx9A7MIb60KBS7CBi2pfNEQiIeR4avEX0+o0
 qR0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA8F4KbfsOVbMYhRgbzoHJ9CTSUqGG/+nnwcRPTMfLoW3xPkEqgaCm1K8f7xjcCp4vhAi0hgX5pxHGplkxzREfkfgZM8W56cIp
X-Gm-Message-State: AOJu0YzCY+J4Sc1OWTQ9YV1cp49G+cbJsh41dPaQkXh+jNMe/oRvzGZw
 SjBgX8E+dwZm6ul3krGtTwfdqc69YZ4Lh9zjLhDFX9iqgrgORUwEx/PDY8SZ
X-Google-Smtp-Source: AGHT+IEiryEnHRn0pakoC9f3F0xz4DDlqEixJnJvkaTjsTfaWq0cDwBI+U6mRxj1AIyUk52rmV5xKg==
X-Received: by 2002:a2e:80c9:0:b0:2eb:1ac4:c9cc with SMTP id
 38308e7fff4ca-2ec3cfe1c38mr35389951fa.52.1718903736064; 
 Thu, 20 Jun 2024 10:15:36 -0700 (PDT)
Received: from f.. (cst-prg-30-39.cust.vodafone.cz. [46.135.30.39])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cd449efd6sm6333746a12.45.2024.06.20.10.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 10:15:35 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: john.johansen@canonical.com
Date: Thu, 20 Jun 2024 19:15:27 +0200
Message-ID: <20240620171528.167997-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.42; envelope-from=mjguzik@gmail.com;
 helo=mail-wr1-f42.google.com
X-Mailman-Approved-At: Fri, 21 Jun 2024 08:36:00 +0000
Subject: [apparmor] [PATCH v2] apparmor: try to avoid refing the label in
	apparmor_file_open
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
Cc: Mateusz Guzik <mjguzik@gmail.com>, paul@paul-moore.com,
 Neeraj.Upadhyay@amd.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

apparmor: try to avoid refing the label in apparmor_file_open

If the label is not stale (which is the common case), the fact that the
passed file object holds a reference can be leverged to avoid the
ref/unref cycle. Doing so reduces performance impact of apparmor on
parallel open() invocations.

When benchmarking on a 24-core vm using will-it-scale's open1_process
("Separate file open"), the results are (ops/s):
before: 6092196
after:  8309726 (+36%)

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

v2:
- reword the commit message

If you want any changes made to it can you just do them on your own
accord? :) Will be faster for both of us than another mail trip.

 security/apparmor/include/cred.h | 20 ++++++++++++++++++++
 security/apparmor/lsm.c          |  5 +++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index 58fdc72af664..7265d2f81dd5 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -63,6 +63,26 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
 	return aa_get_newest_label(aa_cred_raw_label(cred));
 }
 
+static inline struct aa_label *aa_get_newest_cred_label_condref(const struct cred *cred,
+								bool *needput)
+{
+	struct aa_label *l = aa_cred_raw_label(cred);
+
+	if (unlikely(label_is_stale(l))) {
+		*needput = true;
+		return aa_get_newest_label(l);
+	}
+
+	*needput = false;
+	return l;
+}
+
+static inline void aa_put_label_condref(struct aa_label *l, bool needput)
+{
+	if (unlikely(needput))
+		aa_put_label(l);
+}
+
 /**
  * aa_current_raw_label - find the current tasks confining label
  *
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 2cea34657a47..4bf87eac4a56 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -461,6 +461,7 @@ static int apparmor_file_open(struct file *file)
 	struct aa_file_ctx *fctx = file_ctx(file);
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
 	if (!path_mediated_fs(file->f_path.dentry))
 		return 0;
@@ -477,7 +478,7 @@ static int apparmor_file_open(struct file *file)
 		return 0;
 	}
 
-	label = aa_get_newest_cred_label(file->f_cred);
+	label = aa_get_newest_cred_label_condref(file->f_cred, &needput);
 	if (!unconfined(label)) {
 		struct mnt_idmap *idmap = file_mnt_idmap(file);
 		struct inode *inode = file_inode(file);
@@ -494,7 +495,7 @@ static int apparmor_file_open(struct file *file)
 		/* todo cache full allowed permissions set and state */
 		fctx->allow = aa_map_file_to_perms(file);
 	}
-	aa_put_label(label);
+	aa_put_label_condref(label, needput);
 
 	return error;
 }
-- 
2.43.0


