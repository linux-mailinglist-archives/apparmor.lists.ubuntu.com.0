Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E2799911EE3
	for <lists+apparmor@lfdr.de>; Fri, 21 Jun 2024 10:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sKZkY-0004af-2Z; Fri, 21 Jun 2024 08:36:02 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1sKIg7-0004wi-W5
 for apparmor@lists.ubuntu.com; Thu, 20 Jun 2024 14:22:20 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so3384017a12.0
 for <apparmor@lists.ubuntu.com>; Thu, 20 Jun 2024 07:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718893339; x=1719498139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GvxuvoBqoE/GY1YheFb9DI1s4W2tvYezeKtzJ7T24dY=;
 b=JqVu9qsckATxf8ttBiPTUov4morTdKRn7oFQF4vtH9kN1gAvER5gSLipkOVz84BkKw
 A/KMEdwzhzt486ajYQfFoL0xj7n4O8Gb9v8Nd2qSC3Qd1JgNbmPjrTUdunZ1k52nI2Rh
 9N0Wcpf+KnLan/47VegTT0wMPZb4/Jg6L2eXdzrZdYp1OLwuvzGtr7rNIIWo05+0CBbN
 dGP++sCIK/fzh0Mk4ttTrm4r04idO0STao2zmfZN0GMyz5KIYNjXcgLqgZ2c5cy6+oYM
 CTRxANx02mMrym/DEKIIFTC4xbVh0Zfczk6Sbf4CdUCfddtIxe7VKXi8cmERXGQCILwJ
 zRSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjOt7XnGIIxmdkfMD5QkJYSUCF6AiCHgds4uyJyYDYXK42SUFQfNzOZrKVmcqPIwrVotD4lhWuF2VuTMIwOdCKKE+hU4YSy7i8
X-Gm-Message-State: AOJu0Yw5QIlyFlryup0WHDJn3Yk8CCvdZm+ZkB+kein3DTOatZaePlvh
 CBhT+8ilgIkdsD6N3Lq5NCxQvh37IXdeuupy2p8vJn17wbNnvqV6HACPvFMh
X-Google-Smtp-Source: AGHT+IEqnJp1SNZXbYGPZ0xa9ovKenpl+H5Wg16kK3FxOFIVW8FaphRKTrag0JDQQqPQVJ6VlHxa9w==
X-Received: by 2002:a17:907:a645:b0:a62:49ae:cd7b with SMTP id
 a640c23a62f3a-a6fa438df9fmr358825866b.24.1718889332198; 
 Thu, 20 Jun 2024 06:15:32 -0700 (PDT)
Received: from f.. (cst-prg-30-39.cust.vodafone.cz. [46.135.30.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f881fbdfcsm370454266b.121.2024.06.20.06.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 06:15:31 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: john.johansen@canonical.com
Date: Thu, 20 Jun 2024 15:15:24 +0200
Message-ID: <20240620131524.156312-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.54; envelope-from=mjguzik@gmail.com;
 helo=mail-ed1-f54.google.com
X-Mailman-Approved-At: Fri, 21 Jun 2024 08:36:00 +0000
Subject: [apparmor] [PATCH] apparmor: try to avoid refing the label in
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

It can be done in the common case.

A 24-way open1_processes from will-it-scale (separate file open) shows:
  29.37%  [kernel]           [k] apparmor_file_open
  26.84%  [kernel]           [k] apparmor_file_alloc_security
  26.62%  [kernel]           [k] apparmor_file_free_security
   1.32%  [kernel]           [k] clear_bhb_loop

apparmor_file_open is eliminated from the profile with the patch.

Throughput (ops/s):
before:	6092196
after:	8309726 (+36%)

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

I think this is a worthwhile touch up regardless of what happens with
label refcouting in the long run. It does not of course does not fully
fix the problem.

I concede the naming is not consistent with other stuff in the file and
I'm not going to argue about it -- happy to name it whatever as long as
the problem is sorted out.

Am I missing something which makes the approach below not work to begin
with?

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


