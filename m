Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C083CA61974
	for <lists+apparmor@lfdr.de>; Fri, 14 Mar 2025 19:34:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tt9qz-00017o-Ca; Fri, 14 Mar 2025 18:33:53 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tt9qw-00017T-OU
 for apparmor@lists.ubuntu.com; Fri, 14 Mar 2025 18:33:50 +0000
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4633D3F290
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 18:33:50 +0000 (UTC)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff78dd28ecso62747a91.1
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 11:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741977229; x=1742582029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nG/JJAdT0NmDsTWCkRdzs7nxFvkSmP6mAlWiTX/DMU=;
 b=U86/oNrC2HIu+LPHiRmUpbTvZ+9yhhLoTlNDuHyf5KD3Fu5+inCaWwYW+xYPwhkqSj
 PDdcHGDr1tiluaYZNa0M+TGqRcKXDBaXaA55wYZss4MTyVt8/ERKy77DCjifpMSrM8ug
 szHsXbcM9/uc5lzzUdWc+k6kG6FS4jmVOQGYZHI+iau4Ag7xxRlbIXF5MI44UWvS4uHj
 HeB4hYTKnPQqi8ACKZcGvXsdyqsDOCks9yI1wiGhUvag+6OU1MYxQJOh9XtMbwFkii0E
 9732cjELQImSLtWKFU1YqMHGz5mbGdNqScLbCerhoz8CTNNAMWp35XaZoKr6Gry8qFcr
 Gl+w==
X-Gm-Message-State: AOJu0YwBXF7KZBA8jEpeEEzfFh5lOX7FwMRatjcY6ub84YMrjJKYsiGg
 WcQEWkb/z3MZ/zQjqyotP1lHDEoMMoRQZW2PmTqdYqkDUVBcoCKL/lfLloEg8zjpsCK/vgSyuMg
 T/yMVdUd46q2274AgFXb+zw5Wwfu61J9znv3+zD6QDYOza9iThZO6BkYjjRoJpeKVSlSgailZFh
 cEHPgQkw==
X-Gm-Gg: ASbGncsWXzJuEAaRg7f1FFk/tGFCFWlLVK7PVlWX8m2Y1oWsEGUIinfy7fNhXYezmCK
 FByhkbl5HhUJenu8JxcGhnvpa4gbR+bRQtBWkFhLw14SFJG/URHEC39SNSlsXyGaGJO0DD2S7Vm
 6oa3+TLryOXQiN6bYBM2Vz0//HdwdhTGtU4UbbewpxkUo39b24w8bKyxcaOJ2bjzZgW0g4GVnY1
 C6tQswFBaZaYvmu2c7b5lSIUgFr6h/X62UJG3vk1xj7qYzBMr0EpDddMagj6jl0mmbamuhwe0j7
 3GJJ/UGEU7Vh3l7MB+RNCGlX8PkjHgFbmRasamdC6lCb0YZVaD367ZgtQOzfDZHM+zpQLhg=
X-Received: by 2002:a05:6a20:d80f:b0:1f5:b25b:7995 with SMTP id
 adf61e73a8af0-1f5c11dc27dmr6139590637.24.1741977228804; 
 Fri, 14 Mar 2025 11:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe2zNaziCGt18XzxtujavfOCtK5N9S8pedtYqnecbBWsK0B7xeAEk/hcLiM/t3aI7U4DFqsw==
X-Received: by 2002:a05:6a20:d80f:b0:1f5:b25b:7995 with SMTP id
 adf61e73a8af0-1f5c11dc27dmr6139567637.24.1741977228505; 
 Fri, 14 Mar 2025 11:33:48 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7bcc0sm3039161a12.56.2025.03.14.11.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:33:47 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 14 Mar 2025 11:33:38 -0700
Message-ID: <20250314183340.681554-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314183340.681554-1-ryan.lee@canonical.com>
References: <20250314183340.681554-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: Use AA_SFS_FILE_BOOLEAN_INTPRINT
	for userns and io_uring sysctls
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

These two sysctls used to be INTPTRs, before being changed to BOOLEANs.
Now that their values are hardcoded, switch to the new BOOLEAN_INTPRINT
type to preserve backwards compatibility upon reads of the values.

Before this patchset:
$ cat /sys/kernel/security/apparmor/features/policy/unconfined_restrictions/userns
yes

After this patchset (matching the old behavior):
$ cat /sys/kernel/security/apparmor/features/policy/unconfined_restrictions/userns
1

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/apparmorfs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 92f034f369c2..bcbeb5cfb396 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2590,8 +2590,11 @@ static struct aa_sfs_entry aa_sfs_entry_domain[] = {
 
 static struct aa_sfs_entry aa_sfs_entry_unconfined[] = {
 	AA_SFS_FILE_BOOLEAN("change_profile", 1),
-	AA_SFS_FILE_BOOLEAN("userns",		1),
-	AA_SFS_FILE_BOOLEAN("io_uring",		1),
+	/* Retain backwards compatibility with Ubuntu userspace
+	 * code that is expecting integer values for these sysctls
+	 */
+	AA_SFS_FILE_BOOLEAN_INTPRINT("userns",		1),
+	AA_SFS_FILE_BOOLEAN_INTPRINT("io_uring",		1),
 	{ }
 };
 
-- 
2.43.0
base-kernel: Ubuntu-6.14.0-7.7
target: Ubuntu-kernel

