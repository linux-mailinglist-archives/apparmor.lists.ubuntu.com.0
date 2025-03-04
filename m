Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BD570A4EEE5
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJG-0002kk-9i; Tue, 04 Mar 2025 20:56:14 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJE-0002kM-Qz
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:12 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6CD033FCC9
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:11 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2234c09241fso175253435ad.2
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121770; x=1741726570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piI8k0N/TUwVQyl2eBrVS4cqmoKPJ5owfb3c+8Imj84=;
 b=tbgQ+Oa/A7InIw2a100y6G7iRs+auaETRWIhdiH4hfpDImtlR/mhDligpa1LkgPBTa
 x3cd9LEMOU28Tb3NH1Vpi8f0rwg4iNC+/+RcgZmlEILPSlKjqTa1SwXiQEE+VfIlLHPG
 gsEWGEz0SJbSHQ2d6udDXby80k6lxWHmPcKrXqBgDVQd6uTnpDoQpeUGmBqtUXaE/PiG
 CD4Xk6BbhnoAlgMmFgajWny5ZFkPRCPp8t3Y0K4teQ16W1X/EvEUhTVhVfTwJK9+ufJF
 andNw8b4Wn1R7JmGWxcxq8W++ee9fXjlnPD6bYBGPjiNsCUikO/tDHrYvCz/YpGBhNrQ
 m8gQ==
X-Gm-Message-State: AOJu0Yyn7ZnwyndvIjM41Yz+h/lqkwS0dF0Spio5d+pcboj+/8tVjZLK
 y6bUxFhg0HGOdWR8cTtv1RHkaqyCBEpbrv7hBx26H645xorzDqIuGbw49N2ZEWsaPYG45Xgtf4I
 CYtzUQTdJiaP9yFTR4jds5THDE0IqX4jdWMmW5zNj9ayF0zWwwGHtZphic0C8D1muF0cHrr1lYa
 EGhkuDRw==
X-Gm-Gg: ASbGncuD4uuDSYiIVU4CFqlGNe8RVdGjX+xZirbXwuHXWn2h7BMSC0JyhoBdhy4axaH
 SDHGDc1lgId1pXWVogqQ1Rw5OKbw88Fj76B4hbUIttHja1wNn5SQJFn2JmsZBA3xBW9nVgcJuD3
 feJMNmKtSa/bBcbD4O9RYG2OE7IZE1avrdllmSRtGzCdIGk8INh67N5uNl/EWuDMLq4EWyO4oqH
 V3ANahyH1ZaJ8mesng/PZ5wdmPT5VeTi7FKLHEz5t4FAOWAWW1zZQyerUHuJgbpkBOT7hNR1Rx3
 9M14cCiWuxRvsYO46g0wU0AD3K5pxpZpsK7iwhjkpXR9r/1eykizRk6FkpF1TdH2kz1ratY=
X-Received: by 2002:a05:6a00:4b4c:b0:732:1a2c:7f34 with SMTP id
 d2e1a72fcca58-736829cf9efmr526758b3a.0.1741121770026; 
 Tue, 04 Mar 2025 12:56:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPQvwOLLJrEjaN2cHcDmZnVCnwiJqKTm0v5WRWgU9sHyt6wS7NcIjK+2B8v2roLejp7+pfUQ==
X-Received: by 2002:a05:6a00:4b4c:b0:732:1a2c:7f34 with SMTP id
 d2e1a72fcca58-736829cf9efmr526738b3a.0.1741121769592; 
 Tue, 04 Mar 2025 12:56:09 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:09 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:50 -0800
Message-ID: <20250304205556.290042-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
References: <20250304205556.290042-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 1/5] apparmor: pass complain-mode information to
	aa_path_name path lookup
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


