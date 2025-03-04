Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B226A4EEE4
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJK-0002n4-JO; Tue, 04 Mar 2025 20:56:18 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJJ-0002mB-7F
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:17 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8FA723F47C
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:16 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22368a8979cso78902775ad.2
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121775; x=1741726575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hYEqpe2fRa1bm+XJYZwh5YvpLjwUfX3KYcK195EiGI=;
 b=pJ+uVNMlLIm7PU2Ns2tbeS45IRHb6cv9F74f3va1RZarf3+hxWBwVurgZCL4x8P4U3
 bsiQOJQtezgrMBbyfpadb09K4xeCKS8ER0v+JcR3R0R/qDv5+UxcpVfMo5fyG5/2bpzR
 m8xxG/2Mt9M4DLedaZzfibHnBJ/0M1nNSar9B4qCaFyUSeecp2w9AfKosakH8n60gzmd
 sU15RDXxUBwFHWAxCgaLXON/zOTQdKazd+PyHEuhPURk5/d7rLU5UiDjFVF4DwhGTZF4
 +5XuYfmSnHBjZWIFVSCxIaX6wJ+W1l6bdtCkRKZwoXmeqRVgqoEeTGLE33f3KzjfRc/T
 BhhA==
X-Gm-Message-State: AOJu0YzRmgw0BjxZ47+QpcQlC6JD0n16vEus5AGM7Kj7qZcWBrn7+yru
 x2OXDyeCqQRmMAivwlLB1xCGKpBMibdKQZPs0ygkeZy+qoU4nprMR6axONE/kGgggraTX8pZGUq
 B30vFZZajLxzMYNewGYNmaCqL/odSUFQkb5UiR9ILaoyYiYatopFBtg8RMWTsGvmfAP+g5lNRR1
 snNXBobA==
X-Gm-Gg: ASbGncvwIwfckq7dqCN8eMaY3A5ak+Ki9ej+8jiWRiU3CAoqfYXiX949dUm+/5Grk4c
 Z6jE/eLqL0Jlrf7YHCYxvRvDUXuJp5je6ABE1WrUVwTf2x3in9Ef7fcRarM/PmWWSN16dd1ubpL
 t1KM+ZznxBgcfqv9+n1rl3Ca7q22MQYGrCxB3AJDt80s+CxotlMMaMWoSIMgt9KmQmqFOkQTpBQ
 JOK5+nsgsO7QkS2WITEayJvai9gbxrwNSkPoBTqe0AFgPPsfxnmnmX2iXZxh4su6zdsRY4EJ6gr
 hyod4rDHy6kAt8WqUjRMXZrKH5k5c5wrmelARLlDcGhe9uo7ye6Ht8gWemI8NdobkP9IbjI=
X-Received: by 2002:a05:6a21:178a:b0:1f3:1b78:ceb9 with SMTP id
 adf61e73a8af0-1f349463713mr764813637.5.1741121775024; 
 Tue, 04 Mar 2025 12:56:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPwo8UDbuVoWXxnqv217QBFxrHt6FaX4Wzt5DdUWWZeiq+gZXQsd6c9L/aVbD6q6mKbrpNYQ==
X-Received: by 2002:a05:6a21:178a:b0:1f3:1b78:ceb9 with SMTP id
 adf61e73a8af0-1f349463713mr764796637.5.1741121774670; 
 Tue, 04 Mar 2025 12:56:14 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:14 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:52 -0800
Message-ID: <20250304205556.290042-4-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 3/5] apparmor: create new learning profile in
	complain mode upon disconnect exec
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

Trying to execute a binary located at a disconnected path (e.g. through
execveat() with AT_EMPTY_PATH) would result in a permission denial due to
a path lookup failure, even when in complain mode. Instead, create a new
learning profile, as would be done for any other complain mode execution
of a binary not covered by a profile's execution rules. Because of the
path aliasing that can occur in situations with disconnected paths, do not
behave as if attach_disconnected was specified as a profile flag (unless,
of course, the loaded profile itself has that flag set).

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 9703ec2bfa78..eaf8baa743f3 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -661,6 +661,13 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 			AA_DEBUG(DEBUG_DOMAIN, "name lookup ix on error");
 			error = 0;
 			new = aa_get_newest_label(&profile->label);
+		} else if (COMPLAIN_MODE(profile)) {
+			AA_DEBUG(DEBUG_DOMAIN, "name lookup ix on error");
+			error = 0;
+
+			name = bprm->filename;
+			// TODO: helper function to detangle control flow (?)
+			goto create_learning_profile;
 		}
 		name = bprm->filename;
 		goto audit;
@@ -837,7 +844,7 @@ static struct aa_label *handle_onexec(const struct cred *subj_cred,
 		error = fn_for_each_in_ns(label, profile,
 				profile_onexec(subj_cred, profile, onexec, stack,
 					       bprm, buffer, cond, unsafe));
-		if (error)
+		if (error && !COMPLAIN_MODE(profile))
 			return ERR_PTR(error);
 		new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
 				aa_get_newest_label(onexec),
@@ -850,7 +857,7 @@ static struct aa_label *handle_onexec(const struct cred *subj_cred,
 		error = fn_for_each_in_ns(label, profile,
 				profile_onexec(subj_cred, profile, onexec, stack, bprm,
 					       buffer, cond, unsafe));
-		if (error)
+		if (error && !COMPLAIN_MODE(profile))
 			return ERR_PTR(error);
 		new = fn_label_build_in_ns(label, profile, GFP_KERNEL,
 				aa_label_merge(&profile->label, onexec,
@@ -860,17 +867,28 @@ static struct aa_label *handle_onexec(const struct cred *subj_cred,
 						   cond, unsafe));
 	}
 
-	if (new)
-		return new;
-
-	/* TODO: get rid of GLOBAL_ROOT_UID */
-	error = fn_for_each_in_ns(label, profile,
+	/*
+	 * error should only be set at this point if we're complain mode
+	 * Any remaining error after this block would be an error in the
+	 * auditing process itself, which we'd want to bubble up
+	 */
+	if (error) {
+		/* TODO: get rid of GLOBAL_ROOT_UID */
+		error = fn_for_each_in_ns(label, profile,
 			aa_audit_file(subj_cred, profile, &nullperms,
 				      OP_CHANGE_ONEXEC,
 				      AA_MAY_ONEXEC, bprm->filename, NULL,
 				      onexec, GLOBAL_ROOT_UID,
 				      "failed to build target label", -ENOMEM, false));
-	return ERR_PTR(error);
+	}
+	if (error) {
+		// Decrement refcount on any learning profile created earlier
+		aa_put_label(new);
+		return ERR_PTR(error);
+	}
+
+	AA_BUG(!new);
+	return new;
 }
 
 /**
-- 
2.43.0


