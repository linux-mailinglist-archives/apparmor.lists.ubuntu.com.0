Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 16085A5E2FD
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQAA-00022W-VR; Wed, 12 Mar 2025 17:46:38 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQA9-0001xF-1B
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:37 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A37EF3F2B2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:25 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2254e500a73so1335675ad.0
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801582; x=1742406382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piI8k0N/TUwVQyl2eBrVS4cqmoKPJ5owfb3c+8Imj84=;
 b=G6GKp9YKXEBIJs0790lNleh+lwOdBg9Sbx1reOGMflDHzn0sbcXyH+mRL23Xr98qYX
 /W9gUFElDWT0C7eholK8aIniQ+CkRYyF0S7njpwg2vqdfvQdVILaktrne//cIfQ6Pcus
 WWJWXOqMLuFou79gYl/yHXGImHcsIKk9QdA6Du/ekTB1qad+F/hn7jidIKin/Pkphv5V
 QjLZX3KiIJRycc124l0ONNqLy/FVDLgTT3viLy2xL4Gr/xav/Zf9ELaZv54QE24YIazg
 TElrCwYwABbBNaUKNRCu7VGwcwaFB7GelcV7M+5Z0YRdRfJJ+MRxiEl80rOQgSKbkw32
 bKKA==
X-Gm-Message-State: AOJu0YwLwCoElXUSAArFBrLhp41CwVv/YOtm593wW7b+wEQKk7wElw/a
 mYh9OaUbG4Tfjzor4xxivK60TSvINUIfOn7uqILGeJrOZiOZ3RZUnuQ9/BEUwh01RrMNGl/oEnh
 BJkyTW1m3SgQL1qjQD3gYZiK9HZ03nvIIsx9kJ8qc07uIc7wsvzHTfuFmk35XnX0kCnUvE/FlH7
 WMO0KK9g==
X-Gm-Gg: ASbGnctjovyzxf9gR4N8o4w1UdRoCQKXjA/hc7HMfi0aAHL/1i85EQzOtokmVnREjEl
 hnrcWw0xcISAJkd5QvFEwKG+aSTauUPoUcKbtVJggxxwQMmSfLfLLOb6MMjRUNKWvk+D6iTn5U7
 R55ht7viHOaKBz1XhggB9+LO1c+2ulk0nVH/rcw9C+4RnxHmiljCE4pAbVoz4LRGxs5ebEYrIR7
 s7Mxu54X1AjwF3ebWG21EqpPN/aITwv3wmwJsucANX67+wW6pNRcGWerj6YV7Cs7eiarzk49Rp9
 taDYg4KmoMP6Bqw33i2lWu7LqOG1isFywOr3Gs7sPmaTVp6yfK8Ko1BqYvVnOCUz2Ur1Rqk=
X-Received: by 2002:a05:6a00:189b:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-736eb856d50mr13068103b3a.18.1741801581909; 
 Wed, 12 Mar 2025 10:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC/Uo30y7X04XozprscPG7wWlUNl8Tb95/MRbZjiI9P5UOuw5yhFMQXUALQ8ZlULw1KaDkkQ==
X-Received: by 2002:a05:6a00:189b:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-736eb856d50mr13068075b3a.18.1741801581594; 
 Wed, 12 Mar 2025 10:46:21 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:21 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:45:59 -0700
Message-ID: <20250312174605.95563-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312174605.95563-1-ryan.lee@canonical.com>
References: <20250312174605.95563-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 1/5] apparmor: pass complain-mode information
	to aa_path_name path lookup
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

This is the first patch of a patchset that ensures that operations in
complain mode do not fail with real permission denials upon encountering
a disconnected path. Instead, the goal is to audit the disconnected paths
by prefixing them with a sentinel character '#', in order to mark them
as special disconnected paths that may be unreliable.

