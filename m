Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54887CC6F
	for <lists+apparmor@lfdr.de>; Fri, 15 Mar 2024 12:39:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rl5tt-0005JH-Dj; Fri, 15 Mar 2024 11:39:01 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <cgzones@googlemail.com>)
 id 1rl5tq-0005J7-Kn
 for apparmor@lists.ubuntu.com; Fri, 15 Mar 2024 11:38:58 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-568a3292916so1984176a12.1
 for <apparmor@lists.ubuntu.com>; Fri, 15 Mar 2024 04:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710502738; x=1711107538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ret+NQ/Tw5LK56vjyJDNxqW8M+4jtEPqZMI9umR9cCI=;
 b=O60FGfvP+yNra/3Tujub6ukErb1waFKWIx+DkB36vzUWeKeb68JH7bxL95jBjtpCK6
 cA507fcqEc+p0g6l4BpTjGlLm9qWOmi3McEKA4I/J7K/hDiL7J/vF+h+NTjB05QMkaeF
 jPXGybB8bWIZNtW2xhoSqjZkcjfmtf3WAkOqpB1uraCss3xj4Oi32mT391k3YbrihQuL
 e6L26/i7IIA7IhKwAbSAHavWGQ9ht8iTCQsB7hGEVzmr8k9pfPCNLgGsKzGKqHVb21Ba
 DrkDySiAkOxrS4s7zN0Zuqt4ZG3zg6U1UNXIq04M2+6tDvEXz5J1DgKeX0L0M4uLMm/v
 ln9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/EnhdftcJSTU7WjXyplS3pr3XGhlo2bCm2w8DWsmjyE06TwD3+2P2nyEwrrlHAyBgVVTuVuYB8CdYXHLqU1Au0Eui6lgaJ/4O
X-Gm-Message-State: AOJu0YwLVAJ/BFD8vFjXFLo2356X+ZigcxKlulZs3TuAMAt5SIKudi1V
 Q2Gr9KEWr7/DApb0Biv1LQjB0M9ZNYVEYOnS8NGMUZcq0x77/BBN
X-Google-Smtp-Source: AGHT+IHxB7FB377TOoio0unYbfIwnkxt4g5n3Z4MDqCqa7L7No5w/MvY3FrF55UMKEirChoiUMRGJg==
X-Received: by 2002:a05:6402:530a:b0:568:797a:f2d with SMTP id
 eo10-20020a056402530a00b00568797a0f2dmr2968341edb.27.1710502737191; 
 Fri, 15 Mar 2024 04:38:57 -0700 (PDT)
Received: from ddev.DebianHome
 (dynamic-095-119-217-226.95.119.pool.telefonica.de. [95.119.217.226])
 by smtp.gmail.com with ESMTPSA id
 fg3-20020a056402548300b005682f47aea7sm1610024edb.94.2024.03.15.04.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:38:56 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 15 Mar 2024 12:37:22 +0100
Message-ID: <20240315113828.258005-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.49;
 envelope-from=cgzones@googlemail.com; helo=mail-ed1-f49.google.com
Subject: [apparmor] [PATCH 01/10] capability: introduce new capable flag
	CAP_OPT_NOAUDIT_ONDENY
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
Cc: Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-block@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Introduce a new capable flag, CAP_OPT_NOAUDIT_ONDENY, to not generate
an audit event if the requested capability is not granted.  This will be
used in a new capable_any() functionality to reduce the number of
necessary capable calls.

Handle the flag accordingly in AppArmor and SELinux.

CC: linux-block@vger.kernel.org
Suggested-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
v5:
   rename flag to CAP_OPT_NOAUDIT_ONDENY, suggested by Serge:
     https://lore.kernel.org/all/20230606190013.GA640488@mail.hallyn.com/
---
 include/linux/security.h       |  2 ++
 security/apparmor/capability.c |  8 +++++---
 security/selinux/hooks.c       | 14 ++++++++------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 41a8f667bdfa..c60cae78ff8b 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -70,6 +70,8 @@ struct lsm_ctx;
 #define CAP_OPT_NOAUDIT BIT(1)
 /* If capable is being called by a setid function */
 #define CAP_OPT_INSETID BIT(2)
+/* If capable should audit the security request for authorized requests only */
+#define CAP_OPT_NOAUDIT_ONDENY BIT(3)
 
 /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
 #define SECURITY_LSM_NATIVE_LABELS	1
diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 9934df16c843..08c9c9a0fc19 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -108,7 +108,8 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
  * profile_capable - test if profile allows use of capability @cap
  * @profile: profile being enforced    (NOT NULL, NOT unconfined)
  * @cap: capability to test if allowed
- * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
+ * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NOAUDIT_ONDENY bit determines whether audit
+ *	record is generated
  * @ad: audit data (MAY BE NULL indicating no auditing)
  *
  * Returns: 0 if allowed else -EPERM
@@ -126,7 +127,7 @@ static int profile_capable(struct aa_profile *profile, int cap,
 	else
 		error = -EPERM;
 
-	if (opts & CAP_OPT_NOAUDIT) {
+	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NOAUDIT_ONDENY) && error)) {
 		if (!COMPLAIN_MODE(profile))
 			return error;
 		/* audit the cap request in complain mode but note that it
@@ -143,7 +144,8 @@ static int profile_capable(struct aa_profile *profile, int cap,
  * @subj_cred: cred we are testing capability against
  * @label: label being tested for capability (NOT NULL)
  * @cap: capability to be tested
- * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
+ * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NOAUDIT_ONDENY bit determines whether audit
+ *	record is generated
  *
  * Look up capability in profile capability set.
  *
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 3448454c82d0..1a2c7c1a89be 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1624,7 +1624,7 @@ static int cred_has_capability(const struct cred *cred,
 	u16 sclass;
 	u32 sid = cred_sid(cred);
 	u32 av = CAP_TO_MASK(cap);
-	int rc;
+	int rc, rc2;
 
 	ad.type = LSM_AUDIT_DATA_CAP;
 	ad.u.cap = cap;
@@ -1643,11 +1643,13 @@ static int cred_has_capability(const struct cred *cred,
 	}
 
 	rc = avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
-	if (!(opts & CAP_OPT_NOAUDIT)) {
-		int rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
-		if (rc2)
-			return rc2;
-	}
+	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NOAUDIT_ONDENY) && rc))
+		return rc;
+
+	rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
+	if (rc2)
+		return rc2;
+
 	return rc;
 }
 
-- 
2.43.0


