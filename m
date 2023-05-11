Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38C70000D
	for <lists+apparmor@lfdr.de>; Fri, 12 May 2023 07:55:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pxLkW-0001FY-7N; Fri, 12 May 2023 05:55:28 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cgzones@googlemail.com>) id 1px7FX-0005xP-PF
 for apparmor@lists.ubuntu.com; Thu, 11 May 2023 14:26:31 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-50bc394919cso12966416a12.2
 for <apparmor@lists.ubuntu.com>; Thu, 11 May 2023 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1683815191; x=1686407191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FfHvJaE373FwPkBo+MbvKKH9vrJm6j2m01pppMLR2Fs=;
 b=n9Y7Em7SkB9orYrAbcCUvQXxkKi727MiQdFajf4HlIYSHX2PG9dMO34uyKqJrZ5cit
 i4+wO58Ror05WSxbokgiqseHvrBbqqie2cxX7KTFU071x1BQhSh+2dEnOHgunVWzaPOO
 IQvNEKYfRGf05i3DNDX88Njr55+onoL6F2nnpPjanz16zRSjfQdZj6yyRVqiQrzImILd
 Z/OWXk2gkmISUByuBUlZnuNGfbmO4N9WHTkesGj3dEgnTkcJmbXkIqjAHdpjSzgn8YLm
 wTv3jqTgBm+oKURueLWtI94wjqxO2TmC1YXk9er+4EojpU1xst3Cr6Jg+XEtf2oScBgM
 odyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815191; x=1686407191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfHvJaE373FwPkBo+MbvKKH9vrJm6j2m01pppMLR2Fs=;
 b=kKBcvkzDOgAYi4IzYjsiMaegbcP8kiopI8+olyLIsCXxYKhvLRg8oAGaOFmgnudUoq
 LETr//2ZdOGekJhjxrrJb8Y7NygTZYL5YjLYXofJgR/vpyNR1UAeVU1gL4bDyebrPUVs
 wpCzybhV+uc9FYhWVA6yHeWvewQ7W6I8EjM/z8DfFk1FglmTk9ZT3nZPNSI9dK9KcpSH
 l5qnwJXjvkBSMysBeo3Dkc6VcFhCrqx/Wq6nuBWakVsfxTLMB4fWltdBiACfNZhCA41G
 77HIlV8Zm2F3e2C4eDvF0GRYIcTK3RzZW3GA1QF+AvO0qB1m6eFwpO7xPEgMwD1gP+03
 KYZQ==
X-Gm-Message-State: AC+VfDytmFV4RctHjLODp+cnVnHHWaLxipL+4IQkUvIhy/7NPSXOsH52
 roVeMynzHdMNNL2HyNA+6oM=
X-Google-Smtp-Source: ACHHUZ5y1zkVgoN4BZ0TJw5mvRpA0PrhNACP4gefsO5AZ+PYeLklJn3cCj9SPGF8TNfMkgAfKB6DEQ==
X-Received: by 2002:a17:907:a46:b0:94f:2b80:f3b4 with SMTP id
 be6-20020a1709070a4600b0094f2b80f3b4mr17315061ejc.69.1683815190662; 
 Thu, 11 May 2023 07:26:30 -0700 (PDT)
Received: from debianHome.localdomain
 (dynamic-077-008-180-228.77.8.pool.telefonica.de. [77.8.180.228])
 by smtp.gmail.com with ESMTPSA id
 hf15-20020a1709072c4f00b0094f58a85bc5sm4056647ejc.180.2023.05.11.07.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:26:29 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Date: Thu, 11 May 2023 16:25:24 +0200
Message-Id: <20230511142535.732324-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.53;
 envelope-from=cgzones@googlemail.com; helo=mail-ed1-f53.google.com
X-Mailman-Approved-At: Fri, 12 May 2023 05:55:26 +0000
Subject: [apparmor] [PATCH v4 1/9] capability: introduce new capable flag
	NODENYAUDIT
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-security-module@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>,
 apparmor@lists.ubuntu.com, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Micah Morton <mortonm@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Eric Paris <eparis@parisplace.org>, bpf@vger.kernel.org,
 =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
 Frederick Lawler <fred@cloudflare.com>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Introduce a new capable flag, CAP_OPT_NODENYAUDIT, to not generate
an audit event if the requested capability is not granted.  This will be
used in a new capable_any() functionality to reduce the number of
necessary capable calls.

Handle the flag accordingly in AppArmor and SELinux.

Suggested-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 include/linux/security.h       |  2 ++
 security/apparmor/capability.c |  8 +++++---
 security/selinux/hooks.c       | 14 ++++++++------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index e2734e9e44d5..629c775ec297 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -67,6 +67,8 @@ struct watch_notification;
 #define CAP_OPT_NOAUDIT BIT(1)
 /* If capable is being called by a setid function */
 #define CAP_OPT_INSETID BIT(2)
+/* If capable should audit the security request for authorized requests only */
+#define CAP_OPT_NODENYAUDIT BIT(3)
 
 /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
 #define SECURITY_LSM_NATIVE_LABELS	1
diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
index 326a51838ef2..98120dd62ca7 100644
--- a/security/apparmor/capability.c
+++ b/security/apparmor/capability.c
@@ -108,7 +108,8 @@ static int audit_caps(struct common_audit_data *sa, struct aa_profile *profile,
  * profile_capable - test if profile allows use of capability @cap
  * @profile: profile being enforced    (NOT NULL, NOT unconfined)
  * @cap: capability to test if allowed
- * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
+ * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether audit
+ *	record is generated
  * @sa: audit data (MAY BE NULL indicating no auditing)
  *
  * Returns: 0 if allowed else -EPERM
@@ -126,7 +127,7 @@ static int profile_capable(struct aa_profile *profile, int cap,
 	else
 		error = -EPERM;
 
-	if (opts & CAP_OPT_NOAUDIT) {
+	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && error)) {
 		if (!COMPLAIN_MODE(profile))
 			return error;
 		/* audit the cap request in complain mode but note that it
@@ -142,7 +143,8 @@ static int profile_capable(struct aa_profile *profile, int cap,
  * aa_capable - test permission to use capability
  * @label: label being tested for capability (NOT NULL)
  * @cap: capability to be tested
- * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
+ * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether audit
+ *	record is generated
  *
  * Look up capability in profile capability set.
  *
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 79b4890e9936..0730edf2f5f1 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1571,7 +1571,7 @@ static int cred_has_capability(const struct cred *cred,
 	u16 sclass;
 	u32 sid = cred_sid(cred);
 	u32 av = CAP_TO_MASK(cap);
-	int rc;
+	int rc, rc2;
 
 	ad.type = LSM_AUDIT_DATA_CAP;
 	ad.u.cap = cap;
@@ -1590,11 +1590,13 @@ static int cred_has_capability(const struct cred *cred,
 	}
 
 	rc = avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
-	if (!(opts & CAP_OPT_NOAUDIT)) {
-		int rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
-		if (rc2)
-			return rc2;
-	}
+	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && rc))
+		return rc;
+
+	rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
+	if (rc2)
+		return rc2;
+
 	return rc;
 }
 
-- 
2.40.1


