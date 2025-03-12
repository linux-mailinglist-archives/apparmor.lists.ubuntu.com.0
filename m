Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CFDA5E2FF
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQAD-000259-Hs; Wed, 12 Mar 2025 17:46:41 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQAB-00021X-CF
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:39 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D19C63F6C9
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:33 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-225429696a9so2916985ad.1
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801585; x=1742406385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dj02Zwr30EMsSiw40uCYRMQccVTJwIY6Amg40GuHV/Y=;
 b=mS4Yp6bcOebmEpplieQpfucjnsl2JAxEJfHPt2G2KZPbBK0JSaJsv/Onr8XBakaaWY
 Bbtv01Ei+12Rd5GzSGl9u7NJT92vcj4xSXLU0cWs34z4hzFDG8sxYwFHcOc4Bwg42sj0
 5L+PMVJE6C0SXsTQuvUS2Ft+Xlsb/zRb7wErv7pdC6pYg/1DYi7DdtddHhjGz62m9cYV
 67cf2QNC4im19GI/3gSCKygB2Sy3ywHCYxJg0V6B7g2kumfWlp7CJlx8L99XRz5YDyii
 2yZtKxYFqQrWbtnnOCxBuo0KQhskJ7eI8hdyWbq2eQBZFEpGPJArvr4XiqnXY3AXab40
 khzA==
X-Gm-Message-State: AOJu0YyDWn9gG83Up+ZqE2CKjLWtQL8fZE6tqft7CRgDQxeo0We4Txun
 pQxiIL+KxqA2Ae30jX8t6ebUA/8/SReugvZlDRWVieKTYJeQaKvrXCrZ8LNH4veoBTh89KYGNxv
 AA6xfBnMahXRT3jxvykaUDsoToiWIsrnLyIE8AbIEUitruOquZDlgMHJt1aluSDpP9rq/eu8rEC
 29l1GktQ==
X-Gm-Gg: ASbGncump3RP4X2Z0rQ3QnahW2dcz4cuht0j+poKX4Bb9+aodKWsieSaPk/cRjmFqzy
 2dWS6/PM5BMmvfUSQHDNV46txahx59ADY1jTX1gw7pI0Tv/ioMgZ37lGO8kgKLRYRkhZBG3BHLD
 YLw4CMlXrvN4HcpvsSHko5yz59qDxl/xqcmhTN/SjYcGYnyQUC+yD+k9IqCXrwQ7Jvyvh2/Ku4i
 y/fDbBI3jZIiiLw1PZ5DfrGDqySY+/5Buifw/ff6TqFpLzRIb8ALGociONOobqdoTX9MT7SPOnq
 n90stWV3lL9SPOS2VLrwwvUPJh4C+GNzyGDSXcUPjgNaMBMXNrNUPiCssDCeyrlZIJlMGiY=
X-Received: by 2002:a05:6a00:843:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-736aaad3d00mr33781446b3a.22.1741801585569; 
 Wed, 12 Mar 2025 10:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH09FCa4A/XoGgyd916SJhswNxkxhFXS6ARkmCO+A7/+yJ8h4prp4SYXWlgeJUKw70UyZ4yXg==
X-Received: by 2002:a05:6a00:843:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-736aaad3d00mr33781422b3a.22.1741801585269; 
 Wed, 12 Mar 2025 10:46:25 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:24 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:46:02 -0700
Message-ID: <20250312174605.95563-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312174605.95563-1-ryan.lee@canonical.com>
References: <20250312174605.95563-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 4/5] apparmor: don't bail early in mount on
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