This patch implements the sentinel character placement, adds a
profile_complain argument to the path lookup functions, and passes the
complain-mode information in at all the places where aa_path_perm is
called.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c       |  6 ++++--
 security/apparmor/file.c         |  6 ++++--
 security/apparmor/include/path.h |  4 ++--
 security/apparmor/mount.c        |  9 ++++++--
 security/apparmor/path.c         | 37 +++++++++++++++++++++-----------
 5 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index ce8b057196b6..9703ec2bfa78 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -652,7 +652,8 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
 	AA_BUG(!bprm);
 	AA_BUG(!buffer);
 
-	error = aa_path_name(&bprm->file->f_path, profile->path_flags, buffer,
+	error = aa_path_name(&bprm->file->f_path, profile->path_flags,
+			     COMPLAIN_MODE(profile), buffer,
 			     &name, &info, profile->disconnected);
 	if (error) {
 		if (profile_unconfined(profile) ||
@@ -767,7 +768,8 @@ static int profile_onexec(const struct cred *subj_cred,
 		return 0;
 	}
 
-	error = aa_path_name(&bprm->file->f_path, profile->path_flags, buffer,
+	error = aa_path_name(&bprm->file->f_path, profile->path_flags,
+			     COMPLAIN_MODE(profile), buffer,
 			     &xname, &info, profile->disconnected);
 	if (error) {
 		if (profile_unconfined(profile) ||
diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index a4cdd6cb9af3..5e0cadb75651 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -299,8 +299,10 @@ static int path_name(const char *op, const struct cred *subj_cred,
 	const char *info = NULL;
 	int error;
 
-	error = aa_path_name(path, flags, buffer, name, &info,
-			     labels_profile(label)->disconnected);
+	// Use the profile var for aa_path_name and reuse it in the for loop
+	profile = labels_profile(label);
+	error = aa_path_name(path, flags, COMPLAIN_MODE(profile),
+			     buffer, name, &info, profile->disconnected);
 	if (error) {
 		fn_for_each_confined(label, profile,
 			aa_audit_file(subj_cred,
diff --git a/security/apparmor/include/path.h b/security/apparmor/include/path.h
index 8bb915d48dc7..7c8d53536920 100644
--- a/security/apparmor/include/path.h
+++ b/security/apparmor/include/path.h
@@ -22,8 +22,8 @@ enum path_flags {
 	PATH_MEDIATE_DELETED = 0x20000,	 /* mediate deleted paths */
 };
 
-int aa_path_name(const struct path *path, int flags, char *buffer,
-		 const char **name, const char **info,
+int aa_path_name(const struct path *path, int flags, bool profile_complain,
+		 char *buffer, const char **name, const char **info,
 		 const char *disconnected);
 
 #define IN_ATOMIC true
diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 1e1878a2ed6b..21c933dc469c 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -323,7 +323,8 @@ static int match_mnt_path_str(const struct cred *subj_cred,
 	if (!RULE_MEDIATES(rules, AA_CLASS_MOUNT))
 		return 0;
 
-	error = aa_path_name(mntpath, path_flags(profile, mntpath), buffer,
+	error = aa_path_name(mntpath, path_flags(profile, mntpath),
+			     COMPLAIN_MODE(profile), buffer,
 			     &mntpnt, &info, profile->disconnected);
 	if (error)
 		goto audit;
@@ -384,6 +385,7 @@ static int match_mnt(const struct cred *subj_cred,
 
 	if (devpath) {
 		error = aa_path_name(devpath, path_flags(profile, devpath),
+				     COMPLAIN_MODE(profile),
 				     devbuffer, &devname, &info,
 				     profile->disconnected);
 		if (error)
@@ -618,7 +620,8 @@ static int profile_umount(const struct cred *subj_cred,
 	if (!RULE_MEDIATES(rules, AA_CLASS_MOUNT))
 		return 0;
 
-	error = aa_path_name(path, path_flags(profile, path), buffer, &name,
+	error = aa_path_name(path, path_flags(profile, path),
+			     COMPLAIN_MODE(profile), buffer, &name,
 			     &info, profile->disconnected);
 	if (error)
 		goto audit;
@@ -686,11 +689,13 @@ static struct aa_label *build_pivotroot(const struct cred *subj_cred,
 		return aa_get_newest_label(&profile->label);
 
 	error = aa_path_name(old_path, path_flags(profile, old_path),
+			     COMPLAIN_MODE(profile),
 			     old_buffer, &old_name, &info,
 			     profile->disconnected);
 	if (error)
 		goto audit;
 	error = aa_path_name(new_path, path_flags(profile, new_path),
+			     COMPLAIN_MODE(profile),
 			     new_buffer, &new_name, &info,
 			     profile->disconnected);
 	if (error)
diff --git a/security/apparmor/path.c b/security/apparmor/path.c
index 45ec994b558d..800825caf7f4 100644
--- a/security/apparmor/path.c
+++ b/security/apparmor/path.c
@@ -46,19 +46,26 @@ static int prepend(char **buffer, int buflen, const char *str, int namelen)
  *     namespace root.
  */
 static int disconnect(const struct path *path, char *buf, char **name,
-		      int flags, const char *disconnected)
+		      int flags, bool profile_complain,
+		      const char *disconnected)
 {
 	int error = 0;
 
 	if (!(flags & PATH_CONNECT_PATH) &&
 	    !(((flags & CHROOT_NSCONNECT) == CHROOT_NSCONNECT) &&
 	      our_mnt(path->mnt))) {
-		/* disconnected path, don't return pathname starting
-		 * with '/'
-		 */
 		error = -EACCES;
-		if (**name == '/')
-			*name = *name + 1;
+		if (profile_complain) {
+			// Replace the leading slash with a sentinel character
+			if (**name == '/')
+				**name = '#';
+		} else {
+			/* disconnected path, don't return pathname starting
+			 * with '/'
+			 */
+			if (**name == '/')
+				*name = *name + 1;
+		}
 	} else {
 		if (**name != '/')
 			/* CONNECT_PATH with missing root */
@@ -86,7 +93,8 @@ static int disconnect(const struct path *path, char *buf, char **name,
  *          a position in @buf
  */
 static int d_namespace_path(const struct path *path, char *buf, char **name,
-			    int flags, const char *disconnected)
+			    int flags, bool profile_complain,
+			    const char *disconnected)
 {
 	char *res;
 	int error = 0;
@@ -110,7 +118,8 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
 			error = prepend(name, *name - buf, "/proc", 5);
 			goto out;
 		} else
-			error = disconnect(path, buf, name, flags,
+			error = disconnect(path, buf, name,
+					   flags, profile_complain,
 					   disconnected);
 		goto out;
 	}
@@ -149,7 +158,8 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
 	*name = res;
 
 	if (!connected)
-		error = disconnect(path, buf, name, flags, disconnected);
+		error = disconnect(path, buf, name, flags, profile_complain,
+				   disconnected);
 
 	/* Handle two cases:
 	 * 1. A deleted dentry && profile is not allowing mediation of deleted
@@ -178,6 +188,7 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
  * aa_path_name - get the pathname to a buffer ensure dir / is appended
  * @path: path the file  (NOT NULL)
  * @flags: flags controlling path name generation
+ * @profile_complain: whether the lookup is done with a complain-mode profile
  * @buffer: buffer to put name in (NOT NULL)
  * @name: Returns - the generated path name if !error (NOT NULL)
  * @info: Returns - information on why the path lookup failed (MAYBE NULL)
@@ -194,11 +205,13 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
  *
  * Returns: %0 else error code if could retrieve name
  */
-int aa_path_name(const struct path *path, int flags, char *buffer,
-		 const char **name, const char **info, const char *disconnected)
+int aa_path_name(const struct path *path, int flags, bool profile_complain,
+		 char *buffer, const char **name, const char **info,
+		 const char *disconnected)
 {
 	char *str = NULL;
-	int error = d_namespace_path(path, buffer, &str, flags, disconnected);
+	int error = d_namespace_path(path, buffer, &str,
+				     flags, profile_complain, disconnected);
 
 	if (info && error) {
 		if (error == -ENOENT)
-- 
2.43.0


