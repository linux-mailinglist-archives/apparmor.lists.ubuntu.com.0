Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FAA4EEE6
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJN-0002pc-PB; Tue, 04 Mar 2025 20:56:21 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJM-0002oI-3r
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:20 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2EEEF3FCC9
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:19 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-223f3357064so917015ad.3
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121777; x=1741726577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dj02Zwr30EMsSiw40uCYRMQccVTJwIY6Amg40GuHV/Y=;
 b=FQF9AE58KkCb1DzGJmaurEIxdAuY1BAhcnpk6HoMMwR6+9eYAz5GiaKG+uD0xLvwnH
 zxfG9jdOoelnYjlCKFIwBQ7HwxEaS5iw5NMIYt1T+KzNhtYVV2ullDTjNkXHOitVT7Ds
 WUPrzpDiFjc1UPo+B/rVgwWZx+Emvz0LizeqsZ3XeGHkmB+7Z747zEiUxYTtORTI0O8r
 qmHkbhI0G9O8w4Cuy8TjPAZywgN8Rs9y45xy0+5ygevHPWdRoLixYB3V8pZ64UYL5lAO
 UwFAxd1l83yfMF37eP1E2kMcbvK3Kkn+xj2HWk8u2fHuHq4z1HSp+q8J0FbAMq13JFJh
 uDEA==
X-Gm-Message-State: AOJu0YzgPT9JwIQi6t6vc6ZX+zKpEJYc8iB0t/EFnG3qNwpz489Kv5nm
 M4zhJoFyv/EdY4zWOMk0BwpD347e+HbIFgFdJnSdFYvztCyBx4jCQ88zbhEAcT0Vk9GYkMr5ESW
 EzsSeANl+To9WXfZowbUw8bM33VAUyDjskwPpWH5j4KxGTb+D8Pw+tVzG3gjIGN/RlPDkUCmtNF
 2NQnVHPw==
X-Gm-Gg: ASbGncsDHmW796NXygHFZq+Og7vYmSVPqjr6dePZ3VGlKr0yKFZwSWkR6vb0EqJ8EvM
 nIBNZ2Zz2agPrhUB96vwJu6nm9NFePAMN8vkFJALOql/5GvUL0Y/NQ7JlO2ryuWJNZOy1DYFmeb
 YI1O8F69Jfn840KvX9M/RKWAlsOsCTO6cL4nRF8OPIPUg6FicPglbB+2oqq92YElczCp/9H5LqJ
 9bAFfGoEkzCD2lwQ7Udzd4bUKuS1b20VF5tY/wv0WIqlC3ziXFahAMUhIgVeTlZollCPhXOQxUH
 mF9nTUL/iEiwcIi6SXVFBkdWOnFAG6rB7YpluC4bbiNW+3jmKZ6OEBdKH03egcYT1uwIU+c=
X-Received: by 2002:aa7:88c1:0:b0:736:6279:ca25 with SMTP id
 d2e1a72fcca58-73682cda337mr523438b3a.24.1741121777101; 
 Tue, 04 Mar 2025 12:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8xnycePXyPBh99T8aFi+5YOOEV49nCyhZv4mBYvKw9PrC4MMFtlzDBNll15qnAqohh4qBcA==
X-Received: by 2002:aa7:88c1:0:b0:736:6279:ca25 with SMTP id
 d2e1a72fcca58-73682cda337mr523411b3a.24.1741121776779; 
 Tue, 04 Mar 2025 12:56:16 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:16 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:53 -0800
Message-ID: <20250304205556.290042-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 4/5] apparmor: don't bail early in mount on
	disconnected paths in complain mode
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

This is the analogous change to profile_path_perm in an earlier patch of
this patchset, except for the mount mediation functions.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/mount.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 21c933dc469c..9f6006a35965 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -326,7 +326,7 @@ static int match_mnt_path_str(const struct cred *subj_cred,
 	error = aa_path_name(mntpath, path_flags(profile, mntpath),
 			     COMPLAIN_MODE(profile), buffer,
 			     &mntpnt, &info, profile->disconnected);
-	if (error)
+	if (error && !COMPLAIN_MODE(profile))
 		goto audit;
 	if (IS_ERR(devname)) {
 		error = PTR_ERR(devname);
@@ -388,7 +388,7 @@ static int match_mnt(const struct cred *subj_cred,
 				     COMPLAIN_MODE(profile),
 				     devbuffer, &devname, &info,
 				     profile->disconnected);
-		if (error)
+		if (error && !COMPLAIN_MODE(profile))
 			devname = ERR_PTR(error);
 	}
 
@@ -623,7 +623,7 @@ static int profile_umount(const struct cred *subj_cred,
 	error = aa_path_name(path, path_flags(profile, path),
 			     COMPLAIN_MODE(profile), buffer, &name,
 			     &info, profile->disconnected);
-	if (error)
+	if (error && !COMPLAIN_MODE(profile))
 		goto audit;
 
 	state = aa_dfa_match(rules->policy->dfa,
@@ -692,13 +692,13 @@ static struct aa_label *build_pivotroot(const struct cred *subj_cred,
 			     COMPLAIN_MODE(profile),
 			     old_buffer, &old_name, &info,
 			     profile->disconnected);
-	if (error)
+	if (error && !COMPLAIN_MODE(profile))
 		goto audit;
 	error = aa_path_name(new_path, path_flags(profile, new_path),
 			     COMPLAIN_MODE(profile),
 			     new_buffer, &new_name, &info,
 			     profile->disconnected);
-	if (error)
+	if (error && !COMPLAIN_MODE(profile))
 		goto audit;
 
 	error = -EACCES;
-- 
2.43.0


