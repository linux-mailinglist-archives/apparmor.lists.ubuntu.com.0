Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F88A5E2FA
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQ9z-0001xH-KP; Wed, 12 Mar 2025 17:46:27 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQ9y-0001x7-2R
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:26 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF6FC3F2C4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:25 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff68033070so183727a91.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801584; x=1742406384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwCO5wemFTino2FkomTY3zTjjWsUJKodmFiCaVEfVJs=;
 b=X5XZPxNOXKfFOz4SDWuFtIYG3pjrh/EaMr1mixivHLdeGIaAgTAuQnozATbvqKa9oN
 iXMnQSURXZoWZQgExOtmEIBeaw7GqH4TzX2PYKYEMurjtpwkWuyFIeZ90JqsQo6Amw+C
 3EVgPzwsVwB3u2gSkMmnCOGxWguOHg9QjZRtqUNBvhwLQK+GKxSNC7wCDN43RcSg863w
 mWLixYIthO16cqcLCOm1eNyvRmwFc5zzbF4Z9ACSQ/S4QvGKjYeAqHi2icvQpqfTm0WP
 M6OKW2ygLVFUNg3/saxl+qVoEDmQDShjTTCZ9y1dmu1umVZSpSKpQ2L2thHdE1ZUBmVy
 wn6A==
X-Gm-Message-State: AOJu0YyCfEBh32enDbNGCa5LoOnY6nFg8VhviVRiQkbV+WPoDkpAymfX
 L5D3NDWCLYycRdC/L1rpJ8F9zVJa1Og5tf/7ieV0lZrfm77aXfgC5+Khy8pk58z1onHD9CHeym8
 azcZy93h4cZLZvrbXMnUMRdPwBXecO7a7VkoNNXMT+ffUW0Kb8Ta2ttm9dsvyD/SxRFszkVhquH
 ErGm9oRw==
X-Gm-Gg: ASbGncuBDAbbQEnqAOvafrmQ90flvJctz3lP3p3dbzoumj1MFIjDnMSPdKzWn/xbnZr
 TSnlueeSKpL0UqEBWE9o6HywDhESZhYx4usAiNd2sf97yIak7HGut0Ktl7uCd56aMcCTB9WrTkn
 iM6ousGzIubl0zvZG/y1KuKgItxLmgjpgf1wAQVJyBGBWQIcc/a0UWwtvxbRtfuPNLPyrIAeQFS
 SpLa6cyK5RJ0xzkMsGJ4prWhia2OK+E79ZT5pug1Mxu2cm5oaeq/+8KvkRIrdXF/8MGiiKQhlo0
 ofjZksIL7kG/xi2CYZ351TzrCHFhg9BEtb8N7DrK3SWpkqWOj1xKWKUYU5tEhowHEjHlM6w=
X-Received: by 2002:a05:6a20:9f0a:b0:1f5:7eb5:72c7 with SMTP id
 adf61e73a8af0-1f58cbc5d79mr12732220637.29.1741801584458; 
 Wed, 12 Mar 2025 10:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUojI5Ma3h/Fn+V7UZuMmM0yVPPhG+i9uM2WL1prVLSzXXfEN8wc7/iOPL0qQNMhkPxEcP7g==
X-Received: by 2002:a05:6a20:9f0a:b0:1f5:7eb5:72c7 with SMTP id
 adf61e73a8af0-1f58cbc5d79mr12732195637.29.1741801584142; 
 Wed, 12 Mar 2025 10:46:24 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:23 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:46:01 -0700
Message-ID: <20250312174605.95563-4-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312174605.95563-1-ryan.lee@canonical.com>
References: <20250312174605.95563-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 3/5] apparmor: create new learning profile in
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

v1 -> v2: fix grammar nit identified by Christian Boltz

 security/apparmor/domain.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 9703ec2bfa78..e383f37a1536 100644
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
+	 * error should only be set at this point if we're in complain mode
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


