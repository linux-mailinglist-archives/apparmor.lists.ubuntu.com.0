Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C392D490
	for <lists+apparmor@lfdr.de>; Wed, 10 Jul 2024 16:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRYhe-000693-5X; Wed, 10 Jul 2024 14:53:54 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <yisooan.dev@gmail.com>)
 id 1sR1D5-0000IL-Ji
 for apparmor@lists.ubuntu.com; Tue, 09 Jul 2024 03:08:07 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5c6639b34fcso1671718eaf.2
 for <apparmor@lists.ubuntu.com>; Mon, 08 Jul 2024 20:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720494486; x=1721099286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PwwuYSXB90fKktmKvx7XHMxW0xqHEFFAvhcbieHh5ZM=;
 b=QbC3DzuwkjK4NqxoQGE3lii1gI7j3jkzhLxFRaRQ5anKOStyc6kHlm6VZr8n+FL0aw
 D7VQXHl4bK+Owd+pZtxIZ1NNvIbb1n2RzpGz6z97mXxJZ/F3chT4CuvtL80wt3BvJ5KM
 tpbW6xTZx+1IGcskOyZjownZrBMtzacZQVvMlag+HG09IZW1uZqLblT8ZpcXLcB9E3tS
 t6VPMwMtxaOhetXFXFEOEN7s4Q10nz5+7hU7IXq09lkiccEtkv7lI++s1Xo/u942qy7c
 WG/IhHrditC3m4i0ro9dTpaB3EH2HE7pHa89fmXN5MPLGHI6jxYPcrc7kRFmHy/8mHBw
 iXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzWX0Vx4vlpnOcWrTNJmSSxLAnHu1lQXjmafJiCYzzPA+k5GhoyG/aZxdsULl73U5/dL2GyksuwtzUsI0EOdmF5/Kmsbf7/2aP
X-Gm-Message-State: AOJu0YzpFPMKzLR47zaT0rSXf6Ja4OTwm062pUCmesMTKtw0ku7715vn
 cvCkI9xmXi/P2yjCvDOpr1f+ZGgO2n6BfJhIBlogU25SbWZ0/+oa
X-Google-Smtp-Source: AGHT+IG4PZquzeh4SNLSzENKHm6x9p4wfSaWPtdDgVG+sfwxGbHHf4Ew64OpCozvb5F3dAFFjN23vQ==
X-Received: by 2002:a05:6358:6f97:b0:1a6:2c4d:c902 with SMTP id
 e5c5f4694b2df-1aade29aa01mr131953155d.19.1720494486049; 
 Mon, 08 Jul 2024 20:08:06 -0700 (PDT)
Received: from SYSOS.. ([115.178.65.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a97c275sm8962088a91.25.2024.07.08.20.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 20:08:05 -0700 (PDT)
From: Leesoo Ahn <lsahn@ooseel.net>
X-Google-Original-From: Leesoo Ahn <lsahn@wewakecorp.com>
To: lsahn@ooseel.net
Date: Tue,  9 Jul 2024 12:07:51 +0900
Message-Id: <20240709030751.3825748-1-lsahn@wewakecorp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.161.48; envelope-from=yisooan.dev@gmail.com;
 helo=mail-oo1-f48.google.com
X-Mailman-Approved-At: Wed, 10 Jul 2024 14:53:53 +0000
Subject: [apparmor] [PATCH] apparmor: domain: clean up duplicated parts of
	handle_onexec()
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
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 Leesoo Ahn <lsahn@wewakecorp.com>, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Regression test of AppArmor finished without any failures.

PASSED: aa_exec access attach_disconnected at_secure introspect capabilities
changeprofile onexec changehat changehat_fork changehat_misc chdir clone
coredump deleted e2e environ exec exec_qual fchdir fd_inheritance fork i18n
link link_subset mkdir mmap mount mult_mount named_pipe namespaces net_raw
open openat pipe pivot_root posix_ipc ptrace pwrite query_label regex rename
readdir rw socketpair swap sd_flags setattr symlink syscall sysv_ipc tcp
unix_fd_server unix_socket_pathname unix_socket_abstract unix_socket_unnamed
unix_socket_autobind unlink userns xattrs xattrs_profile longpath nfs
exec_stack aa_policy_cache nnp stackonexec stackprofile
FAILED:
make: Leaving directory '/apparmor/tests/regression/apparmor'

Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
---
 security/apparmor/domain.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 571158ec6188..b73e01b512c2 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -822,33 +822,18 @@ static struct aa_label *handle_onexec(const struct cred *subj_cred,
 	AA_BUG(!bprm);
 	AA_BUG(!buffer);
 
-	if (!stack) {
-		error = fn_for_each_in_ns(label, profile,
-				profile_onexec(subj_cred, profile, onexec, stack,
-					       bprm, buffer, cond, unsafe));
-		if (error)
-			return ERR_PTR(error);
-		new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
-				aa_get_newest_label(onexec),
-				profile_transition(subj_cred, profile, bprm,
-						   buffer,
-						   cond, unsafe));
-
-	} else {
-		/* TODO: determine how much we want to loosen this */
-		error = fn_for_each_in_ns(label, profile,
-				profile_onexec(subj_cred, profile, onexec, stack, bprm,
-					       buffer, cond, unsafe));
-		if (error)
-			return ERR_PTR(error);
-		new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
-				aa_label_merge(&profile->label, onexec,
-					       GFP_KERNEL),
-				profile_transition(subj_cred, profile, bprm,
-						   buffer,
-						   cond, unsafe));
-	}
+	/* TODO: determine how much we want to loosen this */
+	error = fn_for_each_in_ns(label, profile,
+			profile_onexec(subj_cred, profile, onexec, stack,
+				       bprm, buffer, cond, unsafe));
+	if (error)
+		return ERR_PTR(error);
 
+	new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
+			stack ? aa_label_merge(&profile->label, onexec, GFP_KERNEL)
+			      : aa_get_newest_label(onexec),
+			profile_transition(subj_cred, profile, bprm,
+					   buffer, cond, unsafe));
 	if (new)
 		return new;
 
-- 
2.34.1


